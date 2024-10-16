<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.projeto.config.Conexao"%>
<%@ page import="com.projeto.bean.Produto"%>
<%@ page import="com.projeto.dao.ProdutoDAO"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="ISO-8859-1">

<link rel="stylesheet" type="text/css" href="../css/admPageProdutos.css">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<link href="../css/estilo_escopo.css" rel="stylesheet">

<title>Insert title here</title>

</head>

<%

String carrega = (String) session.getAttribute("verdadeiro");
//out.print(carrega);

if (carrega == null) {

	response.sendRedirect("../home.jsp");

}

%>

<body>

	<div class="principal">

		<header>

			<div>
			
				<section>
				
					<img alt="" src="../img/avatar.png">
				
				</section>
				
				<h4><%out.print(carrega);%></h4>
			
			</div>

			<nav>

				<ul>

					<li><a href="../usuario/usuario.jsp">Usuários</a></li>
					<li class="liProduto"><a href="../produto/produto.jsp">Produtos</a></li>
					<li><a href="../servico/servico.jsp">Serviços</a></li>
					<li><a href="../relato/todosRelatos.jsp">FeedBacks</a></li>

				</ul>

			</nav>

		</header>

		<div class="conteudo">

			<div class="container">

				<div class="col">

					<!--Estamos chamndo a pagina do formulario de Prod(inserirProduto.jsp)-->
					<form action="inserirProduto.jsp">

						<button type="submit" class="btn btn-info btn-sm">Novo
							Produto</button>

					</form>

				</div>

				<div class="row mt-4 mb-4">

					<div class="col">

						<form class="direita">

							<input class="rounded" type="search" placeholder="buscar Produto"
								name="txtbuscar" aria-label="Search">
							<button class="btn btn-out-line-info btn-sm" type="submit"
								name="btn_buscar">Buscar</button>

						</form>

					</div>

				</div>

			</div>

			<div class="container">

				<table class="table table-striped">

					<thead>

						<tr>

							<th scope="col">IdProduto</th>
							<th scope="col">Descrição</th>
							<th scope="col">Valor</th>
							<th scope="col">Tamanho</th>
							<th scope="col">Quantidade</th>
							<th scope="col">Promoçãos</th>
							<th scope="col">Imagem</th>
							<th colspan="2" scope="col">Ação</th>

						</tr>

					</thead>

					<tbody>

						<%
						ProdutoDAO produtoDAO = new ProdutoDAO(new Conexao().conectar());

						List<Produto> vetorProdutos;

						String filtro = request.getParameter("btn_buscar"); // ObtÃ©m o parÃ¢metro do filtro da solicitaÃ§Ã£o
						String valorDeBusca = '%' + request.getParameter("txtbuscar") + '%'; // ObtÃ©m o parÃ¢metro do valor de busca da solicitaÃ§Ã£o

						if (filtro != null && valorDeBusca != null) {

							filtro = "buscarPorNome";
							vetorProdutos = produtoDAO.buscarProdutos(filtro, valorDeBusca);

						} else {

							vetorProdutos = produtoDAO.buscarProdutos("buscarTodos", null);

						}

						if (!vetorProdutos.isEmpty()) {

							for (Produto produto : vetorProdutos) {
						%>
						<tr>
							<td><%=produto.getIdProduto()%></td>
							<td><%=produto.getDescricao()%></td>
							<td><%=produto.getValor()%></td>
							<td><%=produto.getTamanho()%></td>
							<td><%=produto.getQuantidade()%></td>
							<td><%=produto.getPromocao()%></td>
							<td><img src="imagem/<%=produto.getImagem()%>" width="50px"></td>

							<td>
								<!-- CRIAR ESSE arquivo.js -->
								<form action="../arquivo.jsp">

									<input type="hidden" name="idProduto"
										value="<%=produto.getIdProduto()%>">
									<button type="submit" class="btn">

										<i class="bi bi-image"></i>

									</button>

								</form>

							</td>
							<td>
								<form action="editarProduto.jsp">

									<!-- passando o id de forma oculta -->
									<input type="hidden" name="idProduto"
										value="<%=produto.getIdProduto()%>">

									<button type="submit" class="btn">
										<i class="bi-pencil"></i>
									</button>
									<a
										href="produto.jsp?funcao=excluir&id=<%=produto.getIdProduto()%>"
										class="text-danger"><i class="bi-trash"></i></a>

								</form>
							</td>
						</tr>
						<%
						}
						} else {
						%>
						<tr>
							<td colspan="5">Nenhum Produto encontrado.</td>
						</tr>
						<%
						}
						%>

					</tbody>
				</table>
			</div>

			<p>
			
			<a class="btn btn-info" href="../logout.jsp">Sair</a>
			
		</div>
	</div>
</body>

</html>

<%
if (request.getParameter("funcao") != null && request.getParameter("funcao").equals("excluir")) {
	String id = request.getParameter("id");
	// instanciar a classe ContatoDao
	ProdutoDAO apagarProdutoDAO = new ProdutoDAO(new Conexao().conectar());
	// chamar o método apagarUsuario e retornar se houve ou não sucesso
	Boolean continua = apagarProdutoDAO.apagarProduto(id);
	if (!continua) {
		out.print("<script>alert('Erro ao excluir Produto!');</script>");
	} else {
		response.sendRedirect("produto.jsp");
	}
}
%>