# The || operator returns a truthy value if either or both of its operands
# are truthy, a falsey value if both operands are falsey. The && operator
# returns a truthy value if both of its operands are truthy, and a falsey
# value if either operand is falsey. This works great until you need only
# one of two conditions to be truthy, the so-called exclusive or.
#
# In this exercise, you will write a function named xor that takes two
# arguments, and returns true if exactly one of its arguments is truthy,
# false otherwise. Note that we are looking for a boolean result instead of
# a truthy/falsy value as returned by || and &&.
#
# Examples:

xor?(5.even?, 4.even?) == true
xor?(5.odd?, 4.odd?) == true
xor?(5.odd?, 4.even?) == false
xor?(5.even?, 4.odd?) == false


######## ANSWER
Can you think of a situation in which a boolean xor method would be useful? Suppose you were modeling a light at the top of a flight of stairs wired in such a way that the light can be turned on or off using either the switch at the bottom of the stairs or the switch at the top of the stairs. This is an xor configuration, and it can be modeled in ruby using the xor method. Think of some additional examples.

|| and && are so-called short circuit operators in that the second operand is not evaluated if its value is not needed. Does the xor method perform short-circuit evaluation of its operands? Why or why not? Does short-circuit evaluation in xor operations even make sense?
def xor?(cond_1, cond_2)
  (cond_1 == false && cond_2 == true) || (cond_1 == true && cond_2 == false)
end

# better this way:

def xor?(cond_1, cond_2)
  cond_1 && !cond_2 || !cond_1 && cond_2
end


######## SOLUTION

def xor?(value1, value2)
  return true if value1 && !value2
  return true if value2 && !value1
  false
end


######## EXTRA

# Can you think of a situation in which a boolean xor method would be useful?
# Suppose you were modeling a light at the top of a flight of stairs wired in
# such a way that the light can be turned on or off using either the switch at
# the bottom of the stairs or the switch at the top of the stairs. This is an
# xor configuration, and it can be modeled in ruby using the xor method. Think
# of some additional examples.

#### ANSWER

# Traffic lights. When it's green for a road, it's red for the other road.


# || and && are so-called short circuit operators in that the second operand is
# not evaluated if its value is not needed. Does the xor method perform
# short-circuit evaluation of its operands? Why or why not? Does short-circuit
# evaluation in xor operations even make sense?

#### ANSWER

# xor cannot perform short circuit operations because in order to return true
# it has always to check if both conditions are one opposite of the other.
