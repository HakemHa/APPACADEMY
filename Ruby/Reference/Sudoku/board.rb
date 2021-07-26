require_relative 'tile.rb'
require 'byebug'
class Board
    def self.parse(file)
        grid = []
        File.foreach(file).with_index do |l, i|
            grid[i] = []
            l.split("").each do |val| 
               if val == "0"
                grid[i] << Tile.new(val, false)
               elsif val == "\n" || val == "\r"

               else
                grid[i] << Tile.new(val, true)
               end
            end
        end
        grid
    end
    def initialize(grid)
        @grid = Board.parse(grid)
    end
    def [](pos)
        x, y = pos
        grid[x][y]
    end
    def []=(pos, val)
        x, y = pos
        return grid[x][y].to(val)
    end
    def render
        system('clear')
        grid.each_with_index do |row, i|
            print "#{i}| "
            row.each_with_index do |tile, j|
                tile.to_s 
                print " " unless j == row.length - 1
                print "| " if j == 2 || j == 5
            end
            puts
            if i == 2 || i == 5
                25.times {print "-"}
                puts
            end
        end
        print "   "
        grid[0].length.times do |i|
            print "_ "
            print "  " if i == 2 || i == 5
        end
        puts
        print "   "
        grid[0].length.times do |i|
            print "#{i} "
            print "  " if i == 2 || i == 5
        end
        puts
        puts
    end
    def unique_numbers?(table)
        table.each do |row|
            nums = "123456789"
            row.each do |tile|
                unless nums.include?(tile.val)
                   return false 
                end
                nums[nums.index(tile.val)] = ""
            end
        end
        return true
    end
    # def repeated_numbers?(table)
    #     table.each do |row|
    #         nums ="123456789"
    #         row.each do |tile|
    #             unless nums.include?(tile.val) || tile.val == "0"
    #                 return true
    #             end
    #             nums[nums.index(tile.val)] = "" if tile.val != "0"
    #         end
    #     end
    #     return false
    # end
    # def valid_move?(new_value)
    #     return false if repeated_numbers?(grid)
    #     return false if repeated_numbers?(grid.transpose)
    #     return false if repeated_numbers?(blocks)
    #     return true
    # end
    def isValid(i, j, k)
        9.times do |rc|
            if grid[rc][j] == k.to_s
                return false
            end
            if grid[i][rc] == k.to_s
                return false
            end
        end
        ((i/3) * 3 ... (i / 3 + 1) * 3).each do |row|
            ((j/3) * 3 ... (j / 3 + 1) * 3).each do |col|
                if grid[row][col] == k.to_s
                    return false
                end
            end
        end
        return true
    end
    def blocks
        block = []
        i = 0
        3.times do
            lower_limit = 0
            upper_limit = 2
            while lower_limit < grid.length
                row = []
                (lower_limit..upper_limit).each do |j|
                    3.times do 
                        row << grid[j][i]
                        i += 1
                    end
                    i -= 3
                end
                block << row
                lower_limit += 3
                upper_limit += 3
            end
            i += 3
        end
        block
    end
    def solved?
        solved = unique_numbers?(grid)
        solved = unique_numbers?(grid.transpose) if !solved
        solved = unique_numbers?(blocks) if !solved
        solved
    end
    private

    attr_reader :grid
end