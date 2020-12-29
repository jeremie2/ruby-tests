# Using an if/else statement, run a loop that prints "The loop was processed!"
# one time if process_the_loop equals true. Print "The loop wasn't processed!"
# if process_the_loop equals false.
# 
# process_the_loop = [true, false].sample
# (n.b. .sample takes randomly one of the array elements)


# FIRST ATTEMPT
# I didn't understand the exercise. I thought I should have written
# a loop that print always "The loop wasn't processed!" unless
# process_the_loop is equal true.
#
# loop do
#   process_the_loop = [true, false].sample
#   if process_the_loop == true
#     puts "The loop was processed!"
#     break
#   else
#     puts "The loop wasn't processed!"
#   end
# end


# SOLUTION
#
# process_the_loop = [true, false].sample
# 
# loop do
#   if process_the_loop == true
#     puts "The loop was processed!"
#     break
#   else
#     puts "The loop wasn't processed!"
#   end
# end


# SECOND ATTEMPT
# Actually there is no need of a loop at all. If/else is enough:

process_the_loop = [true, false].sample

if process_the_loop
    puts "The loop was processed!"
else
  puts "The loop wasn't processed!"
end