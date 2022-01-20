=begin

Write a method that takes an Array of numbers, and returns an Array
with the same number of elements, and each element has the running
total from the original Array.

Examples:

running_total([2, 5, 13]) == [2, 7, 20]
running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
running_total([3]) == [3]
running_total([]) == []

## PEDAC

input: array of integers
mid section: add elements in a new array so that each element is the
             running total of the given array
output: new array of integers

data struct: new array

algorithm:
- given an array of integers 'numbers'
- set 'new_array' equal []
- set 'new_element' equal zero
- loop through the element
  - increase 'new_element' by the value of the current element of 'numbers'
  - add 'new_element' to 'new_array'
- end loop
- return 'new_array'

=end

# def running_total(numbers)
#   new_array = []
#   new_element = 0
#   numbers.each do |el|
#     new_element += el
#     new_array << new_element
#   end
#   new_array
# end

## shorter version

def running_total(numbers)
  new_element = 0
  numbers.map { |el| new_element += el }
end

puts running_total([2, 5, 13]) == [2, 7, 20]
puts running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
puts running_total([3]) == [3]
puts running_total([]) == []
