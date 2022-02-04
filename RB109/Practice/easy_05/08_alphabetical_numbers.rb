=begin

Write a method that takes an Array of Integers between 0 and 19, and returns
an Array of those Integers sorted based on the English words for each number:

zero, one, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve,
thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen

Examples:

alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]

## PEDAC

input: array of integers between 0 and 19
output: array

data struct:
- array with English string representing integers from 0 to 19

algorithm:
- given array 'ARR' as global with string representing integers from 0 to 19
- given an array of integers 'arr'
- use #sort_by to sort the position 'arr' compared to elements of 'ARR' 

=end

ARR =  ['zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight',
        'nine', 'ten', 'eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen',
        'sixteen', 'seventeen', 'eighteen', 'nineteen']

def alphabetic_number_sort(arr)
  arr.sort_by { |num| ARR[num] }
end

puts alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]
