-- Create table
create table conway (x tinyint, y tinyint, cell tinyint);
go

-- Populate table
insert into conway (x, y, cell)
select one.col, two.col, 0 from (
select 1 as col 
union all
select 2 as col
union all
select 3 as col
union all
select 4 as col
union all
select 5 as col
union all
select 6 as col
union all
select 7 as col
union all
select 8 as col
union all
select 9 as col
union all
select 10 as col) as one
cross join
(select 1 as col 
union all
select 2 as col
union all
select 3 as col
union all
select 4 as col
union all
select 5 as col
union all
select 6 as col
union all
select 7 as col
union all
select 8 as col
union all
select 9 as col
union all
select 10 as col)
as two;
go

-- create grid view
create view grid as
select [1],[2],[3],[4],[5],[6],[7],[8],[9],[10] from conway
pivot (max(cell) for x in ([1],[2],[3],[4],[5],[6],[7],[8],[9],[10])) as pvt;
go