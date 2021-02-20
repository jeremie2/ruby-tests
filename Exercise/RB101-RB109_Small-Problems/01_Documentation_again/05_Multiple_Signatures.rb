
############ Multiple Signatures

# What do each of these puts statements output?

a = %w(a b c d e)
puts a.fetch(7)
puts a.fetch(7, 'beats me')
puts a.fetch(7) { |index| index**2 }

##### ANSWER

# docs:
# https://ruby-doc.org/core-2.7.2/Array.html#method-i-fetch
# fetch(index) → obj
# Tries to return the element at position index, but throws an IndexError
# exception if the referenced index lies outside of the array bounds. This
# error can be prevented by supplying a second argument, which will act as
# a default value.

a = %w(a b c d e)
puts a.fetch(7)   # => IndexError: index 7 outside of array bounds: -5...5
puts a.fetch(7, 'beats me')           # => 'beats me'
puts a.fetch(7) { |index| index**2 }  # => 49

# The last two examples looks like error handling. 
