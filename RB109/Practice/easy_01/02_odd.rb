=begin

Write a method that takes one integer argument, which may be positive, negative, or zero. This method returns true if the number's absolute value is odd. You may assume that the argument is a valid integer value.

Example:

  puts is_odd?(2)    # => false
  puts is_odd?(5)    # => true
  puts is_odd?(-17)  # => true
  puts is_odd?(-8)   # => false
  puts is_odd?(0)    # => false
  puts is_odd?(7)    # => true

Keep in mind that you're not allowed to use #odd? or #even? in your solution.

::::::::::::::::: PEDAC

- input: integer
- output: boolean

There's no particular data structure to take care. Just testing
a property of integer odd number.

- given a integer `num`
- use  modulo operator `%` to perform comparison between `num % 2` and zero `0`
  so that if `num` divided 2 has a rest, then method returns `true` 

=end

def is_odd?(num)
  num % 2 != 0
end

puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false
puts is_odd?(7)    # => true
