# Write a method that takes an Array, and returns a new Array with the elements 
# of the 
# original list in reverse order. Do not modify the original list
# 
# You may not use Array#reverse or Array#reverse!, nor may you use the method 
# you wrote 
# in the previous exercise.
# 
# Examples:
# 
# reverse([1,2,3,4]) == [4,3,2,1]          # => true
# reverse(%w(a b e d c)) == %w(c d e b a)  # => true
# reverse(['abc']) == ['abc']              # => true
# reverse([]) == []                        # => true
# 
# list = [1, 3, 2]                      # => [1, 3, 2]
# new_list = reverse(list)              # => [2, 3, 1]
# list.object_id != new_list.object_id  # => true
# list == [1, 3, 2]                     # => true
# new_list == [2, 3, 1]                 # => true

#### ANSWER

def reverse(arr)
  new_arr = []
  arr.each { |i| new_arr.unshift(i) }
  new_arr
end

puts reverse([1,2,3,4]) == [4,3,2,1]          # => true
puts reverse(%w(a b e d c)) == %w(c d e b a)  # => true
puts reverse(['abc']) == ['abc']              # => true
puts reverse([]) == []                        # => true

list = [1, 3, 2]                      # => [1, 3, 2]
new_list = reverse(list)              # => [2, 3, 1]
puts list.object_id != new_list.object_id  # => true
puts list == [1, 3, 2]                     # => true
puts new_list == [2, 3, 1]                 # => true


#### SOLUTION

# using #reverse_each

def reverse(array)
  result_array = []
  array.reverse_each { |element| result_array << element }
  result_array
end


#### FURTHER EXPLORATION

def reverse(arr)
  arr.each_with_object([]) { |i, new_arr| new_arr.unshift(i) }
end
