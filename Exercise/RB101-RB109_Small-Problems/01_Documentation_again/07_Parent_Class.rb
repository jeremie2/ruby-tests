
############ Parent Class

# Use irb to run the following code:

s = 'abc'
puts s.public_methods.inspect

# You should find that it prints a list of all of the public methods available
# to the String s; this includes not only those methods defined in the String
# class, but also methods that are inherited from Object (which inherits other
# methods from the BasicObject class and the Kernel module). That's a lot of
# methods.

# How would you modify this code to print just the public methods that are
# defined or overridden by the String class? That is, the list should exclude
# all members that are only defined in Object, BasicObject, and Kernel.

##### ANSWER

# Docs
# https://ruby-doc.org/core-3.0.0/Object.html#method-i-public_methods
#
# public_methods(all=true) → array click to toggle source
#
# Returns the list of public methods accessible to obj. If the all parameter is
# set to false, only those methods in the receiver will be listed.
# ...let's try with 'all=false' parameter:

puts s.public_methods(all=false).inspect

##### FROM SOLUTION

# It can be written as:
puts s.public_methods(false).inspect

# Also:
# The phrase "though perhaps in modified form" from above is there because
# a class can override the members of its superclass. In fact, most of the
# Core and Standard Library API classes do just that. For example, String
# overrides Object#==. What this means for you is that you must first look
# at the documentation for your class before looking at the documentation
# for the superclass. Even if you know that the superclass has a particular
# method, you should always check that it isn't being overridden by the
# subclass.
