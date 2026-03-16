with payment_summary as (
    select order_id,
        sum(payment_value) as order_revenue
    from payments
    group by order_id
)

select c.customer_state,
    sum(ps.order_revenue) as total_revenue,
    count(distinct o.order_id) as total_orders
from payment_summary ps
join orders o
on ps.order_id = o.order_id
join customer c
on o.customer_id = c.customer_id
group by customer_state
order by total_revenue desc;