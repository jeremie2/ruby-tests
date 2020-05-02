# What will the following code print, and why?
# Don't run the code until you have tried to answer.
# 
# array = [1, 2, 3]
# 
# array.each do |element|
#   a = element
# end
# 
# puts a

Error

# A block method can read a variable outside its scope, not viceversa.
# 'puts a' can't find variable 'a'. 
