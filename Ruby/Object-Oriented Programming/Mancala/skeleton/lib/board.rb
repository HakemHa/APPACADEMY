require 'byebug'
class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14) {|i, e| i == 6 || i == 13 ? [] : place_stones}
    @name1 = name1
    @name2 = name2
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    Array.new(4) {|i,e| e = :stone}
  end

  def valid_move?(start_pos)
    if start_pos < 0 || start_pos > 12
      raise 'Invalid starting cup'
    elsif cups[start_pos].empty?
      raise 'Starting cup is empty'
    else
      return true
    end
  end

  def make_move(start_pos, current_player_name)
    pouch = cups[start_pos].length
    cups[start_pos] = []
    skip_cup = current_player_name == @name1 ? 13 : 6
    current_position = start_pos
    until pouch <= 0
      next_cup = (current_position + 1) % 14
      unless next_cup == skip_cup
        pouch -= 1
        cups[next_cup] += [:stone]
      end
      current_position = next_cup
    end
    render
    next_turn(current_position)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    if ending_cup_idx ==  6 || ending_cup_idx == 13
      return :prompt
    elsif cups[ending_cup_idx].length == 1
      return :switch
    else
      return ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    if cups[0..5].all? {|e| e.empty?} || cups[7..12].all? {|e| e.empty?}
      return true
    else
      return false
    end
  end

  def winner
    if cups[6] == cups[13]
      return :draw
    elsif cups[6].length > cups[13].length
      return @name1
    else
      return @name2
    end
  end
end