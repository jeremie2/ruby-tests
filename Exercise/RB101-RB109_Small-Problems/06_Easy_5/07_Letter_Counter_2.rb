# Modify the word_sizes method from the previous exercise to exclude non-letters 
# when determining word size. For instance, the length of "it's" is 3, not 4.
#
# Examples
#
# word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
# word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
# word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
# word_sizes('') == {}

##### ANSWER

def word_sizes(words_string)
  alphab = ('a'...'z').to_a + ('A'...'Z').to_a
  counts = Hash.new(0)
  words_string.split.each do |word|
    word.chars.each do |ch|
      word.gsub!(ch, '') if !alphab.include?(ch)
    end
    counts[word.size] += 1
  end
  counts
end


puts word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
puts word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
puts word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
puts word_sizes('') == {}

##### SOLUTION

def word_sizes(words_string)
  counts = Hash.new(0)
  words_string.split.each do |word|
    clean_word = word.delete('^A-Za-z')
    counts[clean_word.size] += 1
  end
  counts
end
