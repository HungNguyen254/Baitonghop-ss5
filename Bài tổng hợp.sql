-- sử dụng or trong yêu cầu số 3 khiến làm hỏng toàn bộ điều kiện lọc là do or chỉ xét điều kiện 1 trong 2 cái chỉ cần 1 cái đúng là điều kiện sẽ được chạy nên sử dụng ANd để yêu cầu lọc cả 2 điều kiện
-- công thức toán học tính offset
select * from orders 
limit 3
offset 3;
-- viết câu lệnh toàn bộ 5 yêu cầu
select 
total_amount ,
statuss,
case when order1 like ('%%') then 'thỏa mãn'
when user_id is null  then 'thỏa mãn'
end as Status,
case when total_amount > 4000000 then 'nguy hiểm'
else 'Bình thường'
end as alert
from orders where total_amount between 2000000 and 5000000 AND status != 'CANCELLED'
limit 20
offset 40;
