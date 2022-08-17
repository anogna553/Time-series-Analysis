SELECT row_id,order_id,customer_id,city,sales,quantity,discount
FROM superstore;
/* Returns row_id,order_id,customer_id,city,sales,quantity,discount from superstore Table*/

SELECT row_id,order_id,customer_id,city,sales,quantity,discount,
 --in below line, 1 indicates check for next row of the current row
 LEAD(sales,1) OVER (ORDER BY row_id) sales_next FROM superstore;
 /* compared sales of next Row with the current Row*/

 SELECT row_id,order_id,customer_id,city,sales,quantity,discount,
 --in below line, 1 indicates check for previous row of the current row
 LAG(sales,1) OVER (ORDER BY row_id) sales_previous FROM superstore;
  /* compared sales of Previous Row with the current Row*/
 
SELECT row_id,order_id,customer_id,city,sales,quantity,discount,
DENSE_RANK() OVER (ORDER BY sales DESC) Rank
FROM superstore;
 /* Ranked Sales in descending order  */
 
SELECT EXTRACT(MONTH FROM order_date) AS sales_month, AVG(sales) FROM superstore
GROUP BY EXTRACT(MONTH FROM order_date)
ORDER BY sales_month ;
/* Analyzed Average sales in each month */

SELECT order_date,
AVG(sales) FROM superstore
GROUP BY order_date
ORDER BY order_date ;
/* Analyzed Average sales in each day */

SELECT order_date,sum(sales),
avg(sum(sales)) OVER(ORDER BY order_date
      ROWS BETWEEN 29 PRECEDING AND CURRENT ROW )
     as thirtyday_moving_average ,
avg(sum(sales)) OVER(ORDER BY order_date
      ROWS BETWEEN 149 PRECEDING AND CURRENT ROW )
     as onefiftyday_day_moving_average 
FROM superstore
GROUP BY order_date;

/* calculated 30 day moving average and 150 day moving avg 
and compared with the total sales every day*/


SELECT order_date,discount,
AVG(sales) FROM superstore
GROUP BY order_date,discount
ORDER BY order_date;












 