with customers as (
    select customer_id, first_name, last_name
    from {{ ref('stg_customers') }}
),
orders as (
    select user_id, order_date, status
    from {{ ref('stg_orders') }}
)

select
    c.customer_id,
    c.first_name,
    c.last_name,
    o.order_date,
    o.status
from customers as c
join orders as o
  on c.customer_id = o.user_id
