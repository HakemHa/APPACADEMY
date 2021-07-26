# Hash Cheat Sheet

hash = { "name" => "App Academy", "color" => "red" }

p hash["color"]  # prints "red"
p hash["age"]    # prints nil

k = "color"
p hash[k]        # prints "red"

hash["age"] = 5
p hash           # prints {"name"=>"App Academy", "color"=>"red", "age"=>5}

hash = { "name" => "App Academy", "color" => "red" }

p hash["color"]  # prints "red"
p hash["age"]    # prints nil

k = "color"
p hash[k]        # prints "red"

hash["age"] = 5
p hash           # prints {"name"=>"App Academy", "color"=>"red", "age"=>5}

hash = { "name" => "App Academy", "color" => "red" }

hash.each { |key, val| p key + ', ' + val} # prints
# "name, App Academy"
# "color, red"

hash.each_key { |key| p key } # prints
# "name"
# "color"

hash.each_value { |val| p val } # prints
# "App Academy"
# "red"

plain_hash = { }
plain_hash["city"] = "SF"
p plain_hash["city"]    # prints "SF"
p plain_hash["country"] # prints nil

hash_with_default = Hash.new("???")
hash_with_default["city"] = "NYC"
p hash_with_default["city"]    # prints "NYC"
p hash_with_default["country"] # prints "???"

#Get Double Age

def get_double_age(hash)
  return hash["age"] * 2
end

puts get_double_age({"name"=>"App Academy", "age"=>5}) # => 10
puts get_double_age({"name"=>"Ruby", "age"=>23})       # => 46

#Get Full Name

def get_full_name(hash)
  return hash["first"] + " " + hash["last"] + ", the " + hash["title"]
end

hash1 = {"first"=>"Michael", "last"=>"Jordan", "title"=> "GOAT"}
puts get_full_name(hash1) # => "Michael Jordan, the GOAT"

hash2 = {"first"=>"Fido", "last"=>"McDog", "title"=> "Loyal"}
puts get_full_name(hash2) # => "Fido McDog, the Loyal"

#Word Lengths

def word_lengths(sentence)
  newHash = Hash.new(0)
  sentence.split(" ").each { |word| word.each_char {newHash[word] += 1}}
  return newHash
end

puts word_lengths("this is fun") #=> {"this"=>4, "is"=>2, "fun"=>3}
puts word_lengths("When in doubt, leave it out") #=> {"When"=>4, "in"=>2, "doubt,"=>6, "leave"=>5, "it"=>2, "out"=>3}

#Retrieve Values

def retrieve_values(hash1, hash2, key)
  return [hash1[key], hash2[key]]
end


dog1 = {"name"=>"Fido", "color"=>"brown"}
dog2 = {"name"=>"Spot", "color"=> "white"}
print retrieve_values(dog1, dog2, "name") #=> ["Fido", "Spot"]
puts
print retrieve_values(dog1, dog2, "color") #=> ["brown", "white"]
puts

#Cat Builder

def cat_builder(name_str, color_str, age_num)
  return {
    "name" => name_str,
    "color" => color_str,
    "age" => age_num
  }
end

print cat_builder("Whiskers", "orange", 3) #=> {"name"=>"Whiskers", "color"=>"orange", "age"=>3}
puts

print cat_builder("Salem", "black", 100) #=> {"name"=>"Salem", "color"=>"black", "age"=>100}
puts

#Ae Count

def ae_count(str)
  ae = 'ae'
  newHash = {'a'=>0, 'e'=>0}
  str.each_char do |char|
    if ae.include?(char)
      newHash[char] += 1
    end
  end
  return newHash
end

puts ae_count("everyone can program") #=> {"a"=>2, "e"=>3}
puts ae_count("keyboard") #=> {"a"=>1, "e"=>1}

#Element Count

def element_count(arr)
  newHash = Hash.new(0)
  arr.each {|ele| newHash[ele] += 1}
  return newHash
end

puts element_count(["a", "b", "a", "a", "b"]) #=> {"a"=>3, "b"=>2}
puts element_count(["red", "red", "blue", "green"]) #=> {"red"=>2, "blue"=>1, "green"=>1}

#Select Upcase Keys

def select_upcase_keys(hash)
  newHash = Hash.new()
  hash.each_key do |key|
    if key == key.upcase
      newHash[key] = hash[key]
    end
  end
  return newHash
end

print select_upcase_keys({"make"=> "Tesla", "MODEL"=> "S", "Year"=> 2018, "SEATS"=> 4}) # => {"MODEL"=>"S", "SEATS"=>4}
puts

print select_upcase_keys({"DATE"=>"July 4th","holiday"=> "Independence Day", "type"=>"Federal"}) # => {"DATE"=>"July 4th"}
puts

#Hand Scores

def hand_score(hand)
  points = {
    "A"=>4,
    "K"=>3,
    "Q"=>2,
    "J"=>1
  }

  score = 0
  hand.each_char { |char| score += points[char.upcase] }
  return score
end

puts hand_score("AQAJ") #=> 11
puts hand_score("jJka") #=> 9

#Frequent Letters

def frequent_letters(string)
  letters = Hash.new(0)
  string.each_char {|char| letters[char] += 1}
  frequentLetters = []
  letters.each {|key, val| if val > 2 then frequentLetters << key end}
  return frequentLetters
end

print frequent_letters('mississippi') #=> ["i", "s"]
puts
print frequent_letters('bootcamp') #=> []
puts

#Hash To Pairs

def hash_to_pairs(hash)
  twoDarray = []
  hash.each {|k, v|twoDarray << [k, v]}
  return twoDarray
end


print hash_to_pairs({"name"=>"skateboard", "wheels"=>4, "weight"=>"7.5 lbs"}) #=> [["name", "skateboard"], ["wheels", 4], ["weight", "7.5 lbs"]]
puts


print hash_to_pairs({"kingdom"=>"animalia", "genus"=>"canis", "breed"=>"German Shepherd"}) #=> [["kingdom", "animalia"], ["genus", "canis"], ["breed", "German Shepherd"]]
puts

#Unique Elements

# Hint: all keys of a hash are automatically unique

def unique_elements(arr)
  unique = Hash.new()
  arr.each {|ele| unique[ele] = 0}
  output = []
  unique.each_key {|key| output << key}
  return output
end

print unique_elements(['a', 'b', 'a', 'a', 'b', 'c']) #=> ["a", "b", "c"]
puts

#Element Replace

def element_replace(arr, hash)
  hash.each do |k, v|
    arr.each.with_index do |ele, idx|
      if k == ele
        arr[idx] = v
      end
    end
  end
  return arr
end

arr1 = ["LeBron James", "Lionel Messi", "Serena Williams"]
hash1 = {"Serena Williams"=>"tennis", "LeBron James"=>"basketball"}
print element_replace(arr1, hash1) # => ["basketball", "Lionel Messi", "tennis"]
puts

arr2 = ["dog", "cat", "mouse"]
hash2 = {"dog"=>"bork", "cat"=>"meow", "duck"=>"quack"}
print element_replace(arr2, hash2) # => ["bork", "meow", "mouse"]
puts
