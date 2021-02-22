# What will the following code print, and why? Don't run the code until
# you have tried to answer.

array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2

######## ANSWER

Moe
Larry
CURLY
SHEMP
Harpo
CHICO
Groucho
Zeppo

# Why?
#
# Performing the fist 'each' iteration we are entering values inside array2.
# Basically we are doing this: array1[0] = array2[0] and so on for each element.
# This means that elements of both array are sharing the same values each stored
# in the same memory address.
#
# With the second 'each' iteration we are going to change the value stored
# inside the memory address of the elements that start with letter C or S.
# This because we are using a method that change the caller.
# So, changing elements of array1 will affect also element of array2, because
# each of them points to the same memory address of elements of array1.

######## EXTRA

# How can this feature of ruby get you in trouble? How can you avoid it?
#
# For even more information on this topic, see these Blog posts:
#
# - https://launchschool.com/blog/references-and-mutability-in-ruby
# - https://launchschool.com/blog/mutating-and-non-mutating-methods
# - https://launchschool.com/blog/object-passing-in-ruby

######## ANSWER

# This feature can get you in trouble if you don't want to change original values.
# To avoid this you can use assignment:

array1.each_with_index do |val, idx|
  array1[idx] = val.upcase if array1[idx].start_with?('C', 'S')
end
