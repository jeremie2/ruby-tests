# Write a method that takes two Arrays as arguments, and returns an Array that 
# contains all of the values from the argument Arrays. There should be no 
# duplication of values in the returned Array, even if there are duplicates in 
# the original Arrays.
# 
# Example
# 
# merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]

#### ANSWER

def merge(arr_1, arr_2)
  (arr_1 + arr_2).uniq
end

puts merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]


#### SOLUTION

# with method Array#|

def merge(array_1, array_2)
  array_1 | array_2
end


#### from user ANTONIO SERNA

def merge(first_ary, second_ary)
  first_ary.union(second_ary)
end
