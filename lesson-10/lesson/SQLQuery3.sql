create database f24_class10

use f24_class10

create table tbl1 (col1 int, col2 int)
create table tbl2 (col1 int, col2 int)

insert into tbl1 values (1, 2)
insert into tbl1 values (3, 4)
insert into tbl1 values (5, 6)
insert into tbl1 values (7, 8)

insert into tbl2 values (1, 2)
insert into tbl2 values (3, 4)
insert into tbl2 values (9, 10)

Select * from tbl1
Select * from tbl2


select * from tbl1 cross join tbl2

select * from tbl1 cross join tbl2 where tbl1.col1 > 4

--outer join

--left outer join

select * from tbl1 left join tbl2 on tbl1.col1 = tbl2.col1

select * from tbl1 right join tbl2 on tbl1.col1 = tbl2.col1

select * from tbl1 full join tbl2 on tbl1.col1 = tbl2.col1

