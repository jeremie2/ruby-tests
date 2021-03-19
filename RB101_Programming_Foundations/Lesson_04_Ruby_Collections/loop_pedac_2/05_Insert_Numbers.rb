# Modify the code below so that the user's input gets added to the
# numbers array. Stop the loop when the array contains 5 numbers.
#
# numbers = []
#
# loop do
#   puts 'Enter any number:'
#   input = gets.chomp.to_i
# end
# puts numbers


# PROBLEM
#
# input:
# - integers
#
# output:
# - array
#
# rules:
# - exit loop when after 5 integers have been added to the array


# EXAMPLE
# (possible result)
#
# 'Enter any number:'
# '8'
# 'Enter any number:'
# '10'
# 'Enter any number:'
# '11'
# 'Enter any number:'
# '12'
# 'Enter any number:'
# '4'
#  8
#  10
#  11
#  12
#  14     # end loop


# DATA STRUCTURE
# 
# numbers = []  =>  [8, 10, 11, 12, 14]


# ALGORITHM
#
# - set 'numbers' empty array
# - loop
#   - print a string asking 'Enter any number:'
#   - store user's input converted to integer into 'input' variable
#   - add 'input' into 'numbers' array
#   - exit loop if 'numbers' length = 5
# - end loop
# - print each element of 'numbers'


# CODE

numbers = []

loop do
  puts 'Enter any number:'
  inputs = gets.chomp.to_i
  numbers << inputs
  break if numbers.length == 5
end

puts numbers
