<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.projeto.config.Conexao"%>
<%@ page import="com.projeto.bean.Servico"%>
<%@ page import="com.projeto.dao.ServicoDAO"%>
<%@ page import="java.util.List"%>
    
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">

<link rel="stylesheet" type="text/css" href="../css/admPageServicos.css">

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
					<li><a href="../produto/produto.jsp">Produtos</a></li>
					<li class="liServico"><a href="../servico/servico.jsp">Serviços</a></li>
					<li><a href="../relato/todosRelatos.jsp">FeedBacks</a></li>

				</ul>

			</nav>

		</header>

		<div class="conteudo">

			<div class="container">

				<div class="col">

					<!--Estamos chamndo a pagina do formulario de Prod(inserirProduto.jsp)-->
					<form action="inserirServico.jsp">

						<button type="submit" class="btn btn-info btn-sm">Novo
							Serviço</button>

					</form>

				</div>

				<div class="row mt-4 mb-4">

					<div class="col">

						<form class="direita">

							<input class="rounded" type="search" placeholder="buscar Serviço"
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

							<th scope="col">IdServiço</th>
							<th scope="col">Nome</th>
							<th scope="col">Descrição</th>
							<th scope="col">Imagem</th>
							<th colspan="2" scope="col">Ação</th>

						</tr>

					</thead>

					<tbody>

						<%
						
						ServicoDAO servicoDAO = new ServicoDAO(new Conexao().conectar());

						List<Servico> vetorServicos;

						String filtro = request.getParameter("btn_buscar"); // ObtÃ©m o parÃ¢metro do filtro da solicitaÃ§Ã£o
						String valorDeBusca = '%' + request.getParameter("txtbuscar") + '%'; // ObtÃ©m o parÃ¢metro do valor de busca da solicitaÃ§Ã£o

						if (filtro != null && valorDeBusca != null) {

							filtro = "buscarPorNome";
							vetorServicos = servicoDAO.buscarServicos(filtro, valorDeBusca);

						} else {

							vetorServicos = servicoDAO.buscarServicos("buscarTodos", null);

						}

						if (!vetorServicos.isEmpty()) {

							for (Servico servico : vetorServicos) {
								
						%>
						
						<tr>
						
							<td><%=servico.getIdServico()%></td>
							<td><%=servico.getNomeServico()%></td>
							<td><%=servico.getDescricaoServico()%></td>
							<td><img src="imagem/<%=servico.getImagemServ()%>" width="50px"></td>

							<td>
								<!-- CRIAR ESSE arquivo.js -->
								<form action="../arquivoServ.jsp">

									<input type="hidden" name="id"
										value="<%=servico.getIdServico()%>">
									<button type="submit" class="btn">

										<i class="bi bi-image"></i>

									</button>

								</form>

							</td>
							<td>
								<form action="editarServico.jsp">

									<!-- passando o id de forma oculta -->
									<input type="hidden" name="idServico"
										value="<%=servico.getIdServico()%>">

									<button type="submit" class="btn">
										<i class="bi-pencil"></i>
									</button>
									<a
										href="servico.jsp?funcao=excluir&id=<%=servico.getIdServico()%>"
										class="text-danger"><i class="bi-trash"></i></a>

										<!-- PARA MOS AQUI -->
								
								</form>
							</td>
						</tr>
						
						<%
						
							}
							} else {
							
						%>
						
						<tr>
						
							<td colspan="5">Nenhum Serviços encontrado.</td>
							
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
	ServicoDAO apagarServicoDAO = new ServicoDAO(new Conexao().conectar());
	// chamar o método apagarUsuario e retornar se houve ou não sucesso
	Boolean continua = apagarServicoDAO.apagarServico(id);
	
	if (!continua) {
		
		out.print("<script>alert('Erro ao excluir Servico!');</script>");
		
	} else {
		
		response.sendRedirect("servico.jsp");
		
	}
	
}

%>