-- 1. SELECT
SELECT
	*
FROM
	ORDERS;
	
----2. WHERE - Display all orders where the OrderStatus is Cancelled.
SELECT
	ORDERID,
	PRODUCT,
	DATE,
	ORDERSTATUS
FROM
	ORDERS
WHERE
	ORDERSTATUS = 'Cancelled';
	
 -- 3. ORDER BY - Display orders sorted by TotalPrice from highest to lowest.
SELECT
	ORDERID,
	PRODUCT,
	TOTALPRICE
FROM
	ORDERS
ORDER BY
	TOTALPRICE DESC;

-- 4. COUNT - Find the total number of orders.
SELECT
	COUNT(ORDERID)
FROM
	ORDERS;
-- 5. SUM - Calculate the total sales amount.
SELECT
	SUM(TOTALPRICE)
FROM
	ORDERS;
-- 6. AVG - Calculate the average order value.
SELECT
	AVG(TOTALPRICE)
FROM
	ORDERS;
	
-- 7. GROUP BY - Calculate total sales for each product.
SELECT
	PRODUCT,
	SUM(TOTALPRICE) AS TOTAL_SALES
FROM
	ORDERS
GROUP BY
	PRODUCT;
	
-- 8. HAVING - Identify products with total sales greater than 100000.

SELECT
    product,
    SUM(totalprice) AS total_sales
FROM
    orders
GROUP BY
    product
HAVING
    SUM(totalprice) > 100000;

-- 9. GROUP BY + COUNT - Find the number of orders for each payment method.
SELECT
	PAYMENTMETHOD,
	COUNT(ORDERID)
FROM
	ORDERS
GROUP BY
	PAYMENTMETHOD;
	
-- 10. Percentage Contribution of Each Product

SELECT
    product,
    SUM(totalprice) AS total_sales,
    SUM(totalprice) * 100.0 /
        (SELECT SUM(totalprice) FROM orders) AS percentage_contribution
FROM orders
GROUP BY product;	