-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 16/10/2024 às 19:25
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `projetodelta`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `adm`
--

CREATE TABLE `adm` (
  `idAdm` int(11) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `senha` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `adm`
--

INSERT INTO `adm` (`idAdm`, `email`, `senha`) VALUES
(1, 'adm@gmail.com', '123456');

-- --------------------------------------------------------

--
-- Estrutura para tabela `produtos`
--

CREATE TABLE `produtos` (
  `idProduto` int(11) NOT NULL,
  `descricao` varchar(350) DEFAULT NULL,
  `valor` decimal(5,2) DEFAULT NULL,
  `tamanho` varchar(5) DEFAULT NULL,
  `quantidade` varchar(5) DEFAULT NULL,
  `promocao` varchar(100) DEFAULT NULL,
  `imagem` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `produtos`
--

INSERT INTO `produtos` (`idProduto`, `descricao`, `valor`, `tamanho`, `quantidade`, `promocao`, `imagem`) VALUES
(1, 'Camisa de Manga Larga', 55.59, 'M', '8', '50% de desconto para todos', 'camisa.png'),
(6, 'Meias', 9.99, 'P - M', '5', '', 'meia.png'),
(9, 'Carrinho Hot Weels', 19.99, 'M', '50', 'Na compra de dois carrinhos, o terceiro � de gra�a', 'carrinho.png');

-- --------------------------------------------------------

--
-- Estrutura para tabela `relatos`
--

CREATE TABLE `relatos` (
  `idRelato` int(11) NOT NULL,
  `descricaoRelato` varchar(600) NOT NULL,
  `nomeUsuarios` varchar(100) DEFAULT NULL,
  `emailUsuarios` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `relatos`
--

INSERT INTO `relatos` (`idRelato`, `descricaoRelato`, `nomeUsuarios`, `emailUsuarios`) VALUES
(21, 'Boa noite povo que eu cheguei. Mais outra vez pra apresentar meu baihana!!!', 'Mano GB', 'gbzin@gmail.com'),
(22, 'Algum feedback aqui', 'Wanderson Luis Lima', 'w@gmail.com');

-- --------------------------------------------------------

--
-- Estrutura para tabela `servico`
--

CREATE TABLE `servico` (
  `idServico` int(11) NOT NULL,
  `nomeServ` varchar(50) NOT NULL,
  `descricaoServ` varchar(350) NOT NULL,
  `imagemServ` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `servico`
--

INSERT INTO `servico` (`idServico`, `nomeServ`, `descricaoServ`, `imagemServ`) VALUES
(3, 'Sob Medidaa', 'Aqui fazermos roupas com base em suas medidas! Venha ter sua roupa dos sonhos.', 'imgServSobMedida.jpg'),
(4, 'Ajuste & Concertos', 'Aqui fazemos ajustes de concertos de pe�as de roupas e acess�rios', 'imgServConcertos.jpg'),
(6, 'Vitrine de Produtos', 'Aqui voc� ver� diversas pe�as de roupas que temops prontas em nosso armazenamento.', 'imgServProdutos.jpg');

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` bigint(20) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha` varchar(15) NOT NULL,
  `telefone` varchar(14) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `nome`, `email`, `senha`, `telefone`) VALUES
(1, 'Wanderson Luis', 'wanderson@gmail.com', '123456', '+5521966554477'),
(16, 'Wand�co', 'wandeco@gmail.com', '123456', '21944887755');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `adm`
--
ALTER TABLE `adm`
  ADD PRIMARY KEY (`idAdm`);

--
-- Índices de tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`idProduto`);

--
-- Índices de tabela `relatos`
--
ALTER TABLE `relatos`
  ADD PRIMARY KEY (`idRelato`);

--
-- Índices de tabela `servico`
--
ALTER TABLE `servico`
  ADD PRIMARY KEY (`idServico`);

--
-- Índices de tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `adm`
--
ALTER TABLE `adm`
  MODIFY `idAdm` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `idProduto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `relatos`
--
ALTER TABLE `relatos`
  MODIFY `idRelato` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de tabela `servico`
--
ALTER TABLE `servico`
  MODIFY `idServico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
