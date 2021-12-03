=begin

Print all odd numbers from 1 to 99, inclusive, to the console,
with each number on a separate line.

::::::::::::::::: PEDAC

input: list of integers
output: list of odd integers from 1 to 99

data structure:
- each number can be printed during a loop, but another way could
  be to build an array of odd integers and then print the array
  using puts

algorithm:
- set `num` equal to 1
- set a loop so that
  - print `num`
  - exit the loop if `num` is equal 99
  - increase `num` by two
- end loop
=end

def odd_1_to_99
  num = 1
  while num < 100
    puts num
    num += 2
  end
end

odd_1_to_99

# Using fancy methods:

def odd_1_to_99
  # puts (1..99).select { |el| el.odd? }
  puts (1..99).select(&:odd?)
end

odd_1_to_99
