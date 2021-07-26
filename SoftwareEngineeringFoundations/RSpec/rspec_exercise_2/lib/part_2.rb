def palindrome?(str)
    palindrome = ""
    (0...str.length).each do |i|
        palindrome += str[str.length - (i + 1)]
    end
    palindrome == str
end

def substrings(str)
    subStrings = []
    str.each_char.with_index do |char, i|
        subStrings << char
        idx = i + 1
        sub = char
        while !str[idx].nil?
            sub += str[idx]
            subStrings << sub
            idx += 1 
        end
    end
    subStrings
end

def palindrome_substrings(str)
    subs = substrings(str)
    subs.select do |ele|
        palindrome?(ele) && ele.length > 1
    end
end