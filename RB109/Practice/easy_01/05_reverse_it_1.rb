=begin

Write a method that takes one argument, a string, and returns a new string with the words in reverse order.

Examples:

puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
puts reverse_sentence('') == ''
puts reverse_sentence('    ') == '' # Any number of spaces results in ''

The tests above should print true.

::::::::::::::::: PEDAC

input: string
- looking at the examples I'm going to assume that input is just string type,
  therefore I ignore other use cases (numbers, data collection..) 
output: string

data structure:
- It looks like an array will be needed so that each word into the string will
  be re-arranged in a reverse position. So the string will be turned into
  an array, and after some operation it will be turned into a string again
  for the output.
- When the string contains just withe spaces or empty string, no need of any
  particular data structure. An empty string is returned.

algorithm:
- given a string
- return an empty string, if the string is empty
- split the string into array called `arr`
- if size of arr is equal to zero
  - return an empty string
- reverse `arr`
- join the elements of the array into a string and return it   
=end


def reverse_sentence(str)
  return "" if str == ""
  arr = str.split()
  return "" if arr.size == 0
  arr.reverse.join(" ")
end

puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
puts reverse_sentence('') == ''
puts reverse_sentence('    ') == ''
