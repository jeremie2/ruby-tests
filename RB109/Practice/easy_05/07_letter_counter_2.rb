=begin

Modify the word_sizes method from the previous exercise to exclude non-letters when determining word size. For instance, the length of "it's" is 3, not 4.

Examples

word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
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
- set 'new_str' as a version of 'str' without character different by
  letters and withe spaces
- turn 'new_str' into 'arr' of strings, each element are consecutive
  character of 'new_str' except white spaces
- loop through 'arr' elements 'el'
  - if hsh[el.size] exist, add 1 to hsh[el.size]
    else set hsh[el.size] equal 1
- end loop
- return 'hsh'

=end

def word_sizes(str)
  hsh = Hash.new(0)
  new_str = str.gsub(/[^a-zA-Z ]/, '')
  new_str.split.each { |el| hsh[el.size] += 1 }
  hsh
end

## SOLUTION

# def word_sizes(words_string)
#   counts = Hash.new(0)
#   words_string.split.each do |word|
#     clean_word = word.delete('^A-Za-z')
#     counts[clean_word.size] += 1
#   end
#   counts
# end

puts word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
puts word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
puts word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
puts word_sizes('') == {}
