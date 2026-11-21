with source_data as(
select*
from {{ref('olist_sellers_dataset')}}

),
renamed as (
select 
    seller_id,
    cast( seller_zip_code_prefix as string) as zip_code_prefix,
    lower(trim(translate(
        seller_city,
        'áàãâäéèêëíìîïóòõôöúùûüçñÁÀÃÂÄÉÈÊËÍÌÎÏÓÒÕÔÖÚÙÛÜÇÑ',
        'aaaaaeeeeiiiioooooouuuucnAAAAAEEEEIIIIOOOOOUUUUCN'
    ))) as city,
    upper(trim(seller_state)) as state
from source_data
)
select * from renamed