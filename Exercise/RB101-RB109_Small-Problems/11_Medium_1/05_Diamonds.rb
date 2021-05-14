# Write a method that displays a 4-pointed diamond in an n x n grid, where n is an 
# odd integer that is supplied as an argument to the method. You may assume that 
# the argument will always be an odd integer.
# 
# diamond(1)
# 
# *
# 
# diamond(3)
# 
#  *
# ***
#  *
# 
# diamond(9)
# 
#     *
#    ***
#   *****
#  *******
# *********
#  *******
#   *****
#    ***
#     *

#### ANSWER

# Example odd_int = 5
# - I build a 'pattern' array [1, 2, 3, 4, 5, 4, 3, 2, 1]
# - Each element of the array determines the horizontal raw made of '*'
#   that will be centered during the #each loop

def pattern(size)
  pattern = []
  1.upto(size) { |i| pattern << i if i.odd? }
  (size - 1).downto(1) { |i| pattern << i if i.odd? }
  pattern
end

def diamond(size)
  pattern = pattern(size)

  pattern.each do |i|
    puts ('*' * i).center(size)
  end
end

diamond(9)

#### SOLUTION

def print_row(grid_size, distance_from_center)
  number_of_stars = grid_size - 2 * distance_from_center
  stars = '*' * number_of_stars
  puts stars.center(grid_size)
end

def diamond(grid_size)
  max_distance = (grid_size - 1) / 2
  max_distance.downto(0) { |distance| print_row(grid_size, distance) }
  1.upto(max_distance)   { |distance| print_row(grid_size, distance) }
end


#### FURTHER EXPLORATION

# Try modifying your solution or our solution so it prints only the outline of  
# the diamond:
# 
# diamond(5)
# 
#   *
#  * *
# *   *
#  * *
#   *

#### ANSWER

# Example odd_int = 5
# - I build a 'pattern' array that matches the empty spaces inside
#   the shape. [1, 3, 1]
# - These empty spaces will be surrounded by two '*'
# - To make things easier I just print the first and last line

def pattern(size)
  pattern = []
  1.upto(size - 2) { |i| pattern << i if i.odd? }
  (size - 4).downto(0) { |i| pattern << i if i.odd? }
  pattern + []
end

def diamond(size)
  pattern = pattern(size)

  puts ('*').center(size)
  pattern.each do |i|
    puts ('*' + " " * i + '*').center(size)
  end
  puts ('*').center(size)
end
