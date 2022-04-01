=begin

input: str
output: - array made of palindromic sub-strings
          size: at least 2 characters, max string.size characters
        - empty array in case of empty string

data struct: given string and a new string

str = 'kayak'
       01234

slice_size = 2   # to str.size
idx = 0          # to str.size - slice_size

algorithm:
- given a string 'str'
- set empty array 'arr'
- set slice_size = 2
- loop till slice_size = str.size
  - set idx = 0
  - loop till idx = str.size - slice_size
    - increase idx by 1
    - add str[idx..slice_size] to 'arr' if is equal its reverse
  - end loop
  - increase slice_size by 1
- end loop
- return 'arr'

=end

def palindrome_substrings(str)
  arr = []
  slice_size = 2

  while slice_size <= str.size
    idx = 0
    add_palindr_slice(str, idx, slice_size, arr)
    slice_size += 1
  end

  arr
end

def add_palindr_slice(str, idx, slice_size, arr)
   while idx <= (str.size - slice_size)
    word = str[idx, slice_size]
    arr.prepend(word) if word == word.reverse
    idx += 1
  end
  nil
end

puts palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
puts palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
puts palindrome_substrings("palindrome") == []
puts palindrome_substrings("") == []
