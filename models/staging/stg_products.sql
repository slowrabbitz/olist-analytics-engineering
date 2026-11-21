with source_data as (
select *
from {{ref('olist_products_dataset')}}

),
renamed as (
    select 
        product_id,
        trim(lower(product_category_name)) as category_name,
        product_name_lenght as name_length,
        cast(product_description_lenght as int) as description_length,
        cast(product_photos_qty as int),
        cast(product_weight_g as decimal(10,2)) as weight_g,
        cast(product_length_cm as decimal(10,2)) as length_cm,
        cast(product_height_cm as decimal(10,2)) as height_cm,
        cast(product_width_cm as decimal(10,2)) as width_cm
    from source_data
)
select * from renamed