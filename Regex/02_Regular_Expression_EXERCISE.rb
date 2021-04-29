
########### EXERCISES 1

# Write a regex that matches an uppercase K. Test it with these strings:
#
# Kx
# BlacK
# kelly
#
# There should be two matches.

/K/


########### EXERCISES 2

# Write a regex that matches an uppercase or lowercase H. Test it with
# these strings:
#
# Henry
# perch
# golf
#
# There should be two matches.

/h/i

# or

/(H|h)/


########### EXERCISES 3

# Write a regex that matches the string dragon. Test it with these strings:
#
# snapdragon
# bearded dragon
# dragoon
#
# There should be two matches.

/dragon/


########### EXERCISES 4

# Write a regex that matches any of the following fruits: banana, orange,
# apple, strawberry. The fruits may appear in other words. Test it with
# these strings:
#
# banana
# orange
# pineapples
# strawberry
# raspberry
# grappler
#
# There should be five matches.

/(banana|orange|apple|strawberry)/


########### EXERCISES 5

# Write a regex that matches a comma or space. Test your regex with these strings:
#
# This line has spaces
# This,line,has,commas,
# No-spaces-or-commas
#
# There should be seven matches.

/(,| )/


########### EXERCISES 6

# Challenge: Write a regex that matches blueberry or blackberry, but write berry 
# precisely once. Test it with these strings:
#
# blueberry
# blackberry
# black berry
# strawberry
#
# There should be two matches.

/(blue|black)berry/

# How come the regex doesn't match black berry?

# ANSWER
#
# Because there is a space between the two words.
