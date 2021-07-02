# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span
    if self.length == 0
        return nil
    end
    self.max - self.min
  end

  def average
    if self.length == 0
        return nil
    end
    self.sum / self.length.to_f
  end

  def median
    if self.length % 2 != 0
        self.sort[self.length / 2]
    elsif self.length != 0
        [self.sort[self.length/2 - 1], self.sort[self.length/2]].average
    else
        return nil
    end
  end

  def counts
    count = Hash.new(0)
    self.each {|ele| count[ele] += 1}
    count
  end

  def my_count(ele)
    self.counts[ele]
  end

  def my_index(ele)
    index = 0
    self.each {|el| if el == ele then return index else index += 1 end}
    nil
  end

  def my_uniq
    self.select.with_index {|ele, i| i == self.my_index(ele)}
  end

  def my_transpose
    transpose = []
    self.length.times {transpose << []}
    self.each_index do |i|
        self[i].each_index do |j|
            transpose[i][j] = self[j][i]
        end
    end
    transpose
  end
end
