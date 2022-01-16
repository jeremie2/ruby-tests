=begin

The || operator returns a truthy value if either or both of its operands
are truthy. If both operands are falsey, it returns a falsey value. The
&& operator returns a truthy value if both of its operands are truthy,
and a falsey value if either operand is falsey. This works great until you
need only one of two conditions to be truthy, the so-called exclusive or.

In this exercise, you will write a function named xor that takes two
arguments, and returns true if exactly one of its arguments is truthy,
false otherwise. Note that we are looking for a boolean result instead
of a truthy/falsy value as returned by || and &&.

Examples:

xor?(5.even?, 4.even?) == true
xor?(5.odd?, 4.odd?) == true
xor?(5.odd?, 4.even?) == false
xor?(5.even?, 4.odd?) == false

## PEDAC

The examples are misleading. The parameters (5.even?, 4.even?...) returns
"clear" boolean value (true/false). A method like this should be fine:

  def xor?(val1, val2)
    val1 != val2
  end

But if we read the description the method should work with generic truthiness
and it should work in cases like this:

  xor?(5, 4.even?)

which doesn't work because 5 != true.

The important thing is that we have to "evaluate" the truthiness of the
parameters.


input: 2 objects
mid section: compare the truthiness of the objects
output: a boolean value

algorithm:
- given two conditions `cond1` and `cond2`
- return `true` if the truthiness of `cond1` and `cond2 are different

=end

def xor?(cond_1, cond_2)
  (cond_1 == false && cond_2 == true) || (cond_1 == true && cond_2 == false)
end

puts xor?(5.even?, 4.even?) == true
puts xor?(5.odd?, 4.odd?) == true
puts xor?(5.odd?, 4.even?) == false
puts xor?(5.even?, 4.odd?) == false

# extra
puts xor?(5, 4.even?) == false
