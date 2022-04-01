
########## COLLECTIONS BASICS

# Collections are made up of individual elements.


########## STRINGS

# A string is a collection made of character.
#
# To represent each character of a string, we can use the index,
# starting from 0 (first element), adding 1 unit for each elements:

str = 'abcdefghi'
str[2]              # => "c"

# we can also represent more character this way:
# str[starting_ch, number_of_ch]
# example:

str[2, 3] # => "cde"
          # starting from 'c'
          # total 3 chars 'cde'

# This is actually an alias of String#slice method str.slice(2, 3).
# We can also use index for a slice:

str[2, 3][0] # => "c"

# How would you reference 'grass' from within this string?
str = 'The grass is green'
# answer
str[4, 5]


########## ARRAY

# Arrays are lists of elements that are ordered by index.
# Arrays use an integer-based index to maintain the order of its elements.
# Strings and arrays, although they are different object with different
# method, have a lot in common:

arr = ['a', 'b', 'c', 'd', 'e', 'f', 'g']
arr[2]                                      # => "c"

# What do you think would be returned here?

arr = ['a', 'b', 'c', 'd', 'e', 'f', 'g']
arr[2, 3]                                   # => ['c', 'd', 'e']
arr[2, 3][0]                                # => "c"

# Array#slice does with arrays something similar String#slice does with strings.
# Array#slice return a new array except when the second parameter is missing.
# In that case it returns a string character:

arr = [1, 'two', :three, '4']
arr.slice(3, 1)                 # => ["4"]
arr.slice(3..3)                 # => ["4"]
arr.slice(3)                    # => "4"


########## HASH

# Hashes are collection data structures that use key-value pairs:

hsh = { 'fruit' => 'apple', 'vegetable' => 'carrot' }

hsh['fruit']           # => "apple"
hsh['fruit'][0]        # => "a"

# The keys must be unique:
hsh = { 'fruit' => 'apple', 'vegetable' => 'carrot', 'fruit' => 'pear' }
# rises:warning: key "fruit" is duplicated and overwritten on line 7
# but it's not a problem if values are duplicated.
=> {"fruit"=>"pear", "vegetable"=>"carrot"}


##### KEY - VALUE METHODS

# Key and values can be accessed

country_capitals = { uk: 'London', france: 'Paris', germany: 'Berlin' }
country_capitals.keys      # => [:uk, :france, :germany]
country_capitals.values    # => ["London", "Paris", "Berlin"]
country_capitals.values[0] # => "London"


########## GOTCHAS

##### OUT OF BOUNDS INDICES

str = 'abcde'
arr = ['a', 'b', 'c', 'd', 'e']

# As expected this is what the use of 'internal' indexes return:

str[2] # => "c"
arr[2] # => "c"

# what if the index is out of bound?

str[5] # => nil
arr[5] # => nil

# If we are dealing with strings it's quite obvious that a returned nil value
# tells us there should be an error.
# But for an array nill could be an element of the array:

arr = [3, 'd', nil]

# how can we prevent possible errors?
# Array#fetch rises IndexError if we are outside bound:

arr.fetch(2) # => nil
arr.fetch(3) # => IndexError: index 3 outside of array bounds...

# It's mostly better to use #fetch instead #[] even if #[] is more popular.
# Anyway the main thing is to be careful if an element of an array return nil.


##### NEGATIVE INDICES

# Negative indexes can be used to access an element:

str = 'abcde'
arr = ['a', 'b', 'c', 'd', 'e']

str[-2]   # => "d"
arr[-2]   # => "d"

# Starting from right to left, the first element has key -1. 
#But again, what if we go out of bound?

str[-6]   # => nil
arr[-6]   # => nil

# Previous considerations are still valid for nil elements in arrays


##### INVALID HASH KEYS

# Same problem of missing element because of out of bound key for array,
# with hashes a missing key returns nil:

hsh = { :a => 1, 'b' => 'two', :c => nil }

hsh['b']       # => "two"
hsh[:c]        # => nil
hsh['c']       # => nil
hsh[:d]        # => nil

# ..and the same solution with Hash#fetch method:

hsh.fetch(:c)     # => nil
hsh.fetch('c')    # => KeyError: key not found: "c"...
hsh.fetch(:d)     # => KeyError: key not found: :d...


########## CONVERSION

# String#chars

str = 'Ciao'
arr = str.chars    # => ["C", "i", "a", "o"]

# Array#join

arr.join           # => "Ciao"
arr.join(' ')      # => "C i a o"  Space ' ' as argument will divide
                   #               single character.

# Array#split

str = 'Ciao ciao gente!'
arr = str.split           # => ["Ciao", "ciao", "gente!"]
arr = str.split(' ')      # => ["Ciao", "ciao", "gente!"]
arr = str.split('')       # => ["C", "i", "a", "o", .....
arr = str.split('a')      # => ["Ci", "o ci", "o gente!"]

# Hash#to_a

hsh = { sky: "blue", grass: "green" }
hsh.to_a        # => [[:sky, "blue"], [:grass, "green"]]

# Array#to_h

arr = [[:name, 'Joe'], [:age, 10], [:favorite_color, 'blue']]
arr.to_h        # => {:name=>"Joe", :age=>10, :favorite_color=>"blue"}


########## ELEMENT ASSIGNMENT

##### String Element Assignment

# To each character of a string it's possible to assign a value referring
# to its key:
str = "joe's favorite color is blue"
str[0] = 'J'
str           # => "Joe's favorite color is blue"

##### Array Element Assignment

# Similar to strings:
arr = [1, 2, 3, 4, 5]
arr[0] += 1   # => 2
arr           # => [2, 2, 3, 4, 5]

##### Hash Element Assignment

# Almost same story for hashes:
hsh = {apple: 'Produce', carrot: 'Produce', pear: 'Produce'}
hsh[:apple] = 'Fruit'
hsh # => {:apple => "Fruit", :carrot => "Produce", :pear => "Produce"}
