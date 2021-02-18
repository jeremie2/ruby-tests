# The goal of this bonus is to add Lizard and Spock into your code
# following the rules:
#
#  - Scissors cuts Paper
#  - Paper covers Rock
#  - Rock crushes Lizard
#  - Lizard poisons Spock
#  - Spock smashes Scissors
#  - Scissors decapitates Lizard
#  - Lizard eats Paper
#  - Paper disproves Spock
#  - Spock vaporizes Rock
#  - Rock crushes Scissors

VALID_CHOICES = %w(rock paper scissors spock lizard)

WIN_COMBINATIONS = [%w(paper rock), %w(paper spock), %w(rock scissors),
                    %w(rock lizard), %w(scissors paper), %w(scissors lizard),
                    %w(lizard spock), %w(lizard paper), %w(spock rock),
                    %w(spock scissors)]

def prompt(message)
  Kernel.puts("=> #{message}")
end

def win?(first, second)
  WIN_COMBINATIONS.include?([first, second])
end

def result(player, computer)
  if win?(player, computer)
    'You won!'
  elsif win?(computer, player)
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
  prompt(result(choice, computer_choice))

  prompt('Do you want to play again?')
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt('Thank you for playing. Goodbye!')
