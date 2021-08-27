require_relative 'tic_tac_toe_node'

class SuperComputerPlayer < ComputerPlayer
  def move(game, mark)
    node = TicTacToeNode.new(game.board, mark)
    move = node.children.find {|move| move.winning_node?(mark)}
    return move.prev_move_pos if move
    move = node.children.find {|move| !move.losing_node?(mark)}
    return move.prev_move_pos if move
    raise "No non-losing nodes were found"
  end
end

if __FILE__ == $PROGRAM_NAME
  puts "Play the brilliant computer!"
  hp = HumanPlayer.new("Jeff")
  cp = SuperComputerPlayer.new

  TicTacToe.new(hp, cp).run
end
