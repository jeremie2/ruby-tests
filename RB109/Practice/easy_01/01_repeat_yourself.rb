=begin

Write a method that takes two arguments, a string and a positive integer,
and prints the string as many times as the integer indicates.

Example:

  repeat('Hello', 3)

Output:

  Hello
  Hello
  Hello

::::::::::::::::: PEDAC

- input: a string, a integer
- output: string/strings

There's no particular data structure to take care.
The data passed to the method will be straight used inside a loop
that will print the string how many times  equal the value of the
integer.

- given a string `str` and a integer `num`
- execute a loop `num` times so that each time the string will be printed

=end

def repeat(str, num)
  num.times { puts str }
end

repeat('Hello', 3)
