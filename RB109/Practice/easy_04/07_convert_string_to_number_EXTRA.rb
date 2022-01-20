=begin

Further Exploration of previous exercise

Write a hexadecimal_to_integer method that converts a string representing
a hexadecimal number to its integer value.

DIGITS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
}

def string_to_integer(string)
  digits = string.chars.map { |char| DIGITS[char] }

  value = 0
  digits.each { |digit| value = 10 * value + digit }
  value
end

puts string_to_integer('4321') == 4321
puts string_to_integer('570') == 570

=end

HEXDIGITS = {
  '0' => 0,  '1' => 1,  '2' => 2,  '3' => 3,
  '4' => 4,  '5' => 5,  '6' => 6,  '7' => 7,
  '8' => 8,  '9' => 9,  'A' => 10, 'B' => 11,
  'C' => 12, 'D' => 13, 'E' => 14, 'F' => 15
}

def hexadecimal_to_integer(string)
  digits = string.upcase.chars.map { |char| HEXDIGITS[char] }

  value = 0
  digits.each { |digit| value = 16 * value + digit }
  value
end

puts hexadecimal_to_integer('4D9F') == 19871
