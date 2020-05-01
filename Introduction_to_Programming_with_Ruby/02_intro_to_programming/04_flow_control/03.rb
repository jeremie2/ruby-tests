# Write a program that takes a number from the user between 0 and
# 100 and reports back whether the number is between 0 and 50, 51
# and 100, or above 100.


## FIRST ATTEMPT
## BAD!! Doesn't take in consideration negative numbers
## Also... it could be shorter.
# 
# puts "Type a number: "
# number = gets.chomp.to_i
# 
# if number >= 0 && number <= 50
#   puts "#{number} is between 0 and 50."
# elsif number > 50 && number <= 100
#   puts "#{number} is between 51 and 100."
# else
#   puts "#{number} is above 100."
# end

# SOLUTION
#
# puts "Please enter a number between 0 and 100."
# number = gets.chomp.to_i
#
# if number < 0
#   puts "You can't enter a negative number!"
# elsif number <= 50
#   puts "#{number} is between 0 and 50"
# elsif number <= 100
#   puts "#{number} is between 51 and 100"
# else
#   puts "#{number} is above 100"
# end

## SECOND ATTEMPT

puts "Type a number: "
number = gets.chomp.to_i

if number < 0
  puts "Please, enter only a positive integer!"
elsif number < 51
  puts "#{number} is between 0 and 50."
elsif number < 101
  puts "#{number} is between 51 and 100."
else
  puts "#{number} is above 100."
end
