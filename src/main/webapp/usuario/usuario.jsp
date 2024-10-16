<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.projeto.config.Conexao"%>
<%@ page import="com.projeto.bean.Usuario"%>
<%@ page import="com.projeto.dao.UsuarioDAO"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="ISO-8859-1">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="../css/admPageUsers.css">

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
				
				<h4><%out.print(carrega);%></h4>
			
			</div>

			<nav>

				<ul>

					<li class="liUsuario"><a href="">Usuários</a></li>
					<li><a href="../produto/produto.jsp">Produtos</a></li>
					<li><a href="../servico/servico.jsp">Serviços</a></li>
					<li><a href="../relato/todosRelatos.jsp">FeedBacks</a></li>

				</ul>

			</nav>

		</header>

		<div class="conteudo">

			<div class="container">

				<div class="col">

					<form action="inserirUsuarioAdm.jsp">

						<button type="submit" class="btn btn-info btn-sm">Novo
							Usuario</button>

					</form>

				</div>

				<div class="row mt-4 mb-4">

					<div class="col">

						<form class="direita">

							<input class="rounded" type="search" placeholder="buscar nome"
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

							<th scope="col">IdUsuario</th>
							<th scope="col">Nome</th>
							<th scope="col">Email</th>
							<th scope="col">Senha</th>
							<th scope="col">Telefone</th>
							<th colspan="2" scope="col">Ação</th>

						</tr>

					</thead>

					<tbody>

						<%
						UsuarioDAO usuarioDAO = new UsuarioDAO(new Conexao().conectar());

						List<Usuario> vetorUsuarios;

						String filtro = request.getParameter("btn_buscar"); // ObtÃ©m o parÃ¢metro do filtro da solicitaÃ§Ã£o
						String valorDeBusca = '%' + request.getParameter("txtbuscar") + '%'; // ObtÃ©m o parÃ¢metro do valor de busca da solicitaÃ§Ã£o

						if (filtro != null && valorDeBusca != null) {

							filtro = "buscarPorNome";
							vetorUsuarios = usuarioDAO.buscarUsuarios(filtro, valorDeBusca);

						} else {

							vetorUsuarios = usuarioDAO.buscarUsuarios("buscarTodos", null);

						}

						if (!vetorUsuarios.isEmpty()) {

							for (Usuario usuario : vetorUsuarios) {
						%>

						<tr>

							<td><%=usuario.getIdUsuario()%></td>
							<td><%=usuario.getNome()%></td>
							<td><%=usuario.getEmail()%></td>
							<td>******</td>
							<td><%=usuario.getTelefone()%></td>
							<!--<td>

								<form action="relato.jsp">

									<input type="hidden" name="id"
										value="<%=usuario.getIdUsuario()%>"> <input
										type="hidden" name="nome" value="<%=usuario.getNome()%>">
									<button type="submit" class="btn">
										<i class="bi-pencil"></i>
									</button>

								</form>

							</td>-->

							<td>

								<form action="editarUsuario.jsp">

									<!-- passando o id de forma oculta -->
									<input type="hidden" name="id"
										value="<%=usuario.getIdUsuario()%>"> <input
										type="hidden" name="email" value="<%=usuario.getEmail()%>">
									<input type="hidden" name="telefone"
										value="<%=usuario.getTelefone()%>">

									<button type="submit" class="btn">

										<!--<i class="bi-pencil"></i>-->
										Editar

									</button>

									<a
										href="usuario.jsp?funcao=excluir&id=<%=usuario.getIdUsuario()%>"
										class="text-danger"> <!--<i class="bi-trash"></i>-->
										excluir

									</a>

								</form>

							</td>

						</tr>
						<%
						}

						} else {
						%>

						<tr>

							<td colspan="5">Nenhum Usuario encontrado.</td>

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

	// instanciar a classe UsuarioDAO
	UsuarioDAO apagarUsuarioDAO = new UsuarioDAO(new Conexao().conectar());

	// chamar o método apagarUsuario e retornar se houve ou não sucesso
	Boolean continua = apagarUsuarioDAO.apagarUsuario(id);

	if (!continua) {

		out.print("<script>alert('Erro ao excluir usuario!');</script>");

	} else {

		response.sendRedirect("usuario.jsp");
		out.print("<script>alert('Usuario excluido com sucesso!');</script>");

	}

}
%>