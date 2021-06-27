#Variables Exercise 1

# 1. Declare a variable named `firstName` and assign it your first name as a string:
firstName = "Itai"

# 2. Declare a variable named `lastName` and assign it your last name as a string:
lastName = "Hameiry"

# 3. Declare a variable named `fullName` and assign it the concatenation of
# your `firstName` and `lastName`. Be sure to put a space between your
# first and last names:
fullName = firstName + ' ' + lastName

# 4. print out the `fullName` variable
puts fullName

#Output:
# Itai Hameiry

#Variables Exercise 2

sentence = "There is no spoon"
puts "---1:"
puts sentence + "?"   # There is no spoon?

puts "---2:"
puts sentence         # There is no spoon

sentence += "."
puts "---3:"
puts sentence         # There is no spoon.

num = 6 / 2
puts "---4:"
puts num              # 3

puts "---5:"
puts sentence[num]    # r

#Variables Exercise 3

num = 40
num + 5
puts "---1:"
puts num                   # 40

num += 2
puts "---2:"
puts num                   # 42

isEven = num % 2 == 0
puts "---3:"
puts isEven                # true

isNegative = num < 0
puts "---4:"
puts isNegative            # false

puts "---5:"
puts isEven || isNegative  # true

puts "---6:"
puts isEven && isNegative  # false

puts "---7:"
puts isEven && !isNegative # true
