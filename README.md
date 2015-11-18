# Global Day of Code retreat

On 14th November the [agile Peterborough meet-up group](http://www.meetup.com/Agile-Peterborough/events/224143036/) got together once again for the Global Day of Code retreat.

As per usual we did 45 minute sessions coding Conway's Game of live is pairs and mobs.

This year I had a couple of goes and here are my attempts in Microsoft® SQL Server® T-SQL and Ruby.

## Ruby

Running `ruby gol.py` gives a 10 by 10 grid with the glider pattern. It loops 9 times so you can see the glider move. No tests just hacked out in the time we had.

## T-SQL

In the previous attempt I did TTD the code using [tSQLt](http://tsqlt.org/). I didn't think I would have had time to use that and get it all done in the 45 minutes. 

In the T-SQL directory there are four files:

###dbSetup.sql
Creates a conway table, populates it with data for a 10 by 10 grid and a view called 'grid' to display the data.
The grid co-ordinates start at 1,1 in the top left corner rather than the bottom left as is should be. I haven't looked at how to do that well.

###blinker.sql & glider.sql
These set a starting pattern of either a blinker or glider.

###gol.sql
This runs one tick of the game of life showing before and after.


We had a lot of fun on the day, enjoy!