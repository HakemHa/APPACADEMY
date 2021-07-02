require "byebug"

def select_even_nums(arr)
    arr.select(&:even?)
end

def even(n)
    n % 2 == 0 
end

def reject_puppies(arr)
    arr.reject {|hash| hash["age"] <= 2}
end

def count_positive_subarrays(arr)
    arr.count {|eles| eles.sum > 0}
end

def aba_translate(str)
    aba = ''
    str.each_char do |char|
        if 'aeiou'.include?(char)
            aba += char + 'b' + char
        else
            aba += char
        end
    end
    aba
end

def aba_array(arr)
    arr.map {|word| aba_translate(word)}
end