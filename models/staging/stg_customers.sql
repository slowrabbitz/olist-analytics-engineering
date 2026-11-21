
with source_data as(

    select * 
    from {{ref('olist_customers_dataset')}}
    
),
renamed as (

    select 
        customer_id,
        customer_unique_id,
        cast(customer_zip_code_prefix as string) as zip_code_prefix,
        lower(trim(translate(
                    customer_city,
                    'áàãâäéèêëíìîïóòõôöúùûüçñÁÀÃÂÄÉÈÊËÍÌÎÏÓÒÕÔÖÚÙÛÜÇÑ',
                    'aaaaaeeeeiiiioooooouuuucnAAAAAEEEEIIIIOOOOOUUUUCN'
                    ))) as customer_city,
        upper(trim(customer_state)) as state
    from source_data
)
select * from renamed