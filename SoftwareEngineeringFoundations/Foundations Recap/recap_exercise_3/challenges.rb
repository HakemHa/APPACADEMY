# Write a method no_dupes?(arr) that accepts an array as an arg 
# and returns an new array containing the elements that were not repeated in the array
require 'byebug'
def no_dupes?(arr)
    no_dupes = []
    arr.each_with_index do |ele1, i1|
        dupes = false
        arr.each_with_index do |ele2, i2|
            #debugger
            dupes = true if ele1 == ele2 && i1 != i2 
        end
        no_dupes << ele1 if !dupes
    end
    return no_dupes
end
# Examples
no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
no_dupes?([true, true, true])            # => []

# no_consecutive_repeats?
# Write a method no_consecutive_repeats?(arr) that accepts an array as an arg. 
# The method should return true if an element never appears consecutively in the array;
#  it should return false otherwise.

def no_consecutive_repeats?(arr)
  (0...arr.length - 1).each {|i| return false if arr[i] == arr[i + 1]}
  return true
end

# Examples
no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
no_consecutive_repeats?(['x'])                              # => true

# char_indices
# Write a method char_indices(str) that takes in a string as an arg. 
# The method should return a hash containing characters as keys. 
# The value associated with each key should be an array containing the indices 
# where that character is found.

def char_indices(str)
    indices = Hash.new([])
    str.each_char.with_index do |c, i|
        if indices[c].empty?
            indices[c] = []
        end
    indices[c] << i
    end
    indices
end

# Examples
char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}

# longest_streak
# Write a method longest_streak(str) that accepts a string as an arg.
# The method should return the longest streak of consecutive characters in the string. 
# If there are any ties, return the streak that occurs later in the string.

def longest_streak(str)
    streaks = []
    streak = ''
    (0...str.length).each do |i|
        #debugger
        streak += str[i] if streak.length == 0
        if !str[i + 1].nil? && str[i] == str[i + 1]
            streak += + str[i + 1]
            next
        end
        streaks << streak 
        streak = ''
    end
    if str.length == 1
        streaks << str
    end
    #debugger
    streaks.inject('') {|l, w| if l.length <= w.length then l = w else l end}
end

# Examples
longest_streak('a')           # => 'a'
longest_streak('accccbbb')    # => 'cccc'
longest_streak('aaaxyyyyyzz') # => 'yyyyy
longest_streak('aaabbb')      # => 'bbb'
longest_streak('abc')         # => 'c'

# bi_prime?
# Write a method bi_prime?(num) that accepts a number as an arg 
# and returns a boolean indicating whether or not the number is a bi-prime. 
# A bi-prime is a positive integer that can be obtained by multiplying two prime numbers.

def bi_prime?(n)
    factors(n).length == 2
end

def factors(num)
    factors = []
    (2..num).each do |i|
      if num % i == 0 && prime?(i)
        while num % i == 0 && num != 0
        factors << i
        num /= i
        end
      end
    end
    return factors
  end
  
  def prime?(num)
    num.times.with_index do |idx|
      comp = idx + 1
      if comp != 1 && comp != num && num % comp == 0
        return false
      end
    end
    if num > 0
      return true
    else
      return false
    end
  end

  # Examples
bi_prime?(14)   # => true
bi_prime?(22)   # => true
bi_prime?(25)   # => true
bi_prime?(94)   # => true
bi_prime?(24)   # => false
bi_prime?(64)   # => false

# vigenere_cipher
# A Caesar cipher takes a word and encrypts it by 
# offsetting each letter in the word by a fixed number, called the key. 
# Given a key of 3, for example: a -> d, p -> s, and y -> b.

# A Vigenere Cipher is a Caesar cipher, but instead of a single key, 
# a sequence of keys is used. 
# For example, if we encrypt "bananasinpajamas" with the key sequence 1, 2, 3, 
# then the result would be "ccqbpdtkqqcmbodt":

# Write a method vigenere_cipher(message, keys) 
# that accepts a string and a key-sequence as args, returning the encrypted message. 
# Assume that the message consists of only lowercase alphabetic characters.

def vigenere_cipher(message, keys)
    alphabet = 'abcdefghijklmnopqrstuvwxyz'
    message.each_char.with_index do |c, i|
        message[i] = alphabet[(alphabet.index(c) + keys[i % keys.length]) % alphabet.length] 
    end
    message
end

# Examples
vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
vigenere_cipher("zebra", [3, 0])            # => "ceerd"
vigenere_cipher("yawn", [5, 1])             # => "dbbo"

# vowel_rotate
# Write a method vowel_rotate(str) that accepts a string as an arg and 
# returns the string where every vowel is replaced with 
# the vowel the appears before it sequentially in the original string. 
# The first vowel of the string should be replaced with the last vowel.

def vowel_rotate(str)
    vowels = 'aeiou'
    replaces = (char_indices(str).select {|k, v| vowels.include?(k)}).inverse
    order = []
    temp_replaces = {}
    replaces.each do |k, v|
        k.each do |i| 
            order << i
        end
    end
    order.bubble_sort
    i = 0
    until i == order.length
        replaces.each_key do |k|
            k.each do |idx|
                if idx == order[i]
                    temp_replaces[idx] = replaces[k]
                    i +=1
                end
            end
        end
    end
    replaces = temp_replaces
    #p replaces
    shift = []
    replaces.keys.each_with_index do |n, i|
        shift[i] = replaces.keys[(replaces.keys.length - 1 + i) % replaces.keys.length]
    end
    rotated = ''
    i = 0
    str.each_char do |char|
        if vowels.include?(char)
            rotated += replaces[shift[i]]
            i += 1
        else
            rotated += char
        end
    end
    rotated
end

class Hash
    # Write a method, Hash#inverse, that returns a new hash where the key-value pairs are swapped
    def inverse
        new_hash = {}
        self.each do |k, v|
            new_hash[v] = k
        end
        new_hash
    end
end

class Array
    def bubble_sort(&prc)
        prc ||= Proc.new { |a, b| a <=> b }

        sorted = false
        while !sorted
            sorted = true

            (0...self.length - 1).each do |i|
                if prc.call(self[i], self[i + 1]) == 1
                    self[i], self[i + 1] = self[i + 1], self[i]
                    sorted = false
                end
            end
        end
        self
    end
end

# Examples
vowel_rotate('computer')      # => "cempotur"
vowel_rotate('oranges')       # => "erongas"
vowel_rotate('headphones')    # => "heedphanos"
vowel_rotate('bootcamp')      # => "baotcomp"
vowel_rotate('awesome')       # => "ewasemo"

#Proc Problems

# String#select
# Extend the string class by defining a String#select method that accepts a block. 
# The method should return a new string containing characters of the original string 
# that return true when passed into the block. 
# If no block is passed, then return the empty string. 
# Do not use the built-in Array#select in your solution.

class String
    def select(&prc)
        prc ||= nil
        if prc.nil?
            return ''
        end
        unique = ''
        self.each_char {|c| unique += c if prc.call(c)}
        unique
    end
end

# Examples
"app academy".select { |ch| !"aeiou".include?(ch) }   # => "pp cdmy"
"HELLOworld".select { |ch| ch == ch.upcase }          # => "HELLO"
"HELLOworld".select          # => ""

# String#map!
# Extend the string class by defining a String#map! method that accepts a block. 
# The method should modify the existing string by replacing every character 
# with the result of calling the block, passing in the original character and it's index. 
# Do not use the built-in Array#map or Array#map! in your solution.

class String
    def map!(&prc)
        self.each_char.with_index {|c, i| self[i] = prc.call(c)}
    end
end

# Examples
word_1 = "Lovelace"
word_1.map! do |ch| 
    if ch == 'e'
        '3'
    elsif ch == 'a'
        '4'
    else
        ch
    end
end
#p word_1        # => "Lov3l4c3"

#Recursion Problems

# multiply
# Write a method multiply(a, b) that takes in two numbers and returns their product.

# You must solve this recursively (no loops!)
# You must not use the multiplication (*) operator

def multiply(a, b)
    #debugger
    if b == 1 || b == -1
        return a
    end
    if b > 0
        return multiply(a, b - 1) + a
    elsif b < 0 && a < 0
        a = -a
        b = -b
        return multiply(a, b - 1) + a
    elsif b < 0 && a > 0
        a = -a
        b = -b
        return multiply(a, b - 1) + a
    end
end

# Examples
multiply(3, 5)        # => 15
multiply(5, 3)        # => 15
multiply(2, 4)        # => 8
multiply(0, 10)       # => 0
multiply(-3, -6)      # => 18
multiply(3, -6)       # => -18
multiply(-3, 6)       # => -18

# lucas_sequence
# The Lucas Sequence is a sequence of numbers. 
# The first number of the sequence is 2. The second number of the Lucas Sequence is 1. 
# To generate the next number of the sequence, we add up the previous two numbers. 
# For example, the first six numbers of the sequence are: 2, 1, 3, 4, 7, 11, ...

# Write a method lucasSequence that accepts a number representing a length as an arg. 
# The method should return an array containing the Lucas Sequence up to the given length. 
# Solve this recursively.

def lucas_sequence(n)
    sequence = []
    return sequence if n == 0
    return sequence.unshift(lucas_number(n - 1)).unshift(lucas_sequence(n - 1)).flatten
end

def lucas_number(n)
    if n == 0
        return 2
    elsif n == 1
        return 1
    end
    lucas_number(n - 1) + lucas_number(n - 2)
end

# Examples
lucas_sequence(0)   # => []
lucas_sequence(1)   # => [2]    
lucas_sequence(2)   # => [2, 1]
lucas_sequence(3)   # => [2, 1, 3]
lucas_sequence(6)   # => [2, 1, 3, 4, 7, 11]
lucas_sequence(8)   # => [2, 1, 3, 4, 7, 11, 18, 29]

# prime_factorization
# The Fundamental Theorem of Arithmetic states that every positive integer is 
# either a prime or can be represented as a product of prime numbers.

# Write a method prime_factorization(num) that accepts a number and 
# returns an array representing the prime factorization of the given number. 
# This means that the array should contain only prime numbers that 
# multiply together to the given num. 
# The array returned should contain numbers in ascending order. 
# Do this recursively.

def prime_factorization(num)
    factors = []
    if recursivePrime?(num)
        return factors << num
    elsif num == 1
        return factors[]
    end
    factor = recursivePrime(num)
    return factors.push(factor, prime_factorization(num / factor)).flatten
end

def recursivePrime?(num, i = 2)
    return false if num < 2
    return false if num  % i == 0
    return true if i * i > num
    return recursivePrime?(num, i + 1)
end

def recursivePrime(num, i = 2)
    return 1 if num == 1
    return recursivePrime(-num) if num < 1
    return i if num  % i == 0
    return recursivePrime(num, i + 1)
end

# Examples
prime_factorization(12)     # => [2, 2, 3]
prime_factorization(24)     # => [2, 2, 2, 3]
prime_factorization(25)     # => [5, 5]
prime_factorization(60)     # => [2, 2, 3, 5]
prime_factorization(7)      # => [7]
prime_factorization(11)     # => [11]
prime_factorization(2017)   # => [2017]