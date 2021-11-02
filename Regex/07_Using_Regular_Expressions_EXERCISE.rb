
######### EXERCISE 1

# Write a method that returns true if its argument looks like a URL, 
# false if it does not.
# 
# Examples:
# 
# url?('http://launchschool.com')   # -> true
# url?('https://example.com')       # -> true
# url?('https://example.com hello') # -> false
# url?('   https://example.com')    # -> false

def url?(str)
  str.match?(/\Ahttps?:\/\/\S+\z/)
end

puts url?('http://launchschool.com')   # -> true
puts url?('https://example.com')       # -> true
puts url?('https://example.com hello') # -> false
puts url?('   https://example.com')    # -> false


######### EXERCISE 2

# Write a method that returns all of the fields in a haphazardly formatted 
# string. A variety of spaces, tabs, and commas separate the fields, with 
# possibly multiple occurrences of each delimiter.
# 
# Examples:
# 
# fields("Pete,201,Student")
# # -> ['Pete', '201', 'Student']
# 
# fields("Pete \t 201    ,  TA")
# # -> ['Pete', '201', 'TA']
# 
# fields("Pete \t 201")
# # -> ['Pete', '201']
# 
# fields("Pete \n 201")
# # -> ['Pete', '\n', '201']

def fields(str)
  str.split(/[, \t]+/)
end


p fields("Pete,201,Student")
# => ['Pete', '201', 'Student']

p fields("Pete \t 201    ,  TA")
# => ['Pete', '201', 'TA']

p fields("Pete \t 201")
# => ['Pete', '201']

p fields("Pete \n 201")
# => ['Pete', '\n', '201']


######### EXERCISE 3

# Write a method that changes the first arithmetic operator (+, -, *, /) 
# in a string to a '?' and returns the resulting string. Don't modify the 
# original string.
# 
# Examples:
# 
# mystery_math('4 + 3 - 5 = 2')
# # => '4 ? 3 - 5 = 2'
# 
# mystery_math('(4 * 3 + 2) / 7 - 1 = 1')
# # => '(4 ? 3 + 2) / 7 - 1 = 1'

def mystery_math(str)
  str.sub(/[\+\-\*\/]/, '?')
end

p mystery_math('4 + 3 - 5 = 2')
# => '4 ? 3 - 5 = 2'

p mystery_math('(4 * 3 + 2) / 7 - 1 = 1')
# => '(4 ? 3 + 2) / 7 - 1 = 1'

#### SOLUTION

def mystery_math(equation)
  equation.sub(/[+\-*\/]/, '?')
end


######### EXERCISE 4

# Write a method that changes every arithmetic operator (+, -, *, /) 
# to a '?' and returns the resulting string. Don't modify the original string.
# 
# Examples:
# 
# mysterious_math('4 + 3 - 5 = 2')           # -> '4 ? 3 ? 5 = 2'
# mysterious_math('(4 * 3 + 2) / 7 - 1 = 1') # -> '(4 ? 3 ? 2) ? 7 ? 1 = 1'

def mysterious_math(str)
  str.gsub(/[+\-*\/]/, '?')
end

p mysterious_math('4 + 3 - 5 = 2')           # -> '4 ? 3 ? 5 = 2'
p mysterious_math('(4 * 3 + 2) / 7 - 1 = 1') # -> '(4 ? 3 ? 2) ? 7 ? 1 = 1'


######### EXERCISE 5

# Write a method that changes the first occurrence of the word apple, 
# blueberry, or cherry in a string to danish.
# 
# Examples:
# 
# danish('An apple a day keeps the doctor away')
# # => 'An danish a day keeps the doctor away'
# 
# danish('My favorite is blueberry pie')
# # => 'My favorite is danish pie'
# 
# danish('The cherry of my eye')
# # => 'The danish of my eye'
# 
# danish('apple. cherry. blueberry.')
# # => 'danish. cherry. blueberry.'
# 
# danish('I love pineapple')
# # => 'I love pineapple'

def danish(str)
  str.sub(/\b(apple|blueberry|cherry)\b/, 'danish')
end

p danish('An apple a day keeps the doctor away')
# -> 'An danish a day keeps the doctor away'

p danish('My favorite is blueberry pie')
# -> 'My favorite is danish pie'

p danish('The cherry of my eye')
# -> 'The danish of my eye'

p danish('apple. cherry. blueberry.')
# -> 'danish. cherry. blueberry.'

p danish('I love pineapple')
# -> 'I love pineapple'


######### EXERCISE 6

# Challenge: write a method that changes dates in the format 2016-06-17 
# to the format 17.06.2016. You must use a regular expression and should 
# use methods described in this section.
# 
# Example:
# 
# format_date('2016-06-17') # -> '17.06.2016'
# format_date('2016/06/17') # -> '2016/06/17' (no change)

# Just watched the solution. I tried anyway to find a short way to
# write the method using the range {} quantifier:

def format_date(date)
  date.gsub(/(\d{4})-(\d{2})-(\d{2})/, '\3.\2.\1')
end

p format_date('2016-06-17') # -> '17.06.2016'
p format_date('2016/06/17') # -> '2016/06/17' (no change)

#### SOLUTION

def format_date(original_date)
  original_date.sub(/\A(\d\d\d\d)-(\d\d)-(\d\d)\z/, '\3.\2.\1')
end


######### EXERCISE 7

# Challenge: write a method that changes dates in the format 2016-06-17 
# or 2016/06/17 to the format 17.06.2016. You must use a regular expression 
# and should use methods described in this section.
# 
# Example:
# 
# format_date('2016-06-17') # => '17.06.2016'
# format_date('2017/05/03') # => '03.05.2017'
# format_date('2015/01-31') # => '2015/01-31' (no change)

#### SOLUTION

def format_date(original_date)
  original_date.sub(/\A(\d\d\d\d)-(\d\d)-(\d\d)\z/, '\3.\2.\1')
               .sub(/\A(\d\d\d\d)\/(\d\d)\/(\d\d)\z/, '\3.\2.\1')
end

# Alternative solution

def format_date(original_date)
  date_regex = /\A(\d\d\d\d)([\-\/])(\d\d)\2(\d\d)\z/
  original_date.sub(date_regex, '\4.\3.\1')

# The easiest way to approach this problem is to split it into smaller 
# sub-problems, one that handles dates in 2016-05-17 format, and one that handles 
# 2016/05/17 format, which is what both of our primary solutions do. One possible 
# gotcha here is that you must remember to escape the / characters in the regex.

# You can solve this problem with one regex, as in our alternate solutions, but at 
# the expense of a more complex regex and lowered readability. The regex adds one 
# additional capture group to capture the first - or /, and uses a \2 
# backreference to refer back to that capture in the regex. However, this 
# additional capture group modifies the backreference numbers for the month and 
# day components of the date, so we now need to refer to them as \4 and \3 in 
# Ruby, $4 and $3 in JavaScript. In Ruby, this might be a good time to look up how 
# to use named capture groups.

# Note that our alternate solutions use variables to store the regex. We do this 
# both for readability, and to show that regex are no different than any other 
# object; you can manipulate and pass them around as needed.
