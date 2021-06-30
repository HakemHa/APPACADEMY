# Write a method, compress_str(str), that accepts a string as an arg.
# The method should return a new str where streaks of consecutive characters are compressed.
# For example "aaabbc" is compressed to "3a2bc".

def compress_str(str)
    compressed = ''
    (0...str.length - 1).each do |i|
        if i > 0 && compressed[-2].to_i >= 2 && str[i] == str[i - 1] 
            next
        elsif str[i] == str[i + 1] 
            repeat = true 
            count = 2
            while repeat
                if i + count < str.length 
                    if str[i] == str[i + count] 
                        count += 1 
                    else
                        repeat = false
                    end
                else
                    break
                end
            end
            compressed += count.to_s + str[i]
        else
            compressed += str[i]
        end
    end
    if str[-1] != str[-2]
        compressed += str[-1]
    end
    compressed
end

p compress_str("aaabbc")        # => "3a2bc"
p compress_str("xxyyyyzz")      # => "2x4y2z"
p compress_str("qqqqq")         # => "5q"
p compress_str("mississippi")   # => "mi2si2si2pi"
