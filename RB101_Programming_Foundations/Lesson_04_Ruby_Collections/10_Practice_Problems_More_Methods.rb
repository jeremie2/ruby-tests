
########################### PRACTICE PROBLEM 1

# What is the return value of the select method below? Why?

[1, 2, 3].select do |num|
  num > 5
  'hi'
end

#### ANSWER
#
# The goal of #select method is to select elements of the given array if
# the block return value is truthy.
# In this case, returning the string 'hi' is a truthy statement, then the
# current value will be added to the new array. And every element of the
# original array will be selected. 
# The result should be: [1, 2, 3]

#### SOLUTION
#
# => [1, 2, 3]
#
# select performs selection based on the truthiness of the block's return value.
# In this case the return value will always be 'hi', which is a "truthy" value. 
# Therefore select will return a new array containing all of the elements in the 
# original array.


########################### PRACTICE PROBLEM 2

# How does count treat the block's return value? How can we find out?

['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end

#### ANSWER
#
# Without watching the documentation, we can see: 
# - the method is called 'count'... and it should count how many times
#   something happens.
# - Inside the block there is a condition that return 'true' if the
#   current string element has less than 4 character.
# 
# So I think this block of code will return how many elements return 'true'
# to that condition. This happens with string 'ant' and 'bat'.
# The result is: 2

#### SOLUTION
#
# If we don't know how count treats the block's return value, then we should 
# consult the docs for Array#count. Our answer is in the description:
# "If a block is given, counts the number of elements for which the block returns
# a true value".
# Based on this information, we can conclude that count only counts an element if 
# the block's return value evaluates to true. This means that count considers the 
# truthiness of the block's return value.


########################### PRACTICE PROBLEM 3

# What is the return value of reject in the following code? Why?

[1, 2, 3].reject do |num|
  puts num
end

#### ANSWER
#
# From documentation:
# Returns a new Array whose elements are all those from self for which the block 
# returns 'false' or 'nil':
# The block's return value is 'nil', then every element will be added to new array.
# The result is: [1, 2, 3]

#### SOLUTION
#
# => [1, 2, 3]
#
# Since puts always returns nil, you might think that no values would be selected 
# and an empty array would be returned. The important thing to be aware of here is 
# how reject treats the return value of the block. reject returns a new array 
# containing items where the block's return value is "falsey". In other words, if 
# the return value was false or nil the element would be selected.


########################### PRACTICE PROBLEM 4

# What is the return value of each_with_object in the following code? Why?

['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end

#### ANSWER
#
# The method argument is '{}' and the second block element is 'hash'.
# This method return a hash. 
# Let's see what happens with the first block element.
# value = 'ant'
# - hash['ant'[0]] = 'ant'
#   where 'ant'[0] = 'a'
# - hash['a'] = 'ant'
# 
# Basically the keys of the new hash are made of the first character
# of each element.
#
# The result is:

hash = { 'a' => 'ant', 'b' => 'bear', 'c' => 'cat' }

#### SOLUTION
#
# => { "a" => "ant", "b" => "bear", "c" => "cat" }
#
# Based on our knowledge of each, it might be reasonable to think that
# each_with_object returns the original collection. That isn't the case, though.
# When we invoke each_with_object, we pass in an object ({} here) as an argument.
# That object is then passed into the block and its updated value is returned at 
# the end of each iteration. Once each_with_object has iterated over the calling 
# collection, it returns the initially given object, which now contains all of
# the updates.
#
# In this code, we start with the hash object, {}. On the first iteration, we add 
# "a" => "ant" to the hash. On the second, we add "b" => "bear", and on the last 
# iteration, we add "c" => "cat". Thus, #each_with_object in this example returns 
# a hash with those 3 elements.


########################### PRACTICE PROBLEM 5

# What does shift do in the following code? How can we find out?

hash = { a: 'ant', b: 'bear' }
hash.shift

#### ANSWER
#
# If it works like #shift for arrays, it should remove the first hash pair and 
# return it (probably) as an array.
#
# Return value: [a:, 'ant']
# hash = { b: 'bear' }


#### SOLUTION
# shift destructively removes the first key-value pair in hash and returns it as a 
# two-item array. If we didn't already know how shift worked, we could easily 
# learn by checking the docs for Hash#shift. The description for this method 
# confirms our understanding:
#
#   Removes a key-value pair from hsh and returns it as the two-item array [ key, 
#   value ], or the hash’s default value if the hash is empty.
#
# There are quite a few Ruby methods, and you're not expected to know them all.
# That's why knowing how to read the Ruby documentation is so important. If you 
# don't know how a method works you can always check the docs.


########################### PRACTICE PROBLEM 6

# What is the return value of the following statement? Why?

['ant', 'bear', 'caterpillar'].pop.size

#### ANSWER
#
# - #pop removes and returns the last element of arrays
# - #size counts elements of arrays, or character of a string like in this case
#
# ['ant', 'bear', 'caterpillar'].pop     #=> 'caterpillar'
# 'caterpillar'.size                     #=> 11


########################### PRACTICE PROBLEM 7

# What is the block's return value in the following code? How is it determined? 
# Also, what is the return value of any? in this code and what does it output?

[1, 2, 3].any? do |num|
  puts num
  num.odd?
end

#### ANSWER
#
# - The return value of the block is 'true' if the current element is odd or
#   false if it's even, because of the statement num.odd?
# - The return value of #any? is 'true' if there is at least one element that
#   return 'true' with num.odd?
# - I wrongly thought that the output would have been:
#     1
#     2
#     3
#   but I forgot the nature of truthiness. The block stop iterating whenever
#   it meets a 'true' condition. Then there's no need to go on.
#   In this case the output is: 1


########################### PRACTICE PROBLEM 8

# How does take work? Is it destructive? How can we find out?

arr = [1, 2, 3, 4, 5]
arr.take(2)

#### ANSWER
#
# From documentation:
# "Returns a new Array containing the first n element of self, where n is a 
# non-negative Integer; does not modify self".
#
# In this example, without modifying 'arr', it returns: [1, 2]


########################### PRACTICE PROBLEM 9

# What is the return value of map in the following code? Why?

{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end

#### ANSWER
#
# [nil, 'bear']
#
# 'ant'.size > 3 evaluate to 'false', so there is no value to be returned.
# In such cases 'nil' is returned.
# Then 'bear'.size > 3 evaluate to 'true' and this time we have a value to
# be return, which is 'bear'.


########################### PRACTICE PROBLEM 10

# What is the return value of the following code? Why?

[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end

#### ANSWER
#
# [1, nil, nil]
#
# - num = 1
#   num > 1 evaluate to 'false' so 'num' is returned (else statement)
#   new array = [1]
#
# - num = 2
#   num > 1 evaluate to 'true' so 'puts num' is performed, which return 'nil'
#   new array = [1, nil]
#
# - num = 3
#   num > 1 evaluate to 'true' so 'puts num' is performed, which return 'nil'
#   new array = [1, nil, nil]


########################### SUMMARY

# REMEMBER!
# The key things to think about are:
# - How does the method treat the block's return value?
# - What is the return value of the method? 
# - How can you use the Ruby docs to learn more about a method? 
# - Is the method destructive?
