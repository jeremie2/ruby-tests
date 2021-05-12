# If you take a number like 735291, and rotate it to the left, you get 352917. If 
# you now keep the first digit fixed in place, and rotate the remaining digits, 
# you 
# get 329175. Keep the first 2 digits fixed in place and rotate again to 321759. 
# Keep the first 3 digits fixed in place and rotate again to get 321597. Finally, 
# keep the first 4 digits fixed in place and rotate the final 2 digits to get 
# 321579. The resulting number is called the maximum rotation of the original 
# number.
# 
# Write a method that takes an integer as argument, and returns the maximum 
# rotation of that argument. You can (and probably should) use the 
# rotate_rightmost_digits method from the previous exercise.
# 
# Note that you do not have to handle multiple 0s.


#### ANSWER

# _             _
# 735291 → 352917   idx 0
#  _            _
# 352917 → 329175   idx 1
#   _           _
# 329175 → 321759   idx 2
#    _          _
# 321759 → 321597   idx 3
#     _         _
# 321597 → 321579   idx 4


def rotate_array(array)
  array[1..-1] + [array[0]]
end

def rotate_rightmost_digits(number, n)
  all_digits = number.to_s.chars
  all_digits[-n..-1] = rotate_array(all_digits[-n..-1])
  all_digits.join.to_i
end

# #rotate_rightmost_digits uses negative indexes.
# At the first iteration we have number at idx 0 that has to be
# moved in last position.
# In the loop idx 0 will be -size of the string. Example:
# str = '735291', str[0] = str[-6] = 7
# In this case loop start from 6 down to 2.

def max_rotation(num)
  size = num.to_s.size
  size.downto(2) { |i| num = rotate_rightmost_digits(num, i) }
  num
end

puts max_rotation(735291) == 321579
puts max_rotation(3) == 3
puts max_rotation(35) == 53
puts max_rotation(105) == 15 # the leading zero gets dropped
puts max_rotation(8_703_529_146) == 7_321_609_845


#### SOLUTION

def max_rotation(number)
  number_digits = number.to_s.size
  number_digits.downto(2) do |n|
    number = rotate_rightmost_digits(number, n)
  end
  number
end


#### FURTHER EXPLORATION

# Assume you do not have the rotate_rightmost_digits or rotate_array methods. How 
# would you approach this problem? Would your solution look different? Does this 3 
# part approach make the problem easier to understand or harder?

#### ANSWER

# It is much easier rewriting the method. In the end it's all about
# deleting an element at a given index and pushing it at the end of
# the array.

def max_rotation(num)
  arr = num.to_s.chars
  arr.each_with_index { |_, idx| arr << arr.delete_at(idx) }
  arr.join.to_i
end

puts max_rotation(735291) == 321579
puts max_rotation(3) == 3
puts max_rotation(35) == 53
puts max_rotation(105) == 15 # the leading zero gets dropped
puts max_rotation(8_703_529_146) == 7_321_609_845


# There is an edge case in our problem when the number passed in as the argument 
# has multiple consecutive zeros. Can you create a solution that preserves zeros?

#### ANSWER

# When 0 is in first position Ruby ignore it.
# At this stage the only thing I can do is to return a string version
# of the number.

def max_rotation(num)
  arr = num.to_s.chars
  arr.each_with_index { |_, idx| arr << arr.delete_at(idx) }
  arr[0] == '0' ? arr.join : arr.join.to_i
end


#### from user RYAN PARKERSON

def max_rotation(num)
  str = num.to_s
  str.size.times { |index| str << str.slice!(index) }
  str #can invoke #to_i here if preserving zeros doesn't matter
end
