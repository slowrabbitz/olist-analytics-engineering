with source_data as(

    select *
    from {{ref('olist_order_payments_dataset')}}
),
renamed as(
    
    select 
        order_id,
        payment_sequential as sequential,
        lower(trim(payment_type)) as type, 
        cast(payment_installments as int) as installments,
        cast(payment_value as decimal(10,2)) as value
    from source_data
    )
    select * from renamed