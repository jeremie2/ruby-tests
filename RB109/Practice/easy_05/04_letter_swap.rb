=begin

Given a string of words separated by spaces, write a method that
takes this string of words and returns a string in which the first
and last letters of every word are swapped.

You may assume that every word contains at least one letter, and
that the string will always contain at least one word. You may also
assume that each string contains nothing but words and spaces

Examples:

swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
swap('Abcde') == 'ebcdA'
swap('a') == 'a'

## PEDAC

input: string
mid section: swap first end last char of each word into the string 
output: string with modified words

data struct: the string can be converted to array (each word might be
             separated by a space) 

algorithm:
- given a string
- turn the string into an array containing the words inside the
  string separated by space ' '
- loop iterate the words into the array
  - assign the first char to the last char (and viceversa) of the word
- end loop
- turn the array into a string with words separated by space ' '

=end

def swap(str)
  str.split.each do |word|
    word[0], word[-1] = word[-1], word[0]
  end.join(' ')
end

puts swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
puts swap('Abcde') == 'ebcdA'
puts swap('a') == 'a'
