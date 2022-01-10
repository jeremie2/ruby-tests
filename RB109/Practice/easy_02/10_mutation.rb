=begin

What will the following code print, and why? Don't run the code until you have
tried to answer.

array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2

Further Exploration
How can this feature of ruby get you in trouble? How can you avoid it?

=end

# In the first `each` loop each element of array1 will be added to array2.
# Basically each element is going to be assigned to array2.
# array1 and array2 are different object but are sharing the same elements.
# The second "each" loop is performed on array1 and modifies names that
# begin with `C` or `S`. As those elements are shared between the two
# arrays, then also the words into arrray2 that begin with `C` or `S` will
# be turned to upper case:
#   ["Moe", "Larry", "CURLY", "SHEMP", "Harpo", "CHICO", "Groucho", "Zeppo"]
#
# FURTHER EXPLORATION:
# It can happen that we don't want array2 with modified (uppercase) strings.
# To avoid this in the first `each` loop we can populate array2 with copies
# of every string using method #dup:
#
#   array1.each { |value| array2 << value.dup }
#
# This prevent uppercase strings into array2
