=begin

Write a method that takes one argument, an array containing integers,
and returns the average of all numbers in the array. The array will
never be empty and the numbers will always be positive integers. Your
result should also be an integer.

Examples:

puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40

The tests above should print true.

::::::::::::::::: PEDAC

input: array of positive integers
output: integer (result of integer division)

data structure:
- the given array

algorithm (with fancy method `sum`):
- given an array
- return the sum of the elements of the array divided by array-size

def average(arr)
  arr.sum / arr.size
end

algorithm (step by step):
- given an array
- initialize `tot` equal to zero 
- iterate the array incrementing `tot` with each array's element
- return `tot` divided by array size

=end

def average(arr)
  tot = 0
  arr.each { |el| tot += el }
  tot / arr.size
end

puts average([1, 6]) == 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40
