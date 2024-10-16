<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.projeto.config.Conexao"%>
<%@ page import="com.projeto.bean.Servico"%>
<%@ page import="com.projeto.dao.ServicoDAO"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" type="text/css" href="../css/editarServico2.css">
	
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

// Capturando o Id que foi chamado ocultamente na linha 139 de produto.jsp
String servicoId = request.getParameter("idServico");

%>

<body>

	<%
	
	try {

		// instanciar a classe ContatoDao
		ServicoDAO servicoDAO = new ServicoDAO(new Conexao().conectar());
		// Abaixo é criado uma lista baseada na classe Usuario
		List<Servico> vetorServicos;
		
		// o array vetorLivros estará recebendo os dados de buscarPerfil
		vetorServicos = servicoDAO.buscarId(servicoId);
		// O idUser acima veio da declaração que está na validação da sessão

		for (Servico serv : vetorServicos) {
			
	%>
	
	<div class="principal">

		<form action="" method="post">
		
			<div class="logoLogin">

				<img alt="" src="../img/logoOfic4.png">

			</div>

			<input type="hidden" name="id" id="id" value="<%=serv.getIdServico()%>">

			<div class="divInputsLabels">

				<input type="text" name="txtnome" id="txtnome"
				value="<%=serv.getNomeServico()%>">
			
				<input type="text" name="txtdescricao" id="txtdescricao"
				value="<%=serv.getDescricaoServico()%>">
					
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
	String descricao = request.getParameter("txtdescricao");
	
	// instanciar a classe ContatoDao
	ServicoDAO servicoDAO = new ServicoDAO(new Conexao().conectar());
	
	//instanciar a classe Contato
	Servico editaServico = new Servico();
	// popular o objeto editaContato

	editaServico.setIdServico(id);
	editaServico.setNomeServico(nome);
	editaServico.setDescricaoServico(descricao);


	Boolean continua = servicoDAO.editarServico(editaServico);
	
	if (!continua) {
		
		out.print("<script>alert('Erro ao editar Servico!');</script>");
		
	} else {
		
		response.sendRedirect("servico.jsp");
		
	}

}

if (request.getParameter("btn-fechar") != null) {
	
	response.sendRedirect("servico.jsp");
	
}

%>