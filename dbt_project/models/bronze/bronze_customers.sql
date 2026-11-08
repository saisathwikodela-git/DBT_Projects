with dedup as (
    select *
    from {{ source('source', 'dim_customer') }}
    qualify row_number() over (partition by customer_code order by signup_date desc) = 1
)

select * from dedup