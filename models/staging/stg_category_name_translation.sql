with source_data as (
    select * 
    from {{ref('product_category_name_translation')}}

),
renamed as (
    select 
        trim(lower(product_category_name)) as category_name,
        trim(lower(product_category_name_english)) as category_name_english
    from source_data

)
select * from renamed