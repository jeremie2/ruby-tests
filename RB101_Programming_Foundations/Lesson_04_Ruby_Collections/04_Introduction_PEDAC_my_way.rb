# PROBLEM:
# Given a string, write a method `palindrome_substrings` which returns
# all the substrings from a given string which are palindromes. Consider
# palindrome words case sensitive.
#
# Test cases:
# palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
# palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
# palindrome_substrings("palindrome") == []
# palindrome_substrings("") == []

######## ANSWER

################ UNDERSTANDING THE PROBLEM
#
# IN/OUT
# input: string
# output: array of palindrome substrings
#
# RULES
# palindrome: string == string.reverse
# case sensitive palindrome: 'ada' != 'Ada'
# (implicit)
# at least a substring of 2 character
# empty string == "" == []
# no result == []

#### EXAMPLES TEST CASE
# (see the above description)

################ DATA STRUCTURE
#
# str = 'yuppy'
#
# What we need:
# - initialize an empty array where to collect substrings
# - algorithm: we have to loop the string's character to find slice of
#   string which are palindrome.
# - for the algorithm we need at least 2 loops:
#   - one to set the size of the slice
#   - another to move through the character
# - define a method palindrome?(substrings) WE CAN AVOID IT JUST WITH
#                                           substring == substring.reverse
#
######### SLICES LOOP
#
# string = 'yuppy'
# slice_size = 2 # from 2 to str.size
# char_index = 0
#
# 'yuppy'
#  01234
#
# slice_size = 2  => yu up pp py
# slice_size = 3  => yup upp ppy
# slice_size = 4  => yupp uppy
# slice_size = 5  => yuppy
#
# string.slice(slice_size, char_index)
#
# It's clear that we have to loop slice_size from 2 to 5
# More general, from 2 to 'string.size'
#
#
########## INDEX LOOP
#
# Let's see what happens with the string's index:
#
# - slice_size = 2
# char_index = 0  => yu
# char_index = 1  => up
# char_index = 2  => pp
# char_index = 3  => py
#
# index changes between 0 and 3
#
# - slice_size = 3
# char_index = 0  => yup
# char_index = 1  => upp
# char_index = 2  => ppy
#
# index changes between 0 and 2
#
# - slice_size = 4
# char_index = 0  => yupp
# char_index = 1  => uppy
#
# index changes between 0 and 1
#
# - slice_size = 5
# char_index = 0  => yuppy
#
# index is 0
#
#
# string.length = 5
# loop 1:   0 <= index <= 3
# loop 2:   0 <= index <= 2
# loop 3:   0 <= index <= 1
# loop 4:   0 = index
#
# We have to take in consideration that the last slice has to be
# 'slice_size' distant from the end of a string.
# In the first loop the last slice is at index 3:
#     __
# 'yuppy'  'py' starts 2 character distant from the end
#  01234
#
# At the second loop:
#    ___
# 'yuppy'  'ppy' starts 3 character distant from the end
#  01234
#
# We can generalize that the last index in the loop is:
#
#         index = string.length - slice_size
#
# loop 1: index <= 3     (5 - 2)
# loop 2: index <= 2     (5 - 3)
# loop 3: index <= 1     (5 - 4)
# loop 4: index = 0      (5 - 5)
#
#
########## ALGORITHM:
# given a string
#
# - initialize empty array named 'result'
# - initialize slice_size = 2
# - start loop that iterate slice_size from 2 to string.length
#   - initialize char_index = 0
#   - start loop that iterate char_index from 0 to string.length - slice_size
#     - set 'slice' as string slice starting from char_index to
#       char_index + slice_size
#     - if 'slice' is equal 'slice.reverse' append slice to 'result'
#     - char_index += 1
#   - end inner loop
#   - slice_size += 1
# - end outer loop
# - return 'result'

########## CODE:

def palindrome_substrings(str)
  result = []
  slice_size = 2

  while slice_size <= str.length
    char_index = 0
    while char_index <= str.length - slice_size
      slice = str.slice(char_index, slice_size)
      result << slice if slice == slice.reverse
      char_index += 1
    end
    slice_size += 1
  end
  result
end

p palindrome_substrings('atabliv') == ["ata"]
p palindrome_substrings('agata') == ["aga", "ata"]
p palindrome_substrings('Lalabel') == ["ala"]
p palindrome_substrings('cbdhfgcffcdgfcv') == ["ff", "cffc"]

# edge case
p palindrome_substrings('as  gt ') == ["  "]
