# The following code throws an error. Find out what is wrong and
# think about how you would fix it.
# 
# colors = ['red', 'yellow', 'purple', 'green', 'dark blue', 'turquoise', 'silver', 'black']
# things = ['pen', 'mouse pad', 'coffee mug', 'sofa', 'surf board', 'training mat', 'notebook']
# 
# colors.shuffle!
# things.shuffle!
# 
# i = 0
# loop do
#   break if i > colors.length
# 
#   if i == 0
#     puts 'I have a ' + colors[i] + ' ' + things[i] + '.'
#   else
#     puts 'And a ' + colors[i] + ' ' + things[i] + '.'
#   end
# 
#   i += 1
# end


# FIRST PART
# 
# colors = ['red', 'yellow', 'purple', 'green', 'dark blue', 'turquoise', 'silver', 'black']
# things = ['pen', 'mouse pad', 'coffee mug', 'sofa', 'surf board', 'training mat', 'notebook']
# 
# colors.shuffle!
# things.shuffle!
# 
# i = 0
# loop do
#   break if i > things.length - 1
# 
#   if i == 0
#     puts 'I have a ' + colors[i] + ' ' + things[i] + '.'
#   else
#     puts 'And a ' + colors[i] + ' ' + things[i] + '.'
#   end
# 
#   i += 1
# end
# 
# 
# ANSWER:
# 
# There are 2 problems:
# 
# 1. colors has got one element more things so we have to sobstitute
# colors.length with things.length;
# 2. the loop breaks when i > things.length.. = 7, but counting the
# index og things the last element is things[6]
# 
# Solution:
# break if i > things.length - 1


# SECOND PART
# 
# Further exploration
# 
# We might change our arrays in the future and we might not always know
# which of them is shorter, so picking the shorter one by hand is not
# the best solution. How can you change the break condition, such that
# the loop always stops once we hit the end of the shorter array?

colors = ['red', 'yellow', 'purple', 'green', 'dark blue', 'turquoise', 'silver', 'black']
things = ['pen', 'mouse pad', 'coffee mug', 'sofa', 'surf board', 'training mat', 'notebook']

colors.shuffle!
things.shuffle!

i = 0
loop do
  break if i > colors.length - 1 || i > things.length - 1

  if i == 0
    puts 'I have a ' + colors[i] + ' ' + things[i] + '.'
  else
    puts 'And a ' + colors[i] + ' ' + things[i] + '.'
  end

  i += 1
end
