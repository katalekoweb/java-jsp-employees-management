<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Seja Bemvindo</title>

</head>
<body>

<%@ include file="header.jsp" %>

	<%
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // works in HTTP 1.1
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Expires", "0");
	
		if (session.getAttribute("username") == null) {
			response.sendRedirect("login.jsp");
		}
	%>	
	
	<div class="px-6">
		<div class="container mx-auto h-[70vh] p-5 bg-lime-300 text-zinc-800 rounded-xl shadow flex flex-col items-center justify-center my-6">
			<div class="text-5xl">Seja bemvindo a sua plataforma de RH</div>
			<div class="text-2xl text-lime-900 my-8 py-3 border-t-8 border-white ">O melhor sistema para gestão e controle de funcionários</div>
			<div>&copy; 2025 - Direitos reservados - GRUKTA</div>
		</div>
	</div>
	
</body>
</html>