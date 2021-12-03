=begin

Print all even numbers from 1 to 99, inclusive, to the console,
with each number on a separate line.

::::::::::::::::: PEDAC

input: list of integers
output: list of even integers from 1 to 99

data structure:
- each number can be printed during a loop, but another way could
  be to build an array of even integers and then print the array
  using puts

algorithm:
- set `num` equal to 2
- set a loop so that
  - print `num`
  - exit the loop if `num` is equal 98
  - increase `num` by two
- end loop
=end

def even_1_to_99
  num = 2
  while num < 99
    puts num
    num += 2
  end
end

even_1_to_99

# Using fancy methods:

def even_1_to_99
  # puts((2..98).select { |el| el.even? })
  puts (2..98).select(&:even?)
end

even_1_to_99
