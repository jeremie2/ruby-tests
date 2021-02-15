
# QUESTION 1
#
# In this hash of people and their age,

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# see if "Spot" is present.
# Bonus: What are two other hash methods that would work just as well for
# this solution?

# ANSWER:
#
ages.has_key?('Spot')    # => false

# bonus
# from documentation:

ages.include?('Spot')
ages.key?('Spot')
ages.member?('Spot')

########################################################


# QUESTION 2
#
# Starting with this string:

munsters_description = "The Munsters are creepy in a good way."

# Convert the string in the following ways (code will be executed on
# original munsters_description above):
#
# "tHE mUNSTERS ARE CREEPY IN A GOOD WAY."
# "The munsters are creepy in a good way."
# "the munsters are creepy in a good way."
# "THE MUNSTERS ARE CREEPY IN A GOOD WAY."

# ANSWER:
#
munsters_description.swapcase!
munsters_description.capitalize!
munsters_description.downcase!
munsters_description.upcase!

########################################################


# QUESTION 3
#
# We have most of the Munster family in our age hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }

# add ages for Marilyn and Spot to the existing hash

additional_ages = { "Marilyn" => 22, "Spot" => 237 }


# ANSWER:
#
ages.merge!(additional_ages)

########################################################


# QUESTION 4
#
# See if the name "Dino" appears in the string below:

advice = "Few things in life are as important as house training your pet dinosaur."

# ANSWER:
#
advice.include?('Dino')

# long answer:
advice.split.include?('Dino')


# SOLUTION:
#
advice.match?("Dino")
# Note that this is not a perfect solution, as it would match any substring with Dino in it.

########################################################


# QUESTION 5
#
# Show an easier way to write this array

flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]

# ANSWER:
#
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

########################################################


# QUESTION 6
#

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# ANSWER:
#
flintstones << 'Dino'

########################################################


# QUESTION 7
#
# In the previous practice problem we added Dino to our array like this:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones << "Dino"

# We could have used either Array#concat or Array#push to add Dino to the family.
# How can we add multiple items to our array? (Dino and Hoppy)

# ANSWER:
#
flintstones + %w(Dino Hoppy)

# SOLUTION:
#
flintstones.push("Dino").push("Hoppy")   # push returns the array so we can chain
flintstones.concat(%w(Dino Hoppy))  # concat adds an array rather than one item

########################################################


# QUESTION 8
#
# Shorten this sentence:

advice = "Few things in life are as important as house training your pet dinosaur."

# ...remove everything starting from "house".
#
# Review the String#slice! documentation, and use that method to make the
# return value "Few things in life are as important as ". But leave the
# 'advice' variable as "house training your pet dinosaur.".
#
# As a bonus, what happens if you use the String#slice method instead?

# ANSWER:
#
advice.slice!(0..38)   # return: "Few things in life are as important as "
puts advice            # 'house training your pet dinosaur.'
# Using String#slice method will not change 'advice' initial value.

# SOLUTION:
#
advice.slice!(0, advice.index('house'))

########################################################


# QUESTION 9
#
# Write a one-liner to count the number of lower-case 't' characters in
# the following string:

statement = "The Flintstones Rock!"

# ANSWER:
#
t_lower_counter = 0
statement.split('').each {|i| t_lower_counter += 1 if i == 't'}

puts t_lower_counter

# SOLUTION:
#
statement.count('t')

########################################################


# QUESTION 10
#
# Back in the stone age (before CSS) we used spaces to align things on
# the screen. If we had a 40 character wide table of Flintstone family
# members, how could we easily center that title above the table with
# spaces?

title = "Flintstone Family Members"

# ANSWER:
#
title.center(40)
