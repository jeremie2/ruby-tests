# Write a method that determines and returns the ASCII string value of a string 
# that is passed in as an argument. The ASCII string value is the sum of the ASCII 
# values of every character in the string. (You may use String#ord to determine the 
# ASCII value of a character.)
#
# ascii_value('Four score') == 984
# ascii_value('Launch School') == 1251
# ascii_value('a') == 97
# ascii_value('') == 0

#### ANSWER

# ord → integer
# Returns the Integer ordinal of a one-character string.
# "a".ord         #=> 97

def ascii_value(string)
  sum = 0
  string.chars.each { |ch| sum += ch.ord }
  sum
end

#### ALSO
# String#sum does it automatically:

def ascii_value(string)
  string.sum
end

#### FURTHER EXPLORATION

# There is an Integer method such that:
#   char.ord.mystery == char
# where mystery is our mystery method. Can you determine what method name should be 
# used in place of mystery?

#### ANSWER

# The 'mystery' method is String#chr. It looks that the method takes the asci 
# character value and return the relative character.
# But the documentation tells:
#   chr → string
#   Returns a one-character string at the beginning of the string.
#     a = "abcde"
#     a.chr    # => "a"

char.ord.chr == char  # true

# What happens if you try this with a longer string instead of a single character?

#### ANSWER

# By definition it should work just with a single character.
# Let's try with the value of 'Four score' which is 984:

984.chr
# => RangeError: 984 out of char range
