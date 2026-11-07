-- deuplicates the records in the dim_date table and creates a bronze table for it
select * from {{ source('source', 'dim_date') }}