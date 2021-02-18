
# QUESTION 1
#
# What do you expect to happen when the greeting variable is referenced
# in the last line of the code below?

if false
  greeting = "hello world"
end

greeting

# ANSWER:
#
# I was expecting an 'undefined variable error' but running the code
# everything was fine. (By the way, code doesn't return anything.)
# Anyway, inside if/else, even if it's not used a variable is initialized
# at list to 'nil'.

# SOLUTION:
#
# greeting is nil here, and no "undefined method or local variable" exception
# is thrown. Typically, when you reference an uninitialized variable, Ruby
# will raise an exception, stating that it’s undefined. However, when you
# initialize a local variable within an if block, even if that if block doesn’t
# get executed, the local variable is initialized to nil.

########################################################


# QUESTION 2
#
# What is the result of the last line in the code below?

greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings

# ANSWER:
#
puts greetings  #  => { a: 'hi there' }

# greetings[:a] and informal_greeting share the same memory address.
# informal_greeting << ' there' is going to modify what is stored in that
# memory address... then also greetings[:a] is affected.

# FROM SOLUTION:
#
# Of course to avoid this situation creating a new string object doing: 
# informal_greeting = informal_greeting + ' there'
# But...
# it's also possible to create a reference to a new object doing:
# informal_greeting = greetings[:a].clone

########################################################


# QUESTION 3
#
# In other practice problems, we have looked at how the scope of variables
# affects the modification of one "layer" when they are passed to another.
#
# To drive home the salient aspects of variable scope and modification of
# one scope by another, consider the following similar sets of code.
#
# What will be printed by each of these code groups?

#:::::::::::::::::: A

def mess_with_vars(one, two, three)
  one = two
  two = three
  three = one
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

# ANSWER:
#
# one is: one
# two is: two
# three is: three
# 
# Variables don't change.
# Inside the method there are new assignment, the original values
# is not modified.

#:::::::::::::::::: B

def mess_with_vars(one, two, three)
  one = "two"
  two = "three"
  three = "one"
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

# ANSWER:
#
# one is: one
# two is: two
# three is: three
# 
# Same as before, variables don't change.
# Inside the method there are new assignment, the original values
# is not modified.

#:::::::::::::::::: C

def mess_with_vars(one, two, three)
  one.gsub!("one","two")
  two.gsub!("two","three")
  three.gsub!("three","one")
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

# ANSWER:
#
# one is: two
# two is: three
# three is: one
# 
# This time variables will change.
# Inside the method gsub! is used which modify the original values.

########################################################


# QUESTION 4
#
# Ben was tasked to write a simple ruby method to determine if an input
# string is an IP address representing dot-separated numbers. e.g.
# "10.4.5.11". He is not familiar with regular expressions. Alyssa supplied
# Ben with a  method called is_an_ip_number? that determines if a string is
# a numeric string between 0 and 255 as required for IP numbers and asked
# Ben to use it.

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    break unless is_an_ip_number?(word)
  end
  return true
end

# Alyssa reviewed Ben's code and says "It's a good start, but you missed a
# few things. You're not returning a false condition, and you're not handling
# the case that there are more or fewer than 4 components to the IP address
# (e.g. "4.5.5" or "1.2.3.4.5" should be invalid)."
#
# Help Ben fix his code.

# ANSWER:
#
# I wrote also a is_an_ip_number method:

def is_an_ip_number?(word)
  word.to_i.to_s == word && word.to_i >= 0 && word.to_i <= 255
end

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false if dot_separated_words.size != 4
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false if is_an_ip_number?(word) == false
  end
  return true
end

# OK, basically almost the same as the solution with some ugly spot
# here and there but working...

# SOLUTION:
#
def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false unless dot_separated_words.size == 4

  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_an_ip_number?(word)
  end

  true
end
