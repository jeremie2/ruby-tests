# The following code increments number_a and number_b by either 0 or 1.
# loop is used so that the variables can be incremented more than once,
# however, break stops the loop after the first iteration. Use next to
# modify the code so that the loop iterates until either number_a or
# number_b equals 5. Print "5 was reached!" before breaking out of the loop.
#
# number_a = 0
# number_b = 0
#
# loop do
#   number_a += rand(2)
#   number_b += rand(2)
#
#   break
# end


# PROBLEM
#
# input:
# 'number_a' and 'number_b' initialized as 0
#
# output:
# - string "5 was reached!"
#
# rules:
# - 'number_a' and 'number_b' will be increased of 1 or 0 
# - avoid breaking the loop if number_a or number_b are < 5 using 'next'


# EXAMPLE
# (result)
#
# "5 was reached!"


# DATA STRUCTURE
# 
# integers and a string


# ALGORITHM
#
# - set 'number_a' = 0
# - set 'number_b' = 0
# - loop
#   - add randomly 1 or 0 to 'number_a'
#   - add randomly 1 or 0 to 'number_b'
#   - skip the loop if 'number_a' or 'number_b' is < 5
#   - print "5 was reached!"
#   - exit loop
# - end loop


# CODE

number_a = 0
number_b = 0

loop do
  number_a += rand(2)
  number_b += rand(2)

  puts "number_a - number_b = #{number_a} - #{number_b}" # added for some control

  next if number_a != 5 && number_b != 5

  puts '5 was reached!'
  break
end
