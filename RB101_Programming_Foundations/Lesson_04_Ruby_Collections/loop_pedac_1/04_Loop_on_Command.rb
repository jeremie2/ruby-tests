# Modify the code below so the loop stops iterating when the user inputs 'yes'.
#
# loop do
#   puts 'Should I stop looping?'
#   answer = gets.chomp
# end


# PROBLEM
#
# - loop run infinitely asking input to the user
# - change the code so that loop ends depending on user's input
#
# Input:
# - string
# 
# Output:
# - string
#
# Watching the solution:
# - Appreciated an 'error handling' answer if user's input
#   doesn't match the requested string to exit the loop

# EXAMPLE
# (doesn't matter the input, loop keeps going on)
#
# Should I stop looping?
# g
# Should I stop looping?
# yes
# Should I stop looping?
# no
# Should I stop looping?
#
# Should I stop looping?
# ....

# DATA STRUCTURE
#
# - No particular data structure, just an input string
#   and an output string

# ALGORITHM
#
# - start loop
#   - print the string asking for user if he wants to stop looping
#   - 'answer' = user's input
#   - exit loop if 'answer' = 'yes'
#   - print eventual error handling message
# - end loop

# CODE

loop do
  puts 'Should I stop looping?'
  answer = gets.chomp
  break if answer == 'yes'
  puts 'Wrong answer, please try again!'
end
