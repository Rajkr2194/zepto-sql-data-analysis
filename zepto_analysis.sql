drop table if exists zeto;

create table zeto(
sku_id SERIAL PRIMARY KEY,
category VARCHAR(120),
name VARCHAR(150) NOT NULL,
mr NUMERIC(8,2),
discountPercent NUMERIC(5,2),
availableQuantity INTEGER,
discountsellingprice NUMERIC(8,2),
weightInGrams INTEGER,
outofstock BOOLEAN,
quantity INTEGER
);

--data exploration
--count of rows
SELECT COUNT(*) FROM zeto;

--samle of data
SELECT * FROM zeto
LIMIT 10;

--null values
SELECT * FROM zeto
WHERE name IS NULL
OR category IS NULL
OR mr IS NULL
OR discountpercent IS NULL
OR discountsellingprice IS NULL
OR weightingrams IS NULL
OR availablequantity IS NULL
OR outofstock IS NULL
OR quantity IS NULL;

--different product categories
SELECT DISTINCT category
from zeto
order by category;

--products in stock vs out of stock
SELECT outofstock, count(sku_id)
from zeto
group by outofstock;

---product names present mutliple times
select name, count(sku_id) as "Number of SKUs"
from zeto
Group by name
Having count(sku_id)>1
ORDER BY COUNT(sku_id)DESC;

---DATA CLEANING
--products with price=0
SElECT * FROM ZETO
WHERE mr = 0 OR discountsellingprice = 0;

DELETE FROM ZETO
WHERE MR=0;

--convert paise to rupees
update zeto
SET mr = mr/100.0,
discountsellingprice = discountsellingprice/100.0;

select mr, discountsellingprice from zeto
-- Q1 find the top 10 best-value products based on the discount percentage.
select DISTINCT name, mr,discountpercent
from zeto
order by discountpercent DESC
limit 10;

--Q2 what are the products with high mr but out of stock.
select distinct name,mr
from zeto
where outofstock = True and mr >300
order by mr desc;

--Q3 calculate estimated revenue for each cateorgy.
SELECT Category,
sum(discountsellingprice * availableQuantity) as total_revenue
from zeto
group by category
order by total_revenue;

--Q4 Find all products where mrp is greater than 500 and discount is less than 10%.
SELECT DISTINCT name, mr, discountpercent
from zeto
where mr> 500 and discountpercent <10
order by mr desc,discountpercent desc;

--Q5 identify the top5 cateogeries offering the highest average discount percantage.
SELECT category,
ROUND (AVG(discountpercent),2) AS avg_discount
from zeto
Group by category 
order by avg_discount desc
limit 5;

--Q6 Find the price per gram for products above 100gm and sort by best value.
SELECT DIStinct name , weightingrams , discountsellingprice , 
ROUND(discountsellingprice/weightingrams,2) as price_per_gram
from zeto
where weightingrams >=100
order by price_per_gram;

--Q7 Group the products into categories like low, medium, bulk.
SELECT DISTINCT name, weightingrams,
case when weightingrams < 1000 then 'low'
     when weightingrams < 5000 then 'Medium'
	 else 'BULK'
	 END AS weight_category
from zeto;	 

--Q8 What is the total inventory weight per category.
SELECT category,
SUM(weightingrams * availableQuantity) as total_weight
from zeto
Group by category
order by total_weight;

ALTER TABLE zeto
RENAME TO zepto;

DROP TABLE zepto;

ALTER TABLE zeto
RENAME TO zepto;

SELECT * FROM zepto LIMIT 10;



