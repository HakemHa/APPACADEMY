require 'byebug'

words_file = File.open("dictionary.txt")
words = words_file.read.split("\n")
$dictionary = Hash.new(false)
words.each do |word|
    $dictionary[word] = true
end

class Game
    def initialize(players)
        @players = players
        @fragment = ""
        @index = 0
    end
    def current_player
        @players.keys[@index % @players.keys.length]
    end
    def previous_player
        @players.keys[(@index - 1) % @players.keys.length]
    end
    def next_player!
        @index += 1
    end
    def take_turn(player)
        letter = nil
        if @players[player]
            player.moves(valid_play, @fragment)
        end
        letter = player.guess
        player.alert_invalid_guess if !valid_play?(letter)
        @fragment += letter if valid_play?(letter)
        p @fragment
    end
    def valid_play?(letter)
        if letter.nil? || !letter.is_a?(String) || letter.length != 1
            return false
        end
        new_word = @fragment + letter
        $dictionary.keys.each do |word|
            return true if word[0...new_word.length].include?(new_word) && $dictionary[word]
        end
        false
    end
    def valid_play
        plays = []
        'abcdefghijklmnopqrstuvwxyz'.each_char do |c|
            plays << c if valid_play?(c)
        end
        plays
    end
    def play_round
        until $dictionary[@fragment]
            i = 0
            while i < @players.keys.length
                take_turn(current_player)
                unless $dictionary[@fragment]
                    next_player!
                    i += 1
                end
                break
            end
        end
        losses
    end
    def losses
        previous_player.lose
    end
    def run
        if @players.length == 1
            p @players.keys[@index % @players.keys.length].name + " WINS!!"
            return
        end
        play_round
        puts @fragment + "! Completed, " + previous_player.name + " lost!"
        remove_losers
        next_player!
        $dictionary[@fragment] = false
        @fragment = ""
        run
    end
    def remove_losers
        temp_players = {}
        @players.each do |player, machine|
            temp_players[player] = machine if player.losses < 5
            if player.losses >= 5
                p player.name + " lost!"
            end
        end
        @players = temp_players
    end
end

class Player
    attr_reader :losses, :name
    def initialize(name)
        @name = name
        @losses = 0
    end
    def guess
        print "#{@name + " " + self.record} guess a letter: "
        letter = gets.chomp
        letter
    end
    def alert_invalid_guess
        p "Invalid guess"
    end
    def lose 
        @losses += 1
    end
    def record
        "GHOST"[0...@losses]
    end
end
class AiPlayer
    attr_reader :losses, :name
    def initialize(name)
        @name = name
        @losses = 0
        @winning_moves = []
        @losing_moves = []
    end
    def moves(valid_play, fragment)
        @winning_moves = []
        @losing_moves = []
        valid_play.each do |c|
            if $dictionary[fragment + c]
                @winning_moves << c
            else
                @losing_moves << c
            end
        end
    end
    def guess
        letter = @winning_moves.sample unless @winning_moves.empty?
        letter = @losing_moves.sample if @winning_moves.empty?
        puts "#{@name + " " + self.record} guess a letter: #{letter}"
        letter
    end
    def lose 
        @losses += 1
    end
    def record
        "GHOST"[0...@losses]
    end
    def alert_invalid_guess
        p "Invalid guess"
    end
end
def valid?(val)
    if val.nil? || val <= 0
        return false
    end
    true
end
players = {}
player_amount = nil
ai = nil
until valid?(player_amount)
    print "How many will be playing?: "
    player_amount = gets.chomp.to_i
end
print "How many players are computers?: "
ai = gets.chomp.to_i
while player_amount > 0 
        print "Player name?: "
        name = gets.chomp
        if rand(player_amount) < ai
            player = AiPlayer.new(name)
            ai -= 1
            player_amount -= 1
            players[player] = true
        else
            player = Player.new(name)
            player_amount -= 1
            players[player] = false
        end
end
Game.new(players).run