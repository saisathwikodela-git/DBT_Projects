SELECT
    {{ dbt_utils.generate_surrogate_key(['sales_id','date_sk']) }} AS sg_key,
    *
FROM {{ ref('bronze_sales') }}