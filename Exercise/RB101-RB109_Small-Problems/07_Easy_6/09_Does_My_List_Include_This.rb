# Write a method named include? that takes an Array and a search value as 
# arguments. This method should return true if the search value is in the 
# array, false if it is not. You may not use the Array#include? method in your 
# solution.

#### ANSWER

# classical:

def include?(arr, val)
  arr.each do |i|
    return true if i == val
  end
  false
end

# counting occurrences of val

def include?(arr, val)
  arr.count(val) >= 1
end

puts include?([1,2,3,4,5], 3) == true
puts include?([1,2,3,4,5], 6) == false
puts include?([], 3) == false
puts include?([nil], nil) == true
puts include?([], nil) == false


#### SOLUTION

def include?(array, value)
  !!array.find_index(value)
end

# The first method uses Array#find_index to scan the array for the first 
# element that has the specified value. find_index returns the index number of 
# the found element, which will always have a truthy value, or nil if no such 
# element is present. We then use !! to force the return value to true or false 
# in accordance with the implied promise of the ? in include?.


#### fro mother users

def include?(array, value)
  array.any?(value)
end
