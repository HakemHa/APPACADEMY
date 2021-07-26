require_relative 'board.rb'

class Game
    def initialize(file)
        @board = Board.new(file)
    end
    def change_value
        puts "Which number you want to change? Ex: [y, x]"
        print ">"
    end
    def new_value 
        puts "To what value should tile be reassigned? Ex: 8"
        print ">"
        value = gets.chomp
        if value.downcase != "solve"
            return value
        else
            until board.solved?
                solve
            end
        end
    end
    def parse(location)
        if location[1..-2].nil? || location[1..-2].split(",").map {|num| num.strip}.length != 2
            return [5, 5]
        end
        location[1..-2].split(",").map {|num| num.strip.to_i}
    end
    def warning
        p "Invalid move"
    end
    def play
        until board.solved?
            board.render
            change_value
            coordinate = parse(STDIN.gets.chomp)
            new_number = new_value
            board.valid_move?(new_number) ? board[coordinate] = new_number : warning unless board.solved?
            sleep(2)
        end
        board.render
        p "Sudoku Completed"
    end

    # def solve(column=0,row=0,firstGiven=false)
    #     debugger if column == 5
    #     if row == 0
    #         (column...9).each do |i|
    #             (row...9).each do |j|
    #                 next_guess = 0
    #                 while true
    #                     board[[j, i]] == "0" ? next_guess = (next_guess + 1) : next_guess = board[[j, i]].val.to_i + 1
    #                     board[[j, i]] = next_guess.to_s
    #                     if board[[j, i]].val == next_guess.to_s && next_guess <= 9
    #                         break if board.valid_move?(next_guess.to_s)
    #                     elsif board[[j, i]].val == next_guess.to_s && next_guess == 10
    #                         board[[j, i]] = "0"
    #                         if j == 0
    #                             solve(i - 1, 8)
    #                             return
    #                         else
    #                             solve(i, j - 1)
    #                             return
    #                         end
    #                     else
    #                         if firstGiven
    #                             solve(i - 1,8)
    #                             return
    #                         end
    #                         break
    #                     end
    #                 end
    #                 board.render
    #             end
    #         end
    #     elsif row != 0
    #         (column...9).each do |i|
    #             (row...9).each do |j|
    #                 next_guess = 0
    #                 while true
    #                     board[[j, i]] == "0" ? next_guess = (next_guess + 1) : next_guess = board[[j, i]].val.to_i + 1
    #                     board[[j, i]] = next_guess.to_s
    #                     if board[[j, i]].val == next_guess.to_s && next_guess <= 9
    #                         break if board.valid_move?(next_guess.to_s)
    #                     elsif board[[j, i]].val == next_guess.to_s && next_guess == 10
    #                         board[[j, i]] = "0"
    #                         if j == 0
    #                             solve(i - 1, 8)
    #                             return
    #                         elsif j - 1 == 0 
    #                             solve(i, j - 1, true)
    #                             return
    #                         else
    #                             solve(i, j - 1)
    #                             return
    #                         end
    #                     else
    #                         if j == row
    #                             if j == 0
    #                                 solve(i - 1, 8)
    #                                 return
    #                             else
    #                                 solve(i, j - 1)
    #                                 return
    #                             end
    #                         end
    #                         break
    #                     end
    #                 end
    #                 if j == 8
    #                     solve(i + 1, 0)
    #                     return
    #                 end
    #                 board.render
    #             end
    #         end
    #     end
    # end
    def solve
        9.times do |i|
            9.times do |j|
                if board[[i,j]] == "0"
                    (1..9).each do |k|
                        if board.isValid(i, j, k)
                            board[[i, j]].to(k.to_s)
                            if solve
                                return true
                            end
                            board[[i, j]] = "0"
                        end
                    end
                    return false
                end
            end
        end
        return true
    end

    private

    attr_reader :board
end

if $PROGRAM_NAME == __FILE__
    file = ARGV.empty? ? './puzzles/sudoku1.txt' : "./puzzles/#{ARGV.shift}"
    Game.new(file).play
end