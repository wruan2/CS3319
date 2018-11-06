-- Show data in all the tables
SELECT * FROM product;
SELECT * FROM agent;
SELECT * FROM customer;
SELECT * FROM purchased;
SELECT * FROM agentDeals;
-- Creates new view of customers, the products they bought, and the total price they spent
CREATE VIEW V AS(
	SELECT 
		customer.firstname, customer.lastname, 
		product.description, product.costperitem, 
		purchased.quantity, product.costperitem * purchased.quantity AS "Total" FROM customer
    LEFT JOIN purchased ON customer.customerid = purchased.customerid
    LEFT JOIN product ON product.productid = purchased.productid
    ORDER BY customer.lastname
);
-- Select from view
SELECT * FROM V;
SELECT * FROM V WHERE total > 100;
-- Deletes my madeup product
DELETE FROM product WHERE productid = '67';
-- Displays product table after deletion
SELECT * FROM product;
-- Attempts to delete agents from Springfield
DELETE FROM agent WHERE city = 'Springfield';
-- Displays agent table after deletion
SELECT * FROM agent;
-- It does not delete since I put a constraint on the table where if it references the agent in the agentDeals table it cannot delete the agent
-- Since Hugh Grant from Springfield is in the agentDeals table (i.e. has customers), therefore he cannot be deleted