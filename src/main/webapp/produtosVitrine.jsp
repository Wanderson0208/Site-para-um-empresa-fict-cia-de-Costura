<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.projeto.config.Conexao"%>
<%@ page import="com.projeto.bean.Produto"%>
<%@ page import="com.projeto.dao.ProdutoDAO"%>
<%@ page import="java.util.List"%>
	
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" type="text/css" href="css/produtosVitrine1.css">
<link rel="stylesheet" type="text/css" href="css/footer2.css">

<!-- Itens da NAV -->
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
<body>

<div class="principal">

	<div class="redesSociais">

		<a href="https://api.whatsapp.com" target="_blank"> <img
			src="img/iconWhatsapp.png" alt="WhatsApp">

		</a> <a href="https://www.instagram.com/" target="_blank"> <img
			src="img/iconInstagram.png" alt="Instagram">

		</a> <a href="https://www.google.com.br/maps/preview" target="_blank">

			<img src="img/iconLocalizacao.png" alt="Localização">

		</a> <a class="btn btn-info" href="logout.jsp">Sair</a>

	</div>

	<header id="home">

		<nav>

			<ul>

				<li><a href="sobMedida.jsp">Sob Medida</a></li>
				<li><a href="home.jsp">Serviços</a></li>
				<li><a href="#">Produtos</a></li>
				<li><a href="home.jsp">Sobre Nós</a></li>
				<li><a href="login.jsp">Login</a></li>

			</ul>

		</nav>

	</header>
	
	<div class="logo">
	
		<div class="filtroPageProdutos">

			<a href="home.jsp">
			
				<img alt="" src="img/logoOfic3.png">
		
			</a>
			
		</div>
		
	</div>
	
	<div class="conteudo">
	
		<section>
			
			<h1>Peças que temos no Estoque!!!</h1>
		
		</section>
		
		<section class="AreaProdutosVitrine">
		
						<%
									
							ProdutoDAO produtoDAO = new ProdutoDAO(new Conexao().conectar());
	
							List<Produto> vetoProdutos;
	
							vetoProdutos = produtoDAO.buscarProdutos("buscarTodos", null);
	
							if (!vetoProdutos.isEmpty()) {
	
								for (Produto produto : vetoProdutos) {
								
						%>
						
			<div class="itemProduto">
			
				<section class="imgProduto">
				
					<img src="produto/imagem/<%=produto.getImagem()%>">
				
				</section>
				
				<section class="areaDescETamnho">
					
					<div class="divDescricaoProd"><%=produto.getDescricao()%></div>
					
					<div class="divTamanhoProd"><%=produto.getTamanho()%></div>
					
				</section>
				
				<section class="areaBtn">
				
					<a href="https://api.whatsapp.com">Saber Mias</a>
				
				</section>
			
			</div>
			
			<%
			
				}
				}
				
			%>
		
		</section>
	
	</div>

		<footer>
		
			<div class="divNavFooter">
			
				<ul>

					<li><a href="sobMedida.jsp">Sob Medida</a></li>
					<li><a href="#serv">Serviços</a></li>
					<li><a href="produtosVitrine.jsp">Produtos</a></li>
					<li><a href="#sobre">Sobre Nós</a></li>
					<li><a href="login.jsp">Login</a></li>

				</ul>
			
			</div>
			
			<div class="divLogosFooter">
			
				<section class="divImgLogoModaFooter">
					
					<img alt="" src="img/logoOficBranca.png">
				
				</section>
				
				<section class="divImgLogoSenacFooter">
				
					<img alt="" src="img/logoSenac.png">
				
				</section>
			
			</div>
			
			<div class="divImgRedesSociasFooter">
				
				<div class="divImgLogoDelta">
					
					<img alt="" src="img/logoDelta.png">
				
				</div>
				
				<div class="divIconsRedesFooter">
				
					<a href="https://api.whatsapp.com" target="_blank">
					
						<img src="img/iconWhatsappBranco.png" alt="WhatsApp">

					</a> 
					
					<a href="https://www.instagram.com/" target="_blank">
						
						<img src="img/iconInstagramBranco.png" alt="Instagram">

					</a> 
					
					<a href="https://www.google.com.br/maps/preview" target="_blank">

						<img src="img/iconLocalizacaoBranco.png" alt="Localização">

					</a>
					
					<a href="loginAdm.jsp" target="_blank">

						<img src="img/iconLoginAdmBranco.png" alt="Localização">

					</a>
				
				</div>
			
			</div>
		
		</footer>
	
</div>
</body>
</html>