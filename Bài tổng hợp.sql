-- sử dụng or trong yêu cầu số 3 khiến làm hỏng toàn bộ điều kiện lọc là do or chỉ xét điều kiện 1 trong 2 cái chỉ cần 1 cái đúng là điều kiện sẽ được chạy nên sử dụng ANd để yêu cầu lọc cả 2 điều kiện
-- công thức toán học tính offset
create database BTTH;
use BTTH;
create table orders (
	order_id int primary key,
    status varchar(30),
    total_amount int,
    note text,
    user_id int
);
alter table orders
add column total_amount int;
INSERT INTO orders (order_id, user_id, total_amount, status, note) VALUES
(1, 101, 2500000, 'PAID', N'giao gấp cho khách VIP'),
(2, NULL, 3000000, 'PAID', N'đơn hệ thống'),
(3, 102, 4500000, 'SHIPPED', N'xử lý gấp'),
(4, NULL, 4800000, 'PAID', N'auto generate'),
(5, 103, 2100000, 'PROCESSING', N'gấp nhẹ'),
(6, NULL, 3900000, 'PAID', N'đơn test hệ thống'),
(7, 104, 3000000, 'CANCELLED', N'gấp nhưng đã hủy'),
(8, NULL, 4000000, 'CANCELLED', N'auto nhưng hủy'),
(9, 105, 1000000, 'PAID', N'gấp nhưng quá nhỏ'),
(10, NULL, 6000000, 'PAID', N'auto nhưng quá lớn'),
(11, 106, 3000000, 'PAID', N'bình thường'),
(12, 107, 3500000, 'SHIPPED', N'không có gì đặc biệt'),
(13, NULL, 7000000, 'PAID', N'auto lớn bất thường'),
(14, 108, 3000000, 'CANCELLED', N'gấp cực'),
(15, 109, 2200000, 'PAID', N'gấp xử lý ngay'),
(16, NULL, 4100000, 'PROCESSING', N'auto urgent'),
(17, 110, 5000000, 'PAID', N'gấp cuối ngày'),
(18, NULL, 2000000, 'SHIPPED', N'đơn hệ thống'),
(19, 111, 4300000, 'PAID', N'gấp nhanh'),
(20, NULL, 2600000, 'PROCESSING', N'auto order');
select * from orders;
select * from orders where total_amount between 2000000 and 5000000;
select * from orders where status != 'CANCELLED';
select * from orders where note like ('%gấp%')  or user_id is null;
select * ,
case when total_amount > 4000000 then 'Nguy hiểm'
else 'Bình thường'
end as Alert_level
from orders;
select * from orders order by total_amount desc limit 5 offset 10;
-- gộp vào một câu lệnh
select *,
case when total_amount > 4000000 then 'Nguy hiểm'
else 'Bình thường'
end as Alert_level
from orders where total_amount between 2000000 and 5000000 and status !='CANCELLED' AND note like ('%gấp%') or user_id is null order by total_amount desc limit 5 offset 10;
