# Write a method that takes a string with one or more space separated words and 
# returns a hash that shows the number of words of different sizes.
#
# Words consist of any string of characters that do not include a space.
#
# Examples
#
# word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
# word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
# word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
# word_sizes('') == {}

##### ANSWER

def word_sizes(string)
  hash = {}
  string.split.each do |word|
    idx = word.size
    if hash[idx]
      hash[idx] += 1
    else
      hash[idx] = 1
    end
  end
  hash
end


puts word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
puts word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
puts word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
puts word_sizes('') == {}


##### SOLUTION  (very interesting)

def word_sizes(words_string)
  counts = Hash.new(0)
  words_string.split.each do |word|
    counts[word.size] += 1
  end
  counts
end

# The main goal of this problem is to count the number of words of each size. To do 
# that, we first need to obtain a list of the words. Once we have a word, computing 
# its size is easy, but incrementing the count for words of that size is slightly 
# trickier. If we initialize counts as
#
# counts = {}
#
# we will get an exception the first time counts[word.size] += 1 is executed. This 
# is because that element doesn't exist, so counts[word.size] returns nil, and nil 
# cannot be added to 1. To fix this, we use the default value form of initializing 
# counts:
#
# counts = Hash.new(0)
