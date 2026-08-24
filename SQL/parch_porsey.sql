--SQL JOINS--
--TYPES OF JOINS:INNER JOIN, OUTER JOIN/FULL OUTER JOIN, LEFT JOIN, RIGHT, JOIN, CROSS JOIN--

SELECT *
FROM orders
LIMIT 5

SELECT *
FROM accounts
LIMIT 5

SELECT COUNT (*)
FROM accounts

SELECT count (distinct account_id)
FROM orders

--JOINING TABLES--
-- INNER JOIN--
SELECT a.id,a.name,o.standard_qty,o.gloss_qty,o.poster_qty
FROM accounts a
JOIN orders o
ON a.id = o.account_id
JOIN web_events w
ON a.id = w.account_id
 


--LEFT JOIN--
SELECT a.id,a.name,o.standard_qty,o.gloss_qty,o.poster_qty
FROM accounts a
LEFT JOIN orders o
ON a.id = o.account_id


SELECT COUNT (distinct a.id)
FROM accounts a
LEFT JOIN orders o
ON a.id = o.account_id


SELECT a.id,name,standard_qty,gloss_qty,poster_qty
FROM accounts a
LEFT JOIN orders o
ON a.id = o.account_id
WHERE standard_qty IS null

--RIGHT JOIN--
SELECT a.id,name,standard_qty,gloss_qty,poster_qty
FROM accounts a
RIGHT JOIN orders o
ON a.id = o.account_id
WHERE standard_qty IS null

--OUTER JOIN--
SELECT a.id,name,standard_qty,gloss_qty,poster_qty
FROM accounts a
FULL OUTER JOIN orders o
ON a.id = o.account_id



-- WHEN JOINING A TABLE, MULTIPLE TABLES CAN BE JOINED TOGTHER INNER, LEFT, OR THE RIGHT JOIN--

--ASSIGNMENT--
--Q1--
SELECT
	a.name AS company_name,
	SUM (o.total_amt_usd) AS total_sales_usd
FROM accounts a
JOIN orders o
	ON a.id = o.account_id
GROUP BY a.name
ORDER BY total_sales_usd DESC
	
--Q2--
SELECT
	w.channel,
	a.name AS company_name,
	w.occured_at
FROM web_eventS w
JOIN accounts a
	ON w.account_id = a.id
ORDER BY w.occured_at DESC
LIMIT 1

--Q3--
SELECT 
	channel,
	COUNT(*) AS number_of_times_used
FROM web_events
GROUP BY channel
ORDER BY number_of_times_used DESC


/* SUB QUERRY */
-- THIS IS WHEN YOU WANT TO GET A QUERRY FROM AN0THER QUERRY

SELECT a.id,name,
		standard_qty,gloss_qty,poster_qty,
		standard_qty+gloss_qty+poster_qty AS total_row,
		channel
FROM accounts a
JOIN orders o
ON a.id = o.account_id
JOIN web_events w
ON a.id =w.account_id

-------------

SELECT name,
		channel,
		SUM(standard_qty) AS quant_standard
FROM accounts a
JOIN orders o
ON a.id = o.account_id
JOIN web_events w
ON a.id =w.account_id
GROUP BY 1,2

----------
SELECT COUNT(name),
		SUM(quant_standard)
FROM 
(SELECT name,
		channel,
		SUM(standard_qty) AS quant_standard
FROM accounts a
JOIN orders o
ON a.id = o.account_id
JOIN web_events w
ON a.id =w.account_id
GROUP BY 1,2) T1
WHERE channel = 'direct'


select student_name,
		coalesce(age, '0'),
		coalesce(address, 'unknown')
	FROM Student

