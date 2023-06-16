-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 16/06/2023 às 21:48
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
-- Banco de dados: `umbrela`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `address`
--

CREATE TABLE `address` (
  `addrId` int(10) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `postalCode` varchar(50) DEFAULT NULL,
  `streetAddr` varchar(250) DEFAULT NULL,
  `province` varchar(50) DEFAULT NULL,
  `contactPhoneNumber` char(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `bank_card`
--

CREATE TABLE `bank_card` (
  `cardId` int(10) NOT NULL,
  `cardNumber` char(19) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  `bank` varchar(50) DEFAULT NULL,
  `expiryDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `buyer`
--

CREATE TABLE `buyer` (
  `buyerId` int(10) NOT NULL,
  `user_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `comments`
--

CREATE TABLE `comments` (
  `idComm` int(11) NOT NULL,
  `userid` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  `creationTime` datetime NOT NULL,
  `grade` float(2,1) DEFAULT NULL,
  `content` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `contain`
--

CREATE TABLE `contain` (
  `orderId` int(10) DEFAULT NULL,
  `itemId` int(10) DEFAULT NULL,
  `quantity` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `credit_card`
--

CREATE TABLE `credit_card` (
  `creditId` int(10) NOT NULL,
  `card_id` int(10) DEFAULT NULL,
  `organization` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `debit_card`
--

CREATE TABLE `debit_card` (
  `debitId` int(10) NOT NULL,
  `card_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `deliver_to`
--

CREATE TABLE `deliver_to` (
  `addrId` int(10) DEFAULT NULL,
  `orderId` int(10) DEFAULT NULL,
  `timeDelivered` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `manage`
--

CREATE TABLE `manage` (
  `sellerId` int(10) DEFAULT NULL,
  `storeId` int(10) DEFAULT NULL,
  `setupTime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `order`
--

CREATE TABLE `order` (
  `orderId` int(10) NOT NULL,
  `creationTime` datetime DEFAULT NULL,
  `paymentStatus` varchar(50) DEFAULT NULL,
  `totalAmount` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `order_item`
--

CREATE TABLE `order_item` (
  `itemId` int(10) NOT NULL,
  `product_id` int(10) DEFAULT NULL,
  `price` varchar(50) DEFAULT NULL,
  `creationTime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `payment`
--

CREATE TABLE `payment` (
  `orderId` int(10) DEFAULT NULL,
  `cardId` int(10) DEFAULT NULL,
  `paytime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `product`
--

CREATE TABLE `product` (
  `productId` int(10) NOT NULL,
  `store_id` int(10) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `brand` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `amount` int(5) DEFAULT NULL,
  `price` float(6,2) DEFAULT NULL,
  `colour` varchar(50) DEFAULT NULL,
  `customerReview` varchar(50) DEFAULT NULL,
  `modelNumber` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `save_to_shopping_cart`
--

CREATE TABLE `save_to_shopping_cart` (
  `buyerId` int(10) DEFAULT NULL,
  `productId` int(10) DEFAULT NULL,
  `addTime` datetime DEFAULT NULL,
  `quantity` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `seller`
--

CREATE TABLE `seller` (
  `sellerId` int(10) NOT NULL,
  `user_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `service_point`
--

CREATE TABLE `service_point` (
  `serviceId` int(11) NOT NULL,
  `streetAddr` varchar(250) DEFAULT NULL,
  `province` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `startTime` varchar(50) DEFAULT NULL,
  `endTime` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `store`
--

CREATE TABLE `store` (
  `storeId` int(10) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `startTime` datetime DEFAULT NULL,
  `customerGrade` int(1) DEFAULT NULL,
  `streetAddr` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `province` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `user`
--

CREATE TABLE `user` (
  `userId` int(10) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `phoneNum` char(13) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`addrId`),
  ADD KEY `user_id` (`user_id`);

--
-- Índices de tabela `bank_card`
--
ALTER TABLE `bank_card`
  ADD PRIMARY KEY (`cardId`),
  ADD KEY `user_id` (`user_id`);

--
-- Índices de tabela `buyer`
--
ALTER TABLE `buyer`
  ADD PRIMARY KEY (`buyerId`),
  ADD KEY `user_id` (`user_id`);

--
-- Índices de tabela `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`idComm`),
  ADD KEY `userid` (`userid`),
  ADD KEY `productId` (`productId`);

--
-- Índices de tabela `contain`
--
ALTER TABLE `contain`
  ADD KEY `orderId` (`orderId`),
  ADD KEY `itemId` (`itemId`);

--
-- Índices de tabela `credit_card`
--
ALTER TABLE `credit_card`
  ADD PRIMARY KEY (`creditId`),
  ADD KEY `card_id` (`card_id`);

--
-- Índices de tabela `debit_card`
--
ALTER TABLE `debit_card`
  ADD PRIMARY KEY (`debitId`),
  ADD KEY `card_id` (`card_id`);

--
-- Índices de tabela `deliver_to`
--
ALTER TABLE `deliver_to`
  ADD KEY `addrId` (`addrId`),
  ADD KEY `orderId` (`orderId`);

--
-- Índices de tabela `manage`
--
ALTER TABLE `manage`
  ADD KEY `sellerId` (`sellerId`),
  ADD KEY `storeId` (`storeId`);

--
-- Índices de tabela `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`orderId`);

--
-- Índices de tabela `order_item`
--
ALTER TABLE `order_item`
  ADD PRIMARY KEY (`itemId`),
  ADD KEY `product_id` (`product_id`);

--
-- Índices de tabela `payment`
--
ALTER TABLE `payment`
  ADD KEY `orderId` (`orderId`),
  ADD KEY `cardId` (`cardId`);

--
-- Índices de tabela `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`productId`),
  ADD KEY `store_id` (`store_id`);

--
-- Índices de tabela `save_to_shopping_cart`
--
ALTER TABLE `save_to_shopping_cart`
  ADD KEY `buyerId` (`buyerId`),
  ADD KEY `productId` (`productId`);

--
-- Índices de tabela `seller`
--
ALTER TABLE `seller`
  ADD PRIMARY KEY (`sellerId`),
  ADD KEY `user_id` (`user_id`);

--
-- Índices de tabela `service_point`
--
ALTER TABLE `service_point`
  ADD PRIMARY KEY (`serviceId`);

--
-- Índices de tabela `store`
--
ALTER TABLE `store`
  ADD PRIMARY KEY (`storeId`);

--
-- Índices de tabela `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userId`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `address`
--
ALTER TABLE `address`
  MODIFY `addrId` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `bank_card`
--
ALTER TABLE `bank_card`
  MODIFY `cardId` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `buyer`
--
ALTER TABLE `buyer`
  MODIFY `buyerId` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `comments`
--
ALTER TABLE `comments`
  MODIFY `idComm` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `credit_card`
--
ALTER TABLE `credit_card`
  MODIFY `creditId` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `debit_card`
--
ALTER TABLE `debit_card`
  MODIFY `debitId` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `order`
--
ALTER TABLE `order`
  MODIFY `orderId` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `order_item`
--
ALTER TABLE `order_item`
  MODIFY `itemId` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `product`
--
ALTER TABLE `product`
  MODIFY `productId` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `seller`
--
ALTER TABLE `seller`
  MODIFY `sellerId` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `service_point`
--
ALTER TABLE `service_point`
  MODIFY `serviceId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `store`
--
ALTER TABLE `store`
  MODIFY `storeId` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `user`
--
ALTER TABLE `user`
  MODIFY `userId` int(10) NOT NULL AUTO_INCREMENT;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `address_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`userId`);

--
-- Restrições para tabelas `bank_card`
--
ALTER TABLE `bank_card`
  ADD CONSTRAINT `bank_card_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`userId`);

--
-- Restrições para tabelas `buyer`
--
ALTER TABLE `buyer`
  ADD CONSTRAINT `buyer_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`userId`);

--
-- Restrições para tabelas `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `buyer` (`buyerId`),
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`productId`) REFERENCES `product` (`productId`);

--
-- Restrições para tabelas `contain`
--
ALTER TABLE `contain`
  ADD CONSTRAINT `contain_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `order` (`orderId`),
  ADD CONSTRAINT `contain_ibfk_2` FOREIGN KEY (`itemId`) REFERENCES `order_item` (`itemId`);

--
-- Restrições para tabelas `credit_card`
--
ALTER TABLE `credit_card`
  ADD CONSTRAINT `credit_card_ibfk_1` FOREIGN KEY (`card_id`) REFERENCES `bank_card` (`cardId`);

--
-- Restrições para tabelas `debit_card`
--
ALTER TABLE `debit_card`
  ADD CONSTRAINT `debit_card_ibfk_1` FOREIGN KEY (`card_id`) REFERENCES `bank_card` (`cardId`);

--
-- Restrições para tabelas `deliver_to`
--
ALTER TABLE `deliver_to`
  ADD CONSTRAINT `deliver_to_ibfk_1` FOREIGN KEY (`addrId`) REFERENCES `address` (`addrId`),
  ADD CONSTRAINT `deliver_to_ibfk_2` FOREIGN KEY (`orderId`) REFERENCES `order` (`orderId`);

--
-- Restrições para tabelas `manage`
--
ALTER TABLE `manage`
  ADD CONSTRAINT `manage_ibfk_1` FOREIGN KEY (`sellerId`) REFERENCES `seller` (`sellerId`),
  ADD CONSTRAINT `manage_ibfk_2` FOREIGN KEY (`storeId`) REFERENCES `store` (`storeId`);

--
-- Restrições para tabelas `order_item`
--
ALTER TABLE `order_item`
  ADD CONSTRAINT `order_item_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`productId`);

--
-- Restrições para tabelas `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `order` (`orderId`),
  ADD CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`cardId`) REFERENCES `bank_card` (`cardId`);

--
-- Restrições para tabelas `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `store` (`storeId`);

--
-- Restrições para tabelas `save_to_shopping_cart`
--
ALTER TABLE `save_to_shopping_cart`
  ADD CONSTRAINT `save_to_shopping_cart_ibfk_1` FOREIGN KEY (`buyerId`) REFERENCES `buyer` (`buyerId`),
  ADD CONSTRAINT `save_to_shopping_cart_ibfk_2` FOREIGN KEY (`productId`) REFERENCES `product` (`productId`);

--
-- Restrições para tabelas `seller`
--
ALTER TABLE `seller`
  ADD CONSTRAINT `seller_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`userId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
