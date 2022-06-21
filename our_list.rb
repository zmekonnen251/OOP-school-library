require_relative 'our_enumerable'

class List
  include Enumerable
  def initialize(*items)
    @items = items
  end

  def each
    @items.length.times { |i| yield @items[i] }
  end
end

# Create our list

my_list = List.new(1, 4, 6, 9, -2, 14, 3, 4)
puts(my_list)
# <MyList: @list=[1, 4, 6,9,-2,14, 3, 4]>

# Test #all?
puts(my_list.all? { |e| e < 5 })
# => false

puts(my_list.all? { |e| e > 5 })
# => false

puts(my_list.all? { |e| e > -3 })
# => true

# Test #any?
puts(my_list.any? { |e| e == -2 })
# => true
puts(my_list.any? { |e| e == 5 })
# => false

# Test #max
puts(my_list.max)
# => 14

# Test #min
puts(my_list.min)
# => -2

# Test #sort
print(my_list.sort)
# => [-2, 1, 3, 4, 4, 6, 9, 14]

puts ''

# Test #filter
print(my_list.filter(&:even?))
puts ''
# => [4, 6, -2, 14, 4]
