# Write a method that returns a list of all substrings of a string that start at 
# the beginning of the original string. The return value should be arranged in 
# order from shortest to longest substring.

#### ANSWER

def leading_substrings(str)
  arr = []
  str.size.times { |i| arr << str[0..i] }
  # 1.upto(str.size) { |i| arr << str[0, i] }
  # str.chars.each_with_index { |_, idx| arr << str[0..idx] }
  arr
end

puts leading_substrings('abc') == ['a', 'ab', 'abc']
puts leading_substrings('a') == ['a']
puts leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

#### SOLUTION

def leading_substrings(string)
  result = []
  0.upto(string.size - 1) do |index|
    result << string[0..index]
  end
  result
end
