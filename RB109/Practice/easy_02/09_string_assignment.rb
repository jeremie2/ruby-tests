=begin

Take a look at the following code:

name = 'Bob'
save_name = name
name = 'Alice'
puts name, save_name

What does this code print out? Think about it for a moment before continuing.

If you said that code printed

Alice
Bob

you are 100% correct, and the answer should come as no surprise. Now, let's look at something a bit different:

name = 'Bob'
save_name = name
name.upcase!
puts name, save_name

What does this print out? Can you explain these results?

=end

# The result is:
# BOB
# BOB
#
# - string `Bob` is stored into variable `name`
# - `name` is assigned to `save_name` and both variable are now pointing
#   the same value, the string `Bob`
# - now we perform the method .upcase! on variable `name`. #upcase! is going
#   to modify the caller, this means that the string `Bob` is now changed to
#   `BOB`
# - Both variable `name` and `save_name` are pointing the same string `BOB`
#   and that's why printing both variable will output:
#     BOB
#     BOB
