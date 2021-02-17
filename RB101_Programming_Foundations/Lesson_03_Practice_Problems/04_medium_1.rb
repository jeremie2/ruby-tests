# QUESTION 1
#
# Let's do some "ASCII Art" (a stone-age form of nerd artwork from back in
# the days before computers had video screens).
#
# For this practice problem, write a one-line program that creates the
# following output 10 times, with the subsequent line indented 1 space to
# the right:
#
# The Flintstones Rock!
#  The Flintstones Rock!
#   The Flintstones Rock!

# ANSWER:
#

(0..9).each { |i| puts (' ' * i) + 'The Flintstones Rock!' }

# SOLUTION
#
10.times { |number| puts (" " * number) + "The Flintstones Rock!" }

########################################################


# QUESTION 2
#
# The result of the following statement will be an error:

puts "the value of 40 + 2 is " + (40 + 2)

# Why is this and what are two possible ways to fix this?

# ANSWER:
#
# We can't concatenate string with integer. We have to convert integer:

puts "the value of 40 + 2 is " + (40 + 2).to_s

# SOLUTION
#
# or interpolation:

puts "the value of 40 + 2 is #{40 + 2}"

########################################################


# QUESTION 3
#
# Alan wrote the following method, which was intended to show all of the
# factors of the input number:

def factors(number)
  divisor = number
  factors = []
  begin
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end until divisor == 0
  factors
end

# Alyssa noticed that this will fail if the input is 0, or a negative number,
# and asked Alan to change the loop. How can you make this work without using
# begin/end/until? Note that we're not looking to find the factors for 0 or
# negative numbers, but we just want to handle it gracefully instead of raising
# an exception or going into an infinite loop.

# Bonus 1
# What is the purpose of the number % divisor == 0 ?
#
# Bonus 2
# What is the purpose of the second-to-last line (line 8) in the method (the
# factors before the method's end)?

# ANSWER:
#
# - number = number.abs turns negative numbers into positive
# - (div + 1) to avoid ZeroDivideError, div = 0 → 1 → 2 → etc..
#
def factors(number)
  number = number.abs
  factors = []
  number.times { |div| factors << number / (div + 1) if number % (div + 1) == 0 }
  factors
end

# Bonus 1
# 'number % divisor == 0' tells there is no rest in a division.

# Bonus 2
# It's written 'factors' but it actually means 'return factors'.
# In Ruby you can omit the 'return' statement.
# This method return an array of factors, so after all the operations it returns
# the result.

# SOLUTION
#
# While loop. Brilliant because it avoid at all 0 or negative inputs
# returning just an empty array 'factors'.
#
def factors(number)
  divisor = number
  factors = []
  while divisor > 0 do
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end
  factors
end
# Bonus Answer 1
# Allows you to determine if the result of the division is an integer number
# (no remainder).

# Bonus Answer 2
# This is what is the actual return value from the method. Recall that without
# an explicit return statement in the code, the return value of the method is
# the last statement executed. If we omitted this line, the code would execute,
# but the return value of the method would be nil.

########################################################


# QUESTION 4
#
# Alyssa was asked to write an implementation of a rolling buffer. Elements
# are added to the rolling buffer and if the buffer becomes full, then new
# elements that are added will displace the oldest elements in the buffer.

# She wrote two implementations saying, "Take your pick. Do you like << or
# + for modifying the buffer?". Is there a difference between the two, other
# than what operator she chose to use to add an element to the buffer?

def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

# ANSWER:
#
# Yes there's a difference between << or +:
# << is going to change the original buffer
# + will add elements to a copy of the buffer

########################################################


# QUESTION 5
#
# Alyssa asked Ben to write up a basic implementation of a Fibonacci calculator.
# A user passes in two numbers, and the calculator will keep computing the
# sequence until some limit is reached.

# Ben coded up this implementation but complained that as soon as he ran it,
# he got an error. Something about the limit variable. What's wrong with the
# code?

limit = 15

def fib(first_num, second_num)
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1)
puts "result is #{result}"

# How would you fix this so that it works?

# ANSWER:
#
# Inside the method there's an undefined variable: 'limit'.
# One way to fix the problem is to move it inside the method definition:

def fib(first_num, second_num)
  limit = 15
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

# Another way is living 'limit' outside the method but passing to it as
# argument:
def fib(first_num, second_num, limit)
  ...
end

result = fib(0, 1, limit)

########################################################


# QUESTION 6
#
# What is the output of the following code?

answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8

# ANSWER:
#
# 34

########################################################


# QUESTION 7
#
# One day Spot was playing with the Munster family's home computer and
# he wrote a small program to mess with their demographic data:

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
end

# After writing this method, he typed the following...and before Grandpa
# could stop him, he hit the Enter key with his tail:

mess_with_demographics(munsters)

# Did the family's data get ransacked? Why or why not?

# ANSWER:
#
# Yes because hashes/arrays are mutable.
# An hash passed to a method does point to the original hash unless
# inside a method you create a copy of it and work on it.

# SOLUTION
#
# Spot will find himself in the "dog" house for this one. The family's data
# is all in shambles now.
#
# Why? Remember that in Ruby, what gets passed to a method isn't the value of
# the object. Under the hood, Ruby passes the object_id of each argument to the 
# method. The method stores these object_id's internally in locally scoped
# (private to the method) variables (named per the method definition's parameter
# list).
#
# So Spot's demo_hash starts off pointing to the munsters hash. His program
# could wind up replacing that with some other object id and then the family's
# data would be safe.
#
# In this case, the program does not reassign demo_hash -- it just uses it as-is.
# So the actual hash object that is being messed with inside of the method IS the
# munsters hash.

########################################################


# QUESTION 8
#
# Method calls can take expressions as arguments. Suppose we define a method
# called rps as follows, which follows the classic rules of rock-paper-scissors
# game, but with a slight twist that it declares whatever hand was used in the
# tie as the result of that tie.

def rps(fist1, fist2)
  if fist1 == "rock"
    (fist2 == "paper") ? "paper" : "rock"
  elsif fist1 == "paper"
    (fist2 == "scissors") ? "scissors" : "paper"
  else
    (fist2 == "rock") ? "rock" : "scissors"
  end
end

# What is the result of the following call?

puts rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock")

# ANSWER:
#
# 'paper'
#
puts rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock")
#                                       ----------------
#                                              |
         puts rps(rps(rps("rock", "paper"), "rock"), "rock")
#                          -------------
#                                |
                 puts rps(rps("paper", "rock"), "rock")
#                              --------------
#                                     |
                          puts rps("paper", "rock")
#                                   --------------
#                                          |
                                   puts "paper"

########################################################


# QUESTION 9
#
# Consider these two simple methods:

def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end

# What would be the return value of the following method invocation?

bar(foo)

# ANSWER:
#
# 'no'
