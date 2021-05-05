with

payments as (
    select * from raw.stripe.payment -- {{ source('stripe','payment') }}
)

select 
  id as payment_id,
  orderid as order_id,
  paymentmethod as payment_method,
  status as status,
  amount as amount,
  created as created
from payments