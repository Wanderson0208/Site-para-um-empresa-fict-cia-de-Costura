<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.mysql.cj.jdbc.Driver"%>
<%@ page import="com.projeto.config.Conexao"%>
<%@ page import="com.projeto.bean.Produto"%>
<%@ page import="com.projeto.dao.ProdutoDAO"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html>

<html>

<head>

<link rel="stylesheet" type="text/css" href="css/arquivo2.css">
	
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

<!-- ESSE (idProduto) esta vindo do produto.jsp, linha 124 -->
<%
String prodId = request.getParameter("idProduto");
%>
<body>
	<%
	// instanciar a classe UsuarioDao
	ProdutoDAO produtoDAO = new ProdutoDAO(new Conexao().conectar());
	// Abaixo é criado uma lista baseada na classe Usuario
	List<Produto> vetorProdutos;
	
	// o array vetorUsuarios estará recebendo os dados de buscarPerfil
	vetorProdutos = produtoDAO.buscarId(prodId);
	// O idUser acima veio da declaração que está na validação da sessão

	for (Produto prod : vetorProdutos) {
	%>
	<div class="principal">
	
		<section>
		
			<div class="logoLogin">

				<img alt="" src="img/logoOfic4.png">

			</div>
		
			<div class="divInputsLabels">
			
				<input type="text" name="txtdescricao" id="txtdescricao"
				value="<%=prod.getDescricao()%>" readonly>
					
				<input type="text" name="txtvalor" id="txtvalor"
				value="<%=prod.getValor()%>" readonly>
				
				<input type="text" name="txttamanho" id="txttamanho"
				value="<%=prod.getTamanho()%>" readonly>

				<input type="text" name="txtquantidade" id="txtquantidade"
				value="<%=prod.getQuantidade()%>" readonly>
				
				<input type="text" name="txtpromocao" id="txtpromocao"
				value="<%=prod.getPromocao()%>" readonly>

			</div>
			
			<%
			}
			%>

		</section> 
		
		<form action="UploadDeArquivo" method="post" enctype="multipart/form-data">
		
			<input type="hidden" name="id" value="<%=prodId%>">
			
			<div class="divInputsLabelsForm">
			
				<input class="inputImg" type="file" name="file">
			
			</div>
			
			<div class="containerInpusBtns">
			
				<input type="submit" name="btn-fechar" class="input-btn" value="Fechar">
			
				<input class="input-btn" type="submit" value="Enviar">
				
			</div>
			
		</form>
		
	</div>

	<p>
	<div class="container">
	

		
	</div>
	
</body>

</html>
<!-- img src="img/david-clode-o3r7oVPZnZI-unsplash.jpg"-->
<%
if (request.getAttribute("msg") != null) {
%>
<%=request.getAttribute("msg")%>
<%
}
%>
<%
String file = (String) request.getAttribute("arquivo");
%>
<%
String prodIdUp = (String) request.getAttribute("prodId");
%>
<%
if (file != null) {
	produtoDAO.editarImagem(prodIdUp, file);
	response.sendRedirect("http://localhost:8080/ProjetoIntegrador/produto/produto.jsp");
}
%>

<%
   
	if (request.getParameter("btn-fechar") != null) {
		
		response.sendRedirect("produto/produto.jsp");
		
	}
   
%>