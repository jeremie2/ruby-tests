# The code below asks the user "What does 2 + 2 equal?" and uses #gets to
# retrieve the user's answer. Modify the code so "That's correct!" is
# printed and the loop stops when the user's answer equals 4. Print
# "Wrong answer. Try again!" if the user's answer doesn't equal 4.
# 
# loop do
#   puts 'What does 2 + 2 equal?'
#   answer = gets.chomp.to_i
# end


# FIRST ATTEMPT

loop do
  puts 'What does 2 + 2 equal?'
  answer = gets.chomp.to_i
  if answer == 4
    puts "That's correct!"
    break
  else
    puts "Wrong answer. Try again!"
  end
end


# SOLUTION
# else is not needed
#
# loop do
#   puts 'What does 2 + 2 equal?'
#   answer = gets.chomp.to_i
#   if answer == 4
#     puts "That's correct!"
#     break
#   end
#   puts 'Wrong answer. Try again!'
# end


# SECOND ATTEMPT
# I tried to re-write it only for the sake of a shorter version.
# Unfortunately it isn't that good because it's doing a double
# check "... if answer == 4"
# 
# loop do
#   puts 'What does 2 + 2 equal?'
#   answer = gets.chomp.to_i
#   puts "That's correct!" if answer == 4
#   break if answer == 4
#   puts 'Wrong answer. Try again!'
# end


# BETTER SOLUTION 1
# BY Vinton Alexander Bacon
# 
# loop do
#   puts "What does 2 + 2 equal?"
#   answer = gets.chomp.to_i
#   puts answer == 4 ? "Correct!" : "Wrong!"
#   break if answer == 4
# end


# BETTER SOLUTION 2
# BY maruko
# loop do
#   puts 'What does 2 + 2 equal?'
#   answer = gets.to_i
#   break if answer == 4
#   puts 'Wrong answer. Try again!'
# end
# puts 'You got it right, thank you for adding!'