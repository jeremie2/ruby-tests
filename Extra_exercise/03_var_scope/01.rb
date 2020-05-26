# What will the following code print and why? Don't run it
# until you have tried to answer.
# 
# a = 7
# 
# def my_value(b)
#   b += 10
# end
# 
# my_value(a)
# puts a


a = 7

# Numbers are immutable.
# if I want to change a, I should re-assign the value outside the method:

a =  my_value(a)
