=begin

Write a program that solicits 6 numbers from the user, then prints
a message that describes whether or not the 6th number appears among
the first 5 numbers.

Examples:

==> Enter the 1st number:
25
==> Enter the 2nd number:
15
==> Enter the 3rd number:
20
==> Enter the 4th number:
17
==> Enter the 5th number:
23
==> Enter the last number:
17
The number 17 appears in [25, 15, 20, 17, 23].


==> Enter the 1st number:
25
==> Enter the 2nd number:
15
==> Enter the 3rd number:
20
==> Enter the 4th number:
17
==> Enter the 5th number:
23
==> Enter the last number:
18
The number 18 does not appear in [25, 15, 20, 17, 23].


::::::::::::::::: PEDAC

input: 6 integers
mid section: sort out if the 6th element is equal to any previous integer
output: a string

data structure:
- collect the integers into an array `numbers`
- set `number_position` as %w(1st 2nd 3rd  4th  5th last)

algorithm: the use of #include? method is a fast way to check for copies
           of numbers[5] into the array. But I'll use a loop instead.

- set `number_position` as %w(1st 2nd 3rd  4th  5th last)
- set `numbers` as empty array
- loop on `number_position`
  - for each element of number_position print a string asking the user
    to enter a number
  - convert the entered string to a integer (let's assume it's a correct)
    and add it to `numbers`
- end loop
- set `copy` as empty string
- loop on first five `numbers`
  - if a number is equal to 6th number, set `copy` equal to 'yes' and break
- end loop
- if `copy` is equal 'yes', print that 6th number appear into `numbers[0..4]`
  else print that 6th number doesn't appear into `numbers[0..4]

=end

# number_position = %w(1st 2nd 3rd  4th  5th last)
# numbers = []

# number_position.each do |elem|
#   puts "==> Enter the #{elem} number:"
#   numbers << gets.to_i
# end

# copy = ''
# numbers[0..4].each do |num|
#   if num == numbers[5]
#     copy = 'yes'
#     break
#   end
# end

# if copy == 'yes'
#   puts "The number #{numbers[5]} appears in #{numbers[0..4]}."
# else
#   puts "The number #{numbers[5]} does not appear in #{numbers[0..4]}."
# end


# SHORTER VERSION

number_position = %w(1st 2nd 3rd  4th  5th last)
numbers = []

number_position.each do |elem|
  puts "==> Enter the #{elem} number:"
  numbers << gets.to_i
end

num_6 = numbers.pop

if numbers.include?(num_6)
  puts "The number #{num_6} appears in #{numbers}."
else
  puts "The number #{num_6} does not appear in #{numbers}."
end
