# Typing the full word "rock" or "lizard" is tiring. Update the program
# so the user can type "r" for "rock," "p" for "paper," etc.
# Note that if you do bonus #1, you'll have two words that start with "s."
# How do you resolve that?

VALID_CHOICES = %w(r p sc sp l)

SELECT_ITEM = { 'r' => 'rock',
                'p' => 'paper',
                'sc' => 'scissors',
                'sp' => 'spock',
                'l' => 'lizard' }

WIN_COMBINATIONS = [%w(paper rock), %w(paper spock), %w(rock scissors),
                    %w(rock lizard), %w(scissors paper), %w(scissors lizard),
                    %w(lizard spock), %w(lizard paper), %w(spock rock),
                    %w(spock scissors)]

CHOOSE = <<-MSG
  Choose one:
  r) rock
  p) paper
  sc) scissors
  sp) spock
  l) lizard
MSG

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
    prompt(CHOOSE)
    choice = Kernel.gets().chomp().downcase()
    if VALID_CHOICES.include?(choice)
      choice = SELECT_ITEM[choice]
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = SELECT_ITEM[VALID_CHOICES.sample]
  prompt("You chose: #{choice}; Computer chose: #{computer_choice}")
  prompt(result(choice, computer_choice))

  prompt('Do you want to play again?')
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt('Thank you for playing. Goodbye!')
