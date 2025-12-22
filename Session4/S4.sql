-- Write your PostgreSQL query statement below
select round(avg(
    case 
    when d.order_date=d.customer_pref_delivery_date then 1
    else 0
    end
) * 100, 2) as immediate_percentage
from Delivery d
where (customer_id, order_date) in (
    select d2.customer_id, min(d2.order_date)
    from Delivery d2
    group by d2.customer_id
)

-- G1_23BCS10599_Yash_Kotra_Session4
