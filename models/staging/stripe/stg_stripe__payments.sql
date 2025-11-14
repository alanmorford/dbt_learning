select 
    id, 
    orderid as order_id, 
    paymentmethod, 
    status, 
    amount, 
    created 

from {{ source('stripe', 'payment') }}
