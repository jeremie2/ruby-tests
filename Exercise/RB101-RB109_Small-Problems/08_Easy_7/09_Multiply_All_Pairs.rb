# Write a method that takes two Array arguments in which each Array contains a list 
# of numbers, and returns a new Array that contains the product of every pair of 
# numbers that can be formed between the elements of the two Arrays. The results 
# should be sorted by increasing value.
# 
# You may assume that neither argument is an empty Array.

#### ANSWER

def multiply_all_pairs(arr_1, arr_2)
  new_arr = []
  arr_1.each do |el_1|
    arr_2.each { |el_2| new_arr << el_1 * el_2 }
  end
  new_arr.sort
end

puts multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]


#### SOLUTION

def multiply_all_pairs(array_1, array_2)
  array_1.product(array_2).map { |num1, num2| num1 * num2 }.sort
end


#### FURTHER EXPLORATION
# 
# #reduce can be used:

def multiply_all_pairs(array_1, array_2)
  array_1.product(array_2).map { |arr| arr.reduce(:*) }.sort
end
