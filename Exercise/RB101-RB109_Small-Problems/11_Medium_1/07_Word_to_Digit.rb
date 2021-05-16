# Write a method that takes a sentence string as input, and returns the same string with any 
# sequence of the words 'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 
# 'eight', 'nine' converted to a string of digits.


#### ANSWER

DIGITS = {
  'zero' => '0',
  'one' => '1',
  'two' => '2',
  'three' => '3',
  'four' => '4',
  'five' => '5',
  'six' => '6',
  'seven' => '7',
  'eight' => '8',
  'nine' => '9'
}

def word_to_digit(str)
  DIGITS.keys.each { |number| str.gsub!(/#{number}/, DIGITS[number]) }
  str
end

puts word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'


#### SOLUTION

# Basically the same but the regex is also indicating the boundaries of the word
# using \b: /\b#{word}\b/


DIGIT_HASH = {
  'zero' => '0', 'one' => '1', 'two' => '2', 'three' => '3', 'four' => '4',
  'five' => '5', 'six' => '6', 'seven' => '7', 'eight' => '8', 'nine' => '9'
}.freeze

def word_to_digit(words)
  DIGIT_HASH.keys.each do |word|
    words.gsub!(/\b#{word}\b/, DIGIT_HASH[word])
  end
  words
end


#### FURTHER EXPLORATION

# There are many ways to solve this problem and different varieties of it. Suppose, for 
# instance, that we also want to replace uppercase and capitalized words.

def word_to_digit(str)
  DIGITS.keys.each { |number| str.gsub!(/\b#{number}\b/, DIGITS[number]) }
  str.downcase
end

# => 'please call me at 5 5 5 1 2 3 4. thanks.'

# Can you change your solution so that the spaces between consecutive numbers are removed? 
# Suppose the string already contains two or more space separated numbers (not words); can 
# you leave those spaces alone, while removing any spaces between numbers that you create?

def word_to_digit(str)
  DIGITS.keys.each { |number| str.gsub!(/\b#{number}\b/, DIGITS[number]) }
  str.downcase.gsub!(/(\d)\s/, '\1')
end

# => 'please call me at 5551234. thanks.'

# What about dealing with phone numbers? Is there any easy way to format the result to 
# account for phone numbers? For our purposes, assume that any 10 digit number is a phone 
# number, and that the proper format should be "(123) 456-7890".

def word_to_digit(str)
  DIGITS.keys.each { |number| str.gsub!(/\b#{number}\b/, DIGITS[number]) }
  str.gsub!(/(\d)\s/, '\1')
  str.gsub!(/\b(\d{3})(\d{3})(\d{4})\b/, '(\1) \2-\3')
end

puts word_to_digit('Please call me at one two three five five five one two three four. Thanks.') == 'Please call me at (123) 555-1234. Thanks.'


#### from user RALPH WILLIAM HARTMAN IV

def word_to_digit(string)
  puts string.gsub(/zero|one|two|three|four|five|six|seven|eight|nine/,
  'zero' => '0',
  'one' => '1',
  'two' => '2',
  'three' => '3',
  'four' =>'4',
  'five' => '5',
  'six' => '6',
  'seven' => '7',
  'eight' => '8',
  'nine' => '9')
end
