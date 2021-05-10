# Write a method that takes an Array of numbers and then returns the sum of the 
# sums of each leading subsequence for that Array. You may assume that the Array 
# always contains at least one number.

#### ANSWER

def sum_of_sums(arr)
  total = 0
  n_elements = 1
  arr.size.times do
    total += arr[0, n_elements].reduce(:+)
    n_elements += 1
  end
  total
end


puts sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
puts sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
puts sum_of_sums([4]) == 4
puts sum_of_sums([1, 2, 3, 4, 5]) == 35


#### SOLUTION

## Solution 1

def sum_of_sums(numbers)
  sum_total = 0
  accumulator = 0

  numbers.each do |num|
    accumulator += num
    sum_total += accumulator
  end

  sum_total
end

## Solution 2

def sum_of_sums(numbers)
  sum_total = 0
  1.upto(numbers.size) do |count|
    sum_total += numbers.slice(0, count).reduce(:+)
  end
  sum_total
end


#### from user AHAM-OUDEIS

def sum_of_sums(arr)
  arr.size == 1 ? arr[0] : (sum_of_sums(arr[..-2]) + arr.sum)
end

# To handle empty array:

def sum_of_sums(arr)
  arr.size <= 1 ? arr.sum : (sum_of_sums(arr[..-2]) + arr.sum)
end
