with

orders as (
    select * from {{ ref('stg_orders') }}
),

payments as (
    select * from {{ ref('stg_payments') }} where status <> 'fail'
)

select 
  orders.order_id as order_id,
  orders.customer_id as customer_id,
  orders.order_date as order_date,

  sum(payments.amount) as amount

from orders
  join payments on (orders.order_id = payments.order_id)
group by 1, 2, 3

