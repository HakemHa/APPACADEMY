#Doubler

def doubler(numbers)
	i = 0
  	while i < numbers.length
      numbers[i] = numbers [i] * 2
      i += 1
    end
  return numbers
end

print doubler([1, 2, 3, 4]) # => [2, 4, 6, 8]
puts
print doubler([7, 1, 8])    # => [14, 2, 16]

#Yeller

def yell(words)
	i = 0
  	while i < words.length
      words[i] = words[i] + '!'
      i += 1
    end
  return words
end

print yell(["hello", "world"]) # => ["hello!", "world!"]
puts
print yell(["code", "is", "cool"]) # => ["code!", "is!", "cool!"]

#Element Times Index

def element_times_index(numbers)
	i = 0
  	while i < numbers.length
      numbers[i] = numbers[i] * i
      i += 1
    end
  return numbers
end

print element_times_index([4, 7, 6, 5])       # => [0, 7, 12, 15]
puts
print element_times_index([1, 1, 1, 1, 1, 1]) # => [0, 1, 2, 3, 4, 5]

#Even Nums

def even_nums(max)
	even_nums = []
  	i = 0
  	while i <= max
      if i % 2 == 0
        even_nums << i
      end
      i += 1
    end
  return even_nums
end

print even_nums(10) # => [0, 2, 4, 6, 8, 10]
puts
print even_nums(5)  # => [0, 2, 4]

#Range

def range(min, max)
  i = min
  range = []
  while i <= max
    range << i
    i += 1
  end
  return range
end

print range(2, 7)   # => [2, 3, 4, 5, 6, 7]
puts
print range(13, 20) # => [13, 14, 15, 16, 17, 18, 19, 20]

#Odd Range

def odd_range(min, max)
  i = min
  range = []
  while i <= max
    if i % 2 != 0
     range << i
    end
    i += 1
  end
  return range
end

print odd_range(11, 18) # => [11, 13, 15, 17]
puts
print odd_range(3, 7)   # => [3, 5, 7]

#Reverse Range

def reverse_range(min, max)
  i = 0
  range = []
  while max - 1 - i > min
    range << max - 1 - i
    i += 1
  end
  return range
end

print reverse_range(10, 17) # => [16, 15, 14, 13, 12, 11]
puts
print reverse_range(1, 7)   # => [6, 5, 4, 3, 2]

#First Half

def first_half(array)
  i = 0
  firstHalf = []
  while i < array.length / 2.0
    firstHalf << array[i]
    i += 1
  end
  return firstHalf
end

print first_half(["Brian", "Abby", "David", "Ommi"]) # => ["Brian", "Abby"]
puts
print first_half(["a", "b", "c", "d", "e"])          # => ["a", "b", "c"]

#Factors Of

def factors_of(num)
	factors = []
  	i = 1
  	while i <= num
      if num % i == 0
        factors << i
      end
      i += 1
    end
  	return factors
end

print factors_of(3)   # => [1, 3]
puts
print factors_of(4)   # => [1, 2, 4]
puts
print factors_of(8)   # => [1, 2, 4, 8]
puts
print factors_of(9)   # => [1, 3, 9]
puts
print factors_of(16)  # => [1, 2, 4, 8, 16]

#Select Odds

def select_odds(numbers)
	odds = []
  	i = 0
  	while i < numbers.length
      if numbers[i] % 2 != 0
        odds << numbers[i]
      end
      i += 1
    end
  	return odds
end

print select_odds([13, 4, 3, 7, 6, 11]) # => [13, 3, 7, 11]
puts
print select_odds([2, 4, 6])            # => []

#Select Long Words

def select_long_words(words)
	longs = []
  	i = 0
  	while i < words.length
      if words[i].length > 4
        longs << words[i]
      end
      i += 1
    end
  	return longs
end

print select_long_words(["what", "are", "we", "eating", "for", "dinner"]) # => ["eating", "dinner"]
puts
print select_long_words(["keep", "coding"])                               # => ["coding"]

#Sum Elements

def sum_elements(arr1, arr2)
	sum = []
  	i = 0
  	while i < arr1.length
      sum << arr1[i] + arr2[i]
      i += 1
    end
  return sum
end

print sum_elements([7, 4, 4], [3, 2, 11])                            # => [10, 6, 15]
puts
print sum_elements(["cat", "pizza", "boot"], ["dog", "pie", "camp"]) # => ["catdog", "pizzapie", "bootcamp"]

#Fizz Buzz

def fizz_buzz(max)
  fizzBuzz = []
  i = 0
  while i < max
    if ( (i % 4 == 0) || (i % 6 == 0) ) && !((i % 4 == 0) && (i % 6 == 0))
      fizzBuzz << i
    end
    i += 1
  end
  return fizzBuzz
end

print fizz_buzz(20) # => [4, 6, 8, 16, 18]
puts
print fizz_buzz(15) # => [4, 6, 8]
