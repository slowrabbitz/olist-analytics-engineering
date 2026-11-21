with source_data as (

    select *
    from {{ref('olist_order_reviews_dataset')}}
),
renamed as(
    select 
        review_id,
        order_id,
        review_score as score,
        trim(review_comment_title) as comment_title ,
        trim(review_comment_message) as comment_message,
        cast(review_creation_date as timestamp) as creation_date ,
        cast(review_answer_timestamp as timestamp) as answer_timestamp
    from source_data

)
select *
from renamed