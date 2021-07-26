#Array Cheat Sheet

# add element(s) to the end using push
people = ["Tommy", "Bex"]
p people.push("Maurice", "Abby")      # prints ["Tommy", "Bex", "Maurice", "Abby"]
p people                              # prints ["Tommy", "Bex", "Maurice", "Abby"]

# remove the last element using pop
people = ["Tommy", "Bex"]
p people.pop()                        # prints "Bex"
p people                              # prints ["Tommy"]

# add elements(s) to the front using unshift
people = ["Tommy", "Bex"]
p people.unshift("Oscar", "Matthias") # prints ["Oscar", "Matthias", "Tommy", "Bex"]
p people                              # prints ["Oscar", "Matthias", "Tommy", "Bex"]

# remove the first element using shift
people = ["Tommy", "Bex"]
p people.shift()                      # prints "Tommy"
p people                              # prints ["Bex"]

# check if an element exists in an array using include?
people = ["Tommy", "Bex", "Abby", "Maurice"]
p people.include?("Abby")   # prints true
p people.include?("Mashu")  # prints false

# find the index of an element in an array using index
people = ["Tommy", "Bex", "Abby", "Maurice"]
p people.index("Abby")      # prints 2
p people.index("Maurice")   # prints 3
p people.index("Oscar")     # prints nil
p people.index("Danny")     # prints nil

sentence = "Hey Programmers! What's up."
p sentence.split(" ")      # prints ["Hey", "Programmers!", "What's", "up."]
p sentence.split("a")      # prints ["Hey Progr", "mmers! Wh", "t's up."]
p sentence.split("gram")   # prints ["Hey Pro", "mers! What's up."]
p sentence                 # prints "Hey Programmers! What's up."

# convert an array into a string using join
words = ["Rubies", "are", "red"]
p words.join(" ")          # prints "Rubies are red"
p words.join("-")          # prints "Rubies-are-red"
p words.join("HI")         # prints "RubiesHIareHIred"
p words                    # prints ["Rubies", "are", "red"]

#Enumerables Cheat Sheet

people = ["Candace", "Jon", "Jose"]

# iterate over elements of an array using each
people.each { |person| puts person } # prints
# Candace
# Jon
# Jose

# iterate over elements of an array with index using each_with_index
people.each_with_index do |person, i|
  puts person
  puts i
  puts "-----"
end # prints
# Candace
# 0
# -----
# Jon
# 1
# -----
# Jose
# 2
# -----

greeting = "hello"

# iterate over characters of a string using each_char
greeting.each_char { |char| puts char } # prints
# h
# e
# l
# l
# o

# iterate over characters of a string with index using each_char.with_index
greeting.each_char.with_index do |char, i|
  puts char
  puts i
  puts "---"
end # prints
# h
# 0
# ---
# e
# 1
# ---
# l
# 2
# ---
# l
# 3
# ---
# o
# 4
# ---

# repeat a block using times
3.times do
  puts "hi"
end # prints
# hi
# hi
# hi

# specify a range of numbers using (start..end) or (start...end)

# including end
(2..6).each {|n| puts n} # prints
# 2
# 3
# 4
# 5
# 6

# excluding end
(2...6).each {|n| puts n} # prints
# 2
# 3
# 4
# 5

#Exercises:
#To Initials

def to_initials(name)
	names = name.split(" ")
    initials = ""
  	names.each do |name|
      initials += name[0]
    end
  return initials
end

puts to_initials("Kelvin Bridges")      # => "KB"
puts to_initials("Michaela Yamamoto")   # => "MY"
puts to_initials("Mary La Grange")      # => "MLG"

#First In Array

def first_in_array(arr, el1, el2)
	if arr.index(el1) < arr.index(el2)
      return el1
    else
      return el2
    end
end

puts first_in_array(["a", "b", "c", "d"], "d", "b"); # => "b"
puts first_in_array(["cat", "bird" ,"dog", "mouse" ], "dog", "mouse"); # => "dog"

#Abbreviate Sentence

def abbreviate_sentence(sent)
  	output = []
	words = sent.split(" ")
  	words.each do |word|
      if word.length > 4
        word.each_char do |char|
        	if char == 'a' || char == 'e' || char == 'i' || char == 'o' || char == 'u'
          		word[word.index(char)] = ""
        	end
      	end
      end
      output << word
    end
    return output.join(" ")
end

puts abbreviate_sentence("follow the yellow brick road") # => "fllw the yllw brck road"
puts abbreviate_sentence("what a wonderful life")        # => "what a wndrfl life"
#Alternative Solution
def abbreviate_sentence(sent)
  words = sent.split(" ")
  new_words = []

  words.each do |word|
    if word.length > 4
      new_word = abbreviate_word(word)
      new_words << new_word
    else
      new_words << word
    end
  end

  return new_words.join(" ")
end

def abbreviate_word(word)
  vowels = "aeiou"
  new_word = ""

  word.each_char do |char|
    if !vowels.include?(char)
      new_word += char
    end
  end

  return new_word
end

puts abbreviate_sentence("follow the yellow brick road") # => "fllw the yllw brck road"
puts abbreviate_sentence("what a wonderful life")        # => "what a wndrfl life"

#Format Name

# Hint: use str.upcase and str.downcase
# "abc".upcase # => "ABC"

def format_name(str)
  	format = []
	words = str.split(" ")
  	words.each do |word|
      word = word[0].upcase + word[1..-1].downcase
      format << word
    end
  	return format.join(" ")
end

puts format_name("chase WILSON") # => "Chase Wilson"
puts format_name("brian CrAwFoRd scoTT") # => "Brian Crawford Scott"

#Is Valid Name

# A name is valid is if satisfies all of the following:
# - contains at least a first name and last name, separated by spaces
# - each part of the name should be capitalized
#
# Hint: use str.upcase or str.downcase
# "a".upcase # => "A"

def is_valid_name(str)
	words = str.split(" ")
  	if words.length < 2
      return false
    end
  	words.each do |word|
      if !capitalized(word)
        return false
      end
    end
      return true
end
def capitalized(word)
  capitals = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
  word[1..-1].each_char do |char|
    if capitals.include?(char)
      return false
    end
  end
  return capitals.include?(word[0])
end
puts is_valid_name("Kush Patel")       # => true
puts is_valid_name("Daniel")           # => false
puts is_valid_name("Robert Downey Jr") # => true
puts is_valid_name("ROBERT DOWNEY JR") # => false

#Is Valid Email

# For simplicity, we'll consider an email valid when it satisfies all of the following:
# - contains exactly one @ symbol
# - contains only lowercase alphabetic letters before the @
# - contains exactly one . after the @

def is_valid_email(str)
  at = 0
  str.each_char do |char|
    if char == '@'
      at +=1
    end
  end
  if at != 1
    return false
  end
  if !lower(str[0...str.index('@')])
    return false
  end
  if !containDot(str[(str.index('@') + 1)..-1])
    return false
  end
  return true
end

def lower(str)
  str.each_char do |char|
    if char == char.upcase
      return false
    end
  end
  return true
end

def containDot(str)
  dots = 0
  str.each_char do |char|
    if char == '.'
      dots += 1
    end
  end
  return dots == 1
end
puts is_valid_email("abc@xy.z")         # => true
puts is_valid_email("jdoe@gmail.com")   # => true
puts is_valid_email("jdoe@g@mail.com")  # => false
puts is_valid_email("jdoe42@gmail.com") # => false
puts is_valid_email("jdoegmail.com")    # => false
puts is_valid_email("az@email")         # => false

#Reverse Words

def reverse_words(sent)
  reverse = []
  sent.split(" ").each do |word|
    reverse << word.reverse
  end
  return reverse.join(" ")
end

puts reverse_words('keep coding') # => 'peek gnidoc'
puts reverse_words('simplicity is prerequisite for reliability') # => 'yticilpmis si etisiuqererp rof ytilibailer'

#Rotate Array

def rotate_array(arr, num)
  num.times do
    ele = arr.pop
    arr.unshift(ele)
  end

  return arr
end

print rotate_array([ "Matt", "Danny", "Mashu", "Matthias" ], 1) # => [ "Matthias", "Matt", "Danny", "Mashu" ]
puts

print rotate_array([ "a", "b", "c", "d" ], 2) # => [ "c", "d", "a", "b" ]
puts
