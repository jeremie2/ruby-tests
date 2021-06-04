
############ PRACTICE PROBLEM 1

# How would you order this array of number strings by descending numeric value?

arr = ['10', '11', '9', '7', '8']

# ANSWER

arr_srt = arr.map {|i| i.to_i}.sort {|a,b| b <=> a}

p desc_sort_arr

# SOLUTION

arr.sort do |a, b|
  b.to_i <=> a.to_i
end


############ PRACTICE PROBLEM 2

# How would you order this array of hashes based on the year of publication
# of each book, from the earliest to the latest?

books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

# ANSWER

p books.sort_by { |hash| hash[:published]}

# FROM SOLUTION
#
# In this case, all the values for :published are strings so we know that we can
# compare them. Since all the values in question are four characters in length,
# in this case we can simply compare the strings without having to convert them
# to integers.


############ PRACTICE PROBLEM 3

# For each of these collection objects demonstrate how you would reference the
# letter 'g'.

arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]
arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]
arr3 = [['abc'], ['def'], {third: ['ghi']}]
hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}
hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}

# ANSWER

arr1[2][1][3]
arr2[1][:third][0]
arr3[2][:third][0][0]
hsh1['b'][1]
hsh2[:third].keys[0]

# or from SOLUTION:

  hsh2[:third].key(0)

# but:
# Note: the Hash#key method returns the key of an occurrence of a given value.
# A couple of things to note when using this method:
# - If more than one key has the same value the method returns the key for the
#   first occurrence of that value.
# - If the requested value does not exist in the hash then nil is returned.
#
# For this example you could also have done the following:

  hsh2[:third].keys[0] # => 'g'

# Although this looks very similar to the initial solution, Hash#key and Hash#keys
# are actually two completely different methods. Hash#key returns a single key
# based on a value passed to the method. Hash#keys returns an array of all the keys
# in the hash, and the [0] is then referencing the object at index 0 of that
# returned array.


############ PRACTICE PROBLEM 4

# For each of these collection objects where the value 3 occurs, demonstrate how
# you would change this to 4.

arr1 = [1, [2, 3], 4]
arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]
hsh1 = {first: [1, 2, [3]]}
hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}

# ANSWER

arr1[1][1] = 4
arr2[2] = 4
hsh1[:first][2][0] = 4
hsh2[['a']][:a][2] = 4


############ PRACTICE PROBLEM 5

# Given this nested Hash:

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# figure out the total age of just the male members of the family.

# ANSWER

tot_male_age = 0

munsters.each do |_, val|
  tot_male_age += val['age'] if val['gender'] == 'male'
end

puts tot_male_age

# SOLUTION:

total_male_age = 0
munsters.each_value do |details|
  total_male_age += details["age"] if details["gender"] == "male"
end

total_male_age # => 444


############ PRACTICE PROBLEM 6

# One of the most frequently used real-world string properties is that of "string
# substitution", where we take a hard-coded string and modify it with various
# parameters from our program.
#
# Given this previously seen family hash, print out the name, age and gender of
# each family member:

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# ...like this:
# (Name) is a (age)-year-old (male or female).

# ANSWER:

munsters.each do |key, val|
  puts "#{key} is a #{val['age']}-year-old #{val['gender']}."
end

# SOLUTION:
# #each_pair and #each are alias:

munsters.each_pair do |name, details|
  puts "#{name} is a #{details['age']} year old #{details['gender']}"
end


############ PRACTICE PROBLEM 7

# Given this code, what would be the final values of a and b? Try to work this
# out without running the code.

a = 2
b = [5, 8]
arr = [a, b]    # [2, [5, 8]]

arr[0] += 2
arr[1][0] -= a

# ANSWER:

# a #=> 2
# b #=> [3, 8]
# arr #=> [4, [3, 8]]


############ PRACTICE PROBLEM 8

# Using the each method, write some code to output all of the vowels from the
# strings.

hsh = { first: ['the', 'quick'], 
        second: ['brown', 'fox'], 
        third: ['jumped'], 
        fourth: ['over', 'the', 'lazy', 'dog']
      }

# ANSWER:

vowels = %w(a e i o u)
all_chars = hsh.values.join.chars
all_chars.each { |ch| p ch if vowels.include?(ch) }

# LONG ANSWER:

vowels = %w(a e i o u)

hsh.each_value do |array|
  array.each do |word|
    word.chars.each do |char|
      puts char if vowels.include?(char)
    end
  end
end

######## WITH PEDAC

# PROBLEM
# 
# input: hash (where values are arrays with strings inside)
# output: characters (vowels contained into strings inside arrays)
# 
# EXAMPLE
# 
# no examples
# 
# DATA STRUCTURES
# 
# - The data I'm looking for are inside the element of the arrays.
# - I have just to iterate each value (= array), then each string,
#   then transforming each string into array (string.chars) each
#   character so that I can print it it's a vowel. 
# 
# example:
#  
# - hsh.each_value for ['the', 'quick', ... 'dog']
# - ['the', 'quick', ... 'dog'].each |word|
# - word.chars.each to print characters that are vowels
# 
# 
# ALGORITHM
# 
# - define an array of vowels 
# - iterate on values of hsh (which is an array)
#   - iterate on words inside the array
#     - iterate on words transformed to array of character
#       - print each character if it's included into array of vowels
# 
# CODE
# (see above)


############ PRACTICE PROBLEM 9

# Given this data structure, return a new array of the same structure but with
# the sub arrays being ordered (alphabetically or numerically as appropriate)
# in descending order.

arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

# ANSWER:

new_arr = arr.map do |arr|
  arr.sort do |a, b|
    b <=> a
  end
end

p new_arr


############ PRACTICE PROBLEM 10

# Given the following data structure and without modifying the original array,
# use the map method to return a new array identical in structure to the original
# but where the value of each integer is incremented by 1.

arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

# ANSWER:

new_arr = arr.map do |hsh|
  new_hash = {}
  hsh.each do |key, val|
    new_hash[key] = val + 1
  end
  new_hash
end

p new_arr

# or from SOLUTION:

[{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].each_with_object([]) do |hsh, arr|
  incremented_hash = {}
  hsh.each do |key, value|
    incremented_hash[key] = value + 1
  end
  arr << incremented_hash
end


############ PRACTICE PROBLEM 11

# Given the following data structure use a combination of methods, including
# either the select or reject method, to return a new array identical in
# structure to the original but containing only the integers that are multiples
# of 3.

arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

# ANSWER:

new_arr = arr.map do |elem|
  elem.select do |n|
    n % 3 == 0
  end
end

p new_arr

# or from SOLUTION:

arr.map do |element|
  element.reject do |num|
    num % 3 != 0
  end
end


############ PRACTICE PROBLEM 12

# Given the following data structure, and without using the Array#to_h method,
# write some code that will return a hash where the key is the first item in
# each sub array and the value is the second item.

arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]

# expected return value:
# { :a => 1,
#   "b" => "two", 
#   "sea" => {:c=>3}, 
#   {:a=>1, :b=>2, :c=>3, :d=>4} => "D"
# }

# ANSWER:

new_hsh = {}

arr.each do |elem|
  new_hsh[elem[0]] = elem[1]
end

p new_hsh


############ PRACTICE PROBLEM 13

# Given the following data structure, return a new array containing the same
# sub-arrays as the original but ordered logically by only taking into
# consideration the odd numbers they contain.

arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

# The sorted array should look like this:
#
# [[1, 8, 3], [1, 6, 7], [1, 4, 9]]

# ANSWER:

new_arr = arr.sort_by do |elem|
  elem.select do |n|
    n.odd?
  end
end

p new_arr


############ PRACTICE PROBLEM 14

# Given this data structure write some code to return an array containing
# the colors of the fruits and the sizes of the vegetables. The sizes should
# be uppercase and the colors should be capitalized.

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

# The return value should look like this:
#
# [["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]

# ANSWER:

new_arr = hsh.map do |_, val|
  if val[:type] == 'fruit'
    val[:colors].map { |color| color.capitalize }
  elsif val[:type] == 'vegetable'
    val[:size].upcase
  end
end

p new_arr

##### or

arr = []

hsh.each_value do |val|
  arr << val[:colors] if val[:type] == 'fruit'
  arr << val[:size].upcase if val[:type] == 'vegetable'
end


############ PRACTICE PROBLEM 15

# Given this data structure write some code to return an array which contains
# only the hashes where all the integers are even.

arr = [{a: [1, 2, 3]}, 
       {b: [2, 4, 6], c: [3, 6], d: [4]}, 
       {e: [8], f: [6, 10]}
      ]

# ANSWER:

new_arr = arr.select do |hash| 
   hash.values.flatten.all? { |n| n.even? }
end

p new_arr

# SOLUTION:

arr.select do |hsh|
  hsh.all? do |_, value|
    value.all? do |num|
      num.even?
    end
  end
end

# Since select will return all the elements for which the block returns true and
# we only want hashes where all the integers are even, all? combined with even?
# is a good choice here. The situation is complicated slightly by the fact that
# the integers are further nested inside the inner arrays, so we need to iterate
# through these first.
#
# If all of the integers in an inner array are even then the inner block returns
# true to the innermost call to all?. If all of the inner blocks for a particular
# hash return true then the middle block returns true to the outer call to all?
# which in turn causes the outer block to return true to the select method for
# that iteration.


############ PRACTICE PROBLEM 16

# A UUID is a type of identifier often used as a way to uniquely identify items...
# which may not all be created by the same system. That is, without any form of
# synchronization, two or more separate computer systems can create new items and
# label them with a UUID with no significant chance of stepping on each other's
# toes.
#
# It accomplishes this feat through massive randomization. The number of possible
# UUID values is approximately 3.4 X 10E38.
#
# Each UUID consists of 32 hexadecimal characters, and is typically broken into 5
# sections like this 8-4-4-4-12 and represented as a string.
#
# It looks like this: "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"
#
# Write a method that returns one UUID when called with no parameters.

# ANSWER:

def uuid
  characters = '0123456789abcdef'
  layout = [8, 4, 4, 4, 12]
  uuid = ''

  layout.each do |iter|
    iter.times { uuid += characters[rand(0..15)] }
    uuid += '-' if uuid.size < 25 
  end

  uuid
end

p uuid

# SOLUTION:

def generate_UUID
  characters = []
  (0..9).each { |digit| characters << digit.to_s }
  ('a'..'f').each { |digit| characters << digit }

  uuid = ""
  sections = [8, 4, 4, 4, 12]
  sections.each_with_index do |section, index|
    section.times { uuid += characters.sample }
    uuid += '-' unless index >= sections.size - 1
  end

  uuid
end
