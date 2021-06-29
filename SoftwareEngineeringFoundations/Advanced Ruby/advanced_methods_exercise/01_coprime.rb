# Write a method, coprime?(num_1, num_2), that accepts two numbers as args.
# The method should return true if the only common divisor between the two numbers is 1.
# The method should return false otherwise. For example coprime?(25, 12) is true because
# 1 is the only number that divides both 25 and 12.

def coprime?(num_1, num_2)
    div1 = factors(num_1) #[1,2,3]
    div2 = factors(num_2) #[1,3,5]
    commons = 0
    div1.each { |num1| div2.each { |num2| commons += 1 if num1 == num2}}
    return commons == 1
end

def factors(num)
    factors = [1]
    (2..num).each do |i|
      if num % i == 0 && prime?(i)
        factors << i
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
  

p coprime?(25, 12)    # => true
p coprime?(7, 11)     # => true
p coprime?(30, 9)     # => false
p coprime?(6, 24)     # => false
