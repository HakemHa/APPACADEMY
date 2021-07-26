require 'byebug'

#PHASE 1: No big deal

# strange_sums
# Write a method strange_sums that accepts an array of numbers as an argument. 
# The method should return a count of the number of 
# distinct pairs of elements that have a sum of zero. 
# You may assume that the input array contains unique elements.
def strange_sums(nums)
    sums = 0
    nums.each_index do |i|
        nums.each_index do |j|
            if j > i && nums[i] + nums[j] == 0
                sums += 1
            end 
        end
    end
    sums
end
#Examples
# p strange_sums([2, -3, 3, 4, -2])     # 2
# p strange_sums([42, 3, -1, -42])      # 1
# p strange_sums([-5, 5])               # 1
# p strange_sums([19, 6, -3, -20])      # 0
# p strange_sums([9])                   # 0

# pair_product
# Write a method pair_product that accepts an array of numbers and a product as arguments. 
# The method should return a boolean indicating whether or not a pair of distinct elements 
# in the array result in the product when multiplied together. 
# You may assume that the input array contains unique elements.

def pair_product(nums, pr)
    eq = false
    nums.each_index do |i|
        nums.each_index do |j|
            if j > i && nums[i]*nums[j] == pr
                eq = true
            end 
        end
    end
    eq
end

#Examples
# p pair_product([4, 2, 5, 8], 16)    # true
# p pair_product([8, 1, 9, 3], 8)     # true
# p pair_product([3, 4], 12)          # true
# p pair_product([3, 4, 6, 2, 5], 12) # true
# p pair_product([4, 2, 5, 7], 16)    # false
# p pair_product([8, 4, 9, 3], 8)     # false
# p pair_product([3], 12)             # false

# rampant_repeats
# Write a method rampant_repeats that accepts a string and a hash as arguments. 
# The method should return a new string where characters of the original string 
# are repeated the number of times specified by the hash. 
# If a character does not exist as a key of the hash, then it should remain unchanged.

def rampant_repeats(str, hash)
    new_str = ''
    str.each_char {|c| if !hash[c].nil? then new_str += c*hash[c] else new_str += c end}
    new_str
end

#Examples
# p rampant_repeats('taco', {'a'=>3, 'c'=>2})             # 'taaacco'
# p rampant_repeats('feverish', {'e'=>2, 'f'=>4, 's'=>3}) # 'ffffeeveerisssh'
# p rampant_repeats('misispi', {'s'=>2, 'p'=>2})          # 'mississppi'
# p rampant_repeats('faarm', {'e'=>3, 'a'=>2})            # 'faaaarm'

# perfect_square?
# Write a method perfect_square? that accepts a number as an argument. 
# The method should return a boolean indicating whether or not 
# the argument is a perfect square. 
# A perfect square is a number that is the product of some number multiplied by itself. 
# For example, since 64 = 8 * 8 and 144 = 12 * 12, 
# 64 and 144 are perfect squares; 35 is not a perfect square.

def perfect_square(n)
    perfect = false
    perfect = true if n == 1
    (1..n/2).each {|i| perfect = true if i*i == n}
    perfect
end

#Examples
# p perfect_square(1)     # true
# p perfect_square(4)     # true
# p perfect_square(64)    # true
# p perfect_square(100)   # true
# p perfect_square(169)   # true
# p perfect_square(2)     # false
# p perfect_square(40)    # false
# p perfect_square(32)    # false
# p perfect_square(50)    # false

#PHASE 2: Nothing you can't handle

# anti_prime?
# Write a method anti_prime? that accepts a number as an argument. 
# The method should return true if the given number has more divisors than 
# all positive numbers less than the given number. 
# For example, 24 is an anti-prime because it has more divisors 
# than any positive number less than 24. 
# Math Fact: Numbers that meet this criteria are also known as highly composite numbers.

def anti_prime?(num)
    (1...num).each {|i| return false if proper_factors(i).length > proper_factors(num).length}
    true

end

def proper_factors(n)
    (1...n).inject([]) {|f, v| if n % v == 0 then f << v else f  end}
end

def proper_factors_with_n(n)
    (1..n).inject([]) {|f, v| if n % v == 0 then f << v else f  end}
end

#Examples
# p anti_prime?(24)   # true
# p anti_prime?(36)   # true
# p anti_prime?(48)   # true
# p anti_prime?(360)  # true
# p anti_prime?(1260) # true
# p anti_prime?(27)   # false
# p anti_prime?(5)    # false
# p anti_prime?(100)  # false
# p anti_prime?(136)  # false
# p anti_prime?(1024) # false

# matrix_addition
# Let a 2-dimensional array be known as a "matrix". 
# Write a method matrix_addition that accepts two matrices as arguments. 
# The two matrices are guaranteed to have the same "height" and "width". 
# The method should return a new matrix representing the sum of the two arguments. 
# To add matrices, we simply add the values at the same positions.

def matrix_addition(a, b)
    aplusb = Array.new(a.length) {|e| e = Array.new(a[0].length)}
    aplusb.each_index do |i|
        aplusb[i].each_index do |j|
            aplusb[i][j] = a[i][j] + b[i][j]
        end
    end
    aplusb
end

#Examples
# matrix_a = [[2,5], [4,7]]
# matrix_b = [[9,1], [3,0]]
# matrix_c = [[-1,0], [0,-1]]
# matrix_d = [[2, -5], [7, 10], [0, 1]]
# matrix_e = [[0 , 0], [12, 4], [6,  3]]

# p matrix_addition(matrix_a, matrix_b) # [[11, 6], [7, 7]]
# p matrix_addition(matrix_a, matrix_c) # [[1, 5], [4, 6]]
# p matrix_addition(matrix_b, matrix_c) # [[8, 1], [3, -1]]
# p matrix_addition(matrix_d, matrix_e) # [[2, -5], [19, 14], [6, 4]]

# mutual_factors
# Write a method mutual_factors that accepts any amount of numbers as arguments. 
# The method should return an array containing all of the common divisors 
# shared among the arguments. 
# For example, the common divisors of 50 and 30 are 1, 2, 5, 10. 
# You can assume that all of the arguments are positive integers.

def mutual_factors(*nums)
    mutual_factors = Hash.new(0)
    nums.each do |num|
        proper_factors_with_n(num).each do |f|
            mutual_factors[f] += 1
        end
    end
    (mutual_factors.select {|k, v| v == nums.length}).keys
end

#Examples
# p mutual_factors(50, 30)            # [1, 2, 5, 10]
# p mutual_factors(50, 30, 45, 105)   # [1, 5]
# p mutual_factors(8, 4)              # [1, 2, 4]
# p mutual_factors(8, 4, 10)          # [1, 2]
# p mutual_factors(12, 24)            # [1, 2, 3, 4, 6, 12]
# p mutual_factors(12, 24, 64)        # [1, 2, 4]
# p mutual_factors(22, 44)            # [1, 2, 11, 22]
# p mutual_factors(22, 44, 11)        # [1, 11]
# p mutual_factors(7)                 # [1, 7]
# p mutual_factors(7, 9)              # [1]

# tribonacci_number
# The tribonacci sequence is similar to that of Fibonacci. 
# The first three numbers of the tribonacci sequence are 1, 1, and 2. 
# To generate the next number of the sequence, we take the sum of the previous three numbers.
# The first six numbers of tribonacci sequence are: 1, 1, 2, 4, 7, 13, ... and so on
# Write a method tribonacci_number that accepts a number argument, n, 
# and returns the n-th number of the tribonacci sequence.

def tribonacci_number(n)
    if n == 1
        return 1
    elsif n == 2
        return 1
    elsif n == 3
        return 2
    end
    tribonacci_number(n - 1) + tribonacci_number(n - 2) + tribonacci_number(n - 3)
end

#Examples
# p tribonacci_number(1)  # 1
# p tribonacci_number(2)  # 1
# p tribonacci_number(3)  # 2
# p tribonacci_number(4)  # 4
# p tribonacci_number(5)  # 7
# p tribonacci_number(6)  # 13
# p tribonacci_number(7)  # 24
# p tribonacci_number(11) # 274

#PHASE 3: Now We're Having Fun

# matrix_addition_reloaded
# Write a method matrix_addition_reloaded that accepts any number of matrices as arguments. 
# The method should return a new matrix representing the sum of the arguments. 
# Matrix addition can only be performed on matrices of similar dimensions, 
# so if all of the given matrices do not have 
# the same "height" and "width", then return nil.

def matrix_addition_reloaded(*matrices)
    matrices.inject do |sum, matr|
        if matr.length == sum.length && matr[0].length == sum[0].length
            sum = matrix_addition(sum, matr)
        else
            return nil
        end
    end
end

#Examples
# matrix_a = [[2,5], [4,7]]
# matrix_b = [[9,1], [3,0]]
# matrix_c = [[-1,0], [0,-1]]
# matrix_d = [[2, -5], [7, 10], [0, 1]]
# matrix_e = [[0 , 0], [12, 4], [6,  3]]

# p matrix_addition_reloaded(matrix_a, matrix_b)              # [[11, 6], [7, 7]]
# p matrix_addition_reloaded(matrix_a, matrix_b, matrix_c)    # [[10, 6], [7, 6]]
# p matrix_addition_reloaded(matrix_e)                        # [[0, 0], [12, 4], [6, 3]]
# p matrix_addition_reloaded(matrix_d, matrix_e)              # [[2, -5], [19, 14], [6, 4]]
# p matrix_addition_reloaded(matrix_a, matrix_b, matrix_e)    # nil
# p matrix_addition_reloaded(matrix_d, matrix_e, matrix_c)    # nil

# squarocol?
# Write a method squarocol? that accepts a 2-dimensional array as an argument. 
# The method should return a boolean indicating whether or not 
# any row or column is completely filled with the same element. 
# You may assume that the 2-dimensional array has "square" dimensions, 
# meaning it's height is the same as it's width.

def squarocol?(matr)
    squarocol = false
    matr.each_with_index do |row, i|
        squarocol = !row.any? {|e| e != row[row.index(e) - 1]}
    end
    zip(*matr).each_with_index do |row, i|
        squarocol = !row.any? {|e| e != row[row.index(e) - 1]} if squarocol != true
    end
    squarocol
end

def zip(*arrs)
    td = Array.new(arrs[0].length) {|e| e = Array.new(arrs.length)}
    arrs.length.times do |i|
        td.length.times do |j|
            td[j][i] = arrs[i][j]
        end
    end
    td
end

#Examples
# p squarocol?([
#     [:a, :x , :d],
#     [:b, :x , :e],
#     [:c, :x , :f],
# ]) # true

# p squarocol?([
#     [:x, :y, :x],
#     [:x, :z, :x],
#     [:o, :o, :o],
# ]) # true

# p squarocol?([
#     [:o, :x , :o],
#     [:x, :o , :x],
#     [:o, :x , :o],
# ]) # false

# p squarocol?([
#     [1, 2, 2, 7],
#     [1, 6, 6, 7],
#     [0, 5, 2, 7],
#     [4, 2, 9, 7],
# ]) # true

# p squarocol?([
#     [1, 2, 2, 7],
#     [1, 6, 6, 0],
#     [0, 5, 2, 7],
#     [4, 2, 9, 7],
# ]) # false

# squaragonal?
# Write a method squaragonal? that accepts 2-dimensional array as an argument. 
# The method should return a boolean indicating whether or not the array 
# contains all of the same element across either of its diagonals. 
# You may assume that the 2-dimensional array has "square" dimensions, 
# meaning it's height is the same as it's width.

def squaragonal?(matr)
    primer = matr[0][0]
    right_counts = 0
    laster = matr[-1][0]
    left_counts = 0
    matr.each_index do |i|
        matr.each_index do |j|
            if i == j
                right_counts += 1 if primer == matr[i][j]
                left_counts += 1 if laster == matr[i][matr[i].length - (j+1)]
            end
        end
    end
    right_counts == matr.length || left_counts  == matr.length 
end

#Examples
# p squaragonal?([
#     [:x, :y, :o],
#     [:x, :x, :x],
#     [:o, :o, :x],
# ]) # true

# p squaragonal?([
#     [:x, :y, :o],
#     [:x, :o, :x],
#     [:o, :o, :x],
# ]) # true

# p squaragonal?([
#     [1, 2, 2, 7],
#     [1, 1, 6, 7],
#     [0, 5, 1, 7],
#     [4, 2, 9, 1],
# ]) # true

# p squaragonal?([
#     [1, 2, 2, 5],
#     [1, 6, 5, 0],
#     [0, 2, 2, 7],
#     [5, 2, 9, 7],
# ]) # false

# pascals_triangle
# Pascal's triangle is a 2-dimensional array with the shape of a pyramid. 
# The top of the pyramid is the number 1. To generate further levels of the pyramid, 
# every element is the sum of the element above and to the left
# with the element above and to the right. 
# Nonexisting elements are treated as 0 when calculating the sum. For example, 
# here are the first 5 levels of Pascal's triangle:       
#      1
#     1 1
#    1 2 1
#   1 3 3 1
#  1 4 6 4 1
# Write a method pascals_triangle that accepts a positive number, n, 
# as an argument and returns a 2-dimensional array representing 
# the first n levels of pascal's triangle.

def pascals_triangle(n)
    if n == 1
        return [1]
    elsif n == 2
        triangle = Array.new(pascals_triangle(n - 1).length + 1)
        triangle[0] = pascals_triangle(n - 1)
        triangle[-1] = [1, 1]
        return triangle
    end
    triangle = Array.new(pascals_triangle(n - 1)[-1].length + 1)
    triangle[0] = 1
    triangle[-1] = 1
    pascals_triangle(n - 1)[-1].each_with_index do |e, i|
        if i != pascals_triangle(n - 1)[-1].length  - 1
        triangle[i + 1] = pascals_triangle(n - 1)[-1][i] + pascals_triangle(n - 1)[-1][i + 1]
        end
    end
    return [*pascals_triangle(triangle.length - 1), triangle]
end

#Examples
# p pascals_triangle(5)
# # [
# #     [1],
# #     [1, 1],
# #     [1, 2, 1],
# #     [1, 3, 3, 1],
# #     [1, 4, 6, 4, 1]
# # ]

# p pascals_triangle(7)
# # [
# #     [1],
# #     [1, 1],
# #     [1, 2, 1],
# #     [1, 3, 3, 1],
# #     [1, 4, 6, 4, 1],
# #     [1, 5, 10, 10, 5, 1],
# #     [1, 6, 15, 20, 15, 6, 1]
# # ]

#PHASE 4: Nauseating

# mersenne_prime
# A "Mersenne prime" is a prime number that is one less than a power of 2. 
# This means that it is a prime number with the form 2^x - 1, where x is some exponent. 
# For example:

# 3 is a Mersenne prime because it is prime and 3 = 2^2 - 1
# 7 is a Mersenne prime because it is prime and 7 = 2^3 - 1
# 11 is not a Mersenne prime because although it is prime, it does not have the form 2^x - 1
# The first three Mersenne primes are 3, 7, and 31. 
# Write a method mersenne_prime that accepts a number, n, as an argument 
# and returns the n-th Mersenne prime.

def mersenne_prime(n)
    mersenne = 0
    exp = 1
    until n <= 0
        exp += 1
        if prime?(2 ** exp - 1)
            mersenne = 2 ** exp - 1
            n -= 1
        end
    end
    mersenne
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

# p mersenne_prime(1) # 3
# p mersenne_prime(2) # 7
# p mersenne_prime(3) # 31
# p mersenne_prime(4) # 127
# p mersenne_prime(6) # 131071

# triangular_word?
# A triangular number is a number of the form (i * (i + 1)) / 2 
# where i is some positive integer. 
# Substituting i with increasing integers gives the triangular number sequence. 
# The first five numbers of the triangular number sequence are 1, 3, 6, 10, 15. 
# Below is a breakdown of the calculations used to obtain these numbers:

# i	(i * (i + 1)) / 2
# 1	1
# 2	3
# 3	6
# 4	10
# 5	15

# We can encode a word as a number by taking the sum of its letters based on their position 
# in the alphabet. 
# For example, we can encode "cat" as 24 because c is the 3rd of the alphabet, 
# a is the 1st, and t is the 20th:

# 3 + 1 + 20 = 24

# Write a method triangular_word? 
# that accepts a word as an argument and returns a boolean 
# indicating whether or not that word's number encoding is a triangular number. 
# You can assume that the argument contains lowercase letters.

def triangular_word?(word)
    code = word.sum
    if triangular?(code)
        return true
    end
    false
end

class String
    def sum
        val = 1
        al = 'abcdefghijklmnopqrstuvwxyz'
        coder = Hash.new(0)
        al.each_char do |c|
            coder[c] = val
            val += 1
        end
        sum = 0
        self.each_char do |c|
            sum += coder[c]
        end
        sum
    end
end

def triangular?(num)
    (1..num).each do |i|
        if (i*(i+1))/2 == num
            return true
        end
    end
    false
end

# Examples

# p triangular_word?('abc')       # true
# p triangular_word?('ba')        # true
# p triangular_word?('lovely')    # true
# p triangular_word?('question')  # true
# p triangular_word?('aa')        # false
# p triangular_word?('cd')        # false
# p triangular_word?('cat')       # false
# p triangular_word?('sink')      # false

# consecutive_collapse
# Write a method consecutive_collapse that accepts an array of numbers as an argument. 
# The method should return a new array that results from 
# continuously removing consecutive numbers that are adjacent in the array. 
# If multiple adjacent pairs are consecutive numbers, remove the leftmost pair first. 
# For example:

# [3, 4, 1] -> [1]
# because 3 and 4 are consecutive and adjacent numbers, so we can remove them
# [1, 4, 3, 7] -> [1, 7]
# because 4 and 3 are consecutive and adjacent numbers, so we can remove them
# [3, 4, 5] -> [5]
# because 4 and 3 are consecutive and adjacent numbers, we don't target 4 and 5 since we should prefer to remove the leftmost pair
# We can apply this rule repeatedly until we cannot collapse the array any further:

# # example 1
# [9, 8, 4, 5, 6] -> [4, 5, 6] -> [6]

# # example 2
# [3, 5, 6, 2, 1] -> [3, 2, 1] -> [1]

def consecutive_collapse(nums)
    if nums.length == 1
        return nums
    end
    new_nums = []
    sequence = 0
    nums.each_index do |i|
        #debugger
        if !nums[i + 1].nil? && (nums[i] - nums[i + 1] == 1 || nums[i] - nums[i + 1] == -1)  && sequence == 0
            sequence += 1
        else
            if sequence == 1
                sequence += 1
                next
            end
            new_nums << nums[i]
        end
    end
    return consecutive_collapse(new_nums) if new_nums != nums
    nums
end

# Code examples

# p consecutive_collapse([3, 4, 1])                     # [1]
# p consecutive_collapse([1, 4, 3, 7])                  # [1, 7]
# p consecutive_collapse([9, 8, 2])                     # [2]
# p consecutive_collapse([9, 8, 4, 5, 6])               # [6]
# p consecutive_collapse([1, 9, 8, 6, 4, 5, 7, 9, 2])   # [1, 9, 2]
# p consecutive_collapse([3, 5, 6, 2, 1])               # [1]
# p consecutive_collapse([5, 7, 9, 9])                  # [5, 7, 9, 9]
# p consecutive_collapse([13, 11, 12, 12])              # []

# pretentious_primes
# Write a method pretentious_primes that takes accepts an array and a number, n, as arguments. The method should return a new array where each element of the original array is replaced according to the following rules:

# when the number argument is positive, 
#     replace an element with the n-th nearest prime number that is greater than the element
# when the number argument is negative, 
#     replace an element with the n-th nearest prime number that is less than the element
# For example:

# if element = 7 and n = 1, 
#     then the new element should be 11 because 11 is the nearest prime greater than 7
# if the element = 7 and n = 2, 
#     then the new element should be 13 because 13 is the 2nd nearest prime greater than 7
# if the element = 7 and n = -1, 
#     then the new element should be 5 because 5 is the nearest prime less than 7
# if the element = 7 and n = -2, 
#     then the new element should be 3 because 3 is the 2nd nearest prime less than 7
# Note that we will always be able to find a prime that is greater than a given number 
# because there are an infinite number of primes (this is given by Euclid's Theorem). 
# However, we may be unable to find a prime that is smaller than a given number, 
# because 2 is the smallest prime. When a smaller prime cannot be calculated, 
# replace the element with nil.

def pretentious_primes(nums, n)
    if n > 0
        nums.each_with_index do |num, i|
            nums[i] = next_prime(num, n)
        end
    elsif n < 0
        nums.each_with_index do |num, i|
            nums[i] = back_prime(num, n)
        end
    else n == 0
        return nil
    end
    nums
end

def next_prime(n, i)
    until i == 0
        n += 1
        until prime?(n)
            n += 1
        end
        i -= 1
    end
    n
end

def back_prime(n, i)
    until i == 0
        n -= 1
        until prime?(n)
            n -= 1
        end
        i += 1
        return nil if n < 2 && i <= 0
    end
    n
end

# Examples

p pretentious_primes([4, 15, 7], 1)            #[5, 17, 11]
p pretentious_primes([4, 15, 7], 2)            #[7, 19, 13]
p pretentious_primes([12, 11, 14, 15, 7], 1)   #[13, 13, 17, 17, 11]
p pretentious_primes([12, 11, 14, 15, 7], 3)   #[19, 19, 23, 23, 17]
p pretentious_primes([4, 15, 7], -1)           #[3, 13, 5]
p pretentious_primes([4, 15, 7], -2)           #[2, 11, 3]
p pretentious_primes([2, 11, 21], -1)          #[nil, 7, 19]
p pretentious_primes([32, 5, 11], -3)          #[23, nil, 3]
p pretentious_primes([32, 5, 11], -4)          #[19, nil, 2]
p pretentious_primes([32, 5, 11], -5)          #[17, nil, nil]