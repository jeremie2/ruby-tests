# Write a program that will ask a user for an input of a word or multiple
# words and give back the number of characters. Spaces should not be counted
# as a character.
#
# input:
#   Please write word or multiple words: walk
# output:
#   There are 4 characters in "walk".
#
# input:
#   Please write word or multiple words: walk, don't run
# output:
#   There are 13 characters in "walk, don't run".


######## ANSWER

puts "Please write word or multiple words:"
string = gets.chomp
n_chars = string.gsub(' ', '').size
puts "There are #{n_chars} characters in '#{string}'."


######## SOLUTION
# Faster with #delete()
# Also \" \" where missing in my example.

print 'Please write word or multiple words: '
input = gets.chomp
number_of_characters = input.delete(' ').size
puts "There are #{number_of_characters} characters in \"#{input}\"."
