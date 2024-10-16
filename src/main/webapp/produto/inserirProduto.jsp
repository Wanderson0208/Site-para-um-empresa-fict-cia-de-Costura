<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.projeto.config.Conexao"%>
<%@ page import="com.projeto.bean.Produto"%>
<%@ page import="com.projeto.dao.ProdutoDAO"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html>

<html>

<head>

	<link rel="stylesheet" type="text/css" href="../css/inserirProduto1.css">
	
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
<title>Cadastro de Produtos</title>

</head>

<body>

<div class="principal">

		<form action="" method="get">
		
			<div class="logoLogin">

				<img alt="" src="../img/logoOfic4.png">

			</div>

			<div class="divInputsLabels">
			
				<input placeholder="DESCRIÇÃO" type="text" name="txtdescricao" id="txtdescricao" class="form-control" 
				value="<%= request.getParameter("txtdescricao") != null ? request.getParameter("txtdescricao") : "" %>">

				<input placeholder="VALOR" type="text" name="txtvalor" id="txtvalor" class="form-control" 
				value="<%= request.getParameter("txtvalor") != null ? request.getParameter("txtvalor") : "" %>">

				<input placeholder="TAMANHO" type="text" name="txttamanho" id="txttamanho" class="form-control" 
				value="<%= request.getParameter("txttamanho") != null ? request.getParameter("txttamanho") : "" %>">

				<input placeholder="QUANTIDADE" type="text" name="txtquantidade" id="txtquantidade" class="form-control" 
				value="<%= request.getParameter("txtquantidade") != null ? request.getParameter("txtquantidade") : "" %>"> 

				<input placeholder="PROMOÇÃO" type="text" name="txtpromocao" id="txtpromocao" class="form-control" 
				value="<%= request.getParameter("txtpromocao") != null ? request.getParameter("txtpromocao") : "" %>"> 
			
			</div>

			<div class="divBtnsAddUsuario">
			
				<input type="submit" name="btn-fechar" class="input-btn" value="Voltar">
				<input type="submit" name="btn-salvar" class="input-btn" value="Cadastrar">
				
			</div>
			
		</form>
		
	</div>

</body>

</html>

<%

// se houver alguma requisição do botão salvar
if (request.getParameter("btn-salvar") != null) {

	String descricao 	= request.getParameter("txtdescricao");
	String valor 	    = request.getParameter("txtvalor");
	String tamanho 	    = request.getParameter("txttamanho");
	String quantidade 	= request.getParameter("txtquantidade");
	String promocao     = request.getParameter("txtpromocao");
	

	// instanciar a classe LivroDAO
	ProdutoDAO salvarProdutoDAO = new ProdutoDAO(new Conexao().conectar());
	// instanciar a classe
	Produto novoProduto = new Produto();
	// popular o objeto novoContato

	novoProduto.setDescricao(descricao);
	novoProduto.setValor(Double.parseDouble(valor));
	novoProduto.setTamanho(tamanho);
	novoProduto.setQuantidade(Integer.parseInt(quantidade));
	novoProduto.setPromocao(promocao);
	
		
		// chamar o método inserirContato e retornar se houve ou não sucesso
		Boolean continua = salvarProdutoDAO.inserirProduto(novoProduto);
		
		if (!continua) {
			
			out.print("Erro no sistema");
			
		} else {
			
			response.sendRedirect("produto.jsp");
			
		}
		
	
}

if (request.getParameter("btn-fechar") != null) {
	
	response.sendRedirect("produto.jsp");
	
}

%>