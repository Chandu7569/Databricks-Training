-- 1. Create Orders Table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    order_date DATE,
    order_timestamp TIMESTAMP,
    delivery_date DATE,
    order_amount DECIMAL(10,2)
);

-- 2. Insert Sample Data
INSERT INTO orders VALUES
(1, 'Karthik', '2024-01-15', '2024-01-15 10:30:45', '2024-01-20', 2500.00),
(2, 'Veena', '2024-02-18', '2024-02-18 18:45:20', '2024-02-22', 3200.50),
(3, 'Ravi', '2024-03-02', '2024-03-02 09:15:10', '2024-03-08', 4100.75),
(4, 'Anil', '2024-03-09', '2024-03-09 14:05:55', '2024-03-15', 1800.00),
(5, 'Suresh', '2024-01-07', '2024-01-07 23:55:00', '2024-01-12', 2900.00);

-- 3. Current Date & Time Functions
SELECT CURDATE();

SELECT CURRENT_DATE();

SELECT CURTIME();

SELECT CURRENT_TIME();

SELECT NOW();

SELECT CURRENT_TIMESTAMP;

-- 4. Extract Year, Month, Day
SELECT
    YEAR(order_date),
    MONTH(order_date),
    DAY(order_date)
FROM orders;

-- 5. Extract Using EXTRACT()
SELECT
    EXTRACT(YEAR FROM order_date),
    EXTRACT(MONTH FROM order_date),
    EXTRACT(DAY FROM order_date)
FROM orders;

-- 6. Month Name and Day Name
SELECT
    MONTHNAME(order_date),
    DAYNAME(order_date)
FROM orders;

-- 7. Weekday and Day of Week
SELECT
    WEEKDAY(order_date),
    DAYOFWEEK(order_date)
FROM orders;

-- 8. Identify Weekends Using DAYNAME
SELECT order_id, order_date
FROM orders
WHERE DAYNAME(order_date) IN ('Saturday', 'Sunday');

-- 9. Identify Weekends Using DAYOFWEEK
SELECT order_id, order_date
FROM orders
WHERE DAYOFWEEK(order_date) IN (1, 7);

-- 10. Identify Weekdays
SELECT order_id, order_date
FROM orders
WHERE DAYOFWEEK(order_date) BETWEEN 2 AND 6;

-- 11. Add 5 Days
SELECT order_date,
       DATE_ADD(order_date, INTERVAL 5 DAY)
FROM orders;

-- 12. Subtract 3 Days
SELECT order_date,
       DATE_SUB(order_date, INTERVAL 3 DAY)
FROM orders;

-- 13. Add 1 Month
SELECT DATE_ADD(order_date, INTERVAL 1 MONTH)
FROM orders;

-- 14. Subtract 2 Months
SELECT DATE_SUB(order_date, INTERVAL 2 MONTH)
FROM orders;

-- 15. Add 1 Year
SELECT DATE_ADD(order_date, INTERVAL 1 YEAR)
FROM orders;

-- 16. Difference Between Delivery and Order Date
SELECT
    order_id,
    DATEDIFF(delivery_date, order_date) AS delivery_days
FROM orders;

-- 17. TIMESTAMPDIFF in Days and Months
SELECT
    TIMESTAMPDIFF(DAY, order_date, delivery_date) AS days_diff,
    TIMESTAMPDIFF(MONTH, order_date, delivery_date) AS months_diff
FROM orders;

-- 18. Last Day of Month
SELECT LAST_DAY(order_date)
FROM orders;

-- 19. First Day of Month
SELECT DATE_SUB(order_date, INTERVAL DAY(order_date)-1 DAY)
FROM orders;

-- 20. Date Format DD-MM-YYYY
SELECT DATE_FORMAT(order_date, '%d-%m-%Y')
FROM orders;

-- 21. Date Format Month DD, YYYY
SELECT DATE_FORMAT(order_date, '%M %d, %Y')
FROM orders;

-- 22. Convert String to Date
SELECT STR_TO_DATE('15-01-2024', '%d-%m-%Y');

-- 23. Timestamp Formatting
SELECT DATE_FORMAT(order_timestamp, '%d-%m-%Y %H:%i:%s')
FROM orders;

-- 24. Filter Orders in January
SELECT *
FROM orders
WHERE MONTH(order_date) = 1;

-- 25. Filter Orders in February
SELECT *
FROM orders
WHERE MONTHNAME(order_date) = 'February';

-- 26. Financial Year Logic
SELECT order_date,
CASE
    WHEN MONTH(order_date) >= 4
    THEN CONCAT(YEAR(order_date), '-', YEAR(order_date)+1)
    ELSE CONCAT(YEAR(order_date)-1, '-', YEAR(order_date))
END AS financial_year
FROM orders;

-- 27. Orders in Last 7 Days
SELECT *
FROM orders
WHERE order_date >= CURDATE() - INTERVAL 7 DAY;

-- 28. Orders Placed Today
SELECT *
FROM orders
WHERE DATE(order_timestamp) = CURDATE();
