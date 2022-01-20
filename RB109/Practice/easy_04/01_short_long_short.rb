=begin

Write a method that takes two strings as arguments, determines the longest
of the two strings, and then returns the result of concatenating the shorter
string, the longer string, and the shorter string once again. You may assume
that the strings are of different lengths.

Examples:

short_long_short('abc', 'defgh') == "abcdefghabc"
short_long_short('abcde', 'fgh') == "fghabcdefgh"
short_long_short('', 'xyz') == "xyz"

## PEDAC

input: two strings
mid section: - compare strings size
             - concatenate strings
output: string

datastruct: just use stings

algorithm:
- given two strings `str1` and `str2`
- return `str1` + `str2` + `str1` if `str1` is shorter than `str2` 
- return `str2` + `str1` + `str2` if `str1` is greater than `str2` 

=end

def short_long_short(str1, str2)
  if str1.size < str2.size
    str1 + str2 + str1
  else
    str2 + str1 +str2
  end
end



puts short_long_short('abc', 'defgh') == "abcdefghabc"
puts short_long_short('abcde', 'fgh') == "fghabcdefgh"
puts short_long_short('', 'xyz') == "xyz"
