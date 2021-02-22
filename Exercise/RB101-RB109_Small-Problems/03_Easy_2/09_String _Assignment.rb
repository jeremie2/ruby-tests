# Take a look at the following code:

name = 'Bob'
save_name = name
name = 'Alice'
puts name, save_name

# What does this code print out? Think about it for a moment before continuing.
# If you said that code printed

Alice
Bob

# you are 100% correct, and the answer should come as no surprise. Now,
# let's look at something a bit different:

name = 'Bob'
save_name = name
name.upcase!
puts name, save_name

# What does this print out? Can you explain these results?

######## ANSWER

# The second result is:
#
# BOB
# BOB


### FIRST CASE

name = 'Bob'       # The value 'Bob' is stored in a memory address.
save_name = name   # save_name is now pointing to the same memory address.

# The value of both variables 'name' and 'save_name' is 'Bob'

name = 'Alice'     # Now 'name' variable will point to a new address, while
                   # save_name still point to the old one.
# That's why:

puts name        # => 'Alice'
puts save_name   # => 'Bob'


### SECOND CASE

name = 'Bob'       # The value 'Bob' is stored in a memory address.
save_name = name   # save_name is now pointing to the same memory address.

name.upcase!       # We are using a method that modifies the caller. It means
                   # that the value stored at that memory address has been 
                   # changed.

# Both variable still point to that value that now is 'BOB'.
# That's why:

puts name        # => 'BOB'
puts save_name   # => 'BOB'
