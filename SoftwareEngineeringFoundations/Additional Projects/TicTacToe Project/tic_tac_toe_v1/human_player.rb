class HumanPlayer
    attr_reader :mark
    def initialize(m_v)
        @mark = m_v
    end
    def get_position
        puts "Player #{@mark} Enter a position row col:"
        print "Row: "
        begin
            row = gets.chomp.to_i
        rescue
            "Invalid input"
            self.get_position
        end
        puts
        print "Col: "
        begin
            col = gets.chomp.to_i
        rescue
            "Invalid Input"
            self.get_position
        end
        puts
        [row, col]
    end
end