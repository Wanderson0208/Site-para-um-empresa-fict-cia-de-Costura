<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.projeto.config.Conexao"%>
<%@ page import="com.projeto.bean.Usuario"%>
<%@ page import="com.projeto.bean.Relatos"%>
<%@ page import="com.projeto.dao.UsuarioDAO"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<!-- LINKS CSS & JS -->
<link rel="stylesheet" type="text/css" href="css/header.css">
<link rel="stylesheet" type="text/css" href="css/sobre.css">
<link rel="stylesheet" type="text/css" href="css/servico.css">
<link rel="stylesheet" type="text/css" href="css/relatos.css">

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

</head>
<body>

	<div class="principal">

		<div class="redesSociais">

			<a href="https://api.whatsapp.com" target="_blank"> 
			
				<img src="img/iconWhatsapp.png" alt="WhatsApp">

			</a> 
			
			<a href="https://www.instagram.com/" target="_blank"> <img
				src="img/iconInstagram.png" alt="Instagram">

			</a> <a href="https://www.google.com.br/maps/preview" target="_blank">

				<img src="img/iconLocalizacao.png" alt="Localização">

			</a>

		</div>

		<header id="home">

			<div class="filtro">

				<nav>

					<div class="logo">

						<img alt="" src="img/logoOfic3.png">

					</div>

					<ul>

						<li><a href="#">Sob Medida</a></li>
						<li><a href="#serv">Serviços</a></li>
						<li><a href="#carrossels">Produtos</a></li>
						<li><a href="#sobre">Sobre Nós</a></li>
						<li><a href="#faleConosco">Fale Conosco</a></li>
						<li><a href="login.jsp">Login</a></li>

					</ul>

				</nav>

				<section class="secTituloHeader">

					<h2>Bem Vindo(a) a</h2>
					<h1>Medeling Greams</h1>

					<p>
						Aqui nós iremos tornar o Seu Sonho realidade! Nossa prioridade é
						você e seus sonhos. Desfrute de nossos serviços de encomenda <span>Sob
							Medida</span>, onde confeccionaremos uma peça que seja literalmente e
						exclusivamente para você!
					</p>

				</section>

			</div>

		</header>

		<div class="divSobre" id="sobre">

			<section class="textosSobre">

				<div class="conteudo">

					<h1 class="h1sSobre">Sobre</h1>

					<br>

					<p class="paragrafosSobre">Lorem ipsum dolor sit amet
						consectetur adipisicing elit. Consequatur accusamus perferendis</p>

				</div>

				<div class="conteudo">

					<h1 class="h1sSobre">Metas & Objetvos</h1>

					<br>

					<p class="paragrafosSobre">Lorem ipsum dolor sit amet
						consectetur adipisicing elit. Consequatur accusamus perferendis</p>

				</div>

				<div class="conteudo">

					<h1 class="h1sSobre">Missão</h1>

					<br>

					<p class="paragrafosSobre">Lorem ipsum dolor sit amet
						consectetur adipisicing elit. Consequatur accusamus perferendis</p>

				</div>

			</section>

			<section class="ImgSobre"></section>

		</div>


		<div class="divServicos" id="serv">

			<div class="tituloServicos">

				<h1>Conheça Nossos Serviços</h1>

			</div>

			<div class="wrapper">

				<div class="image">

					<img src="img/imgServConcertos.jpg" alt="">

					<div class="content">

						<section class="titleServ bb">

							<h1>Concertos e Ajustes</h1>

						</section>

						<section class="descricaoServ bb">

							<p>Aqui na Modeling Dreams, também oferecemos consertos e
								ajustes em roupas e acessórios.</p>

						</section>

						<section class="btnServ bb">

							<a href="">SAIBA MAIS...</a>

						</section>

					</div>

				</div>


				<div class="image">

					<img src="img/imgServProdutos.jpg" alt="">

					<div class="content">

						<section class="titleServ bb">

							<h1>Venda de Produtos</h1>

						</section>

						<section class="descricaoServ bb">

							<p>Aqui, oferecemos peças de roupa já fabricadas pela nossa
								equipe. Venha conferir.</p>

						</section>

						<section class="btnServ bb">

							<a href="#carrossels">SAIBA MAIS...</a>

						</section>

					</div>

				</div>


				<div class="image">

					<img src="img/imgServSobMedida.jpg" alt="">

					<div class="content">

						<section class="titleServ bb">

							<h1>Sob Medida</h1>

						</section>

						<section class="descricaoServ bb">

							<p>Com a Modeling Dreams, você pode encomendar peças sob
								medida perfeitas para você! Venha modelar-se conosco.</p>

						</section>

						<section class="btnServ bb">

							<a href="">SAIBA MAIS...</a>

						</section>

					</div>

				</div>

			</div>


		</div>

		<div class="divRelatos">

			<div class="sessaoTituloRelatos">

				<h1>Relatos de Nossos Clientes</h1>

			</div>

			<div class="sessaoRelatos">

				<%
				UsuarioDAO usuarioDAO = new UsuarioDAO(new Conexao().conectar());
				List<Relatos> vetorRelato;

				vetorRelato = usuarioDAO.buscarRelatosAll();

				if (!vetorRelato.isEmpty()) {
					for (Relatos rel : vetorRelato) {
				%>
				<section class="relatos">

					<section class="imgUser">
					
					</section>
					
					<br>

					<h1 class="nomeUsuarioRelatos"><%=rel.getNomeUsuarios()%></h1>

					<br>
					
					<p class="pDescricaoRelatos"><%=rel.getDescricaoRelato()%></p>

				</section>
				<%
				}
				}
				%>

			</div>

		</div>

	</div>

</body>
</html>