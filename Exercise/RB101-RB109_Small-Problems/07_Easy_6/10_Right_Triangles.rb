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

#(to be improved, need to find a single method)

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
