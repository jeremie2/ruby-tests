=begin

Write a method that takes one argument, a positive integer, and returns a list of the digits in the number.

Example:

  puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
  puts digit_list(7) == [7]                     # => true
  puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
  puts digit_list(444) == [4, 4, 4]             # => true

::::::::::::::::: PEDAC

- input: integer
- output: array of integers

::::::::::::::::: SOLUTION 1 - to str -> to int

Data structure:
- number can be transformed into a string and then into array
- a new array will be used to store element of the first array
  turned into integer

Algorithm:
- given a integer `num`
- create a new array called `result`
- create a new array `str_arr` and assign to it `num` turned into
  an array of characters 
- iterate `str_arr` and add to `result` each character turned into
  integer
- return array `result`

=end

# def digit_list(num)
#   result = []
#   str_arr = num.to_s.chars
#   str_arr.each { |el| result << el.to_i }
#   result
# end

# one-line-solution
# def digit_list(num)
#   num.to_s.chars.map { |el| el.to_i }
# end

=begin ::::::::::::::::: SOLUTION 2 - use only numbers

Data structure:
- empty array in which integers are going to be stored

Algorithm:
- given a integer `num`
- create empty array `arr`
- start loop
  - prepend to `arr` the result of `num % 10`
  - assign to num the result of `num / 10`
  - break loop if num is equal zero 
- end loop
- return `arr`

=end

# def digit_list(num)
#   arr = []
#   loop do
#     arr.unshift(num % 10)
#     num /= 10
#     break if num == 0
#   end
#   arr
# end

=begin ::::::::::::::::: SOLUTION 3 - only numbers no fancy methods

This time I don't use easy method at all appending every single integer
to array `arr` and then passing each element to a new array `result`.


Algorithm:
- given a integer `num`
- create empty array `arr`
- create empty array `result`
- start loop
  - append to `arr` the result of `num % 10`
  - assign to num the result of `num / 10`
  - break loop if num is equal zero 
- end loop
- initialize variable `idx` with value -1
- start loop
  - loops will run until size of `result` will be smaller than
    size of `arr`
  - append element arr[idx] to `result` array (so that:
    last element of `arr` will be first element of `result`;
    penultimate element of `arr` will be second element of `result`;
    and so on...)
  - decrease `idx` by -1
- end loop
- return `result`

=end
def digit_list(num)
  arr = []
  result = []

  loop do
    arr << num % 10
    num /= 10
    break if num == 0
  end
  
  idx = -1
  while result.size < arr.size
    result << arr[idx]
    idx -= 1
  end
  result
end

# TEST CASES

puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true
