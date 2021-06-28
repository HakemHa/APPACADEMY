#Count E

def count_e(w

  ord)
	sum = 0
  	i = 0
  	while i < word.length
      if word[i] == 'e'
        sum += 1
      end
      i += 1
    end
  return sum
end

puts count_e("movie") # => 1
puts count_e("excellent") # => 3

#Count A

def count_a(word)
	sum = 0
  	i = 0
  	while i < word.length
      if word[i] == 'a' || word[i] == 'A'
        sum += 1
      end
      i += 1
    end
  return sum
end

puts count_a("application")  # => 2
puts count_a("bike")         # => 0
puts count_a("Arthur")       # => 1
puts count_a("Aardvark")     # => 3

#COunt Vowels

def count_vowels(word)
	sum = 0
  	i = 0
  	while i < word.length
      char = word[i]
      if char == 'a' || char == 'e' ||  char == 'i' || char == 'o' || char == 'u'
        sum += 1
      end
      i += 1
    end
  return sum
end

puts count_vowels("bootcamp")  # => 3
puts count_vowels("apple")     # => 2
puts count_vowels("pizza")     # => 2

#Sum Nums

def sum_nums(max)
  i = 0
  sum = 0
  while i <= max
    sum += i
    i += 1
  end
  return sum
end

puts sum_nums(4) # => 10, because 1 + 2 + 3 + 4 = 10
puts sum_nums(5) # => 15

#Factorial

def factorial(num)
  i = 1
  factorial = 1
  while i <= num
    factorial *= i
    i += 1
  end
  return factorial
end

puts factorial(3) # => 6, because 1 * 2 * 3 = 6
puts factorial(5) # => 120, because 1 * 2 * 3 * 4 * 5 = 120

#Reverse

def reverse(word)
	reverse = ''
  	i = 0
  	while i < word.length
    reverse += word[(word.length - 1) - i]
    i += 1
    end
  	return reverse
end

puts reverse("cat")          # => "tac"
puts reverse("programming")  # => "gnimmargorp"
puts reverse("bootcamp")     # => "pmactoob"

#Is Palindrome

def is_palindrome(word)
	reverse = ''
  	i = 0
  	while i < word.length
    reverse += word[(word.length - 1) - i]
    i += 1
    end
  	return reverse == word
end

puts is_palindrome("racecar")  # => true
puts is_palindrome("kayak")    # => true
puts is_palindrome("bootcamp") # => false
