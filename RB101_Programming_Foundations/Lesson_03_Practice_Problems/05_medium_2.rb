# QUESTION 1
#
# Every named entity in Ruby has an object_id. This is a unique identifier
# for that object.
#
# It is often the case that two different things "look the same", but they
# can be different objects. The "under the hood" object referred to by a
# particular named-variable can change depending on what is done to that
# named-variable.
#
# In other words, in Ruby, all values are objects...but they are not always
# the same object.
#
# Predict how the values and object ids will change throughout the flow of
# the code below:

def fun_with_ids
  a_outer = 42
  b_outer = "forty two"
  c_outer = [42]
  d_outer = c_outer[0]

  a_outer_id = a_outer.object_id
  b_outer_id = b_outer.object_id
  c_outer_id = c_outer.object_id
  d_outer_id = d_outer.object_id

  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} before the block."
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} before the block."
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} before the block."
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} before the block."
  puts

  1.times do
    a_outer_inner_id = a_outer.object_id
    b_outer_inner_id = b_outer.object_id
    c_outer_inner_id = c_outer.object_id
    d_outer_inner_id = d_outer.object_id

    puts "a_outer id was #{a_outer_id} before the block and is: #{a_outer_inner_id} inside the block."
    puts "b_outer id was #{b_outer_id} before the block and is: #{b_outer_inner_id} inside the block."
    puts "c_outer id was #{c_outer_id} before the block and is: #{c_outer_inner_id} inside the block."
    puts "d_outer id was #{d_outer_id} before the block and is: #{d_outer_inner_id} inside the block."
    puts

    a_outer = 22
    b_outer = "thirty three"
    c_outer = [44]
    d_outer = c_outer[0]

    puts "a_outer inside after reassignment is #{a_outer} with an id of: #{a_outer_id} before and: #{a_outer.object_id} after."
    puts "b_outer inside after reassignment is #{b_outer} with an id of: #{b_outer_id} before and: #{b_outer.object_id} after."
    puts "c_outer inside after reassignment is #{c_outer} with an id of: #{c_outer_id} before and: #{c_outer.object_id} after."
    puts "d_outer inside after reassignment is #{d_outer} with an id of: #{d_outer_id} before and: #{d_outer.object_id} after."
    puts


    a_inner = a_outer
    b_inner = b_outer
    c_inner = c_outer
    d_inner = c_inner[0]

    a_inner_id = a_inner.object_id
    b_inner_id = b_inner.object_id
    c_inner_id = c_inner.object_id
    d_inner_id = d_inner.object_id

    puts "a_inner is #{a_inner} with an id of: #{a_inner_id} inside the block (compared to #{a_outer.object_id} for outer)."
    puts "b_inner is #{b_inner} with an id of: #{b_inner_id} inside the block (compared to #{b_outer.object_id} for outer)."
    puts "c_inner is #{c_inner} with an id of: #{c_inner_id} inside the block (compared to #{c_outer.object_id} for outer)."
    puts "d_inner is #{d_inner} with an id of: #{d_inner_id} inside the block (compared to #{d_outer.object_id} for outer)."
    puts
  end

  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} BEFORE and: #{a_outer.object_id} AFTER the block."
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} BEFORE and: #{b_outer.object_id} AFTER the block."
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} BEFORE and: #{c_outer.object_id} AFTER the block."
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} BEFORE and: #{d_outer.object_id} AFTER the block."
  puts

  puts "a_inner is #{a_inner} with an id of: #{a_inner_id} INSIDE and: #{a_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"
  puts "b_inner is #{b_inner} with an id of: #{b_inner_id} INSIDE and: #{b_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"
  puts "c_inner is #{c_inner} with an id of: #{c_inner_id} INSIDE and: #{c_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"
  puts "d_inner is #{d_inner} with an id of: #{d_inner_id} INSIDE and: #{d_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"
end

# ANSWER:
#

#### OUTER BLOCK
## these are initial assignments

  a_outer = 42
  b_outer = "forty two"
  c_outer = [42]
  d_outer = c_outer[0]  # => 42

  a_outer_id = a_outer.object_id  # => 85    "just watched id values
  b_outer_id = b_outer.object_id  # => 920   inside pry"
  c_outer_id = c_outer.object_id  # => 940
  d_outer_id = d_outer.object_id  # => 85

#### INSIDE BLOCK
## just passing the object_id of each element in outer-scope to new variables
## no changes here

  a_outer_inner_id = a_outer.object_id  # => 85
  b_outer_inner_id = b_outer.object_id  # => 920
  c_outer_inner_id = c_outer.object_id  # => 940
  d_outer_inner_id = d_outer.object_id  # => 85

## assigning new values to the elements
## this is going to affect outer variables which where first defined out of
## the block

  a_outer = 22                   # a_outer.object_id = 45   "just watched id
  b_outer = "thirty three"       # b_outer.object_id = 960  values inside pry"
  c_outer = [44]                 # c_outer.object_id = 980
  d_outer = c_outer[0]  # => 44  # d_outer.object_id = 89

## passing the values of outer variable to variables defined inside the block

  a_inner = a_outer     # => 22
  b_inner = b_outer     # => "thirty three"
  c_inner = c_outer     # => [44]
  d_inner = c_inner[0]  # => 44

## defining new variables related to ID of variable created inside the block

  a_inner_id = a_inner.object_id  # => 45
  b_inner_id = b_inner.object_id  # => 960
  c_inner_id = c_inner.object_id  # => 980
  d_inner_id = d_inner.object_id  # => 89

## Every 'puts' statements used till now just worked because from the inner
## scope is possible to deal with variable defined in outer scope.

#### OUTSIDE BLOCK

# 'puts' statements related to variables created inside the block will not
# work, because those variables can't be accessed from outer scope.
# All the "a_inner..." variables can't be accessed in the last sequence of
# puts.


# SOLUTION
#
# a_outer is 42 with an id of: 85 before the block.
# b_outer is forty two with an id of: 2152729580 before the block.
# c_outer is [42] with an id of: 2152729540 before the block.
# d_outer is 42 with an id of: 85 before the block.
#
# Notice that Ruby re-used the "42 object with id 85" when the value was
# the same.
#
# a_outer id was 85 before the block and is: 85 inside the block.
# b_outer id was 2152729580 before the block and is: 2152729580 inside the block.
# c_outer id was 2152729540 before the block and is: 2152729540 inside the block.
# d_outer id was 85 before the block and is: 85 inside the block.
#
# Notice that Ruby did NOT change the id for any of the objects between
# outside and inside the block
#
# a_outer inside after reassignment is 22 with an id of: 85 before and: 45 after.
# b_outer inside after reassignment is thirty three with an id of: 2152729580 before and: 2152728320 after.
# c_outer inside after reassignment is [44] with an id of: 2152729540 before and: 2152728280 after.
# d_outer inside after reassignment is 44 with an id of: 85 before and: 89 after.
#
# Notice that changing the values has forced Ruby to create new objects and
# refer to them with the original variable names.
#
# a_inner is 22 with an id of: 45 inside the block (compared to 45 for outer).
# b_inner is thirty three with an id of: 2152728320 inside the block (compared to 2152728320 for outer).
# c_inner is [44] with an id of: 2152728280 inside the block (compared to 2152728280 for outer).
# d_inner is 44 with an id of: 89 inside the block (compared to 89 for outer).
#
# Notice that Ruby re-uses the objects under the hood when it can, but uses
# different ones for different values.
#
# a_outer is 22 with an id of: 85 BEFORE and: 45 AFTER the block.
# b_outer is thirty three with an id of: 2152729580 BEFORE and: 2152728320 AFTER the block.
# c_outer is [44] with an id of: 2152729540 BEFORE and: 2152728280 AFTER the block.
# d_outer is 44 with an id of: 85 BEFORE and: 89 AFTER the block.
# (notice that each variable keeps its new object/object_id even when we leave the block.)
#
# => "ugh ohhhhh"
#
# Notice that once we leave the block, those variables that were defined inside
# the block lose their meaning.

########################################################


# QUESTION 2
#
# Let's look at object id's again from the perspective of a method call
# instead of a block.
#
# Here we haven't changed ANY of the code outside or inside of the
# block/method. We simply took the contents of the block from the previous
# practice problem and moved it to a method, to which we are passing all of
# our outer variables.
#
# Predict how the values and object ids will change throughout the flow of
# the code below:

def fun_with_ids
  a_outer = 42
  b_outer = "forty two"
  c_outer = [42]
  d_outer = c_outer[0]

  a_outer_id = a_outer.object_id
  b_outer_id = b_outer.object_id
  c_outer_id = c_outer.object_id
  d_outer_id = d_outer.object_id

  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} before the block."
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} before the block."
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} before the block."
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} before the block."
  puts

  an_illustrative_method(a_outer, b_outer, c_outer, d_outer, a_outer_id, b_outer_id, c_outer_id, d_outer_id)


  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} BEFORE and: #{a_outer.object_id} AFTER the method call."
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} BEFORE and: #{b_outer.object_id} AFTER the method call."
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} BEFORE and: #{c_outer.object_id} AFTER the method call."
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} BEFORE and: #{d_outer.object_id} AFTER the method call."
  puts

  puts "a_inner is #{a_inner} with an id of: #{a_inner_id} INSIDE and: #{a_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh"
  puts "b_inner is #{b_inner} with an id of: #{b_inner_id} INSIDE and: #{b_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh"
  puts "c_inner is #{c_inner} with an id of: #{c_inner_id} INSIDE and: #{c_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh"
  puts "d_inner is #{d_inner} with an id of: #{d_inner_id} INSIDE and: #{d_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh"
  puts
end


def an_illustrative_method(a_outer, b_outer, c_outer, d_outer, a_outer_id, b_outer_id, c_outer_id, d_outer_id)

  puts "a_outer id was #{a_outer_id} before the method and is: #{a_outer.object_id} inside the method."
  puts "b_outer id was #{b_outer_id} before the method and is: #{b_outer.object_id} inside the method."
  puts "c_outer id was #{c_outer_id} before the method and is: #{c_outer.object_id} inside the method."
  puts "d_outer id was #{d_outer_id} before the method and is: #{d_outer.object_id} inside the method."
  puts

  a_outer = 22
  b_outer = "thirty three"
  c_outer = [44]
  d_outer = c_outer[0]

  puts "a_outer inside after reassignment is #{a_outer} with an id of: #{a_outer_id} before and: #{a_outer.object_id} after."
  puts "b_outer inside after reassignment is #{b_outer} with an id of: #{b_outer_id} before and: #{b_outer.object_id} after."
  puts "c_outer inside after reassignment is #{c_outer} with an id of: #{c_outer_id} before and: #{c_outer.object_id} after."
  puts "d_outer inside after reassignment is #{d_outer} with an id of: #{d_outer_id} before and: #{d_outer.object_id} after."
  puts

  a_inner = a_outer
  b_inner = b_outer
  c_inner = c_outer
  d_inner = c_inner[0]

  a_inner_id = a_inner.object_id
  b_inner_id = b_inner.object_id
  c_inner_id = c_inner.object_id
  d_inner_id = d_inner.object_id

  puts "a_inner is #{a_inner} with an id of: #{a_inner_id} inside the method (compared to #{a_outer.object_id} for outer)."
  puts "b_inner is #{b_inner} with an id of: #{b_inner_id} inside the method (compared to #{b_outer.object_id} for outer)."
  puts "c_inner is #{c_inner} with an id of: #{c_inner_id} inside the method (compared to #{c_outer.object_id} for outer)."
  puts "d_inner is #{d_inner} with an id of: #{d_inner_id} inside the method (compared to #{d_outer.object_id} for outer)."
  puts
end

# ANSWER:
#

#### OUTER METHOD 
## these are initial assignments

a_outer = 42
b_outer = "forty two"
c_outer = [42]
d_outer = c_outer[0]  # => 42

a_outer_id = a_outer.object_id  # => 85    "just watched id values
b_outer_id = b_outer.object_id  # => 920   inside pry"
c_outer_id = c_outer.object_id  # => 940
d_outer_id = d_outer.object_id  # => 85

#### INSIDE METHOD 
#
def an_illustrative_method(a_outer, b_outer, c_outer, d_outer, a_outer_id, b_outer_id, c_outer_id, d_outer_id)

# every variable has been passed by reference to method as argument.
# This way every 'puts' statement returns the initial values of
# a_outer, a_outer_id, etc.. as the variables inside the method are pointing
# to the same values of the variables outside.

#### NEW ASSIGNMENT

a_outer = 22
b_outer = "thirty three"
c_outer = [44]
d_outer = c_outer[0]  # => 44

# New assignments brake the reference to the original value.
# This happens anyway with integers (a_outer, d_outer) because they are
# not mutable. But for strings and arrays like b_outer and c_outer
# this means that starting from now inside the methods it will not be possible
# to change the value in the outer scope.

a_inner = a_outer     # => 22
b_inner = b_outer     # => "thirty three"
c_inner = c_outer     # => [44]
d_inner = c_inner[0]  # => 44

a_inner_id = a_inner.object_id  # => 45
b_inner_id = b_inner.object_id  # => 960
c_inner_id = c_inner.object_id  # => 980
d_inner_id = d_inner.object_id  # => 89

#### OUTER METHOD 
# 
# Variable values and ID values should be like the initial values.
# The last sequence of 'puts' statements should fail as inside it
# local variable created inside the method can't be accessed.


# SOLUTION
#
# a_outer is 42 with an id of: 85 before the block.
# b_outer is forty two with an id of: 2152753560 before the block.
# c_outer is [42] with an id of: 2152753540 before the block.
# d_outer is 42 with an id of: 85 before the block.
#
# Notice that this works the same as before. No big surprise.
#
# a_outer id was 85 before the method and is: 85 inside the method.
# b_outer id was 2152753560 before the method and is: 2152753560 inside the method.
# c_outer id was 2152753540 before the method and is: 2152753540 inside the method.
# d_outer id was 85 before the method and is: 85 inside the method.
#
# This is also the same as before. These "outers" are NOT the same variables
# as those outside, Ruby is simply re-using the objects, as these new variables
# have the same values as the ones outside.
#
# a_outer inside after reassignment is 22 with an id of: 85 before and: 45 after.
# b_outer inside after reassignment is thirty three with an id of: 2152753560 before and: 2152752300 after.
# c_outer inside after reassignment is [44] with an id of: 2152753540 before and: 2152752280 after.
# d_outer inside after reassignment is 44 with an id of: 85 before and: 89 after.
#
# As before with the block version of this practice problem, when we change
# the values of our "outers", Ruby uses new objects for these variables to
# deal with their new values.
#
# One important difference to note is that before, we saw Ruby re-using the
# "42" object and just giving it a new value inside the block. Why the
# difference? It should become clear a couple of paragraphs later in this
# solution...
#
# a_inner is 22 with an id of: 45 inside the method (compared to 45 for outer).
# b_inner is thirty three with an id of: 2152752300 inside the method (compared to 2152752300 for outer).
# c_inner is [44] with an id of: 2152752280 inside the method (compared to 2152752280 for outer).
# d_inner is 44 with an id of: 89 inside the method (compared to 89 for outer).
#
# No big surprise here...Ruby is re-using objects that have the same values...
#
# a_outer is 42 with an id of: 85 BEFORE and: 85 AFTER the method call.
# b_outer is forty two with an id of: 2152753560 BEFORE and: 2152753560 AFTER the method call.
# c_outer is [42] with an id of: 2152753540 BEFORE and: 2152753540 AFTER the method call.
# d_outer is 42 with an id of: 85 BEFORE and: 85 AFTER the method call.
#
# Wow, look at that. Even though we changed the values of our "outer" variables
# inside the method call, we still have the same values and the same object
# id's down here AFTER the method call as we had before it!
#
# This is because our method call accepts VALUES as arguments. The names we
# give to those values in the definition of our method are SEPARATE from any
# other use of those same names.
#
# We used the same names there for convenience (and admittedly to build some
# suspense and allow us to clarify this point). We could just as easily have
# called the first parameter of our method definition a_Fred instead of a_outer.
#
# The method gets the VALUES of the arguments we pass, but the parameter
# variables inside the method have no other relationship to those outside
# of the method. The names were coincidental, and confusing in a useful way.
#
# => "ugh ohhhhh"
#
# Our main method STILL has no access to variables that are defined inside
# of the method.

########################################################


# QUESTION 3
#
# Let's call a method, and pass both a string and an array as arguments and
# see how even though they are treated in the same way by Ruby, the results
# can be different.
#
# Study the following code and state what will be displayed...and why:

def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# ANSWER
#
# My string looks like this now: pumpkins
# My array looks like this now: ['pumpkins', 'rutabaga']
#
# WHY:
#
#  my_string = "pumpkins"
#
# because we pass my_string as a parameter to tricky_method. This means:
# a_string_param = my_string
# Initially both variable are referring to the same value, but after this
# new assignment:
# a_string_param += "rutabaga"
# a_string_param will point to a different values, and this cannot affect
# my_string-
# 
#  my_array = ['pumpkins', 'rutabaga']
#
# my_array changes because inside the method we are using << which is going
# to mutate the original values (the value to which both, my_array and
# an_array_param are pointing).

########################################################


# QUESTION 4
#
# To drive that last one home...let's turn the tables and have the string
# show a modified output, while the array thwarts the method's efforts to
# modify the caller's version of it.

def tricky_method_two(a_string_param, an_array_param)
  a_string_param << 'rutabaga'
  an_array_param = ['pumpkins', 'rutabaga']
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method_two(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# ANSWER
#
# My string looks like this now: pumpkinsrutabaga
# My array looks like this now: ['pumpkins']
#
# WHY:
#
#  my_string = "pumpkinsrutabaga"
#  my_array = ['pumpkins']
#
# The explanation is still the same but this time inside the method
# we are using a method (<<) that mutate the original values of the string,
# while for the array we are performing an assignment.
# THen the original string variable changes, the original array variable is
# still the same.

########################################################


# QUESTION 5
#
# Depending on a method to modify its arguments can be tricky:

def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# Whether the above "coincidentally" does what we think we wanted "depends"
# upon what is going on inside the method.
#
# How can we change this code to make the result easier to predict and easier
# for the next programmer to maintain?

# ANSWER
#
# It depends what is required...
#
# EXAMPLE 1
# We want to modify the original variables directly:

def tricky_method(a_string_param, an_array_param)
  a_string_param << 'rutabaga'
  an_array_param << 'rutabaga'
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# EXAMPLE 2
# We don't want to change the original variables:

def tricky_method(a_string_param, an_array_param)
  a_string_param += 'rutabaga'
  an_array_param += ['rutabaga']

  return a_string_param, an_array_param   # Stuck here! Didn't know how to
end                                       # return 2 different values! :(

my_string = "pumpkins"
my_array = ["pumpkins"]
new_string, new_array = tricky_method(my_string, my_array)

puts "My string looks like this now: #{new_string}"
puts "My array looks like this now: #{new_array}"

# FROM SOLUTION
#
# Every language (Ruby included) provides ways and means of writing "clever"
# code that depends on some of the less obvious traits of the language.
#
# Every good programmer practices these tricks...and then AVOIDS THEM LIKE
# THE PLAGUE.
#
# CLEVER PROGRAMMERS DON'T WRITE "CLEVER" CODE. THEY WRITE EXPLICIT CODE THAT
# IS EASY TO READ, DEBUG AND MODIFY AS THE REQUIREMENTS CHANGE.

########################################################


# QUESTION 6
#
# How could the unnecessary duplication in this method be removed?

def color_valid(color)
  if color == "blue" || color == "green"
    true
  else
    false
  end
end

# ANSWER
#
def color_valid(color)
  color == "blue" || color == "green"
end
