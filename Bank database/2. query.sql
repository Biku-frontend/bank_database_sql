-- Performs querying on this: --

-- Problem#1: --
-- Write a query to display the customer number, firstname, customer’s date of birth. Display in sorted order of date of birth year and within that sort by firstname. --

SELECT 
c.cus_id,
c.first_name,
c.dob

FROM customer c

ORDER BY c.dob;


-- Problem#3: --

-- Write a query to display account number, customer’s number, customer’s firstname,lastname,account opening date. --

SELECT 
acc.acc_num,
c.ph_no AS 'customer number',
c.first_name,
c.last_name,
acc.acc_opening_date

FROM account acc
JOIN customer c
		USING (cus_id);


-- Problem # 4: --

-- Write a query to display the number of customer’s from Delhi. Give the count an alias name of Cust_Count. --

SELECT COUNT(c.city) AS Cust_Count

FROM customer c
WHERE city= 'Delhi';


-- Problem # 5: --

-- Write a query to display  the customer number, customer firstname,account number for the customer’s whose accounts were created after 15th of any month. --
SELECT
c.first_name,
c.ph_no,
acc.acc_num

FROM customer c
JOIN account acc
USING (cus_id)

WHERE day(acc_opening_date) > 15;



-- Problem # 6: --

-- Write a query to display the female customers firstname, city and account number who are not into business, service or studies. --

SELECT 
c.first_name, 
c.city, 
acc.acc_num, 
c.occupation

FROM customer c, account acc
WHERE acc.cus_id = c.cus_id
AND NOT (occupation= 'service' OR occupation= 'student' OR occupation = 'business');


-- Problem # 7: --

-- Write a query to display city name and count of branches in that city. Give the count of branches an alias name of Count_Branch. --
SELECT 
b.bcity,
 COUNT(*) AS Count_branch
FROM branch b
GROUP BY b.bcity;

-- Problem # 8: --

-- Write a query to display account id, customer’s firstname, customer’s lastname for the customer’s whose account is Active. --

SELECT 
acc.acc_num,
c.first_name,
c.last_name,
acc.acc_status

FROM customer c, account acc

WHERE acc.cus_id = c.cus_id
AND acc_status = 'active';

-- Problem # 9: -- 

-- Write a query to display customer number, customer name, account number where the account status is terminated.

SELECT 
acc.acc_num,
c.first_name,
c.last_name,
acc.acc_status

FROM customer c, account acc

WHERE acc.cus_id = c.cus_id
AND acc_status = 'terminated';


-- Problem # 10:

-- Write a query to display the customer’s number, customer’s firstname, branch id and loan amount for people who have taken loans.

SELECT 
c.first_name AS 'Customer Name',
c.ph_no,
l.bid AS 'Branch Id',
l.loan_amount

FROM loan l
JOIN customer c
USING(cus_id)


