with

customers as (
    select * from {{ ref('stg_customers') }}
),

orders as (
    select * from {{ ref('stg_orders') }}
),

payments as (
    select * from {{ ref('stg_payments') }}
)

select 
  customers.customer_id as customer_id,
  orders.order_id as order_id,
  payments.amount as amount
from customers 
  join orders on (customers.customer_id = orders.customer_id)
  join payments on (orders.order_id = payments.order_id)
