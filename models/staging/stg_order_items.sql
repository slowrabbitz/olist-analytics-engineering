with source_data as (

select * 
from {{ref('olist_order_items_dataset')}}

),
renamed as(

    select 
        order_id,
        order_item_id,
        product_id,
        seller_id,
        cast(shipping_limit_date as timestamp) as shipping_limit_date,
        cast(price as decimal(10,2)) as price,
        cast(freight_value as decimal(10,2)) as freight_value
    from source_data

)

select * from renamed
