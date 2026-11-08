with customer as(
  select customer_sk, gender from {{ref('bronze_customers')}}
),
Product as(
    select product_sk,category from {{ref('bronze_product')}}
),
sales as(
    select sales_id, customer_sk, product_sk, quantity, unit_price, gross_amount from {{ref('bronze_sales')}}
),
sales_with_total as(
select 
    s.sales_id,
    c.gender as gender,
    p.category as product_category,
    {{multiplymacro('s.quantity', 's.unit_price')}} as total_sales_amount,
    s.gross_amount
from sales s
left join customer c on s.customer_sk = c.customer_sk
left join product p on s.product_sk = p.product_sk
)
select product_category, gender, sum(total_sales_amount) as total_sales_amount
from sales_with_total
group by product_category, gender
Order by product_category, gender
