# Write a method that returns the next to last word in the String passed to it as 
# an argument.
# Words are any sequence of non-blank characters.
# 
# You may assume that the input String will always contain at least two words.

#### ANSWER

def penultimate(str)
  arr = str.split
  arr[-2]
end

puts penultimate('last word') == 'last'
puts penultimate('Launch School is great!') == 'is'


#### FURTHER EXPLORATION

# Suppose we need a method that retrieves the middle word of a phrase/sentence. 
# What edge cases need to be considered? How would you handle those edge cases 
# without ignoring them? Write a method that returns the middle word of a phrase or 
# sentence. It should handle all of the edge cases you thought of.

#### ANSWER

# Edge cses:
# 
# - no words         # print ''
# - odd string.size  # print last word of the first n/2 words

def mid_element(str)
  arr = str.split
  if arr == []
    ''
  else
    arr[(arr.size - 1 ) / 2]
  end
end

puts mid_element('last word') == 'last'
puts mid_element('Launch School is great!') == 'School'
puts mid_element('Launch School is greatly great!') == 'is'
puts mid_element(' ') == ''
