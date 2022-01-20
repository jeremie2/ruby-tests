=begin

Write a method that determines and returns the ASCII string value of
a string that is passed in as an argument. The ASCII string value is
the sum of the ASCII values of every character in the string.
(You may use String#ord to determine the ASCII value of a character.)

ascii_value('Four score') == 984
ascii_value('Launch School') == 1251
ascii_value('a') == 97
ascii_value('') == 0

## PEDAC

input: string
mid section: - iterate each character to retrieve its relative ascii value
             - return the sum of ascii values
output: integer (sum of ascii values of each char into given string)

data struct: use of an array at some point

algorithm:
- given a string 'str'
- set 'sum' equal zero
- iterate each character and add to 'sum' its ascii
- return 'sum'

=end

# def ascii_value(str)
#   sum = 0
#   str.each_char { |ch| sum += ch.ord }
#   sum
# end

## short version

def ascii_value(str)
  str.chars.map { |ch| ch.ord }.sum
end

puts ascii_value('Four score') == 984
puts ascii_value('Launch School') == 1251
puts ascii_value('a') == 97
puts ascii_value('') == 0

=begin

Further Exploration

There is an Integer method such that:

  char.ord.mystery == char

where mystery is our mystery method. Can you determine what method name
should be used in place of mystery? What happens if you try this with a
longer string instead of a single character?

=end

# The #mystery method is #chr that returns the character that has as ascii
# value the integer returned by char.ord.
# Example:

char = 'a'
char.ord.chr == char
# => true
