create database swiggy;
use swiggy;
-- order analysis
select*from orders;

-- check null value 
select order_id from orders where order_total is null or restaurant_name is null or order_time is null or 
rain_mode is null or on_time is null;
-- there is no null value in order id in above querry;

-- check how many distinct on time delivery. We will use 1 for representing whether is delivery on time and 0 for late
select count(distinct order_id ) as on_time_delivery from orders 
where on_time=1;

-- how many distinct restaurent we have order from
select count(distinct restaurant_name) as total_restaurent from orders;

-- check which is our favorite restaurant
select restaurant_name , count(restaurant_name) as number_Of_orders from orders
 group by restaurant_name
 order by number_of_orders desc;
 
  -- check recent order from orders
 select max(order_time) as recent_order from orders;
 
 -- item analysis
 select*from items;
 
 -- check the no.of items
 select distinct  name from items;
 
--  check no of non veg items
select count(name) as non_veg from items
where is_veg =0;
 
-- check name of non veg from items
select name from items
where is_veg=0;

-- check which items  are other than  veg or non veg
select name from items
where is_veg!=0 and is_veg!=1;

-- check those items which are made from chicken
select * from items
where name like '%chicken';

-- how many time each item is ordered
select name ,count(*) as no_of_times from items
group by name
order by no_of_times desc;
 
