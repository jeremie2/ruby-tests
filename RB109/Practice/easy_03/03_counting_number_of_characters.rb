=begin

Write a program that will ask a user for an input of a word or multiple
words and give back the number of characters. Spaces should not be counted
as a character.

input:

  Please write word or multiple words: walk

output:

  There are 4 characters in "walk".

input:

  Please write word or multiple words: walk, don't run

output:

  There are 13 characters in "walk, don't run".

## PEDAC

input: string
mid section: count the number of characters of the given string
             except spaces → `total_chars`
output: string (containing str. repr. of `total_chars`)

data struct: given string

algorithm:
- print a string asking for a string
- assign the given string to `str`
- set `char_counter` equal to 0
- loop
  - iterate every char of `str`
  - add 1 to `char_counter` if single char is not a space
- end loop
- return a string that shows the value of `char_counter`

=end

# puts 'Please write word or multiple words:'
# str = gets.chomp

# char_counter = 0
# str.each_char { |ch| char_counter += 1 if ch != ' ' }

# puts "There are #{char_counter} characters in \"#{str}\"."

# ## FASTER SOLUTION WITH #delete METHOD

puts 'Please write word or multiple words:'
str = gets.chomp

char_counter = str.delete(' ').size

puts "There are #{char_counter} characters in \"#{str}\"."
