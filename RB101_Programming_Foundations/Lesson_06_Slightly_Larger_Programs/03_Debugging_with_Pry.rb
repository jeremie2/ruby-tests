
##### BUGS AND DEBUGGING

# - Bugs: human errors in code.
# - Debugging: process of identifying and fix bugs.


##### TYPES OF ERRORS

# - SYNTAX ERRORS: 
# missing character, misspell keywords, etc.. code not conform to the grammar of 
# the program language. (Generally stops your code from functioning).

a = true

if a
  puts 'It's true!'  # fix: 'It\'s true!'
end

  # syntax error, unexpected local variable or method, expecting `end'
  #   puts 'It's true!'
  #             ^
  # unterminated string meets end of file
  # syntax error, unexpected end-of-input, expecting `end'

# - LOGICAL ERRORS: code is syntactically correct but the result is not expected.
#                   Wrong implementation.

puts "please pick up an option: 1 or 2"
user_input = gets.chomp

if user_input == 1
  puts "You picked option 1"
elsif user_input == 2
  puts "You picked option 2"
else
  puts "Invalid option!"
end

  # It will always display "Invalid option!" because user_input is not converted
  # to integer or the comparison should be performed with strings '1' and '2'.
  #  
  # But let's see pry debugger in action running the same script with these
  # modifications:

require 'pry'

puts "please pick up an option: 1 or 2"
user_input = gets.chomp
binding.pry
if user_input == 1
  puts "You picked option 1"
elsif user_input == 2
  puts "You picked option 2"
else
  puts "Invalid option!"
end

# pry interactive shell appear and it's now possible to investigate the variables:

  # pry(main)> user_input
  # => "1"
  # pry(main)> user_input == 1
  # => false
  # pry(main)> user_input > 1
  # ArgumentError: comparison of String with 1 failed
  # pry(main)> user_input.class
  # => String

# It's now clear that user_input is a string while comparison is performed
# with an integer.


##### WHAT IS PRY?

# - a Rubygem
# - a REPL (read evaluate print loop), an interactive environment.
#   - takes user input
#   - evaluates the input
#   - returns the result
#   - loops back to the start

# To understand how pry works let's see this script:

loop do
  p eval gets
end

# #eval evaluates the expression inside a string 
# eval '2+2'  #=> 4
# a = 'cia'
# b = 'o'
# eval 'a+b'  #=> "ciao"

# Running the script above we start something similar to a pry session.
# 2+2            # input
# 4
# 3+3            # input
# 6
# puts 'hello'   # input
# hello
# nil
# exit           # input


# With pry its possible to access methods of data types:

  # pry(main)> arr = [1, 2, 3]
  # => [1, 2, 3]
  # pry(main)> cd arr
  # pry(#<Array>):1> 

  # pry(main)> arr = [1, 2, 3]
  # => [1, 2, 3]
  # pry(main)> cd arr
  # [3] pry(#<Array>):1> ls
  # Enumerable#methods: 
  #   chain  chunk_while     detect     each_entry  each_with_index....
  # Array#methods: 
  #   &    []      bsearch        compact!     delete_if   empty?.....   
  # self.methods: __pry__
  # locals: _  __  _dir_  _ex_  _file_  _in_  _out_  pry_instance

# in that context we can run methods on 'arr':

  # pry(#<Array>):1> first
  # => 1
  # pry(#<Array>):1> last
  # => 3
  # pry(#<Array>):1> reverse
  # => [3, 2, 1]

# and look at methods documentation:
  
  # show-doc map   # it doesn't work in my case

# to switch views:
  
  # pry(#<Array>):1> cd ..
  # pry(main)>
  # pry(main)> .
  # pry(#<Array>):1>
  # pry(#<Array>):1> cd /
  # pry(main)>


##### PRY AT RUNTIME - binding.pry

# A 'binding' contains references to any variables that were in scope at
# the point where it was created.
# pry interrupts program execution and opens the binding so that we can
# inspect variables.

require 'pry'

a = 1
b = 2
binding.pry
c = 3

  # [1] pry(main)> a
  # => 1
  # [2] pry(main)> b
  # => 2
  # [3] pry(main)> c
  # => nil


require 'pry'

def my_method(num)
  a = 1
  binding.pry
  b = 2
end

c = 3

my_method(c)

  # [1] pry(main)> a
  # => 1
  # [2] pry(main)> b
  # => nil
  # [3] pry(main)> c
  # NameError: undefined local variable or method `c' for main:Object
  # from (pry):3:in `my_method'

# c is out of scope.


require 'pry'

def double_num(num)
  num * 2
end

arr = [1, 2, 3].map do |num|
  double_num(num)
  binding.pry
end

p arr

  # [1] pry(main)> num
  # => 1
  # [2] pry(main)> double_num(num)
  # => 2


require 'pry'

a = 0
b = 0

loop do
  a += 1
  binding.pry
  b += 1
  break if b >= 3
end

  # [1] pry(main)> a
  # => 1
  # [2] pry(main)> b
  # => 0
  # [3] pry(main)> exit     # or ctrl+D
  # [1] pry(main)> a
  # => 2
  # [2] pry(main)> b
  # => 1


require 'pry'

def select_nums(arr)
  new_arr = []
  arr.each do |num|
    binding.pry
    new_arr << num if num.odd? && num <= 15 || num % 3 == 0
  end
  new_arr
end

p select_nums([1, 2, 5, 6, 9, 12, 15, 17, 19, 21]) == [1, 5, 9, 15, 21]  # false
p select_nums([6, 12, 18]) == []                                         # false
p select_nums([3, 5, 7, 11, 15, 21]) == [3, 5, 7, 11, 15, 21]            # true

  # [1] pry(main)> new_arr
  # => []
  # [2] pry(main)> num
  # => 1
  # [3] pry(main)> arr
  # => [1, 2, 5, 6, 9, 12, 15, 17, 19, 21]
  # [4] pry(main)> num.odd?
  # => true
  # [5] pry(main)> num <= 15
  # => true

  # [6] pry(main)> exit

  # [1] pry(main)> new_arr
  # => [1]
  # [3] pry(main)> num
  # => 2

# It turned out that the description of the exercise wasn't clear. The condition
# should have been:
# num if num.odd? && (num <= 15 || num % 3 == 0)
# In that case all 3 comparisons return 'true'.


##### PRY-BYEBUG

# Similar to pry-nav and pry-debug 

# Extends the pry with:
# - next
# - step
# - continue

## NEXT

require 'pry'
require 'pry-byebug'

def fizzbuzz(arr)
  arr.map do |num|
    binding.pry
    if num % 5 == 0 && num % 3 == 0
      'FizzBuzz'
    elsif num % 5 == 0
      'Buzz'
    elsif num % 3 == 3            # bug: it should be == 0
      'Fizz'
    else
      num
    end
  end
end

a = [1, "Fizz", "Buzz", "Fizz", 7, 8, "Buzz", "Fizz", "FizzBuzz", "Fizz"]

p fizzbuzz([1, 3, 5, 6, 7, 8, 10, 3, 15, 9]) == a

# With 'next' command we see the side arrow jumping through the conditional
# from line 9 to line 11... etc..

     6: def fizzbuzz(arr)
     7:   arr.map do |num|
     8:     binding.pry
 =>  9:     if num % 5 == 0 && num % 3 == 0
    10:       'FizzBuzz'
    11:     elsif num % 5 == 0
    12:       'Buzz'
    13:     elsif num % 3 == 3
    14:       'Fizz'
    15:     else
    16:       num
    17:     end
    18:   end
    19: end


     6: def fizzbuzz(arr)
     7:   arr.map do |num|
     8:     binding.pry
     9:     if num % 5 == 0 && num % 3 == 0
    10:       'FizzBuzz'
 => 11:     elsif num % 5 == 0
    12:       'Buzz'
    13:     elsif num % 3 == 3
    14:       'Fizz'
    15:     else
    16:       num
    17:     end
    18:   end
    19: end

# When we are at the 2nd iteration num = 3. Going on with 'next' we reach
# line 13:

 => 13:     elsif num % 3 == 3

# if the code were correct (== 0), we should expect the conditional to be
# satisfied and running 'next' will move the arrow should move to line 14
# like this:

 => 14:       'Fizz'

# But the arrow jumps to line 16:

 => 16:       num

# which mean something is wrong in the code (num % 3 == 3)


## CONTINUE and STEP

require 'pry'
require 'pry-byebug'

def double_num(num)
  num + 2            # bug, it should be: num * 2
end


def double_evens(arr)
  arr.map do |num|
    binding.pry
    new_num = num.even? ? double_num(num) : num
  end
end

p double_evens([1, 2, 3, 4, 5]) == [1, 4, 3, 8, 5]

# We run the script and we notice that something is wrong. At the 4th iteration: 

pry(main)> num
=> 4

# but performing double_num(num):

pry(main)> double_num(num)
=> 6

# it should have been 8.
# We can use 'continue' to quickly jump to next iteration.
# The arrow is now on line 14:

 => 14:     new_num = num.even? ? double_num(num) : num

# Let's run 'step':

pry(main)> step

From: ~/a.rb:7 Object#double_num:

    6: def double_num(num)
 => 7:   num + 2
    8: end

# As the condition is satisfied double_num(num) is going to be performed.
# 'step' jumps to straight to double_num(num) method, where we can see which
# operation has been performed (+ 2) instead of (* 2).
