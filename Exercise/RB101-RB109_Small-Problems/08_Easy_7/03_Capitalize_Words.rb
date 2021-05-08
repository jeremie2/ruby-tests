# Write a method that takes a single String argument and returns a new string that 
# contains the original value of the argument with the first character of every 
# word capitalized and all other letters lowercase.
# 
# You may assume that words are any sequence of non-blank characters.

#### ANSWER

def word_cap(str)
  arr = str.split
  arr.each { |word| word.capitalize! }
  arr.join(' ')
end

puts word_cap('four score and seven') == 'Four Score And Seven'
puts word_cap('the javaScript language') == 'The Javascript Language'
puts word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'


#### SOLUTION

def word_cap(words)
  words_array = words.split.map do |word|
    word.capitalize
  end
  words_array.join(' ')
end

We can also write this more succinctly as:

def word_cap(words)
  words.split.map(&:capitalize).join(' ')
end


#### FURTHER EXPLORATION

# Ruby conveniently provides the String#capitalize method to capitalize strings. 
# Without that method, how would you solve this problem? Try to come up with at 
# least two solutions.

## Simply using #upcase and #downcase

def word_cap(str)
  arr = str.downcase.split
  arr.each do |word|
    word[0] = word[0].upcase
  end
  arr.join(' ')
end

## Without #upcase and #downcase

UPCASE = ('A'..'Z').to_a
DOWNCASE = ('a'..'z').to_a
HSH_TO_UPCASE = Hash[DOWNCASE.zip(UPCASE)]   # {'a' => 'A', 'b' => 'B'.. }
HSH_TO_DOWNCASE = Hash[UPCASE.zip(DOWNCASE)] # {'A' => 'a', 'B' => 'b'.. }

def word_cap(str)
  arr = str.split

  arr.each do |word|
    i = 0
    while i < word.size
      if i == 0 && DOWNCASE.include?(word[i])
        word[i] = HSH_TO_UPCASE[word[i]]
      elsif i > 0 && UPCASE.include?(word[i])
        word[i] = HSH_TO_DOWNCASE[word[i]]
      end
      i += 1
    end
  end
  arr.join(' ')
end


#### from user EISENCHTETER ALEXANDRE

def word_cap(string)
  downup = Hash[('a'..'z').zip('A'..'Z')]
  string.split.map do |word|
    word.gsub!(/([A-Z])/, downup.invert) #downcase the word
    word[0] = word[0].gsub(/([a-z])/, downup) #upcase the first letter
    word
  end.join(' ')
end
