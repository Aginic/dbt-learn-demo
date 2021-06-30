with orders as (
    select * from {{ ref('stg_order') }}
)

select
    sum(total_price) as total_order_amount
from orders