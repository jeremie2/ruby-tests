# In an earlier exercise, you wrote a program that prints
# 'Launch School is the best!' repeatedly until a certain
# number of lines have been printed. Our solution looked like this:
# 
# number_of_lines = nil
# loop do
#   puts '>> How many output lines do you want? Enter a number >= 3:'
#   number_of_lines = gets.to_i
#   break if number_of_lines >= 3
#   puts ">> That's not enough lines."
# end
# 
# while number_of_lines > 0
#   puts 'Launch School is the best!'
#   number_of_lines -= 1
# end
# 
# Modify this program so it repeats itself after each input/print
# iteration, asking for a new number each time through. The program
# should keep running until the user enters q or Q.
# 
# Examples:
# 
# $ ruby lsprint2.rb
# >> How many output lines do you want? Enter a number >= 3 (Q to quit):
# 5
# Launch School is the best!
# Launch School is the best!
# Launch School is the best!
# Launch School is the best!
# Launch School is the best!
# >> How many output lines do you want? Enter a number >= 3 (Q to quit):
# 2
# >> That's not enough lines.
# >> How many output lines do you want? Enter a number >= 3 (Q to quit):
# 3
# Launch School is the best!
# Launch School is the best!
# Launch School is the best!
# >> How many output lines do you want? Enter a number >= 3 (Q to quit):
# q

loop do
  puts '>> How many output lines do you want? Enter a number >= 3 (Q to quit):'
  lines = gets.chomp
  break if lines.downcase == 'q'
  puts ">> That's not enough lines." if lines.to_i <= 3
  lines.to_i.times {puts 'Launch School is the best!'} if lines.to_i > 3
end


# SOLUTION
# 
# loop do
#   input_string = nil
#   number_of_lines = nil
# 
#   loop do
#     puts '>> How many output lines do you want? ' \
#          'Enter a number >= 3 (Q to Quit):'
# 
#     input_string = gets.chomp.downcase
#     break if input_string == 'q'
# 
#     number_of_lines = input_string.to_i
#     break if number_of_lines >= 3
# 
#     puts ">> That's not enough lines."
#   end
# 
#   break if input_string == 'q'
# 
#   while number_of_lines > 0
#     puts 'Launch School is the best!'
#     number_of_lines -= 1
#   end
# end
