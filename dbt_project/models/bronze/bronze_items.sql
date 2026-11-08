with items as (
    select *, Row_number() over (partition by id order by updateDate desc) as row_num 
    from {{ source('source', 'items') }}
)
select * from items
where row_num = 1
