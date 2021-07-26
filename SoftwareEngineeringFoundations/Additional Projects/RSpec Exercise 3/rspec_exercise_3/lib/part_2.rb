require 'byebug'

def element_count(arr)
    arr.inject(Hash.new(0)) {|h, e| h[e] += 1; h}
end

def char_replace!(str, hash)
    str.each_char.with_index {|c, i| str[i] = hash[c] if hash.keys.include?(c)}
    str
end

def product_inject(nums)
    nums.inject {|pr, n| pr * n}
end