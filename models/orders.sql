with

orders as (
    select * from {{ ref('stg_orders') }}
),

payments as (
    select * from {{ ref('stg_payments') }}
)

select 
  orders.customer_id as customer_id,
  orders.order_id as order_id,
  payments.amount as amount
from orders
  join payments on (orders.order_id = payments.order_id)
