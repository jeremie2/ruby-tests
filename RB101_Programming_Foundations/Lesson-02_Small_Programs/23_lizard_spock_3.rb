# Keep score of the player's and computer's wins. When either the player or
# computer reaches five wins, the match is over, and the winning player becomes
# the grand winner. Don't add your incrementing logic to display_results. Keep
# your methods simple; they should perform one logical task — no more, no less.

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

user_score = 0
computer_score = 0

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
  match_winner = result(choice, computer_choice)
  prompt(match_winner)

  user_score += 1 if match_winner == 'You won!'
  computer_score += 1 if match_winner == 'Computer won!'
  prompt("Score: You - Computer: #{user_score} - #{computer_score}")

  if user_score == 5
    prompt('YOU ARE THE GRAND WINNER!')   
  elsif computer_score == 5
    prompt('COMPUTER IS THE GRAND WINNER!')
  end

  if user_score == 5 || computer_score == 5
    user_score = 0
    computer_score = 0
    prompt('Do you want to play again?')
    answer = Kernel.gets().chomp()
    break unless answer.downcase().start_with?('y')    
  end
end

prompt('Thank you for playing. Goodbye!')
