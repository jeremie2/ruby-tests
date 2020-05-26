# What will the following code print and why? Don't run it
# until you have tried to answer.
# 
# a = 7
# 
# def my_value(a)
#   a += 10
# end
# 
# my_value(a)
# puts a


a = 7

# compare to previous exercise, the only change is the name
# of hte local variable 'a' instad of 'b'.
# Again if I want to change a, I should re-assign the value
# outside the method:

a =  my_value(a)
