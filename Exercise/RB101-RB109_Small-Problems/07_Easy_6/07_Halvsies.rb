# Write a method that takes an Array as an argument, and returns two Arrays (as 
# a pair of nested Arrays) that contain the first half and second half of the 
# original Array, respectively. If the original array contains an odd number of 
# elements, the middle element should be placed in the first half Array.
# 
# Examples:
# 
# halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
# halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
# halvsies([5]) == [[5], []]
# halvsies([]) == [[], []]

#### ANSWER

def halvsies(arr)
  mid_idx = arr.size.odd? ? (arr.size/2) + 1 : arr.size/2
  arr_1 = arr[0, mid_idx]
  arr_2 = arr - arr_1
  [arr_1, arr_2]
end

# Combined with #ceil (shown in the solution) which round up to next
# digit, we can avoid the if/else related to odd/even arr.size:

def halvsies(arr)
  mid = (arr.size / 2.0).ceil
  arr_1 = arr[0, mid]
  arr_2 = arr - arr_1
  [arr_1, arr_2]
end


# THIS DOESN'T WORK WITH (arr.size < 2) but #each_slice method
# is quite interesting:

def halvsies(arr)
  if arr.size.even?
    arr.each_slice(arr.size / 2).to_a
  else
    arr.each_slice((arr.size / 2) + 1).to_a
  end
end


puts halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
puts halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
puts halvsies([5]) == [[5], []]
puts halvsies([]) == [[], []]


#### SOLUTION

def halvsies(array)
  middle = (array.size / 2.0).ceil
  first_half = array.slice(0, middle)
  second_half = array.slice(middle, array.size - middle)
  [first_half, second_half]
end


#### from user LUKE CARLSON

def halvsies(arr)
  mid = (arr.size / 2.0).ceil
  [arr[0...mid], arr[mid..-1]]
end
