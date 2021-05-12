# You have a bank of switches before you, numbered from 1 to n. Each switch is 
# connected to exactly one light that is initially off. You walk down the row of 
# switches and toggle every one of them. You go back to the beginning, and on this 
# second pass, you toggle switches 2, 4, 6, and so on. On the third pass, you go 
# back again to the beginning and toggle switches 3, 6, 9, and so on. You repeat 
# this process and keep going until you have been through n repetitions.
# 
# Write a method that takes one argument, the total number of switches, and 
# returns an Array that identifies which lights are on after n repetitions.
# 
# Example with n = 5 lights:
# 
#     round 1: every light is turned on
#     round 2: lights 2 and 4 are now off; 1, 3, 5 are on
#     round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
#     round 4: lights 2 and 3 are now off; 1, 4, and 5 are on
#     round 5: lights 2, 3, and 5 are now off; 1 and 4 are on
# 
# The result is that 2 lights are left on, lights 1 and 4. The return value is  
# [1,4].
# 
# With 10 lights, 3 lights are left on: lights 1, 4, and 9. The return value is 
# [1, 4, 9].

# https://launchschool.com/posts/4b81cb6b

#### ANSWER

#     1 2 3 4 5
#  1  0 0 0 0 0
#  2  0   0   0
#  3  0       0
#  4  0     0 0
#  5  0     0  
#  
#  1%1 2%1 3%1 4%1 5%1   if == 0 => toggle
#   x   x   x   x   x
#  
#  1%2 2%2 3%2 4%2 5%2
#       x       x    
#  
#  1%3 2%3 3%3 4%3 5%3
#           x
#  
#  1%4 2%4 3%4 4%4 5%4
#               x
#  
#  1%5 2%5 3%5 4%5 5%5
#                   x


#### SOLUTION




#### FURTHER EXPLORATION



#### ANSWER





#### from user 

