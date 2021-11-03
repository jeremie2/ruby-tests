=begin

Build a program that asks a user for the length and width of a room in meters
and then displays the area of the room in both square meters and square feet.

Note: 1 square meter == 10.7639 square feet

Do not worry about validating the input at this time.

Example Run:

  Enter the length of the room in meters:
  10
  Enter the width of the room in meters:
  7
  The area of the room is 70.0 square meters (753.47 square feet).

::::::::::::::::: PEDAC

input: two integers (measure of the sides)
       - no need for validation
output: two integer (room area in square meters and square feet)

data structure:
- just use the given data

algorithm
- print a string that asks for the length in meters
- assign the output to variable `length` multiplying it
- print a string that asks for the width in meters
- assign the output to variable `width`
- assign the product between `length` and `width` to `sq_mt`
- assign the product between `sq_mt` and 10.7639 to `sq_ft`
- print a string that shows the room's area in square meters and square feet

=end

def room_area
  puts "Enter the length of the room in meters:"
  length = gets.to_i
  puts "Enter the width of the room in meters:"
  width = gets.to_i
  sq_mt = (length * width).round(2)
  sq_ft = (sq_mt * 10.7639).round(2)
  puts "The area of the room is #{sq_mt} square meters (#{sq_ft} square feet)."
end

room_area
