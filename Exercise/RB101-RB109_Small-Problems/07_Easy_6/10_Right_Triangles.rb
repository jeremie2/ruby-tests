# Write a method that takes a positive integer, n, as an argument, and displays 
# a right triangle whose sides each have n stars. The hypotenuse of the 
# triangle (the diagonal side in the images below) should have one end at the 
# lower-left of the triangle, and the other end at the upper-right.
# 
# Examples:
# 
# triangle(5)
# 
#     *
#    **
#   ***
#  ****
# *****
# 
# triangle(9)
# 
#         *
#        **
#       ***
#      ****
#     *****
#    ******
#   *******
#  ********
# *********


#### ANSWER

def triangle(num)
  i = 1
  num.times do
    puts ' ' * (num-i) + '*' * i
    i += 1
  end
end

triangle(5)
triangle(10)


#### SOLUTION

def triangle(num)
  spaces = num - 1
  stars = 1

  num.times do |n|
    puts (' ' * spaces) + ('*' * stars)
    spaces -= 1
    stars += 1
  end
end


#### FURTHER EXPLORATION

# Try modifying your solution so it prints the triangle upside down from its 
# current orientation. Try modifying your solution again so that you can 
# display the triangle with the right angle at any corner of the grid.

#### upside down

def triangle(num)
  i = 0
  num.times do
    puts ' ' * i + '*' * (num-i)
    i += 1
  end
end

triangle(5)

#### right angle at any corner

# (to be improved with a single process to draw the triangle)

def triangle(num)

  # 90° bottom right
  i = 1
  num.times do
    puts ' ' * (num-i) + '*' * i
    i += 1
  end

  # 90° top right
  i = 0
  num.times do
    puts ' ' * i + '*' * (num-i)
    i += 1
  end

  # 90° top left
  i = 0
  num.times do
    puts '*' * (num-i) + ' ' * i
    i += 1
  end

  # 90° bottom left
  i = 1
  num.times do
    puts '*' * i + ' ' * (num - i)
    i += 1
  end
end

triangle(5)


############ OTHER USERS

#### Philip Timofeyev

def triangle(num)
  1.upto(num) {|n| puts ('*' * n).rjust(num)}
end


#### loreandstory

def triangle(int, orientation='br')
  case orientation
  when 'tl'
    arr = (1..int).to_a.reverse
    align = Proc.new { |str, val| str.ljust(val) }
  when 'tr'
    arr = (1..int).to_a.reverse
    align = Proc.new { |str, val| str.rjust(val) }
  when 'bl'
    arr = (1..int).to_a
    align = Proc.new { |str, val| str.ljust(val) }
  when 'br'
    arr = (1..int).to_a
    align = Proc.new { |str, val| str.rjust(val) }
  end

  arr.each do |num|
    puts align.call(('*' * num), int)
  end
end


triangle(3)
triangle(3, 'tr')


#### Ryan Parkerson

def triangle(n, upside_down, right_just)
  n.times do |num|
    pattern = upside_down ? (n - num) : (num + 1)
    side = right_just ? n : 0 
    puts "#{'*' * pattern}".rjust(side)
  end
end

triangle(5, true, false)
triangle(5, true, true)
triangle(5, false, false)
triangle(5, false, true)


#### Eisenchteter Alexandre

# 'while' generates an array made of '*' strings.
# Example with 'number' = 5:
# ["*", "**", "***", "****", "*****"]
# These are the singles element of the picture.
# 
# We can reverse the array if needed.
# 
# Then the 'each' loop will draw the triangle
# taking note with if/else of the side of the triangle.

def triangle(number, reversed, side)
  lines = []
  while lines.size < number do
    lines.last ? lines << lines.last + '*' : lines << '*'
  end

  lines.reverse! if reversed
  lines.each do |line|
    puts side == 'left' ? line : line.rjust(number)
  end
end

triangle(5, true, 'left')
triangle(10, true, 'right')
triangle(20, false, 'left')
triangle(25, false, 'right')


#### Rodney Tigges

def triangle(num, base_on_bottom, justified_side)
  arr = (1..num).to_a
  arr = arr.reverse unless base_on_bottom
  print_triangle(arr, num, justified_side)
end

def print_triangle(arr, num, justified_side)
  if justified_side == 'left'
    arr.each { |i| puts ('*' * (i)).ljust(num) }
  else
    arr.each { |i| puts ('*' * (i)).rjust(num) }
  end
end

triangle(4, true, 'left')
triangle(4, true, 'right')
triangle(4, false, 'left')
triangle(4, false, 'right')
