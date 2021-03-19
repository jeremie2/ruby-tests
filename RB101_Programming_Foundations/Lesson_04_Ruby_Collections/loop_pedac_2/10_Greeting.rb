# Given the code below, use a while loop to print "Hello!" twice.
#
# def greeting
#   puts 'Hello!'
# end
#
# number_of_greetings = 2


# PROBLEM
#
# input:
# number_of_greetings = 2
#
# output:
# - string 'Hello!' repeated 2 times
#
# rules:
# - create a while loop to print 2 times #greeting methods


# EXAMPLE
# (result)
#
# 'Hello!'
# 'Hello!'


# DATA STRUCTURE
# 
# integers and a strings


# ALGORITHM
#
# - define greeting()
# -   print 'Hello!'
# - end definition
# -
# - set number_of_greetings = 2
# -
# - while loop with condition 'number_of_greetings' > 0
#   - exec greeting()
#   - subtract 1 from number_of_greetings
# - end loop


# CODE

def greeting
  puts 'Hello!'
end

number_of_greetings = 2

while number_of_greetings > 0
  greeting
  number_of_greetings -= 1
end
