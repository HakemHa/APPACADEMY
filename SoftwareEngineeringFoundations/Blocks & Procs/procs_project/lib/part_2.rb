require "byebug"

def reverser(str, &prc)
    prc.call(str.reverse)
end

def word_changer(str, &prc)
    str.split(" ").map { |word| prc.call(word)}.join(" ")
end

def greater_proc_value(num, *prcs)
    val1 = prcs[0].call(num)
    val2 = prcs[1].call(num)
    [val1, val2].max
end

def and_selector(arr, *prcs)
    arr.select {|ele| prcs[0].call(ele) && prcs[1].call(ele)}
end

def alternating_mapper(arr, *prcs)
    arr.map.with_index {|ele, i| if i % 2 == 0 then prcs[0].call(ele) else prcs[1].call(ele) end}
end