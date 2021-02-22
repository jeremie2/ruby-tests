# Write a program that will ask for user's name. The program will then greet the
# user. If the user writes "name!" then the computer yells back to the user.
# Examples
#
# What is your name? Bob
# Hello Bob.
#
# What is your name? Bob!
# HELLO BOB. WHY ARE WE SCREAMING?

######## ANSWER

puts 'What is your name?'
a_name = gets.chomp

if a_name[-1] == '!'
  puts "Hello #{a_name.gsub('!', '')}. Why are we screaming?".upcase
else
   puts "Hello #{a_name}." 
end


##### after I've seen the solution:

puts 'What is your a_name?'
a_name = gets.chomp

if a_name[-1] == '!'
  puts "HELLO #{a_name.chop.upcase}. WHY ARE WE SCREAMING?"
else
   puts "Hello #{a_name}." 
end

######## SOLUTION

print 'What is your name? '
name = gets.chomp

if name[-1] == '!'
  name = name.chop
  puts "HELLO #{name.upcase}. WHY ARE WE SCREAMING?"
else
  puts "Hello #{name}."
end

######## EXTRA

# Try modifying our solution to use String#chomp! and String#chop!, respectively

puts 'What is your a_name?'
a_name = gets.chomp!

if a_name[-1] == '!'
  puts "HELLO #{a_name.chop!.upcase}. WHY ARE WE SCREAMING?"
else
   puts "Hello #{a_name}." 
end
