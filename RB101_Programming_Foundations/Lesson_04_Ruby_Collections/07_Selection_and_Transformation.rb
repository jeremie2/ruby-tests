############# SELECTION AND TRANSFORMATION

# Selection: picking certain elements out of the collection depending
#            on some criterion. (e.g. pick odd integers from an array)
# 
# Transformation: manipulating every element in the collection.
#                 (e.g. increment by 1 all array's elements)
# 
# If there are n-elements in a collection:
# - selection result in n or less elements
# - transformation result in n elements
# 
# Both rely on:
# - a loop
# - a counter
# - a way to retrieve the current value
# - a way to exit loop


############# LOOPING TO SELECT AND TRANSFORM

# EXAMPLE: select all 'g' characters out of a string

alphabet = 'abcdefghijklmnopqrstuvwxyz'
selected_chars = ''
counter = 0

loop do
  current_char = alphabet[counter]

  if current_char == 'g'
    selected_chars << current_char # appends current_char to selected_chars
  end

  counter += 1
  break if counter == alphabet.size
end

selected_chars # => "g"

# 'if' condition determines which values are selected => SELECTION CRITERIA
# 
# 
# EXAMPLE: append an 's' to each string in the array

fruits = ['apple', 'banana', 'pear']
transformed_elements = []
counter = 0

loop do
  current_element = fruits[counter]

  transformed_elements << current_element + 's' # appends transformed string into array

  counter += 1
  break if counter == fruits.size
end

transformed_elements # => ["apples", "bananas", "pears"]

# We don't need an if condition, the entire line is the transformation criteria.
# Also, the transformation has been performed on a new array not on the original.
# 
# It's important to pay attention whether the original collection is mutated
# or a new collection is returned.


############# EXTRACTING TO METHODS

# EXAMPLE: selecting all vowels in a given string with String#include

def select_vowels(str)
  selected_chars = ''
  counter = 0

  loop do
    current_char = str[counter]

    if 'aeiouAEIOU'.include?(current_char)
      selected_chars << current_char
    end

    counter += 1
    break if counter == str.size
  end

  selected_chars
end


# Select the key-value pairs where the value is 'Fruit':

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}


# How would you implement a method like this?

## MY ATTEMPT WITH SOME PEDAC:
# P
# input: hash
# output: hash
# rules: every chosen element has as value 'Fruit'

# E
# select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}

# D
# we want the result to be a new hash 'fruit':
# fruit = {"apple"=>"Fruit", "pear"=>"Fruit"}
# we can't directly loop an hash
# but #keys will give us an array made of keys
# keys = produce.keys = ['apple', 'carrot', 'pear', 'broccoli']
# fruit = {} will be filled with 'produce' values = 'fruit'

# A
#
# - set 'produce' hash
# - define method 'select_fruit'
#   - set 'keys' array made of 'produce' keys
#   - set 'fruit' empty hash
#   - set 'index' = 0
#   - begin loop
#     - 'current_product' = 'keys' element at index 'index'
#     - 'produce_value' = 'produce' element at index 'current_product'
#     - if 'produce_value' = 'Fruit' string
#       - 'fruit' at key 'current_product' = 'Fruit'
#     - end if
#     - add 1 to 'index'
#     - stop loop if 'index' = 'keys' length
#   - end loop
#   - return 'fruit' hash
# - end loop

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}


def select_fruit(general_produce)
  keys = general_produce.keys
  fruit = {}
  index = 0

  loop do
    current_product = keys[index]
    produce_value = general_produce[current_product]
    fruit[current_product] = 'Fruit' if produce_value == 'Fruit'
    index += 1
    break if index == keys.size #!!! this should be moved on top in case of empty{}
  end
  fruit
end

p select_fruit(produce)


#########################
## SOLUTION

def select_fruit(produce_list)
  produce_keys = produce_list.keys
  counter = 0
  selected_fruits = {}

  loop do
    # this has to be at the top in case produce_list is empty hash
    break if counter == produce_keys.size

    current_key = produce_keys[counter]
    current_value = produce_list[current_key]

    if current_value == 'Fruit'
      selected_fruits[current_key] = current_value
    end

    counter += 1
  end

  selected_fruits
end


# EXAMPLE
# with entire transformation within method definition:

def double_numbers(numbers)
  doubled_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    doubled_numbers << current_number * 2

    counter += 1
  end

  doubled_numbers
end

# method can be invoked this way:

my_numbers = [1, 4, 3, 7, 2, 6]
double_numbers(my_numbers)         # => [2, 8, 6, 14, 4, 12]

# This way doesn't change the original array.
# Can you implement a double_numbers! method that mutates its argument?

def double_numbers!(numbers)
  counter = 0

  loop do
    break if counter == numbers.size
    numbers[counter] *= 2
    counter += 1
  end

  numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
puts double_numbers!(my_numbers)  == [2, 8, 6, 14, 4, 12]


# rather than returning a new array, this method returns a reference
# to the (mutated) original array


############# SELECTION AND TRANSFORMATION COMBINED

# A transformation involves elements of a collection.
# It's possible to transform just elements of a collection
# adding 'if' statement.
#
# This example doesn't change the original array:

def double_odd_numbers(numbers)
  doubled_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    current_number *= 2 if current_number.odd?
    doubled_numbers << current_number

    counter += 1
  end

  doubled_numbers
end

# as we can see:

my_numbers = [1, 4, 3, 7, 2, 6]
double_odd_numbers(my_numbers)  # => [2, 4, 6, 14, 2, 6]

# not mutated
my_numbers                      # => [1, 4, 3, 7, 2, 6]

# What if we wanted to transform the numbers based on their position
# in the array rather than their value?
#### Answer: just replace 'if current_number.odd?' with if counter.odd?

# Try coding a solution that doubles the numbers that have odd index:

### MY ATTEMPT

def double_odd_numbers!(numbers)
  counter = 0

  loop do
    break if counter == numbers.size
    numbers[counter] *= 2 if numbers[counter].odd?
    counter += 1
  end

  numbers
end

### SOLUTION

def double_odd_indices!(numbers)
  doubled_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    current_number *= 2 if counter.odd?
    doubled_numbers << current_number

    counter += 1
  end

  doubled_numbers
end

############# MORE FLEXIBLE METHODS

# Taking again the example with where we chose a product from an hash:

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

# we can write a more generic method where we can decide which product
# we would like to pick:

def general_select(produce_list, selection_criteria)
  produce_keys = produce_list.keys
  counter = 0
  selected_produce = {}

  loop do
    break if counter == produce_keys.size

    current_key = produce_keys[counter]
    current_value = produce_list[current_key]

    # used to be current_value == 'Fruit'
    if current_value == selection_criteria
      selected_produce[current_key] = current_value
    end

    counter += 1
  end

  selected_produce
end

# we have just add the 'selection_criteria' parameter and the 'if' statement:
# 'if current_value == selection_criteria'
# we can now easily chose between 'fruit' or 'vegetable':

general_select(produce, 'Fruit')     # => {"apple"=>"Fruit", "pear"=>"Fruit"}
general_select(produce, 'Vegetable') # => {"carrot"=>"Vegetable", "broccoli"=>"Vegetable"}
general_select(produce, 'Meat')      # => {}


# let's update our double_numbers method to not only be able to double the
# values in an array, but to multiply by any number. For example, let's
# create a method called 'multiply' that can take an additional argument to
# determine the transformation criteria.
#
# my_numbers = [1, 4, 3, 7, 2, 6]
# multiply(my_numbers, 3)              # => [3, 12, 9, 21, 6, 18]


def multiply(numbers, multiplier)
  multiplied_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size

    multiplied_numbers << numbers[counter] * multiplier
    counter += 1
  end

  multiplied_numbers
end


# Recall our initial selection example of selecting the letter 'g' out of the
# alphabet. Let's write a method called select_letter, that takes a string and
# returns a new string containing only the letter that we specified. We want
# it to behave like this:

question = 'How many times does a particular character appear in this sentence?'
select_letter(question, 'a') # => "aaaaaaaa"
select_letter(question, 't') # => "ttttt"
select_letter(question, 'z') # => ""

def select_letter(sentence, character)
  selected_chars = ''
  counter = 0

  loop do
    break if counter == sentence.size
    current_char = sentence[counter]

    if current_char == character
      selected_chars << current_char
    end

    counter += 1
  end

  selected_chars
end

# And because select_letter returns a string, if we wanted to, we can continue to
# chain string methods on the return value. Suppose we wanted to find out how many
# times a letter occurs in a sentence, we could use our method above chained with
# String#size, like so:

select_letter(question, 'a').size # => 8
select_letter(question, 't').size # => 5
select_letter(question, 'z').size # => 0

# Note that now the return value of the entire expression is an integer.
