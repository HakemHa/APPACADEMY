# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.
require "byebug"

def largest_prime_factor(num)
    divisors = []
    (1..num).select do |n|
        if num % n == 0
            divisors << n
        end
    end
    divisors.reverse.each do |n|
        if prime?(n)
            return n
        end
    end
end

def prime?(n)
    if n < 2
       return false
    end
       (2...n).each do |i|
       if n % i == 0
           return false
       end
    end
    true
   end

def unique_chars?(str)
    letters = Hash.new(0)
    str.each_char { |c| letters[c] += 1}
    letters.each_value { |v| return false if v > 1}
    true
end

def dupe_indices(arr)
    dupes = Hash.new([])
    arr.each_index do |i|
        repeats = 0
        if dupes[arr[i]].length == 0
            arr.each_index do |idx|
                if idx > i 
                    if arr[i] == arr[idx]
                        #debugger
                        dupes[arr[i]] += [idx]
                        if dupes[arr[i]][0] != i
                            dupes[arr[i]] = dupes[arr[i]].unshift(i)
                        end
                    end
                end
            end
        end
    end
    dupes
end
def ana_array(arr1, arr2)
    compare1 = Hash.new(0)
    compare2 = Hash.new(0)
    arr1.each { |ele| compare1[ele] += 1}
    arr2.each { |ele| compare2[ele] += 1}
    compare1 == compare2
end

