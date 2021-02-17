
# QUESTION 1
#
# What would you expect the code below to print out?

numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers

# ANSWER:
#
# 1
# 2
# 2
# 3

# THINGS TO REMEMBRE (from solution):
#
# - puts automatically calls to_s on its argument 
# - Using p the output is: [1, 2, 2, 3]. This because p automatically
#   calls inspect. Other option puts numbers.inspect

########################################################


# QUESTION 2
#
# Describe the difference between ! and ? in Ruby. And explain what
# would happen in the following scenarios:
#
# 1. what is != and where should you use it?
# 2. put ! before something, like !user_name
# 3. put ! after something, like words.uniq!
# 4. put ? before something
# 5. put ? after something
# 6. put !! before something, like !!user_name

# ANSWER:
#
# 1. != : it means 'not equal' and it's used in conditionals.
# 2. !user_name : never used anything like that but I suppose it means
#                 not user_name. Anyway it returns 'false'. 
# 3. words.uniq! : ! after a method give the method the power to modify
#                  the caller. Variable 'words' will change rather than
#                  creating a copy. 
# 4. ?a : it looks that before a variable it's just returning the name of
#         the variable as string.
# 5. a_method?: after e method can returns true or false. I've often seen it
#               used in conditionals.
# 5. ? : returns true.
# 6. !!user_name : returns true.
#
# ooops! I didn't noticed that ! was referring to ternary operator.

# SOLUTION
#
# Just to clarify, if you see ! or ? at the end of the method, it's actually
# part of the method name, and not Ruby syntax. Therefore, you really don't
# know what the method is doing, even if it ends in those characters -- it
# depends on the method implementation. The other uses are actual Ruby syntax:

# != means "not equals"
# ? : is the ternary operator for if...else
# !!<some object> is used to turn any object into their boolean equivalent.
#                 (Try it in irb)
# !<some object> is used to turn any object into the opposite of their boolean
#                equivalent, just like the above, but opposite.

########################################################


# QUESTION 3
#
# Replace the word "important" with "urgent" in this string:

advice = "Few things in life are as important as house training your pet dinosaur."

# ANSWER:

advice.gsub('important', 'urgent')

########################################################


# QUESTION 4
#
# The Ruby Array class has several methods for removing items from the array.
# Two of them have very similar names. Let's see how they differ:

numbers = [1, 2, 3, 4, 5]

# What do the following method calls do (assume we reset numbers to the
# original array between method calls)?

numbers.delete_at(1)
numbers.delete(1)

# ANSWER:

numbers.delete_at(1) # Delete the number at position 1 → numbers[1] == 2
                     # and return the deleted number.
numbers.delete(1)    # Delete any element == 1 and return the deleted number.

# THINGS TO REMEMBRE (from solution):
#
# Another thing to notice is that while both of these methods operate on
# the contents of the referenced array and modify it in place (rather than
# just returning a modified version of the array) these methods do NOT have
# the usual ! at the end of the method name for "modify in place" method names.

########################################################


# QUESTION 5
#
# Programmatically determine if 42 lies between 10 and 100.

# ANSWER:
#
(10..100).include?(42)

# SOLUTION
#
(10..100).cover?(42)

# MORE INFO:
# from stackoverflow
#
# The main difference is that 'include' is checking whether object is one
# of range element, and 'cover' is returning whether object is between edge
# elements. You can see that:
# 
# ('a'..'z').include?('cc')   => false
# ('f'..'m').cover?('cc')     => false
# ('a'..'z').cover?('cc')     => true

########################################################


# QUESTION 6
#
# Starting with the string:

famous_words = "seven years ago..."

# show two different ways to put the expected "Four score and " in front of it.

# ANSWER:

"Four score and " <<  famous_words
famous_words.prepend('Four score and ')

# SOLUTION
# there was also:
"Four score and " +  famous_words

########################################################


# QUESTION 7
#
# If we build an array like this:

flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]

# We will end up with this "nested" array:

["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]]

# Make this into an un-nested array.

# ANSWER:
#
flintstones.flatten

# QUESTION 7
#
# Forgot to ad ! to change the array and not only return a copy of the
# flattened array:
flintstones.flatten!

########################################################


# QUESTION 8
#
# Given the hash below

flintstones = { "Fred" => 0,
                "Wilma" => 1,
                "Barney" => 2,
                "Betty" => 3,
                "BamBam" => 4,
                "Pebbles" => 5 }

# Turn this into an array containing only two elements: Barney's name
# and Barney's number.

# ANSWER:
#
flintstones = flintstones.to_a   # [["Fred", 0], ["Wilma", 1], ["Barney", 2],
                                 # ["Betty", 3], ["BamBam", 4], ["Pebbles", 5]]
barney_arr = flintstones[2]   # ["Barney", 2]

# Just one step:

barney_arr = flintstones.to_a[2]

# or longer:

barney_arr = []

flintstones.each do |key, val|
  barney_arr << key if key == 'Barney'
  barney_arr << val if val == flintstones['Barney']
end

# SOLUTION:

flintstones.assoc("Barney")

# documentation:
# assoc(obj) → an_array or nil
# Searches through the hash comparing obj with the key using ==. Returns the
# key-value pair (two elements array) or nil if no match is found.
# See Array#assoc.
