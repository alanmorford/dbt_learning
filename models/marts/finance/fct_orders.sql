with orders as (
    select * from {{ ref('stg_orders') }}
),
customers as (
    select * from {{ ref("dim_customers") }}
)
,
payments as (
    select * from {{ ref("stg_stripe__payments") }}
)

select 
    o.order_id,
    c.customer_id,
    p.amount


from orders o
left join customers c using (customer_id)
left join payments p using (order_id)