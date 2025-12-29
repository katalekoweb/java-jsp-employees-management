<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cargos</title>

<style type="text/css">
	td, th {
		padding: 10px;
		text-align: left;
	}
	
	tr {
		border-bottom: 1px solid #ddd;
	}
</style>
</head>
<body>

<%@ include file="header.jsp" %>

<div>

<%
String name = "";
String rid = request.getParameter("id");
String error = "";

String url = "jdbc:mysql://localhost:3306/employeesDb";
String dbUsername = "root";
String dbPassword = "password";

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection(url, dbUsername, dbPassword);
    Statement st = con.createStatement();

    String sql = "select id, name from roles where id = " + rid;
    ResultSet rs = st.executeQuery(sql);

    if (rs.next()) {
        name = rs.getString("name");
    }

    request.setAttribute("name", name);
    request.setAttribute("id", rid);

    st.close();
    con.close();

} catch (Exception e) {
    error = e.getMessage();
}
%>

	<div class="container mx-auto my-6 grid grid'cols-1 md:grid-cols-3 gap-5">
		<form action="role" method="POST" class="space-y-3">
			<input type="hidden" class="w-full p-3 shadow" name="id" id="id" value="${id}"  />
			
			<div>
				<label>Nome </label>
				<input type="text" required class="w-full p-2 px-5 shadow rounded-xl border" name="name" id="name" value="${name}" />
			</div>
			
			<div>
				<button type="submit" class="bg-lime-600 hober:bg-lime-700 duration-150 p-2 px-4 rounded-xl text-white">Salvar</button>
			</div>
		</form>
		
		<div class="md:col-span-2">
			<div class="text-lg font-bold">Lista de cargos</div>
			
			<div class="w-full overflow-x-auto">
				<table class="w-full">
					<thead>
						<tr>
							<th>ID</th>
							<th>Nome</th>
							<th>Ações</th>
						</tr>
					</thead>
					<tbody>
					
					<sql:setDataSource var="db" driver="com.mysql.cj.jdbc.Driver" url="jdbc:mysql://localhost:3306/employeesDb" user="root" 
						password="password"></sql:setDataSource>
						
					<sql:query var="rs" dataSource="${db}">select * from roles</sql:query>
					
					<c:forEach items="${rs.rows}" var="role">
						<tr>
						<td><c:out value="${role.id}"></c:out></td>
						<td><c:out value="${role.name}"></c:out></td>
						<td class="flex items-center space-x-3">
							<a class="underline" href="?id=${role.id}">Editar</a>
							<form action="role" method="post">
								<input type="hidden" class="w-full p-3 shadow" name="id" id="id" value="${role.id}"  />
								<input type="hidden" class="w-full p-3 shadow" name="del" id="del" value="1"  />
								<button class="underline text-red-600" onclick="return confirm('Tem certeza?')" type="submit">Remover</button>
							</form>
						</td>
						</tr>
					</c:forEach>
						
					</tbody>
				</table>
			
			</div>
		</div>
	</div>
</div>

</body>
</html>