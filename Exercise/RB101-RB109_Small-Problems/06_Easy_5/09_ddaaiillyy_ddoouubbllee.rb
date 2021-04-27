# Write a method that takes a string argument and returns a new string that 
# contains the value of the original string with all consecutive duplicate 
# characters collapsed into a single character. You may not use String#squeeze or 
# String#squeeze!.
#
# Examples:
#
# crunch('ddaaiillyy ddoouubbllee') == 'daily double'
# crunch('4444abcabccba') == '4abcabcba'
# crunch('ggggggggggggggg') == 'g'
# crunch('a') == 'a'
# crunch('') == ''

###### ANSWER

def crunch(string)
  new_str = []
  string.size.times do |i|
    new_str << string[i] unless new_str.last == string[i]
  end
  new_str.join('')
end

puts crunch('ddaaiillyy ddoouubbllee') == 'daily double'
puts crunch('4444abcabccba') == '4abcabcba'
puts crunch('ggggggggggggggg') == 'g'
puts crunch('a') == 'a'
puts crunch('') == ''

###### SOLUTION

def crunch(text)
  index = 0
  crunch_text = ''
  while index <= text.length - 1
    crunch_text << text[index] unless text[index] == text[index + 1]
    index += 1
  end
  crunch_text
end

###### FURTHER EXPLORATION

###### 1

# You may have noticed that we continue iterating until index points past the end 
# of the string. As a result, on the last iteration text[index] is the last 
# character in text, while text[index + 1] is nil. Why do we do this? What happens 
# if we stop iterating when index is equal to text.length?

###### ANSWER

# The last character will be missing


###### 2

# Can you determine why we didn't use String#each_char or String#chars to iterate 
# through the string? How would you update this method to use String#each_char or 
# String#chars?

###### ANSWER

def crunch(string)
  new_str = []
  for i in string.chars
    new_str << i unless new_str.last == i
  end
  new_str.join('')
end
