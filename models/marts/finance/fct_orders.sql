
with payments as (
    select
        order_id,
        amount
    from {{ ref ('stg_stripe__payments')}}
    where
        status = 'success'
),

orders as (
    select
        order_id,
        customer_id,
        order_date
    from {{ ref ('stg_jaffle_shop__orders')}}
)


select orders.order_id,
       orders.customer_id,
       orders.order_date,
       payments.amount
from orders
left join payments using (order_id)



