
########### BASIC MATCHING

# https://rubular.com/ will be used.


########### ALPHANUMERICS

# /s/ will match letter s inside a string.
# If we put inside Rubular text field:

"s sand cats cast Mississippi S KANSAS"

# and s in the regex field, then all letter s inside the string will be highlight
# (this is how Rubolar works, normally with program languages a search like this
# stops at the first match (boolean operation)) but not S.
# Regex work in case sensitive way.
#
# Let's try using Ruby:

str = 'cast'
puts "matched 's'" if str.match(/s/)
# matched 's'
# => nil
puts "matched 'x'" if str.match(/x/)

# String#match check whether character 's' and 'x' appear inside 'str'.


########### SPECIAL CHARACTERS

# $ ^ * + ? . ( ) [ ] { } | \ / are known as META CHARACTER.
#
# When we want to match a meta character we have to escape it using \
# Example when searching for ? the syntax is /\?/

str = "? What's up, doc? Silence! What's that?"

str.match(/?/)
# => target of repeat operator is not specified: /?/

str.match(/\?/)
# => #<MatchData "?">

str.match(/ /)          # In Rubular we have to use [ ] for withe space
# => #<MatchData " ">

str.match(/./)
# => #<MatchData "?">   # Doesn't make sense but escaping it..
str.match(/\./)
# => nil                # as expected because there are no . in 'str'


# If you don't remember which meta character needs to be escaped, that's
# not a big problem. Escaping a meta character that doesn't need to be
# escaped doesn't create any problems.

str = "? What's up: doc? Silence! What's that?"

str.match(/\:/)
# => #<MatchData "?">
str.match(/:/)
# => #<MatchData "?">


########### CONCATENATION

str = "cat catalog copycat scatter the lazy cat. CAT cast"

# Let's try to concatenate more patterns: /cat/

str.match(/cat/)
# => #<MatchData "cat">


########### Alternation

# Using (|) it's possible to look for different matches at the same time.

str = "The lazy cat. The dog barks. Down the rabbit hole. The lazy cat, chased by the barking dog, dives down the rabbit hole. catalog The Yellow Dog My bearded dragon's name is Darwin"

str.match(/(cat|dog|rabbit)/)
# => #<MatchData "cat" 1:"cat">

# As expected it stops as the method find the first match. Using Rubular we see
# that all the others will be discovered.
#
# We have seen meta characters (|) used for their functionalities inside regex.
# Let's see what happens escaping them:

str.match(/\(cat\|dog\)/)
# => nil

# It simply doesn't work because it's searching for this string "(cat|dog)".


########### CONTROL CHARACTER ESCAPES

# Every program language uses character escaping to perform some operations
# with strings:
# \n  new line
# \r  begins the string after it
# \t  tab

puts "has tab" if "Good evening".match(/\t/)
# => nil

puts "has\t tab" if "Good\t evening".match(/\t/)
has tab
# => nil

# (!!!) Not everything that look like an escape is an escape:
#
# \s and \d are special character classes (we'll cover these later)
# \A and \z are anchors (we'll cover these as well)
# \x and \u are special character code markers (we won't cover these)
# \y and \q have no special meaning at all


########### IGNORING CASE - FLAGS/MODIFIERS

# To ignore the 'case sensitive' default behavior, we have to add 

str =  "LAUNCH SCHOOL!"

str.match(/launch/)
# => nil
str.match(/launch/i)
# => #<MatchData "LAUNCH">
