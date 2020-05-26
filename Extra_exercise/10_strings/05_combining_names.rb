# Using the following code, combine the two names together
# to form a full name and assign that value to a variable named
# full_name. Then, print the value of full_name.
# 
# first_name = 'John'
# last_name = 'Doe'
# 
# Expected output:
# 
# John Doe


first_name = 'John'
last_name = 'Doe'
full_name = first_name + ' ' + last_name
puts full_name


# OTHERS
#
# String#<< → first_name << last_name → puts first_name # => JohnDoe
# It mutates the caller.
# 
# Can you think of at least two additional ways to combine a first and
# last name into a full name?
# 
# first_name = 'John'
# last_name = 'Doe'
# 
# full_name = "#{first_name} #{last_name}"
# puts full_name
# 
# print(first_name, ' ', last_name, "\n")