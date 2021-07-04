# Write a method, least_common_multiple, that takes in two numbers and returns the smallest number that is a mutiple
# of both of the given numbers
require 'byebug'
def least_common_multiple(num_1, num_2)
    #debugger
    multiples_2 = Hash.new(0)
    multiples_1 = Hash.new(0)
    factors(num_2).each {|n| multiples_2[n] += 1}
    factors(num_1).each {|n| multiples_1[n] += 1}
    multiples_2.each {|k, v| multiples_1[k] = multiples_2[k] if multiples_2[k] > multiples_1[k]}
    return multiples_1.keys.inject(1) {|lcm, k| lcm *= multiples_1[k] * k} 
    

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

# Write a method, most_frequent_bigram, that takes in a string and returns the two adjacent letters that appear the
# most in the string.
def most_frequent_bigram(str)
    #debugger
    appearances = Hash.new(0)
    bigram = []
    (0...str.length - 1).each {|i| bigram << str[i] + str[i + 1]}
    bigram.each {|bi| appearances[bi] += 1}
    max = ''
    appearances.each_key {|k| max = k if appearances[k] > appearances[max]}
    max
end


class Hash
    # Write a method, Hash#inverse, that returns a new hash where the key-value pairs are swapped
    def inverse
        inv = Hash.new
        self.each {|k, v| inv[v] = k}
        inv
    end
end


class Array
    # Write a method, Array#pair_sum_count, that takes in a target number returns the number of pairs of elements that sum to the given target
    def pair_sum_count(num)
        pairs = 0
        (0...self.length).each do |idx1|
            (idx1...self.length).each do |idx2|
                pairs += 1 if self[idx1] + self[idx2] == num
            end
        end
        pairs
    end

    # Write a method, Array#bubble_sort, that takes in an optional proc argument.
    # When given a proc, the method should sort the array according to the proc.
    # When no proc is given, the method should sort the array in increasing order.
    #
    # Sorting algorithms like bubble_sort, commonly accept a block. That block accepts
    # two parameters, which represents the two elements in the array being compared.
    # If the block returns 1, it means that the second element passed to the block
    # should go before the first (i.e. switch the elements). If the block returns -1,
    # it means the first element passed to the block should go before the second
    # (i.e. do not switch them). If the block returns 0 it implies that
    # it does not matter which element goes first (i.e. do nothing).
    #
    # This should remind you of the spaceship operator! Convenient :)
    def bubble_sort(&prc)
        prc ||= Proc.new {|i, j| i <=> j}
        sorted = false
        until sorted
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
