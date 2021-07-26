def proper_factors(n)
    (1...n).inject([]) {|f, v| if n % v == 0 then f << v else f  end}
end

def aliquot_sum(n)
    proper_factors(n).sum
end

def perfect_number?(n)
    n == aliquot_sum(n)
end

def ideal_numbers(n)
    pn = []
    i = 2
    until n == 0
       if perfect_number?(i)
        n -= 1
        pn << i
       end
       i += 1 
    end
    pn
end