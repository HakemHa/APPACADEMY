#Map By Name

def map_by_name(arr)
  return arr.map {|hash| hash["name"]}
end


pets = [
  {"type"=>"dog", "name"=>"Rolo"},
  {"type"=>"cat", "name"=>"Sunny"},
  {"type"=>"rat", "name"=>"Saki"},
  {"type"=>"dog", "name"=>"Finn"},
  {"type"=>"cat", "name"=>"Buffy"}
]
print map_by_name(pets) #=> ["Rolo", "Sunny", "Saki", "Finn", "Buffy"]
puts

countries = [
 {"name"=>"Japan", "continent"=>"Asia"},
 {"name"=>"Hungary", "continent"=>"Europe"},
 {"name"=>"Kenya", "continent"=>"Africa"},
]
print map_by_name(countries) #=> ["Japan", "Hungary", "Kenya"]
puts

#Map By Key

def map_by_key(arr, key)
  return arr.map { |hash| hash[key] }
end

locations = [
  {"city"=>"New York City", "state"=>"New York", "coast"=>"East"},
  {"city"=>"San Francisco", "state"=>"California", "coast"=>"West"},
  {"city"=>"Portland", "state"=>"Oregon", "coast"=>"West"},
]

print map_by_key(locations, "state") #=> ["New York", "California", "Oregon"]
puts
print map_by_key(locations, "city") #=> ["New York City", "San Francisco", "Portland"]
puts

#Yell Sentence

def yell_sentence(sent)
  return sent.split(" ").map {|ele| ele.upcase + "!"}.join(" ")
end

puts yell_sentence("I have a bad feeling about this") #=> "I! HAVE! A! BAD! FEELING! ABOUT! THIS!"

#Whisper Words

def whisper_words(words)
  return words.map { |ele| ele.downcase + "..." }
end

print whisper_words(["KEEP", "The", "NOISE", "down"]) # => ["keep...", "the...", "noise...", "down..."]
puts

#O Words

def o_words(sentence)
  return sentence.split(" ").select { |ele| ele.include?('o') }
end

print o_words("How did you do that?") #=> ["How", "you", "do"]
puts

#Last Index

def last_index(str, char)
  return (str.length - 1) - str.reverse.index(char)
end

puts last_index("abca", "a")       #=> 3
puts last_index("mississipi", "i") #=> 9
puts last_index("octagon", "o")    #=> 5
puts last_index("programming", "m")#=> 7

#Most Vowels

def most_vowels(sentence)
  mostVowels = {"word" => '', "count" => 0}
  sentence.split(" ").each do |word|
  	count = 0
    word.each_char do |char|
      if 'aeiou'.include?(char)
        count += 1
      end
    end
    if count > mostVowels["count"]
      mostVowels["word"] = word
      mostVowels["count"] = count
    end
  end
  return mostVowels["word"]
end

print most_vowels("what a wonderful life") #=> "wonderful"

#Prime

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

puts prime?(2)  #=> true
puts prime?(5)  #=> true
puts prime?(11) #=> true
puts prime?(4)  #=> false
puts prime?(9)  #=> false
puts prime?(-5) #=> false

#Pick Primes

def pick_primes(numbers)
  return numbers.select { |num| prime?(num)}
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

print pick_primes([2, 3, 4, 5, 6]) #=> [2, 3, 5]
puts
print pick_primes([101, 20, 103, 2017]) #=> [101, 103, 2017]
puts

#Prime Factors

def prime_factors(num)
  factors = []
  (2..num).each do |i|
    if num % i == 0 && prime?(i)
      factors << i
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


print prime_factors(24) #=> [2, 3]
puts
print prime_factors(60) #=> [2, 3, 5]
puts

#Greatest Factor Array

def greatest_factor_array(arr)
  greatest = []
  arr.each do |num|
    if num % 2 == 0
      (1...num).each do |i|
        if prime?(num)
          greatest[arr.index(num)] = num
        elsif num % i == 0
          greatest[arr.index(num)] = i
        end
      end
    else
      greatest[arr.index(num)] = num
    end
  end
  return greatest
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

print greatest_factor_array([16, 7, 9, 14]) # => [8, 7, 9, 7]
puts
print greatest_factor_array([30, 3, 24, 21, 10]) # => [15, 3, 12, 21, 5]
puts

#Perfect Square

def perfect_square?(num)
  (1..num/2).each do |i|
    if i*i == num
      return true
    end
  end
  return false
end

puts perfect_square?(5)   #=> false
puts perfect_square?(12)  #=> false
puts perfect_square?(30)  #=> false
puts perfect_square?(9)   #=> true
puts perfect_square?(25)  #=> true

#Triple Sequence

def triple_sequence(start, length)
  sequence = []
  length.times do |i|
    if i == 0
      sequence[i] = start
    else
      sequence[i] = sequence[i-1] * 3
    end
  end
  return sequence
end

print triple_sequence(2, 4) # => [2, 6, 18, 54]
puts
print triple_sequence(4, 5) # => [4, 12, 36, 108, 324]
puts

#Summation Sequence

def summation_sequence(start, length)
  sequence = []
  length.times do |i|
    if i == 0
      sequence[i] = start
    else
      sequence[i] = sumation(sequence[i - 1])
    end
  end
  return sequence
end

def sumation(num)
  sum = 0
  (1..num).each do |i|
    sum += i
  end
  return sum
end

print summation_sequence(3, 4) # => [3, 6, 21, 231]
puts
print summation_sequence(5, 3) # => [5, 15, 120]
puts

#Fibonacci

def fibonacci(length)
  sequence = []
  fiboNum = [1, 1]
  if length < 1
    return sequence
  end
  (0...length).each do |i|
    sequence << fiboNum[0]
    fiboNum[0] = fiboNum[1]
    fiboNum[1] = sequence[i] + fiboNum[1]
  end
  return sequence
end

print fibonacci(0) # => []
puts
print fibonacci(1) # => [1]
puts
print fibonacci(6) # => [1, 1, 2, 3, 5, 8]
puts
print fibonacci(8) # => [1, 1, 2, 3, 5, 8, 13, 21]
puts

#Caesar Cipher

# Feel free to use this variable:
# alphabet = "abcdefghijklmnopqrstuvwxyz"

def caesar_cipher(str, num)
  alphabet = "abcdefghijklmnopqrstuvwxyz"
  cypher = alphabet.split("").map.with_index do |char, i|
    if !(alphabet.split("").index(char) + num >= alphabet.split("").length)
      alphabet.split("")[alphabet.split("").index(char) + num]
    else
      alphabet.split("")[alphabet.split("").index(char) + num - alphabet.split("").length]
    end
  end
  cryptography = ''
  str.each_char do |char|
    cryptography += cypher[alphabet.index(char)]
  end
  return cryptography
end

puts caesar_cipher("apple", 1)    #=> "bqqmf"
puts caesar_cipher("bootcamp", 2) #=> "dqqvecor"
puts caesar_cipher("zebra", 4)    #=> "difve"
#Alternative Solution
def caesar_cipher(str, num)
  alphabet = "abcdefghijklmnopqrstuvwxyz"
  new_str = ""

  str.each_char do |char|
    old_idx = alphabet.index(char)
    new_idx = old_idx + num
    new_char = alphabet[new_idx % 26]
    new_str += new_char
  end

  return new_str
end

puts caesar_cipher("apple", 1)    #=> "bqqmf"
puts caesar_cipher("bootcamp", 2) #=> "dqqvecor"
puts caesar_cipher("zebra", 4)    #=> "difve"

#Vowel Cipher

def vowel_cipher(string)
  vowels = 'aeiou'
  newString = ''
  string.each_char do |char|
    if vowels.include?(char)
      newString += vowels[(vowels.index(char) + 1) % 5]
    else
      newString += char
    end
  end
return newString
end

puts vowel_cipher("bootcamp") #=> buutcemp
puts vowel_cipher("paper cup") #=> pepir cap

#Double Letter Count

def double_letter_count(string)
  repeats = 0
  oldChar = ''
  string.each_char do |char|
    if oldChar == char
      repeats += 1
    end
    oldChar = char
  end
  return repeats
end

puts double_letter_count("the jeep rolled down the hill") #=> 3
puts double_letter_count("bootcamp") #=> 1

#Adjacent Sum

def adjacent_sum(arr)
  sum = []
  (1...arr.length).each do |i|
    sum[i - 1] = arr[i - 1] + arr[i]
  end
  return sum
end

print adjacent_sum([3, 7, 2, 11]) #=> [10, 9, 13], because [ 3+7, 7+2, 2+11 ]
puts
print adjacent_sum([2, 5, 1, 9, 2, 4]) #=> [7, 6, 10, 11, 6], because [2+5, 5+1, 1+9, 9+2, 2+4]
puts

#Pyramid Sum

# For example, the base [1, 4, 6] gives us the following pyramid
#     15
#   5   10
# 1   4    6

def pyramid_sum(base)
  thisBase = base
  pyramid = [thisBase]
  (0...(base.length - 1)).each do |i|
    pyramid.unshift(nextBase(thisBase))
    thisBase = nextBase(thisBase)
  end
  return pyramid
end

def nextBase(base)
  newBase = []
  (base.length - 1).times do |i|
    newBase << base[i] + base[i + 1]
  end
  return newBase
end

print pyramid_sum([1, 4, 6]) #=> [[15], [5, 10], [1, 4, 6]]
puts

print pyramid_sum([3, 7, 2, 11]) #=> [[41], [19, 22], [10, 9, 13], [3, 7, 2, 11]]
puts

#All Else Equals

def all_else_equal(arr)
  sum = 0
  arr.each do |num|
    sum += num
  end
  if arr.include?(sum / 2)
    return sum / 2
  end
  return nil
end

p all_else_equal([2, 4, 3, 10, 1]) #=> 10, because the sum of all elements is 20
p all_else_equal([6, 3, 5, -9, 1]) #=> 3, because the sum of all elements is 6
p all_else_equal([1, 2, 3, 4])     #=> nil, because the sum of all elements is 10 and there is no 5 in the array

#Anagrams

def anagrams?(word1, word2)
  return charCount(word1) == charCount(word2)
end

def charCount(word)
  newHash = Hash.new(0)
  word.each_char { |char| newHash[char] += 1}
  return newHash
end

puts anagrams?("cat", "act")          #=> true
puts anagrams?("restful", "fluster")  #=> true
puts anagrams?("cat", "dog")          #=> false
puts anagrams?("boot", "bootcamp")    #=> false

#Consonant Cancel

def consonant_cancel(sentence)
  newSentence = []
  sentence.split(" ").each do |word|
    newWord = word
    while !('aeiou'.include?(newWord[0]))
      newWord = newWord[1..-1]
    end
    newSentence << newWord
  end
  return newSentence.join(" ")
end

puts consonant_cancel("down the rabbit hole") #=> "own e abbit ole"
puts consonant_cancel("writing code is challenging") #=> "iting ode is allenging"


#Same Char Collapse

def same_char_collapse(str)
  newStr = str
  newStr = collapsed(newStr)
  if !newStr[1]
    return newStr[0]
  else
    same_char_collapse(newStr)
  end
end

def collapsed(newStr)
  if newStr.length == 2
        myString = newStr[0]
      else
        myString = newStr
      end
  myString.each_char.with_index do |char, i|
    if myString[i] == myString[i + 1]
      myString[i..i + 1] = ''
      return [myString, true]
    end
  end
  return [myString, false]
end

puts same_char_collapse("zzzxaaxy")   #=> "zy"
# because zzzxaaxy -> zxaaxy -> zxxy -> zy


puts same_char_collapse("uqrssrqvtt") #=> "uv"
# because uqrssrqvtt -> uqrrqvtt -> uqqvtt -> uvtt -> uv
#Alternative Solution
def same_char_collapse(str)
  reducible = true

  while reducible
    chars = str.split("")
    reducible = false

    chars.each.with_index do |char, i|
      if chars[i] == chars[i + 1]
        chars[i] = ""
        chars[i + 1] = ""
        reducible = true
      end
    end

    str = chars.join("")
  end

  return str
end

puts same_char_collapse("zzzxaaxy")   #=> "zy"
# because zzzxaaxy -> zxaaxy -> zxxy -> zy


puts same_char_collapse("uqrssrqvtt") #=> "uv"
# because uqrssrqvtt -> uqrrqvtt -> uqqvtt -> uvtt -> uv
