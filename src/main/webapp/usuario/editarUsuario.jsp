<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.projeto.config.Conexao"%>
<%@ page import="com.projeto.bean.Usuario"%>
<%@ page import="com.projeto.dao.UsuarioDAO"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html>

<html>

<head>

<link rel="stylesheet" type="text/css" href="../css/editarUsuario1.css">
	
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
	<title>Editar Usuario</title>
	
</head>

<%

	// Capturando o Id que foi chamado ocultamente no arquivo usuario.jsp - linha 121 a 124.
	String usuarioId = request.getParameter("id");
	// Capturando o Email e o Telefone que foram chamados ocultamente no arquivo usuario.jsp - linha 121 a 124.
	String emailVelho = request.getParameter("email");
	String telefoneVelho = request.getParameter("telefone");

%>

<body>

	<%
	
		try {
			
			// instanciar a classe UsuarioDAO
			UsuarioDAO usuarioDAO = new UsuarioDAO(new Conexao().conectar());
			
			// Abaixo é criado uma lista baseada na classe Usuario
			List<Usuario> vetorUsuarios;
			
			// o array vetorContatos estará recebendo os dados de buscarPerfil
			vetorUsuarios = usuarioDAO.buscarId(usuarioId);
			
			// O idUser acima veio da declaração que está na validação da sessão
	
			for (Usuario usuari : vetorUsuarios) {
			
	%>
	
	<div class="principal">
	
		<form action="" method="post">
			
			<div class="logoLogin">

				<img alt="" src="../img/logoOfic4.png">

			</div>
			
			<input type="hidden" name="id" id="id" value="<%=usuari.getIdUsuario()%>">

			<div class="divInputsLabels">
			
				<input type="text" name="txtnome" id="txtnome" value="<%=usuari.getNome()%>">
					
				<input type="text" name="txtemail" id="txtemail" value="<%=usuari.getEmail()%>">
			
				<input type="password" name="txtsenha" id="txtsenha" value="<%=usuari.getSenha()%>">

				<input type="text" name="txttelefone" id="txttelefone" value="<%=usuari.getTelefone()%>">
					
			</div>

			<div class="divBtnsAddUsuario">
			
				<input type="submit" name="btn-fechar" class="input-btn" value="Fechar">
				<input type="submit" name="btn-editar" class="input-btn" value="Editar">
			
			</div>
			
		</form>
	
	</div>
	
	<%
		}
			
		} catch (Exception e) {
			
			out.print(e);
		
		}
	
	%>

</body>

</html>

<%
	
	// se houver alguma requisição do botão salvar
	if (request.getParameter("btn-editar") != null) {
	
		int id = Integer.parseInt(request.getParameter("id"));
		String nome = request.getParameter("txtnome");
		String email = request.getParameter("txtemail");
		String senha = request.getParameter("txtsenha");
		String telefone = request.getParameter("txttelefone");
	
		// instanciar a classe UsuarioDAO
		UsuarioDAO usuarioDAO = new UsuarioDAO(new Conexao().conectar());
		
		//instanciar a classe Contato
		Usuario editarUsuario = new Usuario();
		
		// popular o objeto e verificar se os dados inseridos ja existem
		
		 // verificar o telefone
		   if ((!telefoneVelho.equals(telefone) && usuarioDAO.buscarTelefone(telefone) == "Encontrado")) {
		           
			   out.print("<script>alert('Telefone já cadastrado!');</script>");
		   
		   } // vefificar o email
		   else if ((!emailVelho.equals(email) && usuarioDAO.buscarEmail(email) == "Encontrado")){
		               
			   out.print("<script>alert('Email já cadastrado!');</script>");
		   
		   } else {
	
			// popular o objeto
			editarUsuario.setIdUsuario(id);
			editarUsuario.setNome(nome);
			editarUsuario.setEmail(email);
			editarUsuario.setSenha(senha);
			editarUsuario.setTelefone(telefone);
	
			Boolean continua = usuarioDAO.editarUsuario(editarUsuario);
			
			if (!continua) {
				
				out.print("<script>alert('Erro ao editar usuario!');</script>");
		
			} else {
				
				response.sendRedirect("usuario.jsp");
		
			}
			
		}
	
	}
	
	if (request.getParameter("btn-fechar") != null) {
		
		response.sendRedirect("usuario.jsp");
		
	}
	
%>


