-- kpis
select sum(total_price) as total_revenue 
from pizza_sales;

select sum(total_price) / count(distinct order_id) as avg_order_value 
from pizza_sales;

select sum(quantity) as total_pizza_sold 
from pizza_sales;

select count(distinct order_id) as total_orders 
from pizza_sales;

select round(sum(quantity) * 1.0 / count(distinct order_id), 2) as avg_pizzas_per_order 
from pizza_sales;

-- charts & trends
select datename(dw, order_date) as order_day, count(distinct order_id) as total_orders 
from pizza_sales 
group by datename(dw, order_date);

select datename(month, order_date) as month_name, count(distinct order_id) as total_orders 
from pizza_sales 
group by datename(month, order_date);

select pizza_category, round(sum(total_price), 2) as total_revenue, 
round(sum(total_price) * 100.0 / (select sum(total_price) from pizza_sales), 2) as pct 
from pizza_sales 
group by pizza_category;

select pizza_size, round(sum(total_price), 2) as total_revenue, 
round(sum(total_price) * 100.0 / (select sum(total_price) from pizza_sales), 2) as pct 
from pizza_sales 
group by pizza_size 
order by pizza_size;

select pizza_category, sum(quantity) as total_quantity_sold 
from pizza_sales 
where month(order_date) = 2 
group by pizza_category 
order by total_quantity_sold desc;

-- top/bottom performers
select pizza_name, sum(total_price) as total_revenue 
from pizza_sales 
group by pizza_name 
order by total_revenue desc 
limit 5;

select pizza_name, sum(total_price) as total_revenue 
from pizza_sales 
group by pizza_name 
order by total_revenue asc 
limit 5;

select pizza_name, sum(quantity) as total_pizza_sold 
from pizza_sales 
group by pizza_name 
order by total_pizza_sold desc 
limit 5;

select pizza_name, sum(quantity) as total_pizza_sold 
from pizza_sales 
group by pizza_name 
order by total_pizza_sold asc 
limit 5;

select pizza_name, count(distinct order_id) as total_orders 
from pizza_sales 
group by pizza_name 
order by total_orders desc 
limit 5;

select pizza_name, count(distinct order_id) as total_orders 
from pizza_sales 
group by pizza_name 
order by total_orders asc 
limit 5;

-- filter example
select pizza_name, count(distinct order_id) as total_orders 
from pizza_sales 
where pizza_category = 'classic' 
group by pizza_name 
order by total_orders asc 
limit 5;
