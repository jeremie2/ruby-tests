VALID_CHOICES = ["rock", "paper", "scissors"]

def test_method
  prompt('test message')
end

def prompt(message)
  Kernel.puts("=> #{message}")
end

def win_condition?(arr)
  arr == %w(paper rock) || arr == %w(rock scissors) || arr == %w(scissors paper)
end

def loose_condition?(arr)
  arr == %w(rock paper) || arr == %w(scissors rock) || arr == %w(paper scissors)
end

def display_result(player, computer)
  both_inputs = [player, computer]
  if win_condition?(both_inputs)
    'You won!'
  elsif loose_condition?(both_inputs)
    'Computer won!'
  else
    "It's a tie."
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
  prompt(display_result(choice, computer_choice))

  prompt('Do you want to play again?')
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt('Thank you for playing. Goodbye!')
