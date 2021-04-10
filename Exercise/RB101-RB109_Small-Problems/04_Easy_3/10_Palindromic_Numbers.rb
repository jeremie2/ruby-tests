# Write a method that returns true if its integer argument is palindromic,
# false otherwise. A palindromic number reads the same forwards and backwards.
#
# Examples:
#
# palindromic_number?(34543) == true
# palindromic_number?(123210) == false
# palindromic_number?(22) == true
# palindromic_number?(5) == true

######## ANSWER

def palindromic_number?(num)
  num = num.to_s
  num == num.reverse
end

######## EXTRA

# Suppose your number begins with one or more 0s. Will your method still work?
# Why or why not? Is there any way to address this?

######## ANSWER

# It doesn't work because zeros in front of numbers transforms it in a octal
# number. I couldn't find an efficient solution. It seems that the only way to
# deal with it is to prepend zeros an integer number transformed into string:

5.to_s.rjust(2, "0")
# => "05"

5.to_s.rjust(4, "0")
=> "0005"
