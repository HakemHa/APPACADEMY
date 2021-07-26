require 'byebug'

def zip(*arrs)
    td = Array.new(arrs[0].length) {|e| e = Array.new(arrs.length)}
    arrs.length.times do |i|
        td.length.times do |j|
            td[j][i] = arrs[i][j]
        end
    end
    td
end

def prizz_proc(a, p_1, p_2)
    a.select {|e| (p_1.call(e) || p_2.call(e)) && !(p_1.call(e) && p_2.call(e))}
end

def zany_zip(*arrs)
    max = maximum(arrs) {|arr| arr.length}
    td = Array.new(max.length) {|e| e = Array.new(arrs.length)}
    arrs.length.times do |i|
        td.length.times do |j|
            if !arrs[i][j].nil?
                td[j][i] = arrs[i][j]
            else
                td[j][i] = nil
            end
        end
    end
    td
end

def maximum(arr, &prc)
    if arr.empty?
        return nil
    end
    arr.inject {|max, e| max = e if prc.call(e) >= prc.call(max); max}
end

def my_group_by(arr, &prc)
    group = Hash.new([])
    arr.each do |e|
        group[prc.call(e)] += [e]
    end
    group
end

def max_tie_breaker(arr, prc, &blc)
    if arr.empty?
        return nil
    end
    arr.inject do |max, e| 
        if blc.call(e) > blc.call(max)
            max = e
        elsif blc.call(e) == blc.call(max)
            if prc.call(e) > prc.call(max)
                max = e
            else
                max
            end
        else
            max
        end
    end
end

def silly_syllables(sent)
    (sent.split(' ').map {|w| cut(w)}).join(' ')
end

def cut(word)
    first = -1
    last = -1
    word.split('').each_with_index do |c, i|
        if 'aeiou'.include?(c) && first == -1
            first = i
            last = i
        elsif 'aeiou'.include?(c) && first != -1
            last = i
        end
    end
    if first == last
        return word
    else
        return word[first..last]
    end
end