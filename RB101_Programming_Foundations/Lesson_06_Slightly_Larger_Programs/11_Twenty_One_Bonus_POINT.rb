SUITS = ['H', 'D', 'S', 'C']
VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
MAX_SCORE = 2

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  SUITS.product(VALUES).shuffle
end

def total(cards)
  # cards = [['H', '3'], ['S', 'Q'], ... ]
  values = cards.map { |card| card[1] }

  sum = 0
  values.each do |value|
    if value == "A"
      sum += 11
    elsif value.to_i == 0 # J, Q, K
      sum += 10
    else
      sum += value.to_i
    end
  end

  # correct for Aces
  values.select { |value| value == "A" }.count.times do
    sum -= 10 if sum > 21
  end

  sum
end

def busted?(total)
  total > 21
end

# :tie, :dealer, :player, :dealer_busted, :player_busted
def detect_result(dealer_total, player_total)

  if player_total > 21
    :player_busted
  elsif dealer_total > 21
    :dealer_busted
  elsif dealer_total < player_total
    :player
  elsif dealer_total > player_total
    :dealer
  else
    :tie
  end
end

def display_result(dealer_total, player_total)
  result = detect_result(dealer_total, player_total)

  case result
  when :player_busted
    prompt "You busted! Dealer wins!"
  when :dealer_busted
    prompt "Dealer busted! You win!"
  when :player
    prompt "You win!"
  when :dealer
    prompt "Dealer wins!"
  when :tie
    prompt "It's a tie!"
  end
end

def play_again?
  puts "-------------"
  prompt "Do you want to play again? (y or n)"
  answer = gets.chomp
  answer.downcase.start_with?('y')
end

def end_of_round(dealer_cards, dealer_total, player_cards, player_total)
  puts "=============="
  prompt "Dealer has #{dealer_cards}, for a total of: #{dealer_total}"
  prompt "Player has #{player_cards}, for a total of: #{player_total}"
  puts "=============="
end

def display_score(dealer_score, player_score)
  puts "=============="
  prompt "Dealer #{dealer_score}"
  prompt "Player #{player_score}"
end

def display_champion(a_player)
  prompt "#{a_player} IS THE CHAMPION!"
  puts  "=============="
end

def next_round
  prompt "Press 'Enter' for next round"
  gets
end

def assign_champion(dealer_score, player_score)
  if dealer_score == MAX_SCORE
    'DEALER'
  elsif player_score == MAX_SCORE
    'PLAYER'
  else
    nil
  end
end

def reset_data
  {dealer_score: 0, player_score: 0, round: 0, champion: nil}
end

match_data = reset_data

system 'clear'
prompt "Welcome to Twenty-One!"
prompt "Press 'Enter' to begin"
gets

loop do
  system 'clear'
  match_data[:round] += 1
  puts "=============="
  prompt "ROUND #{match_data[:round]}"
  puts "=============="

  # initialize vars
  deck = initialize_deck
  player_cards = []
  dealer_cards = []

  # initial deal
  2.times do
    player_cards << deck.pop
    dealer_cards << deck.pop
  end

  player_total = total(player_cards)
  dealer_total = total(dealer_cards)

  prompt "Dealer has #{dealer_cards[0]} and ?"
  prompt "You have: #{player_cards[0]} and #{player_cards[1]}, for a total of #{player_total}."

  # player turn
  loop do
    player_turn = nil
    loop do
      prompt "Would you like to (h)it or (s)tay?"
      player_turn = gets.chomp.downcase
      break if ['h', 's'].include?(player_turn)
      prompt "Sorry, must enter 'h' or 's'."
    end

    if player_turn == 'h'
      player_cards << deck.pop
      player_total = total(player_cards)
      prompt "You chose to hit!"
      prompt "Your cards are now: #{player_cards}"
      prompt "Your total is now: #{player_total}"
    end

    break if player_turn == 's' || busted?(player_total)
  end

  if busted?(player_total)
    match_data[:dealer_score] += 1
    end_of_round(dealer_cards, dealer_total, player_cards, player_total)
    display_result(dealer_total, player_total)
    display_score(match_data[:dealer_score], match_data[:player_score])
    champion = assign_champion(match_data[:dealer_score], match_data[:player_score])
    if champion != nil
      display_champion(champion)
      if play_again?
        match_data = reset_data
        next
      else
        break
      end
    end
    next_round
    next
  else
    prompt "You stayed at #{player_total}"
  end

  # dealer turn
  prompt "Dealer turn..."

  loop do
    break if dealer_total >= 17

    prompt "Dealer hits!"
    dealer_cards << deck.pop
    dealer_total = total(dealer_cards)
    prompt "Dealer's cards are now: #{dealer_cards}"
  end

  if busted?(dealer_total)
    match_data[:player_score] += 1
    prompt "Dealer total is now: #{dealer_total}"
    end_of_round(dealer_cards, dealer_total, player_cards, player_total)
    display_result(dealer_total, player_total)
    display_score(match_data[:dealer_score], match_data[:player_score])
    champion = assign_champion(match_data[:dealer_score], match_data[:player_score])
    if champion != nil
      display_champion(champion)
      if play_again?
        match_data = reset_data
        next
      else
        break
      end
    end
    next_round
    next
  else
    prompt "Dealer stays at #{dealer_total}"
  end

  # both player and dealer stays - compare cards!
  if detect_result(dealer_total, player_total) == :dealer
    match_data[:dealer_score] += 1
  elsif detect_result(dealer_total, player_total) == :player
    match_data[:player_score] += 1
  end

  champion = assign_champion(match_data[:dealer_score], match_data[:player_score])

  end_of_round(dealer_cards, dealer_total, player_cards, player_total)
  display_result(dealer_total, player_total)
  display_score(match_data[:dealer_score], match_data[:player_score])

    if champion != nil
      display_champion(champion)
      if play_again?
        match_data = reset_data
        next
      else
        break
      end
    end
    next_round
end

prompt "Thank you for playing Twenty-One! Good bye!"
