# If you typed along with the Rock Paper Scissors walk-through, and you
# ran that code against Rubocop, you should have seen a lot of warnings.
# Watch the video below to see how to resolve them.
#
# The biggest complaint of Rubocop is about the complexity of display_result
# method:
# 
#   def display_result(player, computer)
#     if (player == 'rock' && computer == 'scissors') ||
#        (player == 'paper' && computer == 'rock') ||
#        (player == 'scissors' && computer == 'paper')
#       prompt('You won!')
#     elsif (player == 'scissors' && computer == 'rock') ||
#           (player == 'rock' && computer == 'paper') ||
#           (player == 'paper' && computer == 'scissors')
#       prompt('Computer won!')
#     else
#       prompt("It's a tie.")
#     end
#   end
#
# The solution looks more brilliant than my attempt in previous exercise.
# Method win?(first, second) has been created:
#
#   def win?(first, second)
#     (first == 'rock' && second == 'scissors') ||
#       (first == 'paper' && second == 'rock') ||
#       (first == 'scissors' && second == 'paper')
#   end
#
# Inside the method we see all the condition so that the first variable
# is the winner.
# In display_result inside if/else statement we can now put the two 
# possible combination for a winner
#   - if win?(player, computer)
#   - win?(computer, player)
# That's the updated display_result method:
#
#   def display_result(player, computer)
#     if win?(player, computer)
#       prompt('You won!')
#     elsif win?(computer, player)
#       prompt('Computer won!')
#     else
#       prompt("It's a tie.")
#     end
#   end

VALID_CHOICES = %w(rock paper scissors)

def test_method
  prompt('test message')
end

def prompt(message)
  Kernel.puts("=> #{message}")
end

def win?(first, second)
  (first == 'rock' && second == 'scissors') ||
    (first == 'paper' && second == 'rock') ||
    (first == 'scissors' && second == 'paper')
end

def display_result(player, computer)
  if win?(player, computer)
    prompt('You won!')
  elsif win?(computer, player)
    prompt('Computer won!')
  else
    prompt("It's a tie.")
  end
end

loop do
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = Kernel.gets().chomp()
    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample
  prompt("You chose: #{choice}; Computer chose: #{computer_choice}")
  display_result(choice, computer_choice)

  prompt('Do you want to play again?')
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt('Thank you for playing. Goodbye!')
