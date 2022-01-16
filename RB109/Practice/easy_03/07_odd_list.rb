=begin

Write a method that returns an Array that contains every other element
of an Array that is passed in as an argument. The values in the returned
list should be those values that are in the 1st, 3rd, 5th, and so on
elements of the argument Array.

Examples:

oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
oddities(['abc', 'def']) == ['abc']
oddities([123]) == [123]
oddities([]) == []

## PEDAC

input: array
output: array that contain only elements of the given array that are
        in odd positions (from index 0, index 2, and so on...)

data-structure: a second empty array might be used to store the requested
                elements from the given array

algorithm:
- given array `arr`
- set `new_arr`
- set `idx` equal 0
- loop
  - exit loop if `idx` is grater than `arr.size`
  - add arr[idx] to `new_arr`
  - increase `idx` by 2
- end loop
- return `new_arr`

=end

# def oddities(arr)
#   new_arr = []
#   idx = 0
#   while idx < arr.size
#     new_arr << arr[idx]
#     idx += 2
#   end
#   new_arr
# end

# with fancy loop

# def oddities(arr)
#   new_arr = []
#   arr.each_with_index { |el, idx| new_arr << el if idx.even? }
#   new_arr
# end

# with fancy method

# def oddities(arr)
#   arr.select.with_index { |el, idx| el if idx.even? }
# end

# puts oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
# puts oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
# puts oddities(['abc', 'def']) == ['abc']
# puts oddities([123]) == [123]
# puts oddities([]) == []

=begin
FURTHER EXPLORATION

Write a companion method that returns the 2nd, 4th, 6th, and so on elements of an array.
Try to solve this exercise in at least 2 additional ways.
=end

# def evenies(arr)
#   new_arr = []
#   idx = 1
#   while idx < arr.size
#     new_arr << arr[idx]
#     idx += 2
#   end
#   new_arr
# end

def evenies(arr)
  arr.select.with_index { |el, idx| el if idx.odd? }
end

puts evenies([2, 3, 4, 5, 6]) == [3, 5]
puts evenies([2, 2, 3, 4, 5, 6]) == [2, 4, 6]
puts evenies(['abc', 'def']) == ['def']
puts evenies([123]) == []
puts evenies([]) == []
