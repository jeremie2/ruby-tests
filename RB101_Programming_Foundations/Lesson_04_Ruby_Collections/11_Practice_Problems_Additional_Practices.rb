
########################### PRACTICE PROBLEM 1

# Given the array below
#
# flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
#
# Turn this array into a hash where the names are the keys and the values
# are the positions in the array.

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
flint_positions = {}

flintstones.each_with_index { |name, idx| flint_positions[name] = idx }

p flint_positions
# => {"Fred"=>0, "Barney"=>1, "Wilma"=>2, "Betty"=>3, "Pebbles"=>4, "BamBam"=>5}


########################### PRACTICE PROBLEM 2

# Add up all of the ages from the Munster family hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

puts ages.values.sum
# => 6174

##### SOLUTION

total_ages = 0
ages.each { |_, age| total_ages += age }
total_ages    # => 6174

# OR

ages.values.inject(:+)    # => 6174

##### ANOTHER ATTEMPT

# using simple loop:

total_ages = 0
counter = 0

loop do
  break if counter == ages.values.size
  total_ages += ages.values[counter]
  counter += 1
end

p total_ages


########################### PRACTICE PROBLEM 3

# In the age hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# remove people with age 100 and greater.

ages.each do |key, val|
  ages.delete(key) if val >= 100
end

p ages
# => {"Herman"=>32, "Lily"=>30, "Eddie"=>10}

##### SOLUTION

ages.keep_if { |_, age| age < 100 }  # returns 'nil'

## or with #select

ages.select { |_, val| val < 100 }


########################### PRACTICE PROBLEM 4

# Pick out the minimum age from our current Munster family hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

puts ages.values.min


# trying to solve it using the longer paths

ages_val = ages.values
# [32, 30, 5843, 10, 22, 237]

# :::::::::::

puts ages_val.sort.shift

# :::::::::::

min = ages_val[0]

ages_val.each do |elem|
  min = elem if elem < min
end

puts "Minimum value: #{min}"
# Minimum value: 10


########################### PRACTICE PROBLEM 5

# In the array:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# Find the index of the first name that starts with "Be"

flintstones.each_with_index do |name, idx|
  if name.start_with?('Be')
    puts idx
    break
  end
end

# => 3

##### SOLUTION
#
# From documentation:
# index(obj) 
# Returns the index of the first object in ary such that the object is == to obj.
# If a block is given instead of an argument, returns the index of the first
# object for which the block returns true. Returns nil if no match is found.

flintstones.index { |name| name[0, 2] == 'Be' }
# => 3


########################### PRACTICE PROBLEM 6

# Amend this array so that the names are all shortened to just the first three
# characters:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.map! { |name| name[0, 3] }

p flintstones
# => ["Fre", "Bar", "Wil", "Bet", "Bam", "Peb"]


########################### PRACTICE PROBLEM 7

# Create a hash that expresses the frequency with which each letter occurs
# in this string:

statement = "The Flintstones Rock"

# ex:
# { "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, ... }


#### FANCY VERSION
# Using syntactic sugar, but several steps require built-in loops.
# It's fun and easy to use but maybe not good for performance (? no idea).

ch_counter = {}
letters_array = statement.delete(' ').split('')  # "TheFlints..." no spaces ' '
letters_uniq = letters_array.uniq                # ['T', 'h', 'e'...] to array

letters_uniq.each do |char|
  ch_counter[char] = statement.count(char)
end

p ch_counter
# => { "T"=>1, "h"=>1, "e"=>2, "F"=>1, "l"=>1, "i"=>1,
#      "n"=>2, "t"=>2, "s"=>2, "o"=>2, "R"=>1, "c"=>1,
#      "k"=>1 }

#### LONG VERSION

frequency = {}
char_arr = statement.delete!(' ').split('')  # ['T', 'h', 'e', ...]

char_arr.each do |i|
  if frequency[i] == nil
    frequency[i] = 1
  else
    frequency[i] += 1
  end
end

p frequency

#### VERSION WITH SINGLE LOOP
# I tried to do everything with a single loop.

ch_counter = {}

statement.split('').each do |char|
  next if char == ' '
  !ch_counter[char] ? ch_counter[char] = 1 : ch_counter[char] += 1
end

p ch_counter
# => { "T"=>1, "h"=>1, "e"=>2, "F"=>1, "l"=>1, "i"=>1,
#      "n"=>2, "t"=>2, "s"=>2, "o"=>2, "R"=>1, "c"=>1,
#      "k"=>1 }

#### SOLUTION

result = {}
letters = ('A'..'Z').to_a + ('a'..'z').to_a
letters.each do |letter|
  letter_frequency = statement.scan(letter).count   # ['t', 't'].count # => 2
  result[letter] = letter_frequency if letter_frequency > 0
end


########################### PRACTICE PROBLEM 8

# What happens when we modify an array while we are iterating over it?
# What would be output by this code?

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end

# 1
# 3

# 1 is printed and removed. Then what was numbers[1] is now numbers[0]
# and the second will start form number 3 which is now numbers[1].

# What would be output by this code?

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end

# 1
# 2

# At the first iteration last number '4' is removed. Then again the new
# last number '3' will be removed.

#### FROM SOLUTION

# In the solution there is a good suggestion for monitoring what happens
# during the loop:

numbers = [1, 2, 3, 4]
numbers.each_with_index do |number, index|
  p "#{index}  #{numbers.inspect}  #{number}"  # this make an iteration picture
  numbers.shift(1)
end

# "0  [1, 2, 3, 4]  1"
# "1  [2, 3, 4]  3"


########################### PRACTICE PROBLEM 9

# As we have seen previously we can use some built-in string methods to change
# the case of a string. A notably missing method is something provided in Rails,
# but not in Ruby itself...titleize. This method in Ruby on Rails creates a
# string that has each word capitalized as it would be in a title. For example,
# the string:

words = "the flintstones rock"

# would be:

words = "The Flintstones Rock"

# Write your own version of the rails titleize implementation.

def titleize(string)
  string_arr = string.split(' ')
  string_arr.map! { |word| word.capitalize }
  string_arr.join(' ')
end

puts titleize('ciao')

#### SOLUTION

words.split.map { |word| word.capitalize }.join(' ')


########################### PRACTICE PROBLEM 10

# Given the 'munsters' hash below

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# Modify the hash such that each member of the Munster family has an additional
# "age_group" key that has one of three values describing the age group the family 
# member is in (kid, adult, or senior). Your solution should produce the hash below

{ "Herman" => { "age" => 32, "gender" => "male", "age_group" => "adult" },
  "Lily" => {"age" => 30, "gender" => "female", "age_group" => "adult" },
  "Grandpa" => { "age" => 402, "gender" => "male", "age_group" => "senior" },
  "Eddie" => { "age" => 10, "gender" => "male", "age_group" => "kid" },
  "Marilyn" => { "age" => 23, "gender" => "female", "age_group" => "adult" } }

# Note: a kid is in the age range 0 - 17, an adult is in the range 18 - 64 and a
# senior is aged 65+.


# Some PEDAC..

#### P
#
# - input: hash
# - output: hash
# - 0 <= kid <= 17
# - 18 <= adult <= 64
# - 65 <= senior
# 
#### E
# 
#  - just see the above example hash
# 
#### D
# 
# age_group = ["kid", "adult", "senior"]
# kid_range = (0..17)
# adult_range = (18..64)
# senior_range = 65
# 
#### A/C
# 
# Let's start looking at one case:

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  # .......
}

# we should use a structure like this:

case age
when 0..17
  'kid_range'
when 18..64
  'adult_range'
else
  'senior_range'
end


#### CODE

munsters.each do |name, details|
  details['age_group'] = case details['age']
                         when 0..17
                           'kid'
                         when 18..64
                           'adult'
                         else
                           'senior'
                         end
end

p munsters
