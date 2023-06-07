-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE Store (
storeId INT(10) PRIMARY KEY auto_increment,
name VARCHAR(50),
startTime VARCHAR(50),
customerGrade VARCHAR(50),
streetAddr VARCHAR(50),
city VARCHAR(50),
province VARCHAR(50)
)

CREATE TABLE Seller (
sellerId INT(10) PRIMARY KEY auto_increment,
user_id INT(10)
)

CREATE TABLE User (
userId INT(10) PRIMARY KEY auto_increment,
name VARCHAR(50),
phoneNum CHAR(11)
)

CREATE TABLE Address (
addrId INT(10) PRIMARY KEY auto_increment,
user_id INT(10),
name VARCHAR(50),
city VARCHAR(50),
postalCode VARCHAR(50),
streetAddr VARCHAR(250),
province VARCHAR(50),
contactPhoneNumber CHAR(11),
FOREIGN KEY(user_id) REFERENCES User (userId)
)

CREATE TABLE Manage (
sellerId INT(10),
storeId INT(10),
setupTime DATETIME,
FOREIGN KEY(sellerId) REFERENCES Seller (sellerId),
FOREIGN KEY(storeId) REFERENCES Store (storeId)
)

CREATE TABLE Order (
orderId INT(10) PRIMARY KEY auto_increment,
creationTime DATETIME,
paymentStatus VARCHAR(50),
totalAmount INT(5)
)

CREATE TABLE Contain (
orderId INT(10),
itemId INT(10),
quantity INT(5),
FOREIGN KEY(orderId) REFERENCES Order (orderId)
)

CREATE TABLE Order_Item (
itemId INT(10) PRIMARY KEY auto_increment,
product_id INT(10),
price VARCHAR(50),
creationTime DATETIME
)

CREATE TABLE Deliver_To (
addrId INT(10),
orderId INT(10),
timeDelivered DATETIME,
FOREIGN KEY(addrId) REFERENCES Address (addrId),
FOREIGN KEY(orderId) REFERENCES Order (orderId)
)

CREATE TABLE Payment (
orderId INT(10),
cardId INT(10),
paytime DATETIME,
FOREIGN KEY(orderId) REFERENCES Order (orderId)
)

CREATE TABLE Debit_Card (
debitId INT(10) PRIMARY KEY auto_increment,
card_id INT(10)
)

CREATE TABLE Credit_Card (
creditId INT(10) PRIMARY KEY auto_increment,
card_id INT(10),
organization VARCHAR(50)
)

CREATE TABLE Bank_Card (
cardId INT(10) PRIMARY KEY auto_increment,
cardNumber CHAR(16),
user_id INT(10),
bank VARCHAR(50),
expiryDate DATE,
FOREIGN KEY(user_id) REFERENCES User (userId)
)

CREATE TABLE Save_To_Shopping_Cart (
buyerId INT(10),
productId INT(10),
addTime DATETIME,
quantity INT(10)
)

CREATE TABLE Product (
productId INT(10) PRIMARY KEY auto_increment,
store_id INT(10),
name VARCHAR(50),
brand VARCHAR(50),
type VARCHAR(50),
amount INT(5),
price FLOAT(6,2),
colour VARCHAR(50),
customerReview VARCHAR(50),
modelNumber VARCHAR(50),
FOREIGN KEY(store_id) REFERENCES Store (storeId)
)

CREATE TABLE Buyer (
buyerId INT(10) PRIMARY KEY auto_increment,
user_id INT(10),
FOREIGN KEY(user_id) REFERENCES User (userId)
)

ALTER TABLE Seller ADD FOREIGN KEY(user_id) REFERENCES User (userId)
ALTER TABLE Contain ADD FOREIGN KEY(itemId) REFERENCES Order_Item (itemId)
ALTER TABLE Order_Item ADD FOREIGN KEY(product_id) REFERENCES Product (productId)
ALTER TABLE Payment ADD FOREIGN KEY(cardId) REFERENCES Bank_Card (cardId)
ALTER TABLE Debit_Card ADD FOREIGN KEY(card_id) REFERENCES Bank_Card (cardId)
ALTER TABLE Credit_Card ADD FOREIGN KEY(card_id) REFERENCES Bank_Card (cardId)
ALTER TABLE Save_To_Shopping_Cart ADD FOREIGN KEY(buyerId) REFERENCES Buyer (buyerId)
ALTER TABLE Save_To_Shopping_Cart ADD FOREIGN KEY(productId) REFERENCES Product (productId)
