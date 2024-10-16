<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.projeto.config.Conexao"%>
<%@ page import="com.projeto.bean.Servico"%>
<%@ page import="com.projeto.dao.ServicoDAO"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>

	<link rel="stylesheet" type="text/css" href="../css/inserirServico2.css">
	
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
<title>Cadastro de Servicos</title>

</head>
<body>

<div class="principal">

		<form action="" method="get">
		
			<div class="logoLogin">

				<img alt="" src="../img/logoOfic4.png">

			</div>

			<div class="divInputsLabels">
			
				<input placeholder="NOME" type="text" name="txtnome" id="txtnome" class="form-control" 
				value="<%= request.getParameter("txtnome") != null ? request.getParameter("txtnome") : "" %>">
			
				<input placeholder="DESCRIÇÃO" type="text" name="txtdescricao" id="txtdescricao" class="form-control" 
				value="<%= request.getParameter("txtdescricao") != null ? request.getParameter("txtdescricao") : "" %>">
					
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

	String nome 	 = request.getParameter("txtnome");
	String descricao = request.getParameter("txtdescricao");
	

	// instanciar a classe LivroDAO
	ServicoDAO salvarServicoDAO = new ServicoDAO(new Conexao().conectar());
	
	// instanciar a classe
	Servico novoServico = new Servico();
	// popular o objeto novoContato

	novoServico.setNomeServico(nome);
	novoServico.setDescricaoServico(descricao);	
	
		
		// chamar o método inserirContato e retornar se houve ou não sucesso
		Boolean continua = salvarServicoDAO.inserirServico(novoServico);
		
		if (!continua) {
			
			out.print("Erro no sistema");
			
		} else {
			
			response.sendRedirect("servico.jsp");
			
		}
		
	
}

if (request.getParameter("btn-fechar") != null) {
	
	response.sendRedirect("servico.jsp");
	
}

%>