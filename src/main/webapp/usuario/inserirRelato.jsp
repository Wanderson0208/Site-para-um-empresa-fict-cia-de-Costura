<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.projeto.config.Conexao"%>
<%@ page import="com.projeto.bean.Relatos"%>
<%@ page import="com.projeto.bean.Usuario"%>
<%@ page import="com.projeto.dao.UsuarioDAO"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" type="text/css" href="../css/inserirRelato1.css">

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
<title>Insert title here</title>
</head>

<%

String carrega = (String) session.getAttribute("ativo");
//out.print(carrega);

if (carrega == null) {

	response.sendRedirect("../home.jsp");

}

%>


<body>

	<div class="principal">
	
		<form action="" method="post">
		
			<div class="logoLogin">

				<img alt="" src="../img/logoOfic4.png">

			</div>
		
			<div class="divInputsLabels">

				<input type="text" id="txtnome" name="txtnome" placeholder="NOME">

				<input type="text" id="txtemail" name="txtemail" placeholder="EMAIL">
			
				<textarea id="txtrelato" name="txtrelato" placeholder="FEEDBACK"></textarea>

			</div>

			<div class="divBtnsAddRelato">
				
				<input type="submit" name="btn-fechar" class="input-btn" value="Fechar">
				<input type="submit" name="btn-salvar" class="input-btn" value="Salvar">

			</div>
			
		</form>
	</div>


</body>
</html>

<%
// se houver alguma requisição do botão salvar
if (request.getParameter("btn-salvar") != null) {

    String nomeUsuarioString  = request.getParameter("txtnome");
	String emailUsuarioString = request.getParameter("txtemail");
	String relat 	          = request.getParameter("txtrelato");
	
	
	// instanciar a classe LivroDAO
	UsuarioDAO salvarRelatoDAO = new UsuarioDAO(new Conexao().conectar());
	// instanciar a classe
	Relatos novoRelato = new Relatos();
	// popular o objeto novoContato

	novoRelato.setNomeUsuarios(nomeUsuarioString);
	novoRelato.setEmailUsuarios(emailUsuarioString);
	novoRelato.setDescricaoRelato(relat);

		// chamar o método inserirContato e retornar se houve ou não sucesso
		Boolean continua = salvarRelatoDAO.inserirRelato(novoRelato);
		
		if (!continua) {
			out.print("Erro no sistema");
		} else {
			response.sendRedirect("usuario.jsp");
		}
	
}

if (request.getParameter("btn-fechar") != null) {
	
	response.sendRedirect("../home.jsp");
	
}
%>