# The code below asks the user "What does 2 + 2 equal?" and uses #gets
# to retrieve the user's answer. Modify the code so "That's correct!"
# is printed and the loop stops when the user's answer equals 4. Print
# "Wrong answer. Try again!" if the user's answer doesn't equal 4.
#
# loop do
#   puts 'What does 2 + 2 equal?'
#   answer = gets.chomp.to_i
# end


# PROBLEM
#
# input:
# - string (converted to integer)
#
# output:
# - string
#
# rules:
# - exit loop when user's answer is '4'


# EXAMPLE
# (possible result)
#
# "5"
# "Wrong answer. Try again!"
# "8"
# "Wrong answer. Try again!"
# "4"
# "That's correct!"    # end loop


# DATA STRUCTURE
# 
# just strings input output


# ALGORITHM
# 
# - loop
#   - print a string "What does 2 + 2 equal?" asking for user's input
#   - store user's input converted to integer into 'answer' variable
#     - if 'answer' = 4
#       - print "That's correct!"
#       - exit loop 
#     - else
#       - print "Wrong answer. Try again!"
#     - end if
# - end loop

# CODE

loop do
  puts "What does 2 + 2 equal?"
  answer = gets.chomp.to_i
  if answer == 4
    puts "That's correct!"
    break
  else
    puts 'Wrong answer. Try again!'
  end
end
