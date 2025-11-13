{{ config(materialized='view') }}

with orders as (
    select order_id, customer_id
    from {{ ref("fct_orders" )}}
)

select
     sum(amount) lifetime_value,
     customer_id
     from {{ ref("stg_stripe__payments") }}
     left join orders using (order_id)
     group by customer_id