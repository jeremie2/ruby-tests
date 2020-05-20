# Write a program that iterates over an array and builds a new
# array that is the result of incrementing each value in the
# original array by a value of 2. You should have two arrays at
# the end of this program, The original array and the new array
# you've created. Print both arrays to the screen using the p
# method instead of puts.

arr_1 = [1, 2, 3, 4]
arr_2 = []

arr_1.each {|i| arr_2 << i + 2}

p arr_1
p arr_2


# also in SOLUTION
# arr = [1, 2, 3, 4, 5]
# 
# new_arr = arr.map do |n|
#   n + 2
# end
# 
# p arr
# p new_arr