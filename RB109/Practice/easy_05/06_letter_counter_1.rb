=begin

Write a method that takes a string with one or more space separated
words and returns a hash that shows the number of words of different
sizes.

Words consist of any string of characters that do not include a space.

Examples

word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
word_sizes('') == {}

## PEDAC

problem:
- word: any consecutive character except white space ' ' 
- the hash's pair are made of:
  - key: size of a word
  - value: number of words of that size

input: string
mid section:
- turn str into array
- iterate array to build the hash
output: hash 

data struct:
- array: from given string
- hash: collecting data from iterated array

algorithm:
- given a string 'str'
- create a empty hash 'hsh'
- turn 'str' into 'arr' of strings, each element are consecutive
  character of 'str' except white spaces
- loop through 'arr' elements 'el'
  - if hsh[el.size] exist, add 1 to hsh[el.size]
    else set hsh[el.size] equal 1
- end loop
- return 'hsh'

=end

# def word_sizes(str)
#   hsh = {}
#   str.split.each do |el|
#     if hsh[el.size]
#       hsh[el.size] += 1
#     else
#       hsh[el.size] = 1
#     end
#   end
#   hsh
# end

## SHORT VERSION

# We can avoid the "if exist" statement setting hsh = Hash.new(0) 
# This way if hsh[el.size] doesn't exist, 0 is returned instead of nil

def word_sizes(str)
  hsh = Hash.new(0)
  str.split.each { |el| hsh[el.size] += 1 }
  hsh
end

puts word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
puts word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
puts word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
puts word_sizes('') == {}
