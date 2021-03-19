# The code below is an example of an infinite loop. The name describes
# exactly what it does: loop infinitely. This loop isn't useful in a real
# program, though. Modify the code so the loop stops after the first iteration.
#
# loop do
#   puts 'Just keep printing...'
# end


# PROBLEM
#
# Given a script running an infinite loop,
# stop the loop after first iteration. 

# EXAMPLE
#
# Result of the script:
#   Just keep printing...
#   Just keep printing...
#   Just keep printing...
#   ....

# DATA STRUCTURE
#
# There is just a string that is printed by the loop

# ALGORITHM
#
# - start a loop
#   - print a given string
#   - exit the loop
# - end loop

# CODE

loop do
  puts 'Just keep printing...'
  break
end