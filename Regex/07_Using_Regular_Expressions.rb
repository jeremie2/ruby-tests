
########### USING REGULAR EXPRESSIONS IN RUBY


########### MATCHING STRINGS

#### match()
#
# We have already seen String#match() method. A portion of code could looks
# like this:

fetch_url(text) if text.match(/\Ahttps?:\/\/\S+\z/)

# example:

text = 'https://launchschool.com'
puts 'Valid url' if text.match(/\Ahttps?:\/\/\S+\z/)


# The return value of match should be an array but in Ruby it is
# actually a 'MatchData' object.


#### =~
#
# Similar to #match (even faster) =~ can be used in the same way:

text = 'https://launchschool.com'
puts 'Valid url' if =~ /\Ahttps?:\/\/\S+\z/


#### scan()
#
# #scan returns an array of matches:

a = "cruel world"

a.scan(/\w+/)
#=> ["cruel", "world"]

a.scan(/.../)
#=> ["cru", "el ", "wor"]


########### SPLITTING STRINGS

# #split return an array of values that comes by splitting a string
# in pieces delimited by particular characters:

record = "xyzzy\t3456\t334\tabc"
fields = record.split("\t")
# -> ['xyzzy', '3456', '334', 'abc']

# It works also when the delimiters is just an arbitrary white space:

record = "xyzzy  3456  \t  334\t\t\tabc"
fields = record.split(/\s+/)
# -> ['xyzzy', '3456', '334', 'abc']


# (!!!) Beware of regex like /:*/ and /\t?/ used with split.
# As they matches 'zero or more' they can lead to unexpected results:

'abc:xyz'.split(/:*/)
# -> ['a', 'b', 'c', 'x', 'y', 'z']


########### CAPTURE GROUPS: A DIVERSION

# If we want to match a string in single or double quotes we could write:

if text.match(/".*?"/) || text.match(/'.*?'/)
  puts "Got a quoted string"
end

# This looks clear, but we have to know that sometimes a 'backreference'
# can be used.

/(['"]).+?\1/

# (['"])  this part will match the use of a single ' or a double " quote.
# .+?     this matches any or more of any character (with lazy quantifier) 
# \1      backreference: if a ' is matched, then it will match a ' 
#         else a " will be matched.
# 
# We'll see the usage in the next chapter.


########### TRANSFORMATIONS IN RUBY

# sub  transforms the first part of a string that matches a regex.
# gsub transforms every part of a string that matches.

text = 'Four score and seven'

vowelless = text.sub(/[aeiou]/, '*')
# => "F*ur score and seven"

vowelless = text.gsub(/[aeiou]/, '*')
# => 'F**r sc*r* *nd s*v*n'


# With backreference:
text = %(We read "War of the Worlds".)
puts text.sub(/(['"]).+\1/, '\1The Time Machine\1')
# => We read "The Time Machine".

# We could use double quote, but the we have to double the backslash:
puts text.sub(/(['"]).+\1/, "\\1The Time Machine\\1")

# If possible use single quotes.


########### FROM EXERCISE

# Look at this use of backreference to write 2016-06-17 in this
# format 17.06.2016:

def format_date(original_date)
  original_date.sub(/\A(\d\d\d\d)-(\d\d)-(\d\d)\z/, '\3.\2.\1')
end

format_date('2016-06-17') # => '17.06.2016'