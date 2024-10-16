<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.projeto.config.Conexao"%>
<%@ page import="com.projeto.bean.Produto"%>
<%@ page import="com.projeto.dao.ProdutoDAO"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html>
<html>

<head>

<link rel="stylesheet" type="text/css" href="../css/editarProduto2.css">

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
<title>Editar Produto</title>

</head>

<%

// Capturando o Id que foi chamado ocultamente na linha 139 de produto.jsp
String produtoId = request.getParameter("idProduto");

%>

<body>

	<%
	try {

		// instanciar a classe ContatoDao
		ProdutoDAO produtoDAO = new ProdutoDAO(new Conexao().conectar());
		// Abaixo é criado uma lista baseada na classe Usuario
		List<Produto> vetorProdutos;
		// o array vetorLivros estará recebendo os dados de buscarPerfil
		vetorProdutos = produtoDAO.buscarId(produtoId);
		// O idUser acima veio da declaração que está na validação da sessão

		for (Produto prod : vetorProdutos) {
	%>

	<div class="principal">

		<form action="" method="post">

			<div class="logoLogin">

				<img alt="" src="../img/logoOfic4.png">

			</div>
			
			<input type="hidden" name="id" id="id" value="<%=prod.getIdProduto()%>">

			<div class="divInputsLabels">

  					<input type="text" name="txtdescricao" id="txtdescricao"
  					value="<%=prod.getDescricao()%>" placeholder="DESCRIÇÃO">

 					<input type="text"	name="txtvalor" id="txtvalor" 
					value="<%=prod.getValor()%>" placeholder="VALOR">
					
					<input type="text"	name="txttamanho" id="txttamanho"
					value="<%=prod.getTamanho()%>" placeholder="TAMANHO">
					
					<input type="text" name="txtquantidade" id="txtquantidade"
					value="<%=prod.getQuantidade()%>" placeholder="QUANTIDADE">
					
					<input type="text" name="txtpromocao" id="txtpromocao"
					value="<%=prod.getPromocao()%>" placeholder="PROMOÇÃO">
					
			</div>

			<div class="divBtnsAddUsuario">
			
				<input type="submit" name="btn-fechar" class="input-btn" value="Fechar">
				<input type="submit" name="btn-editar" class="input-btn" value="Salvar">
				
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
	String descricao = request.getParameter("txtdescricao");
	String valor = request.getParameter("txtvalor");
	String tamanho = request.getParameter("txttamanho");
	String quantidade = request.getParameter("txtquantidade");
	String promocao = request.getParameter("txtpromocao");

	// instanciar a classe ContatoDao
	ProdutoDAO produtoDao = new ProdutoDAO(new Conexao().conectar());
	//instanciar a classe Contato
	Produto editaProduto = new Produto();
	// popular o objeto editaContato

	editaProduto.setIdProduto(id);
	editaProduto.setDescricao(descricao);
	editaProduto.setValor(Double.parseDouble(valor));
	editaProduto.setTamanho(tamanho);
	editaProduto.setQuantidade(Integer.parseInt(quantidade));
	editaProduto.setPromocao(promocao);

	Boolean continua = produtoDao.editarProduto(editaProduto);
	
	if (!continua) {
		
		out.print("<script>alert('Erro ao editar Produto!');</script>");
		
	} else {
		
		response.sendRedirect("produto.jsp");
		
	}

}

if (request.getParameter("btn-fechar") != null) {
	
	response.sendRedirect("produto.jsp");
	
}

%>