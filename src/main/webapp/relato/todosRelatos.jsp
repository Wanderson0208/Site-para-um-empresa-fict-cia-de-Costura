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

<link rel="stylesheet" type="text/css" href="../css/admPageFeedbacks.css">

<meta charset="ISO-8859-1">
<title>Insert title here</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

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

				<h4>
					<%
					out.print(carrega);
					%>
				</h4>

			</div>

			<nav>

				<ul>

					<li><a href="../usuario/usuario.jsp">Usuários</a></li>
					<li><a href="../produto/produto.jsp">Produtos</a></li>
					<li><a href="../servico/servico.jsp">Serviços</a></li>
					<li class="liRelato"><a href="../relato/todosRelatos.jsp">FeedBacks</a></li>

				</ul>

			</nav>

		</header>

		<div class="conteudo">

			<div class="container">

				<div class="row mt-4 mb-4">

					<div class="col">

						<form class="direita">

							<input class="rounded" type="search"
								placeholder="buscar Usuario FeedBack" name="txtbuscar"
								aria-label="Search">
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

							<th scope="col">Id Feedback</th>							
							<th scope="col">Nome Usuario</th>
							<th scope="col">FeedBack Usuarios</th>
							<th scope="col">Email Usuario</th>
							<th colspan="2" scope="col">Ação</th>

						</tr>

					</thead>

					<tbody>

						<%
						UsuarioDAO usuarioDAO = new UsuarioDAO(new Conexao().conectar());

						List<Relatos> vetorRelatos;

						String filtro = request.getParameter("btn_buscar"); // ObtÃ©m o parÃ¢metro do filtro da solicitaÃ§Ã£o
						String valorDeBusca = '%' + request.getParameter("txtbuscar") + '%'; // ObtÃ©m o parÃ¢metro do valor de busca da solicitaÃ§Ã£o

						if (filtro != null && valorDeBusca != null) {

							filtro = "buscarPorNome";
							vetorRelatos = usuarioDAO.pesquisarRelatos(filtro, valorDeBusca);

						} else {

							vetorRelatos = usuarioDAO.pesquisarRelatos("buscarTodos", null);

						}

						if (!vetorRelatos.isEmpty()) {

							for (Relatos relato : vetorRelatos) {
						%>
						<tr>

							<td><%=relato.getIdRelato()%></td>							
							<td><%=relato.getNomeUsuarios()%></td>
							<td><%=relato.getDescricaoRelato()%></td>
							<td><%=relato.getEmailUsuarios()%></td>

							<td>
							
							<a href="todosRelatos.jsp?funcao=excluir&id=<%=relato.getIdRelato()%>"
								class="text-danger"><i class="bi-trash"></i></a>
								
							</td>

						</tr>
						<%
						}
						} else {
						%>
						<tr>
							<td colspan="5">Nenhum Relato encontrado.</td>
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
	UsuarioDAO apagarRelatoDAO = new UsuarioDAO(new Conexao().conectar());
	// chamar o método apagarUsuario e retornar se houve ou não sucesso
	Boolean continua = apagarRelatoDAO.apagarRelato(id);
	if (!continua) {
		out.print("<script>alert('Erro ao excluir Relato!');</script>");
	} else {
		response.sendRedirect("todosRelatos.jsp");
	}
}
%>