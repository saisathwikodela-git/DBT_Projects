select * from {{ref('bronze_sales')}} 
where net_amount <0 and gross_amount<0