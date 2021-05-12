# Write a method that rotates an array by moving the first element to the end of 
# the array. The original array should not be modified.
# 
# Do not use the method Array#rotate or Array#rotate! for your implementation.

#### ANSWER

def rotate_array(arr)
  arr[1..-1] << arr[0]
end

puts rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
puts rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
puts rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
puts rotate_array(x) == [2, 3, 4, 1]   # => true
puts x == [1, 2, 3, 4]                 # => true


#### SOLUTION

def rotate_array(array)
  array[1..-1] + [array[0]]
end


#### from user JOSHUA BALDWIN

def rotate_array(ary)
  copied_array = ary.map {|i| i }
  copied_array <<  copied_array.shift
end


#### FURTHER EXPLORATION

# Write a method that rotates a string instead of an array. Do the same thing for 
# integers. You may use rotate_array from inside your new method.

#### ANSWER

def rotate_array(arr)
  arr[1..-1] << arr[0]
end

def rotate_string(str)
  rotate_array(str.chars).join
end

def rotate_number(num)
  rotate_string(num.to_s).to_i
end

puts rotate_string('ciao ciao') == 'iao ciaoc'
puts rotate_string('a') == 'a'

puts rotate_number(849) == 498
puts rotate_number(1000) == 0001  # The result of #rotate_number(1000) is 1
                                  # but Ruby treats 001 as 1
