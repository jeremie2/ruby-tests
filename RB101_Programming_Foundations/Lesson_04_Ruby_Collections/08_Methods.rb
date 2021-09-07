############# ITERATION, SELECTION AND TRANSFORMATION

# Looping can be very repetitive. Ruby's methods can make work shorter.

###### EACH

# We can usually loop through a collection like this:

numbers = [1, 2, 3]
counter = 0

loop do
  break if counter == numbers.size
  puts numbers[counter]
  counter += 1
end

# using #each method things can be written like this 

[1, 2, 3].each do |num|
  puts num
end

# let's break the code:

[1, 2, 3]                   # The array

.each                       # The method called on the array

               do |num|     # The block taken from the methods.
  puts num                  # This code will be executed for each iteration
end                         # 'num' is the value of the current element sent
                            # by #each


# #each can be called on hashes. In that case it needs two arguments:

hash = { a: 1, b: 2, c: 3 }

hash.each do |key, value|
  puts "The key is #{key} and the value is #{value}"
end

# An important aspect is that #each will always return the original collection.
# This because 'hash.each' is the last expression.


###### SELECT

# Instead performing a loop setting break point and counter, it's
# possible to select specific elements using #select method:

[1, 2, 3].select do |num|
  num.odd?
end

# #select evaluates the return value of the block for each iteration.
# If the return value is 'truthy' then the current element will be
# appended to a new array.
# Basically #select returns a new array made of elements that return
# 'true' to a condition.
#
# Just to understand, let's see some 'silly' example:

[1, 2, 3].select do |num|
  num + 1
end

# 'num + 1' is a truthy condition, then every single element will be
# added to the return array [1, 2, 3].

[1, 2, 3].select do |num|
  num + 1
  puts num
end

# The last evaluated expression is not truthy as 'puts' returns 'nil'.
# In this case no elements will be added to the new array [].
# 
# !! THIS CAN LEAD TO ERROR WHILE DEBUGGING
# (It happens to forget a 'puts' statement inside an iteration block)


###### MAP

# #map uses the return value to perform transformations and return a new array:

[1, 2, 3].map do |num|
  num * 2
end
# => [2, 4, 6]


[1, 2, 3].map do |num|
  num.odd?
end
# => [true, false, true]


# Here an interesting case.
# Map is going to always return an array the same size of the original array.
# Here we see that the new array takes original element if they are == 3.
#
# What does happen if there isn't a returned value? ...'nil'
# 'nil' element will be added to the new array:

[1, 2, 3].map do |value|
  value if value == 3
end
# => [nil, nil, 3]


####### A USEFUL TABLE

##############################################################
#        #            # Considers #             #            #
#        #            # return    # Returns     # Returned   #
# Method #  Action    # block's   # new         # collection #
#        #            # value?    # collection? # length     #
##############################################################
#        ::           ::          ::   No       ::           #
# each   :: Iteration ::   No     :: (returns   :: Original  #
#        ::           ::          ::  original) ::  length   #
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::# 
#        ::           ::          :: Yes - made :: Original  #
# select :: Selection ::   Yes    :: of original::  length   #
#        ::           :: (truthy) :: elements   ::  or less  #
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::#
#        :: Transfor- ::          ::            ::           #
# map    ::  mation   ::   Yes    ::    Yes     :: Original  #
#        ::           ::          ::            ::  length   #
##############################################################
