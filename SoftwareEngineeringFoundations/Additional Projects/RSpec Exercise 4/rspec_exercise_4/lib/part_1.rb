def my_reject(a, &p)
    a.select {|e| !p.call(e)}
end

def my_one?(a, &p)
    t = false
    a.each {|e| if p.call(e) && !t then t = !t elsif p.call(e) && t then t = !t end}
    t
end

def hash_select(h, &p)
    t = Hash.new
    h.each {|k, v| t[k] = v if p.call(k, v)}
    t
end

def xor_select(a, p_1, p_2)
    a.select {|e| (p_1.call(e) || p_2.call(e)) && !(p_1.call(e) && p_2.call(e))}
end

def proc_count(v, prcs)
    prcs.inject(0) {|c, prc| if prc.call(v) then c += 1 else c end}
end