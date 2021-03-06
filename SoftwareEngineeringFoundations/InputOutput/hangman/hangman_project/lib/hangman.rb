class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
  def self.random_word
    DICTIONARY.sample
  end
  
  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, '_') 
    @attempted_chars = []
    @remaining_incorrect_guesses = 5 
  end

  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(guess)
    if @attempted_chars.include?(guess)
      return true
    end
    false
  end

  def get_matching_indices(guess)
  indices = []
  @secret_word.each_char.with_index {|c, i| indices << i if c == guess}
  indices
  end

  def fill_indices(guess, indices)
  indices.each {|i| @guess_word[i] = guess}
  end

  def try_guess(guess)
    if already_attempted?(guess)
      puts 'that has already been attempted'
      return false
    else
      @attempted_chars << guess
      if get_matching_indices(guess).length == 0
        @remaining_incorrect_guesses -= 1
      else
        fill_indices(guess, get_matching_indices(guess))
      end
      return true
    end
  end

  def ask_user_for_guess
    print 'Enter a char: '
    guess = gets.chomp
    return try_guess(guess)
  end

  def win?
    if @guess_word.join("") == @secret_word
      puts 'WIN'
      return true
    else
      return false
    end
  end
  
  def lose?
    if @remaining_incorrect_guesses == 0
      print 'LOSE '
      return true
    else
      return false
    end
  end

  def game_over?
    if self.win? || self.lose?
      puts "the word was " + @secret_word
      return true
    else
      return false
    end
  end
end
