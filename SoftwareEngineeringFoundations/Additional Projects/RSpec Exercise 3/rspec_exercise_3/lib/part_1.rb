def is_prime?(num)
    if num < 2
        return false
    end
    (2...num).each {|i| return false if num % i == 0}
    true
end

def nth_prime(n)
    prime = 0
    i = 0
    until n == 0
        i += 1
        until is_prime?(i)
            i += 1
        end
        prime = i
        n -= 1
    end
    prime
end

def prime_range(min, max)
    range = []
    (min..max).each {|i| range << i if is_prime?(i)}
    range
end