=begin

Write a method that takes a string argument and returns a new string that
contains the value of the original string with all consecutive duplicate
characters collapsed into a single character. You may not use String#squeeze
or String#squeeze!.

Examples:

crunch('ddaaiillyy ddoouubbllee') == 'daily double'
crunch('4444abcabccba') == '4abcabcba'
crunch('ggggggggggggggg') == 'g'
crunch('a') == 'a'
crunch('') == ''

## PEDAC

input: string
output: string with no doubled characters

data struct: new string to collect character

algorithm:
- given a string 'str'
- return '' if 'str' is empty or 'str' size is equal one
- set 'new_str' as empty string
- add str[0] to 'new_str'
- loop each character of 'str' starting from second element
  - add element to 'new_str' if it's different by previous element
- end loop
- return 'new_str'

=end

# def crunch(str)
#   return str if str == '' || str.size == 1
#   new_str = ''
#   new_str << str[0]
#   idx = 1
#   while idx < str.size
#     new_str << str[idx] if str[idx] != str[idx-1]
#     idx += 1
#   end
#   new_str
# end

## CLEVER SOLUTION

# Add the character to 'new_str' unless str[idx] is equal str[idx+1]

# def crunch(str)
#   new_str = ''
#   idx = 0
#   while idx < str.size
#     new_str << str[idx] unless str[idx] == str[idx+1]
#     idx += 1
#   end
#   new_str
# end

# def crunch(str)
#   new_str = ''
#   str.chars.each_with_index do |ch, idx|
#     new_str << ch unless str[idx] == str[idx+1]
#   end
#   new_str
# end

## WITH REGEX

# from Ethanweiner20

def crunch(str)
  str.gsub(/(.)\1+/, '\1')
end

puts crunch('ddaaiillyy ddoouubbllee') == 'daily double'
puts crunch('4444abcabccba') == '4abcabcba'
puts crunch('ggggggggggggggg') == 'g'
puts crunch('a') == 'a'
puts crunch('') == ''
