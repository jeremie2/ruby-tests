SUITS = ['H', 'D', 'C', 'S']
VALUES = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A']
TOP_NUMBER = 21
TOP_DEALER_NUM = 17
MAX_SCORE = 2

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  SUITS.product(VALUES).shuffle
end

def reset_data
  { dealer_cards: [],
    dealer_total: 0,
    dealer_score: 0,
    player_cards: [],
    player_total: 0,
    player_score: 0,
    round: 0,
    champion: nil }
end

def card_value(card_val)
  return card_val if card_val.class == Integer
  card_val == 'A' ? 11 : 10
end

def add_cards(arr)
  total = 0
  arr.each { |el| total += card_value(el) }
  total
end

def total(cards)
  values = cards.map { |arr| arr[1] }
  total = add_cards(values)
  values.each { |el| total -= 10 if total > TOP_NUMBER && el == 'A' }
  total
end

def busted?(total)
  total > TOP_NUMBER
end

def detect_result(dealer_total, player_total)
  if player_total > TOP_NUMBER
    :player_busted
  elsif dealer_total > TOP_NUMBER
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

def display_user(user, user_cards, user_total)
  sentence = nil
  case user
  when 'dealer'
    sentence = 'Dealer has'
  when 'player'
    sentence = 'You have'
  end
  prompt "#{sentence}: #{user_cards} for a total of #{user_total}."
end

def end_of_round(dealer_cards, dealer_total, player_cards, player_total)
  puts "=============="
  display_user('dealer', dealer_cards, dealer_total)
  display_user('player', player_cards, player_total)
  puts "=============="
end

def display_score(dealer_score, player_score)
  puts "=============="
  prompt "Dealer #{dealer_score}"
  prompt "Player #{player_score}"
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
  end
end

def display_champion(a_player)
  prompt "#{a_player} IS THE CHAMPION!"
  puts "=============="
end

def resume(data)
  end_of_round(data[:dealer_cards], data[:dealer_total],
               data[:player_cards], data[:player_total])
  display_result(data[:dealer_total], data[:player_total])
  display_score(data[:dealer_score], data[:player_score])
  data[:champion] = assign_champion(data[:dealer_score], data[:player_score])
end

def play_again?
  puts "-------------"
  prompt "Do you want to play again? (y or n)"
  answer = gets.chomp
  answer.downcase.start_with?('y')
end

# ::::::::::::::::::::::::::::::::::::::::::: BEGIN
data = reset_data
system 'clear'
prompt "Welcome to Twenty-One!"
prompt "Press 'Enter' to begin"
gets

loop do
  # ::::::::::::::::::::::::::::::::::::::::: INITIALIZE VARS
  system 'clear'
  data[:round] += 1
  puts "=============="
  prompt "ROUND #{data[:round]}"
  puts "=============="

  deck = initialize_deck
  data[:dealer_cards] = [] if data[:dealer_cards].size != 0
  data[:player_cards] = [] if data[:player_cards].size != 0

  2.times do
    data[:dealer_cards] << deck.pop
    data[:player_cards] << deck.pop
  end

  data[:dealer_total] = total(data[:dealer_cards])
  data[:player_total] = total(data[:player_cards])

  prompt "Dealer has #{data[:dealer_cards][0]} and ?"
  display_user('player', data[:player_cards], data[:player_total])

  loop do
    # ::::::::::::::::::::::::::::::::::::::: PLAYER TURN
    answer = nil
    loop do
      prompt "Would you like to (h)it or (s)tay?"
      answer = gets.chomp.downcase
      break if ['h', 's'].include?(answer)
      prompt "Sorry, must enter 'h' or 's'."
    end

    if answer == 'h'
      data[:player_cards] << deck.pop
      data[:player_total] = total(data[:player_cards])
      prompt "You chose to hit!"
      prompt "You have: #{data[:player_cards]} for a total \
of #{data[:player_total]}"
    end
    break if answer == 's' || busted?(data[:player_total])
  end

  if busted?(data[:player_total])
    data[:dealer_score] += 1
    resume(data)
    if !data[:champion].nil?
      display_champion(data[:champion])
      if play_again?
        data = reset_data
        next
      else
        break
      end
    end
    next_round
    next
  else
    prompt "You stayed at #{data[:player_total]}"
  end

  # ::::::::::::::::::::::::::::::::::::::: DEALER TURN
  prompt "Dealer turn..."

  loop do
    break if data[:dealer_total] >= TOP_DEALER_NUM

    prompt "Dealer hits!"
    data[:dealer_cards] << deck.pop
    data[:dealer_total] = total(data[:dealer_cards])
    prompt "Dealer's cards are now: #{data[:dealer_cards]}"
  end

  if busted?(data[:dealer_total])
    data[:player_score] += 1
    resume(data)
    if !data[:champion].nil?
      display_champion(data[:champion])
      if play_again?
        data = reset_data
        next
      else
        break
      end
    end
    next_round
    next
  else
    prompt "Dealer stays at #{data[:dealer_total]}"
  end

  # ::::::::::::::::::::::::::::::::::::::: BOTH PLAYERS STAY - COMPARE CARDS
  if detect_result(data[:dealer_total], data[:player_total]) == :dealer
    data[:dealer_score] += 1
  elsif detect_result(data[:dealer_total], data[:player_total]) == :player
    data[:player_score] += 1
  end

  resume(data)

  if !data[:champion].nil?
    display_champion(data[:champion])
    if play_again?
      data = reset_data
      next
    else
      break
    end
  end
  next_round
end

prompt "Thank you for playing Twenty-One! Good bye!"
