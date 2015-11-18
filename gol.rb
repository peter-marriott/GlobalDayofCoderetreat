#!/usr/bin/ruby
# encoding: utf-8

class Cell
	attr_accessor :x, :y, :live
	
	def initialize(x, y, live)
		@x = x
		@y = y
		@live = live
	end
	
	def to_s
		print "#{@x}, #{@y}, #{@live}\n"
	end
	def value
		print "#{@live}"
	end
end

def print_grid (local_grid)
	local_grid.each do | cell_out |
		print cell_out.value
		if cell_out.y == 10
			print "\n"
		end
	end
end

def aliveness(focused_cell, local_grid)
	mini_x = focused_cell.x - 1
	max_x = focused_cell.x + 1
	mini_y = focused_cell.y - 1
	max_y = focused_cell.y + 1
	neighbour_count = 0
	local_grid.each do | cell_out |
		if cell_out.x.between?(mini_x,max_x) &&
			cell_out.y.between?(mini_y,max_y)
			if cell_out.live == 1
				neighbour_count = neighbour_count + 1
			end
		end
	end
	neighbour_count = neighbour_count - focused_cell.live

	if focused_cell.live == 1
		if neighbour_count.between?(2,3)
			return 1;
		end
	else
		if neighbour_count == 3
			return 1;
		end
	end
	return 0;
end

def game_tick(local_grid)
	new_grid = []

	local_grid.each do | cell_out |
		new_grid.push(Cell.new(cell_out.x, cell_out.y, 
			aliveness(cell_out, local_grid)))
	end
	return new_grid
end

grid = []

1.upto(10) do |x|
  1.upto(10) do |y|
	  grid.push(Cell.new(x,y,0))
	end
end

grid[2].live = 1
grid[13].live = 1
grid[21].live = 1
grid[22].live = 1
grid[23].live = 1

9.times do | |
  10.times do | |
    puts
  end
	print_grid(grid)
	grid = game_tick(grid)
	sleep 2
end
