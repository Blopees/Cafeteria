-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 28/09/2023 às 20:16
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `cafeteria`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `autenticacao`
--

CREATE TABLE `autenticacao` (
  `id_Autenticacao` int(100) NOT NULL,
  `idCliente` int(100) DEFAULT NULL,
  `id_Operador` int(100) DEFAULT NULL,
  `id_niveis_admin` int(100) DEFAULT NULL,
  `Login` varchar(255) DEFAULT NULL,
  `Senha` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

CREATE TABLE `cliente` (
  `idCliente` int(100) NOT NULL,
  `Nome` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Telefone` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `itens`
--

CREATE TABLE `itens` (
  `id_Itens` int(100) NOT NULL,
  `id_Produto` int(100) DEFAULT NULL,
  `Quantidade` int(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `niveis_admin`
--

CREATE TABLE `niveis_admin` (
  `id_niveis_admin` int(100) NOT NULL,
  `Nivel` int(2) DEFAULT NULL,
  `Descrição` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `operador`
--

CREATE TABLE `operador` (
  `id_Operador` int(100) NOT NULL,
  `Nome` varchar(40) DEFAULT NULL,
  `Email` varchar(250) DEFAULT NULL,
  `Telefone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `pagamento`
--

CREATE TABLE `pagamento` (
  `id_Pagamento` int(100) NOT NULL,
  `id_Pedido` int(100) NOT NULL,
  `Hora_Data` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `pedido`
--

CREATE TABLE `pedido` (
  `id_Pedido` int(100) NOT NULL,
  `idCliente` int(100) DEFAULT NULL,
  `id_Operador` int(100) DEFAULT NULL,
  `id_Itens` int(100) DEFAULT NULL,
  `Forma_Pagamento` varchar(100) DEFAULT NULL,
  `Pedido_Fechado` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `produto`
--

CREATE TABLE `produto` (
  `id_Produto` int(100) NOT NULL,
  `Categoria` varchar(250) DEFAULT NULL,
  `Preço` varchar(250) DEFAULT NULL,
  `Descrição` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `autenticacao`
--
ALTER TABLE `autenticacao`
  ADD PRIMARY KEY (`id_Autenticacao`),
  ADD KEY `idCliente` (`idCliente`),
  ADD KEY `id_Operador` (`id_Operador`),
  ADD KEY `id_niveis_admin` (`id_niveis_admin`);

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idCliente`);

--
-- Índices de tabela `itens`
--
ALTER TABLE `itens`
  ADD PRIMARY KEY (`id_Itens`),
  ADD KEY `id_Produto` (`id_Produto`);

--
-- Índices de tabela `niveis_admin`
--
ALTER TABLE `niveis_admin`
  ADD PRIMARY KEY (`id_niveis_admin`);

--
-- Índices de tabela `operador`
--
ALTER TABLE `operador`
  ADD PRIMARY KEY (`id_Operador`);

--
-- Índices de tabela `pagamento`
--
ALTER TABLE `pagamento`
  ADD PRIMARY KEY (`id_Pagamento`),
  ADD KEY `id_Pedido` (`id_Pedido`);

--
-- Índices de tabela `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id_Pedido`),
  ADD KEY `idCliente` (`idCliente`),
  ADD KEY `id_Operador` (`id_Operador`),
  ADD KEY `id_Itens` (`id_Itens`);

--
-- Índices de tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`id_Produto`);

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `autenticacao`
--
ALTER TABLE `autenticacao`
  ADD CONSTRAINT `autenticacao_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`),
  ADD CONSTRAINT `autenticacao_ibfk_2` FOREIGN KEY (`id_Operador`) REFERENCES `operador` (`id_Operador`),
  ADD CONSTRAINT `autenticacao_ibfk_3` FOREIGN KEY (`id_niveis_admin`) REFERENCES `niveis_admin` (`id_niveis_admin`);

--
-- Restrições para tabelas `itens`
--
ALTER TABLE `itens`
  ADD CONSTRAINT `itens_ibfk_1` FOREIGN KEY (`id_Produto`) REFERENCES `produto` (`id_Produto`);

--
-- Restrições para tabelas `pagamento`
--
ALTER TABLE `pagamento`
  ADD CONSTRAINT `pagamento_ibfk_1` FOREIGN KEY (`id_Pedido`) REFERENCES `pedido` (`id_Pedido`);

--
-- Restrições para tabelas `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`),
  ADD CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`id_Operador`) REFERENCES `operador` (`id_Operador`),
  ADD CONSTRAINT `pedido_ibfk_3` FOREIGN KEY (`id_Itens`) REFERENCES `itens` (`id_Itens`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
