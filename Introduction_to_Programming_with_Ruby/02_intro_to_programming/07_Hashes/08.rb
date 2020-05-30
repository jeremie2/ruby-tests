# Challenge: Given the array...
# 
# words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
#           'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
#           'flow', 'neon']
# 
# Write a program that prints out groups of words that are anagrams.
# Anagrams are words that have the same exact letters in them but in
# a different order. Your output should look something like this:
# 
# ["demo", "dome", "mode"]
# ["neon", "none"]
# (etc)

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

# FIRST ATTEMPT
#
# A way to check if one element inside the words array is equal to
# others, is to run: elem.split('').sort.join. Example with 'demo':
# 'mode'.split('') = ['m', 'o', d', 'e']
# ['m', 'o', d', 'e'].sort = ['d', 'e', 'm', 'o']
# ['d', 'e', 'm', 'o'].join = 'demo'
# If elem.split('').sort.join will be equal to 'demo'... then
# it will be an anagram.
#
# So what I want to di is to create an hash where the keys are
# the sorted wersion of the elements inside words array:
# hash = {"demo"=>[], "enno"=>[], "deit"=>[], "eilv"=>[], "flow"=>[]}
#
# Then I'm going to populate the arrays inside the ashes. If the sorted
# version of an element will be equal the key of hash, the it will be
# added to the hash[k] array: "demo"=>["demo", "dome", "mode"]
#
# At this point we are ready to print the arrays inside the hash.
# 
# 
# hash = {}
# 
# # Creating hash = {"demo"=>[], "enno"=>[], "deit"=>[], "eilv"=>[], "flow"=>[]}
# words.each do |elem|
#   sorted = elem.split('').sort.join
#   hash[sorted] = []
# end
# 
# # Populating arrays inside hash, like: "demo"=>["demo", "dome", "mode"]
# words.each do |elem|
#   sorted = elem.split('').sort.join
#   hash.each { |k, v| hash[k] << elem if k == sorted }
# end
# 
# # Printing the arrays inside the hash.
# hash.each { |k, v| p v }


# SOLUTION
#
# The solution brings some improvements creating and populating
# the hash in one loop adding an if/else:
# - if the key already exist the element will be added: result[key].push(word)
# - elese: result[key] = [word] (..creating the relative array)
#
# It also uses the #each_value hash method which requires just
# the values of the hash instead of key+values.
#
#   
# result = {}
# 
# words.each do |word|
#   key = word.split('').sort.join
#   if result.has_key?(key)
#     result[key].push(word)
#   else
#     result[key] = [word]
#   end
# end
# 
# result.each_value do |v|
#   puts "------"
#   p v
# end


# FINAL VERSION
#
# Mixing the first version with the solution improvements
# and using the ternary operator for the if/else statement,
# that's the result: 

hash = {}

words.each do |elem|
  sorted = elem.split('').sort.join
  hash.has_key?(sorted) ? hash[sorted] << elem : hash[sorted] = [elem]
end

hash.each_value { |v| p v }