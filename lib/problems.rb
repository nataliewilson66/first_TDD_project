def my_uniq(array)
  uniq_arr = []
  array.each do |elem|
    uniq_arr << elem if !uniq_arr.include?(elem)
  end
  uniq_arr
end

class Array

  def two_sum
    len = self.length
    sum_arr = []
    (0...len - 1).each do |idx1|
      (idx1 + 1...len).each do |idx2|
        elem1, elem2 = self[idx1], self[idx2]
        sum_arr << [idx1, idx2] if elem1 + elem2 == 0
      end
    end
    sum_arr.sort_by { |pair| [pair[0], pair[1]] }
  end

end

def my_transpose(array)
  len = array.length
  trans_arr = Array.new(len) { Array.new }
  (0...len).each do |col|
    (0...len).each do |row|
      trans_arr[col] << array[row][col]
    end
  end
  trans_arr
end

def stock_picker(array)
  len = array.length
  profitable_pair = [0, 1]
  (0...len - 1).each do |idx1|
    (idx1 + 1...len).each do |idx2|
      curr_x, curr_y = profitable_pair
      curr_profit = array[curr_y] - array[curr_x]
      profitable_pair = [idx1, idx2] if array[idx2] - array[idx1] > curr_profit
    end
  end
  profitable_pair
end

class TowerOfHanoi

  attr_reader :towers, :num_discs

  def initialize(num_towers, num_discs)
    @towers = Array.new(num_towers) { Array.new }
    @num_discs = num_discs
    fill_towers(num_discs)
  end

  def fill_towers(num_discs)
    (1..num_discs).each { |n| @towers[0].unshift(n) }
  end

  def valid_pos?(idx)
    return true if idx >= 0 && idx < towers.length
    false
  end

  def move(idx1, idx2)
    if !(valid_pos?(idx1) && valid_pos?(idx2))
      raise "invalid position"
    elsif towers[idx1].empty?
      raise "invalid move"
    elsif !towers[idx2].empty? && towers[idx1][-1] > towers[idx2][-1]
      raise "invalid move"
    end
    disc = towers[idx1].pop
    towers[idx2].push(disc)
    towers
  end

  def won?
    count = 0
    towers[0...-1].each do |stack|
      count += 1 if stack.empty?
    end
    return true if towers[-1].length == num_discs && count == towers.length - 1
    false
  end

end