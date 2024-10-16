<%

	// fechar qualquer sessão
	session.invalidate();

	// redirecionar o index.jsp
	response.sendRedirect("http://localhost:8080/ProjetoIntegrador/home.jsp");
	
%>