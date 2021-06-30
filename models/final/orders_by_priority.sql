with customers as (
    select * from {{ ref('stg_customer') }}
),

orders as (
    select * from {{ ref('stg_order') }}
),

nation as (
    select * from {{ ref('stg_nation') }}
),

customer_nation as (
    select
        customers.*,
        nation.name as nation
    from customers
    left join nation using (nation_id)
),

final as (
    select    
        order_priority,
        nation,
        sum(total_price) as total_order_amount
    from orders
    left join customer_nation using (customer_id)
    group by 1, 2
    order by 1
)

select * from final