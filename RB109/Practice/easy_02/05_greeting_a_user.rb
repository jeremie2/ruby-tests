=begin

Write a program that will ask for user's name. The program will then
greet the user. If the user writes "name!" then the computer yells
back to the user.

Examples

What is your name? Bob
Hello Bob.

What is your name? Bob!
HELLO BOB. WHY ARE WE SCREAMING?

::::::::::::::::: PEDAC

input: string
output: a string from two possible strings, depending on
        the input string containing a '!' or not.

data structure:
- just use the given data to sort out (with boolean) which output string
  is the correct one.

algorithm:
- print a string asking for user's name
- assign user's output to variable `username`
- if `username` contains '!' character
  - using uppercase print a message that greets the user and ask him why
    is he screaming. Make sure you cut the '!' character from username.
- else, just print a message to greet the user
=end

def greet_user
  puts "What is your name? "
  username = gets.chomp
  if username[-1] == '!'
    puts "HELLO #{username.chop.upcase}. WHY ARE WE SCREAMING?"
  else
    puts "Hello #{username}."
  end
end

greet_user
