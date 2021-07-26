require 'colorize'

class Tile
    attr_reader :val
    def initialize(val, given)
        @val = val
        @given = given
    end
    def to_s
        if given
            print val.colorize(:green)
        else
            print val.colorize(:blue)
        end
    end
    def to(new_val)
        unless "0123456789".include?(new_val)
            p "Invalid Argument"
            val = 0
        end
        unless given
            @val = new_val
            return true
        end
        puts "Can't change given value! (the green ones)" if given
        return false
    end

    def ==(other)
        @val == other
    end

    private

    attr_reader :given
end