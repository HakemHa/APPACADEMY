require 'byebug'

def greedy_make_change(amount, coins = [25, 10, 5, 1])
    if coins.length >= 1
        if amount - coins[0] >= 0
            return [coins[0]] + greedy_make_change(amount - coins[0], coins)
        else
            greedy_make_change(amount, coins[1..-1])
        end
    else
        return []
    end
end

def make_better_change(amount, coins = [25, 10, 5, 1])
    change = []
    coins.each_with_index do |coin, i|
        temp_change = []
        if amount - coin >= 0
            temp_change = [coin] + make_better_change(amount - coin, coins[i..-1]) 
        elsif amount != 0
            temp_change = make_better_change(amount, coins[(i + 1)..-1])
        end
        change = temp_change if temp_change.length < change.length || change.length == 0
    end
    change
end
p make_better_change(11027, [10, 7, 1])