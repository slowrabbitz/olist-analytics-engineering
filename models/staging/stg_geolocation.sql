with source_data as (

    select * from {{ source('raw','olist_geolocation_dataset') }}
),
renamed as (
    select 
        geolocation_zip_code_prefix,
        geolocation_lat as geolocation_latitude,
        geolocation_lng as geolocation_longitude,
        lower(trim(translate(
                    geolocation_city,
                    'áàãâäéèêëíìîïóòõôöúùûüçñÁÀÃÂÄÉÈÊËÍÌÎÏÓÒÕÔÖÚÙÛÜÇÑ',
                    'aaaaaeeeeiiiioooooouuuucnAAAAAEEEEIIIIOOOOOUUUUCN'
                    ))) as geolocation_city ,
        geolocation_state

    
    from source_data

)
select * from renamed