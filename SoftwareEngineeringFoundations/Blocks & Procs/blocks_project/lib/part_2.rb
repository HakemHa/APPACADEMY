def all_words_capitalized?(arr)
    arr.all? {|word| word == word[0].upcase + word[1..-1].downcase}
end

def no_valid_url?(arr)
    arr.none? { |url| url[-4..-1].include?('.com') || url[-4..-1].include?('.net') || url[-4..-1].include?('.io') || url[-4..-1].include?('.org')}
end

def any_passing_students?(students)
    students.any? { |student| avg(student[:grades]) >= 75}
end

def avg(arr)
    arr.sum / arr.length
end
