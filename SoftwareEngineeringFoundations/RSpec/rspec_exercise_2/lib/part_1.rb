def partition(array, num)
    less = []
    more = []
    partition = [less, more]
    array.each do |ele|
        if ele < num
            less << ele
        else
            more << ele
        end
    end
    partition
end

def merge(hash1, hash2)
    merged = Hash.new()
    hash1.each { |k, v| merged[k] = v}
    hash2.each { |k, v| merged[k] = v}
    merged
end

def censor(sentence, curses)
    (
        sentence.split(" ").map do |word|
            if curses.include?(word.downcase)
                word.each_char.with_index do |char, i|
                    if 'aeiou'.include?(char.downcase)
                        word[i] = '*'
                    end
                end
                word
            else
                word
            end
        end
    ).join(" ")
end

def power_of_two?(n)
    while n % 2 == 0 && n != 0
        n = n / 2
    end
    if n == 1
        return true
    else
        return false
    end
end 