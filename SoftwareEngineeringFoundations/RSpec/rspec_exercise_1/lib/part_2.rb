def hipsterfy(word)
    word.each_char.with_index do |char, i|
        if 'aeiou'.include?(word[word.length - (1 + i)])
            word[word.length - (1 + i)] = ""
            return word
        end
    end
    word
end

def vowel_counts(str)
    hash = Hash.new(0)
    str.each_char do |char|
        if 'aeiou'.include?(char.downcase)
            hash[char.downcase] += 1
        end
    end
    hash
end

def caesar_cipher(message, n)
    alphabet = 'abcdefghijklmnopqrstuvwxyz'
    message.each_char.with_index do |char, i|
        if alphabet.include?(char.downcase)
            idx = alphabet.index(char)
            n.times do
                idx += 1
            end
            char = alphabet[idx % alphabet.length]
            message[i] = char
        end
    end
    message
end