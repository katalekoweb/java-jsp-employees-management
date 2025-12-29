<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://cdn.tailwindcss.com"></script>

<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link rel="stylesheet" href="https://cdn.datatables.net/2.3.6/css/dataTables.dataTables.css" />
<script src="https://cdn.datatables.net/2.3.6/js/dataTables.js"></script>

</head>
<body>

<div class="bg-gradient-to-b from-lime-600 via-lime-700 to-lime-600 h-16 flex items-center px-6">
		<div class="container mx-auto flex items-center justify-between text-white">
			<a href="welcome.jsp" class="text-xl font-bold text-white">Gestão de Funcionários</a>
			<div class="flex items-center space-x-6 uppercase">
				<a>Funcionários</a>
				<a>Folha de pagamento</a>
				<a>Departamentos</a>
				<a href="roles.jsp">Cargos</a>
				
				<form action="Logout" method="POST">
					<button type="submit">Sair (${uname})</button>
				</form>
			</div>
		</div>
	</div>

</body>
</html>