# Using the following code, compare the value of name with the
# string 'RoGeR' while ignoring the case of both strings. Print
# true if the values are the same; print false if they aren't.
# Then, perform the same case-insensitive comparison, except compare
# the value of name with the string 'DAVE' instead of 'RoGeR'.
# 
# name = 'Roger'
# 
# Expected output:
# 
# true
# false


name = 'Roger'
puts 'RoGeR'.downcase == name.downcase
puts 'DAVE'.downcase == name.downcase


# SOLUTION
# with String#casecmp: case-insensitive comparison which returns:
# 0 when strings are equal
# 1 if the string is shorter than the original one
# -1 if the string is longer than the original one
#
# name = 'Roger'
# puts name.casecmp('RoGeR') == 0
# puts name.casecmp('DAVE') == 0


# OTHERS
#
# name = 'Roger'
# puts name.casecmp?('RoGeR') 
# puts name.casecmp?('DAVE')