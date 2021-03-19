# Given the array below, use loop to remove and print each name.
# Stop the loop once names doesn't contain any more elements.
#
# names = ['Sally', 'Joe', 'Lisa', 'Henry']
#
# Keep in mind to only use loop, not while, until, etc.


# PROBLEM
#
# input:
# - array of strings
#
# output:
# - strings
#
# rules:
# - remove and print element of an array using 'loop do'


# EXAMPLE
# (result)
#
# Sally 
# Joe 
# Lisa 
# Henry


# DATA STRUCTURE
# 
# names = ['Sally', 'Joe', 'Lisa', 'Henry']


# ALGORITHM
#
# - set 'names' array with these names: 'Sally', 'Joe', 'Lisa', 'Henry'
# - loop
#   - print end remove first element of the array by using #shift method
#   - exit loop if 'names' length = 0
# - end loop


# CODE

names = ['Sally', 'Joe', 'Lisa', 'Henry']

loop do
  puts names.shift
  break if names.length == 0
end
