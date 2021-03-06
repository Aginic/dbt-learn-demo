-- example schema test
{% macro test_is_even(model, column_name) %}

with validation as (
    select
        {{ column_name }} as even_field
    from {{ model }}
),

validation_errors as (
    select
        even_field
    from validation
    -- if this is true, then even_field is actually odd!
    where (even_field % 2) = 1
)

-- if COUNT returns > 0 then the test has failed
select count(*)
from validation_errors

{% endmacro %}