<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.projeto.config.Conexao"%>
<%@ page import="com.projeto.bean.Usuario"%>
<%@ page import="com.projeto.dao.UsuarioDAO"%>
<%@ page import="java.util.List"%>


<!DOCTYPE html>

<html>

<head>
	
	<link rel="stylesheet" type="text/css" href="../css/inserirUsuario1.css">
	
<!-- LINKS DO GOOGLE FONTS -->

<!-- Itens da NAV -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Economica:ital,wght@0,400;0,700;1,400;1,700&family=Twinkle+Star&family=Zilla+Slab:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
	rel="stylesheet">

<!-- Item h2 do HEADER -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Economica:ital,wght@0,400;0,700;1,400;1,700&family=Twinkle+Star&family=Zilla+Slab:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
	rel="stylesheet">

<!-- Item h1 do HEADER -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Economica:ital,wght@0,400;0,700;1,400;1,700&family=Twinkle+Star&family=Zilla+Slab:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
	rel="stylesheet">
	
	<meta charset="ISO-8859-1">
	<title>Cadastro de Usuario</title>
	
</head>

<body>

	<div class="principal">
	
		<form action="" method="get">
		
			<div class="logoLogin">

				<img alt="" src="../img/logoOfic4.png">

			</div>

			<div class="divInputsLabels">
			
				<input placeholder="NOME" type="text" name="txtnome" id="txtnome" class="form-control" 
					value="<%= request.getParameter("txtnome") != null ? request.getParameter("txtnome") : "" %>">

				<input placeholder="EMAIL" type="text" name="txtemail" id="txtemail" class="form-control" 
					value="<%= request.getParameter("txtemail") != null ? request.getParameter("txtemail") : "" %>">
			
				<input placeholder="SENHA" type="password" name="txtsenha" id="txtsenha" class="form-control" 
					value="<%= request.getParameter("txtsenha") != null ? request.getParameter("txtsenha") : "" %>">

				<input placeholder="TELEFONE" type="text" name="txttelefone" id="txttelefone" class="form-control" 
					value="<%= request.getParameter("txttelefone") != null ? request.getParameter("txttelefone") : "" %>"> 
			
			</div>

			<div class="divBtnsAddUsuario">
				
				<input type="submit" name="btn-fechar" class="input-btn" value="Fechar">
				<input type="submit" name="btn-cadastrar" class="input-btn" value="Cadastrar">

			</div>
			
		</form>
		
	</div>
	
</body>

</html>

<%
	// se houver alguma requisição do botão salvar
	if (request.getParameter("btn-cadastrar") != null) {
	
		String nome = request.getParameter("txtnome");
		String email = request.getParameter("txtemail");
		String senha = request.getParameter("txtsenha");
		String telefone = request.getParameter("txttelefone");
	
		// instanciar a classe UsuarioDAO
		UsuarioDAO salvarUsuarioDAO = new UsuarioDAO(new Conexao().conectar());
		
		// instanciar a classe
		Usuario novoUsuario = new Usuario();
		
		// popular o objeto novoUsuario
		novoUsuario.setNome(nome);
		novoUsuario.setEmail(email);
		novoUsuario.setSenha(senha);
		novoUsuario.setTelefone(telefone);
	
		// chamar o método buscarEmail para verificar se o email já existe
		if (salvarUsuarioDAO.buscarEmail(email) == "Encontrado") {
			
			out.print("<script>alert('Email já cadastrado!');</script>");
			
		// chamar o método buscarTelefone para verificar se o telefone já existe
		} else if (salvarUsuarioDAO.buscarTelefone(telefone) == "Encontrado"){
			
			out.print("<script>alert('Telefone já cadastrado!');</script>");
			
		} else {
			
			// chamar o método inserirContato e retornar se houve ou não sucesso
			Boolean continua = salvarUsuarioDAO.inserirUsuario(novoUsuario);
			
			if (!continua) {
				
				out.print("Erro no sistema");
				
			} else {
				
				response.sendRedirect("../login.jsp");
				
			}
			
		}
		
	}
	
	if (request.getParameter("btn-fechar") != null) {
		
		response.sendRedirect("../home.jsp");
		
	}

%>