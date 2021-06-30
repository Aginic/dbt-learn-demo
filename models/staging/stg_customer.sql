SELECT
    C_CUSTKEY as customer_id,
    C_NAME as name,
    C_ADDRESS as address,
    C_NATIONKEY as nation_id,
    C_PHONE as phone,
    C_ACCTBAL as account_balance,
    C_MKTSEGMENT as market_segment,
    C_COMMENT as comment
FROM {{ source('sf', 'customer') }}
