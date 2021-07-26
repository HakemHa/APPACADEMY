require 'byebug'

def sum_to(n)
    return n if n == 1 || n == -1 || n == 0
    return n + sum_to(n - 1) if n > 0
    return n + sum_to(n + 1) if n < 0 
end

def add_numbers(nums_array)
    return nums_array.first if nums_array.length <= 1
    nums_array.first + add_numbers(nums_array[1..-1])
end

def gamma_fnc(n)
    factorial(n - 1)
end

def factorial(n)
    return 1 if n == 1 || n == 0
    return nil if n < 0
    n * factorial(n - 1)
end

def ice_cream_shop(flavors, favorite)
    return false if flavors.length <= 0
    return true if flavors[0] == favorite
    ice_cream_shop(flavors[1..-1], favorite)
end

def reverse(string)
    return string if string.length <= 1
    reverse(string[1..-1]) + string[0]
end
