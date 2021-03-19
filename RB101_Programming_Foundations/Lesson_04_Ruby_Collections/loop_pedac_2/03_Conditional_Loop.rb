# Using an if/else statement, run a loop that prints "The loop was processed!"
# one time if process_the_loop equals true. Print "The loop wasn't processed!"
# if process_the_loop equals false.
#
# process_the_loop = [true, false].sample


# PROBLEM
#
# input:
# - boolean
#
# output:
# - string
#
# rules:
# - exit loop when boolean is 'true' 


# EXAMPLE
# (2 possible result)
#
# "The loop wasn't processed!"
#
# "The loop was processed!"


# DATA STRUCTURE
# 


# ALGORITHM
# 
# - set 'process_the_loop' as true or false via #sample method
# - if 'process_the_loop' = 'true'
#   - loop
#     - print "The loop was processed!"
#     - exit loop
#   - end loop
# - else
#   - print "The loop wasn't processed!"
# - end if

# CODE

process_the_loop = [true, false].sample

if process_the_loop
  loop do
    puts 'The loop was processed!'
    break
  end
else
  puts "The loop wasn't processed!"
end
