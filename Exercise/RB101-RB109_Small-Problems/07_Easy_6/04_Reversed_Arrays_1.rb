# Write a method that takes an Array as an argument, and reverses its elements in 
# place; 
# that is, mutate the Array passed into this method. The return value should be the 
# same 
# Array object.
# 
# You may not use Array#reverse or Array#reverse!.
# 
# Examples:
# 
# list = [1,2,3,4]
# result = reverse!(list)
# result == [4, 3, 2, 1] # true
# list == [4, 3, 2, 1] # true
# list.object_id == result.object_id # true
# 
# list = %w(a b e d c)
# reverse!(list) == ["c", "d", "e", "b", "a"] # true
# list == ["c", "d", "e", "b", "a"] # true
# 
# list = ['abc']
# reverse!(list) == ["abc"] # true
# list == ["abc"] # true
# 
# list = []
# reverse!(list) == [] # true
# list == [] # true
# 
# Note: for the test case list = ['abc'], we want to reverse the elements in the array. 
# The array only has one element, a String, but we're not reversing the String itself, so 
# the reverse! method call should return ['abc'].

#### ANSWER

def reverse!(arr)
  arr_clone = arr.clone
  arr_clone.each { |i| arr.unshift(i) }
  arr_clone.size.times { arr.pop }
  arr
end

list = [1,2,3,4]
result = reverse!(list)
puts result == [4, 3, 2, 1] # true
puts list == [4, 3, 2, 1] # true
puts list.object_id == result.object_id # true

list = %w(a b e d c)
puts reverse!(list) == ["c", "d", "e", "b", "a"] # true
puts list == ["c", "d", "e", "b", "a"] # true

list = ['abc']
puts reverse!(list) == ["abc"] # true
puts list == ["abc"] # true

list = []
puts reverse!(list) == [] # true
puts list == [] # true


#### SOLUTION

# Swapping elements starting from external index moving to middle array:

def reverse!(array)
  left_index = 0
  right_index = -1

  while left_index < array.size / 2
    array[left_index], array[right_index] = array[right_index], array[left_index]
    left_index += 1
    right_index -= 1
  end

  array
end


#### from user CANDY

# Delete element at idx -2 and add it at the end of array:

def reverse!(list)
  index = -2

  loop do 
    break if index < -list.length 
    list << list.delete_at(index)
    index -= 1
  end

  list
end


#### from user PIERRE-EMMANUEL ROUSSEL

# First elem = last elem of clone arr... then 2nd elem = to elem at idx -2...

def reverse!(array)
  copy, n = array.clone, array.size - 1
  (0..n).map{ |i| array[i] = copy[n - i] }
  array
end
