<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.projeto.config.Conexao"%>
<%@ page import="com.projeto.dao.AdmDAO"%>

<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" type="text/css" href="css/logins1.css">
	
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
	<title>Insert title here</title>
	
</head>
<body>

	<div class="principal">

		<form action="" method="post">

			<div class="logoLogin">

				<img alt="" src="img/logoOfic4.png">

			</div>

			<div class="divInputsLabels">

				<input type="text" name="email" id="email" placeholder="EMAIL" class="form-control">
				
				<input type="password" name="senha"	id="senha" placeholder="SENHA" class="form-control">

				<input type="submit" name="submit" class="input-btn" value="Logar-se">
				
				
		
			</div>
			
			<div class="divAncoragens">
				
				<a class="btn-voltar" href="home.jsp">Voltar</a>
			
			</div>
			

		</form>

	</div>

</body>
</html>

<%

	// abaixo, verifico se os campos estão em branco ou não
	if (request.getParameter("submit") != null) {
	
	  // pegar as variáveis do formulário
	  String email = request.getParameter("email");
	  String senha = request.getParameter("senha");
	
	  // instanciar ContatoDAO
	  AdmDAO admDAO = new AdmDAO(new Conexao().conectar());
	  
	  if (admDAO.logar(email, senha)){
		  
		// criar uma variavel da session
		String ativo = email;
		
		// passar a variável
		session.setAttribute("verdadeiro", ativo);
		// ------------------------------------
	    response.sendRedirect("usuario/usuario.jsp");
		
	  } else {
		  
	    out.println("<script>alert('Login inválido!');</script>");
	    
	  }
	  
	}

%>