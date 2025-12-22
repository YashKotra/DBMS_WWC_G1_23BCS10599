
select a.name , b.bonus
from
employee as a
left outer join
bonus as b
on a.empid=b.empid
where b.bonus is null or b.bonus<1000;

-- G1_23BCS10599_Yash_Kotra_Session_5
