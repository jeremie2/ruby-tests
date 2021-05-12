# Write a method that can rotate the last n digits of a number.
# Note that rotating just 1 digit results in the original number being returned.
# You may use the rotate_array method from the previous exercise if you want. (
# Recommended!)
# You may assume that n is always a positive integer.


#### ANSWER

def rotate_array(arr)
  arr[1..-1] << arr[0]
end

def rotate_string(str)
  rotate_array(str.chars).join
end

def rotate_rightmost_digits(num, idx)
  right_slice = num.to_s[-idx..-1]
  left_slice = num.to_s[0..-(idx + 1)]

  right_slice = rotate_string(right_slice)
  (left_slice + right_slice).to_i
end

puts rotate_rightmost_digits(735291, 1) == 735291
puts rotate_rightmost_digits(735291, 2) == 735219
puts rotate_rightmost_digits(735291, 3) == 735912
puts rotate_rightmost_digits(735291, 4) == 732915
puts rotate_rightmost_digits(735291, 5) == 752913
puts rotate_rightmost_digits(735291, 6) == 352917               # => true


#### SOLUTION

def rotate_rightmost_digits(number, n)
  all_digits = number.to_s.chars
  all_digits[-n..-1] = rotate_array(all_digits[-n..-1])
  all_digits.join.to_i
end


#### from user Aman Bal

def rotate_rightmost_digits(num, idx)
  num = num.to_s.chars
  num << num.delete_at(-idx)
  num.join.to_i
end


#### from user PIERRE-EMMANUEL ROUSSEL

def rotate_rightmost_digits(num, n)
  first, last = (num % 10**n).divmod(10**(n - 1))
  num - (num % 10**n) + (last * 10) + first
end
