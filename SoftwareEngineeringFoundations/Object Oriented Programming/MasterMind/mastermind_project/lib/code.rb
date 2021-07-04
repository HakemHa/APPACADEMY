require 'byebug'

class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(pegs)
    #debugger
    pegs.all? {|peg| POSSIBLE_PEGS.keys.include?(peg.upcase)}
  end

  def initialize(pegs)
    if !Code.valid_pegs?(pegs)
      raise "Invalid pegs selection"
    else
      @pegs = pegs.map {|peg| peg.upcase}
      #debugger
      p 'wait'
    end
  end

  attr_reader :pegs

  def self.random(num)
    code  = []
    num.times {code << POSSIBLE_PEGS.keys.sample}
    Code.new(code)
  end

  def self.from_string(pegs)
    Code.new(pegs.upcase.split(""))
  end

  def [](i)
    @pegs[i]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(guess)
    match = 0
    length.times {|i| match += 1 if guess[i] == @pegs[i]}
    match
  end

  def num_near_matches(guess)
    near_match = 0
    #debugger
    matches = @pegs.inject([]) {|copy, ele| copy << ele}
    length.times do |i| 
      if matches.include?(guess[i])
        near_match += 1 
        matches[matches.index(guess[i])] = ''
      end
    end
    near_match - num_exact_matches(guess)
  end

  def ==(code)
    self.pegs() == code.pegs()
  end
end
