=begin

Write a method that takes one argument, a string containing one or more words, and returns the given string with words that contain five or more characters reversed. Each string will consist of only letters and spaces. Spaces should be included only when more than one word is present.

Examples:

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS

::::::::::::::::: PEDAC

input: string
- looking at the examples I'm going to assume that input is just string type,
  therefore I ignore other use cases (numbers, data collection..) 
output: string

data structure:
- The string needs to be converted into an array so that each word inside
  it can be iterated.

algorithm:
- given a string
- split the string into array called `arr`
- iterate each word inside `arr` and reverse it if the size is equal or
  greater than 5
- join the elements of the array into a string (`new_str`)
- return new_str   
=end

def reverse_words(str)
  arr = str.split
  arr.each { |word| word.reverse! if word.size >= 5 }
  new_str = arr.join(" ")
end

# each step can be easily reproduced within a single line
# def reverse_words(str)
#   str.split.each { |word| word.reverse! if word.size >= 5 }.join(" ")
# end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS
 