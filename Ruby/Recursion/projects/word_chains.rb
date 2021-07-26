require 'set'
require 'byebug'

class String
    def similar(word)
        return false if word.length != self.length
        discrepancies = 0
        self.length.times {|i| discrepancies += 1 if word[i] != self[i]}
        discrepancies == 1 ? true : false
    end
end

class WordChainer
    def initialize(dictionary_file_name)
        words_file = File.open(dictionary_file_name)
        words = words_file.read.split("\n")
        @dictionary = Set.new
        words.each do |word|
            @dictionary.add(word)
        end
        @current_words = Set.new
        @all_seen_words = Hash.new
    end
    def adjacent_words(word)
        words = Set.new
        @dictionary.each do |word_from_dict|
            words.add(word_from_dict) if word.similar(word_from_dict)
        end
        words
    end
    def run(source, target)
        if source.length != target.length
            return []
        end
        @all_seen_words[source] = nil
        adjacent_words(source).each do |word|
            @current_words.add(word) unless @all_seen_words.include?(word)
            @all_seen_words[word] = source
        end
        until @current_words.length == 0 || @all_seen_words.include?(target)
            new_current_words = Set.new
            @current_words.each do |current_word|
                new_current_words += explore_current_words(current_word)
            end
            @current_words = new_current_words
        end
        build_path(target) + [source]
    end
    def explore_current_words(current_word)
        words = Set.new
        adjacent_words(current_word).each do |new_word|
            unless @all_seen_words.include?(new_word)
                words.add(new_word)
                @all_seen_words[new_word] = current_word
            end
        end
        words
    end
    def build_path(target)
        path = [target]
        if @all_seen_words[target].nil?
            return []
        end
        origin = @all_seen_words[target]
        path += build_path(origin)
    end
end