# Write a method that takes an Array of numbers, and returns an Array with the
# same number of elements, and each element has the running total from the
# original Array.
#
# Examples:
#
# running_total([2, 5, 13]) == [2, 7, 20]
# running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
# running_total([3]) == [3]
# running_total([]) == []

#### ANSWER

def running_total(array)
  tot = 0
  array.map { |val| tot += val }
end

#### FURTHER EXPLORATION

# Try solving this problem using Enumerable#each_with_object or Enumerable#inject
# (note that Enumerable methods can be applied to Arrays).

def running_total(numbers)
  tot = 0
  numbers.each_with_object([]) { |val, array| array << tot += val }
end

def running_total(numbers)
  new_array = []
  temp_array = []

  numbers.each do |val|
    temp_array << val
    new_array << temp_array.reduce(:+)
  end
  new_array
end
