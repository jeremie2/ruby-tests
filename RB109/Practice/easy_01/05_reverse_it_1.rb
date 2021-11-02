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
- split the string into array called `arr`
- reverse the array (`arr_reverse`)
- join the elements of the array into a string (`new_str`)
- return new_str   
=end

# def reverse_sentence(str)
#   arr = str.split
#   arr_reverse = arr.reverse
#   new_str = arr_reverse.join(" ")
#   new_str
# end

# each step can be easily reproduced within a single line
def reverse_sentence(str)
  str.split.reverse.join(" ")
end

puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
puts reverse_sentence('') == ''
puts reverse_sentence('    ') == ''
 