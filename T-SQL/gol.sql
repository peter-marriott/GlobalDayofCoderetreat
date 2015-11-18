-- State before starting
select * from dbo.grid;

-- Variables for current location
declare @x tinyint, @y tinyint;

-- Use table variable to hold grid state before processing cells
declare @con as table
    (
      x tinyint ,
      y tinyint ,
      cell tinyint
    );

insert  into @con
        ( x, y, cell )
select  x ,
        y ,
        cell
from    dbo.conway;

declare process_cell cursor
for
    select  x ,
            y
    from    @con for read only;

open process_cell;
fetch next from process_cell into @x, @y;

while @@FETCH_STATUS = 0
    begin
        -- Get cell state and cell_range_count to set neighbours count
        declare @cell tinyint, @neighbours_count tinyint, @cell_range_count tinyint;

        select  @cell = cell
        from    @con
        where   x = @x
                and y = @y;

        select  @cell_range_count = count(cell)
        from    @con
        where   x between @x - 1 and @x + 1
                and y between @y - 1 and @y + 1
                and cell = 1;

        set @neighbours_count = @cell_range_count - @cell; 

        print 'X ' + cast(@x as varchar(2)) + ' Sy ' + cast(@y as varchar(2))
            + ' hei ' + cast(@neighbours_count as varchar(2));

        if @cell = 1 and ( @neighbours_count < 2 or @neighbours_count > 3)
            begin 
                update  conway
                set     cell = 0
                where   x = @x
                        and y = @y;
            end;

        if @cell = 0 and @neighbours_count = 3
            begin 
                update  conway
                set     cell = 1
                where   x = @x
                        and y = @y;
            end;

        fetch next from process_cell into @x, @y;
    end;

close process_cell;
deallocate process_cell;
select  *
from    dbo.grid;