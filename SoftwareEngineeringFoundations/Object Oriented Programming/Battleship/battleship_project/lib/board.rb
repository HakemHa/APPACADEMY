require 'byebug'

class Board
  def initialize(n)
    @grid = Array.new(n) {|i| Array.new(n, :N)}
    @size = n * n 
  end

  attr_reader :size, :grid

  def [](indices) #indices = [row, column]
    #debugger
    @grid[indices[0]][indices[1]]
  end

  def []=(pos, val)
    #debugger
     @grid[pos[0]][pos[1]] = val
  end

  def num_ships
    @grid.inject(0) {|sum, row| sum + row.count(:S)}
  end

  def attack(pos)
    #debugger
    if self.[](pos) == :S
        self[pos] = :H
        $stdout.print 'you sunk my battleship!'
        puts
        return true
    else
        self[pos] = :X
        return false
    end
  end

  def place_random_ships
    ships = (size * 0.25).round
    pos = Array.new(2) {rand(Math.sqrt(@size))}
    ships.times do 
        while  self[pos] == :S
            pos = [rand(Math.sqrt(@size)), rand(Math.sqrt(@size))]
        end
        self[pos] = :S
    end
  end

  def hidden_ships_grid
    @grid.map {|row| row.map {|ele| if ele == :S then ele = :N else ele = ele end}}
  end

  def self.print_grid(grid)
    grid.each do |row| 
        row.each.with_index {|ele, i| if i != row.length - 1 then print ele.to_s + " "  else print ele.to_s end}
        puts
    end
  end\

  def cheat
    Board.print_grid(@grid)
  end

  def print
    Board.print_grid(self.hidden_ships_grid)
  end
end
