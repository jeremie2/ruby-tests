# Given a string of words separated by spaces, write a method that takes this
# string of words and returns a string in which the first and last letters of every 
# word are swapped.
#
# You may assume that every word contains at least one letter, and that the string 
# will always contain at least one word. You may also assume that each string 
# contains nothing but words and spaces
#
# Examples:

# swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
# swap('Abcde') == 'ebcdA'
# swap('a') == 'a'

###### ANSWER

def swap(string)
  array = string.split
  new_arr = array.map do |word|
    word[0], word[-1] = [word[-1], word[0]]
    word
  end
  new_arr.join(' ')
end

puts swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
puts swap('Abcde') == 'ebcdA'
puts swap('a') == 'a'


###### SOLUTION

def swap_first_last_characters(word)
  word[0], word[-1] = word[-1], word[0]
  word
end

def swap(words)
  result = words.split.map do |word|
    swap_first_last_characters(word)
  end
  result.join(' ')
end

###### DISCUSSION

# Our solution takes a straightforward approach; it simply chops the string into 
# words, then iterates through all of the words using map, and produces an array of 
# modified words. We then apply join to that array to produce our return value.
#
# The tricky part here is actually swapping the first and last characters of each 
# word. Because of the mild trickiness, we use a separate method. It uses this 
# common idiom:
#
# a, b = b, a
#
# to exchange the values of a and b. In our method, a is the first letter of the 
# word, and b is the last letter of the word. When Ruby sees something like this, 
# it effectively creates a temporary array with the values from the right side
# ([b, a]), and then assigns each element from that array into the corresponding 
# named variable:
#
# a = b   # b is value from position 0 of temporary array (original value of b)
# b = a   # a is value from position 1 of temporary array (original value of a)
#
# Looked at another way, this is equivalent to:
#
# temporary = [b, a]
# a = temporary[0]
# b = temporary[1]

###### Further Exploration

# How come our solution passes word into the swap_first_last_characters method 
# invocation instead of just passing the characters that needed to be swapped? 
# Suppose we had this implementation:

def swap_first_last_characters(a, b)
  a, b = b, a
end

# and called the method like this:

swap_first_last_characters(word[0], word[-1])

###### ANSWER

def swap_first_last_characters(a, b)
  a, b = b, a
end

def swap(words)
  result = words.split.map do |word|
    swap_first_last_characters(word[0], word[-1])
  end
  result.join(' ')
end

# It doesn't work because the method call inside #map iteration will
# just return the last and the first character of the word, not the
# word with first and last character changed.
