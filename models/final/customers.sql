with customers as (
    select * from {{ ref('stg_customer') }}
),

orders as (
    select * from {{ ref('stg_order') }}
),

nation as (
    select * from {{ ref('stg_nation') }}
),

customer_orders as (
    select
        customer_id,
        min(order_date) as first_order,
        max(order_date) as most_recent_order,
        count(order_id) as number_of_orders,
        sum(total_price) as total_order_amount
    from orders
    group by 1
),

final as (
    select
        customers.customer_id,
        customers.name as cust_name,
        nation.name as nation,
        customer_orders.first_order,
        customer_orders.most_recent_order,
        customer_orders.number_of_orders,
        customer_orders.total_order_amount
    from customers
    left join nation using (nation_id)
    left join customer_orders using (customer_id) 
    where customer_orders.number_of_orders is not null
)

select * from final
