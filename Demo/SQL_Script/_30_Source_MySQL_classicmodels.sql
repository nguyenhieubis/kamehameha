-- --// MySQL - localhost - classicmodels //-- --
-- -------------------------// customers //------------------------- --
-- PROCEDURE: sp_select_customers
USE `classicmodels`;
DELIMITER $$
DROP PROCEDURE IF EXISTS `sp_select_customers`;
CREATE PROCEDURE `sp_select_customers`
()
BEGIN
SELECT `customerNumber`,
`customerName`,
`contactLastName`,
`contactFirstName`,
`phone`,
`addressLine1`,
`addressLine2`,
`city`,
`state`,
`postalCode`,
`country`,
`salesRepEmployeeNumber`,
`creditLimit`
FROM customers;
END
$$


-- --// MySQL - localhost - classicmodels //-- --
-- -------------------------// employees //------------------------- --
-- PROCEDURE: sp_select_employees
USE `classicmodels`;
DELIMITER $$
DROP PROCEDURE IF EXISTS `sp_select_employees`;
CREATE PROCEDURE `sp_select_employees`
()
BEGIN
SELECT `employeeNumber`,
`lastName`,
`firstName`,
`extension`,
`email`,
`officeCode`,
`reportsTo`,
`jobTitle`
FROM employees;
END
$$


-- --// MySQL - localhost - classicmodels //-- --
-- -------------------------// offices //------------------------- --
-- PROCEDURE: sp_select_offices
USE `classicmodels`;
DELIMITER $$
DROP PROCEDURE IF EXISTS `sp_select_offices`;
CREATE PROCEDURE `sp_select_offices`
()
BEGIN
SELECT `officeCode`,
`city`,
`phone`,
`addressLine1`,
`addressLine2`,
`state`,
`country`,
`postalCode`,
`territory`
FROM offices;
END
$$


-- --// MySQL - localhost - classicmodels //-- --
-- -------------------------// orderdetails //------------------------- --
-- PROCEDURE: sp_select_orderdetails
USE `classicmodels`;
DELIMITER $$
DROP PROCEDURE IF EXISTS `sp_select_orderdetails`;
CREATE PROCEDURE `sp_select_orderdetails`
()
BEGIN
SELECT `orderNumber`,
`productCode`,
`quantityOrdered`,
`priceEach`,
`orderLineNumber`
FROM orderdetails;
END
$$


-- --// MySQL - localhost - classicmodels //-- --
-- -------------------------// orders //------------------------- --
-- PROCEDURE: sp_select_orders
USE `classicmodels`;
DELIMITER $$
DROP PROCEDURE IF EXISTS `sp_select_orders`;
CREATE PROCEDURE `sp_select_orders`
()
BEGIN
SELECT `orderNumber`,
`orderDate`,
`requiredDate`,
`shippedDate`,
`status`,
`comments`,
`customerNumber`
FROM orders;
END
$$


-- --// MySQL - localhost - classicmodels //-- --
-- -------------------------// payments //------------------------- --
-- PROCEDURE: sp_select_payments
USE `classicmodels`;
DELIMITER $$
DROP PROCEDURE IF EXISTS `sp_select_payments`;
CREATE PROCEDURE `sp_select_payments`
()
BEGIN
SELECT `customerNumber`,
`checkNumber`,
`paymentDate`,
`amount`
FROM payments;
END
$$


-- --// MySQL - localhost - classicmodels //-- --
-- -------------------------// productlines //------------------------- --
-- PROCEDURE: sp_select_productlines
USE `classicmodels`;
DELIMITER $$
DROP PROCEDURE IF EXISTS `sp_select_productlines`;
CREATE PROCEDURE `sp_select_productlines`
()
BEGIN
SELECT `productLine`,
`textDescription`,
`htmlDescription`,
`image`
FROM productlines;
END
$$


-- --// MySQL - localhost - classicmodels //-- --
-- -------------------------// products //------------------------- --
-- PROCEDURE: sp_select_products
USE `classicmodels`;
DELIMITER $$
DROP PROCEDURE IF EXISTS `sp_select_products`;
CREATE PROCEDURE `sp_select_products`
()
BEGIN
SELECT `productCode`,
`productName`,
`productLine`,
`productScale`,
`productVendor`,
`productDescription`,
`quantityInStock`,
`buyPrice`,
`MSRP`
FROM products;
END
$$


