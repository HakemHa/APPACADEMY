#Combinations

def combinations(arr)
  twoDimensions = []
  arr.each do |ele1|
    arr.each do |ele2|
      if arr.index(ele2) > arr.index(ele1)
        twoDimensions << [ele1,ele2]
      end
    end
  end
  return twoDimensions
end

print combinations(["a", "b", "c"]); # => [ [ "a", "b" ], [ "a", "c" ], [ "b", "c" ] ]
puts

print combinations([0, 1, 2, 3]); # => [ [ 0, 1 ], [ 0, 2 ], [ 0, 3 ], [ 1, 2 ], [ 1, 3 ], [ 2, 3 ] ]
puts

#Opposite Count

def opposite_count(nums)
  pairs = 0
  nums.each do |num1|
    nums.each do |num2|
      if num1 + num2 == 0 && nums.index(num1) < nums.index(num2)
        pairs += 1
      end
    end
  end
  return pairs
end

puts opposite_count([ 2, 5, 11, -5, -2, 7 ]) # => 2
puts opposite_count([ 21, -23, 24 -12, 23 ]) # => 1

#Two Dimensional Sum

def two_d_sum(arr)
  totalSum = 0
  arr.each do |ele|
    partialSum = 0
    ele.each do |num|
      partialSum += num
    end
    totalSum += partialSum
  end
  return totalSum
end

array_1 = [
  [4, 5],
  [1, 3, 7, 1]
]
puts two_d_sum(array_1)    # => 21

array_2 = [
  [3, 3],
  [2],
  [2, 5]
]
puts two_d_sum(array_2)    # => 15

#Two Dimensional Translate

def two_d_translate(arr)
  newArray = []
  arr.each do |ele|
    ele[1].times do
      newArray << ele[0]
    end
  end
  return newArray
end

arr_1 = [
  ['boot', 3],
  ['camp', 2],
  ['program', 0]
]

print two_d_translate(arr_1) # => [ 'boot', 'boot', 'boot', 'camp', 'camp' ]
puts

arr_2 = [
  ['red', 1],
  ['blue', 4]
]

print two_d_translate(arr_2) # => [ 'red', 'blue', 'blue', 'blue', 'blue' ]
puts

#Array Translate

def array_translate(array)
  newString = ""
  index = 0
  while index < array.length
    array[index + 1].times do
      newString += array[index]
    end
    index += 2
  end
  return newString
end

print array_translate(["Cat", 2, "Dog", 3, "Mouse", 1]); # => "CatCatDogDogDogMouse"
puts

print array_translate(["red", 3, "blue", 1]); # => "redredredblue"
puts

#Pig Latin Word

# Pig latin translation uses the following rules:
# - for words that start with a vowel, add 'yay' to the end
# - for words that start with a nonvowel, move all letters before the first vowel to the end of the word and add 'ay'

def pig_latin_word(word)
  latin = word
  word.each_char.with_index do |char,idx|
    if isVowel(char)
      if idx == 0
        return latin + 'yay'
      else
        return latin + 'ay'
      end
    else
      letter = latin[0]
      latin[0] = ""
      latin += letter
    end
  end
end
def isVowel(char)
  vowels = 'aeiou'
  return vowels.include?(char)
end
puts pig_latin_word("apple")   # => "appleyay"
puts pig_latin_word("eat")     # => "eatyay"
puts pig_latin_word("banana")  # => "ananabay"
puts pig_latin_word("trash")   # => "ashtray"
