require 'pry'

SIGNS = ['H', 'D', 'C', 'S']
VALUES = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A']

def prompt(msg)
  puts "=> #{msg}"
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
  values.each { |el| total -= 10 if total > 21 && el == 'A' }
  total
end

def busted?(total)
  total > 21
end

def detect_result(total_player, total_dealer)
  if busted?(total_player)
    'player_busted'
  elsif busted?(total_dealer)
    'dealer_busted'
  elsif total_player > total_dealer
    'player'
  elsif total_player < total_dealer
    'dealer'
  else
    'tie'
  end
end

def display_result(total_player, total_dealer)
  result = detect_result(total_player, total_dealer)
  case result
  when 'player_busted'
    'You busted! Dealer wins!'
  when 'dealer_busted'
    'Dealer busted! You win!'
  when 'player'
    'You win!'
  when 'dealer'
    'Dealer wins!'
  when 'tie'
    "It's a tie!"
  end
end

def play_again?
  prompt "Would you like to play again? y/n"
  answer = gets.chomp.downcase
  answer == 'n' 
end

loop do
  prompt "Welcome to Twenty-One!"
  deck = SIGNS.product(VALUES).shuffle

  cards_player = [deck.pop, deck.pop]
  cards_delaer = [deck.pop, deck.pop]
  total_player = total(cards_player)
  total_dealer = total(cards_delaer)

  prompt "Dealer has: #{cards_delaer[0]} and ?"
  prompt "You have: #{cards_player} for a total of #{total_player}"
  prompt "Player turn.."

  loop do
    prompt "Would you like to (h)it or (s)tay?"
    answer = gets.chomp.downcase
    if answer == 'h'
      new_card = deck.pop
      cards_player << new_card
      total_player += card_value(new_card[1])
      prompt "You have: #{cards_player} for a total of #{total_player}"
    end
    break if answer == 's' || busted?(total_player)
  end

  if busted?(total_player)
    prompt display_result(total_player, total_dealer)
    break if play_again?
    next
  else
    prompt 'You stayed.'
  end

  prompt 'Dealers turn..'
  loop do
    break if total_dealer >= 17
    new_card = deck.pop
    cards_delaer << new_card
    total_dealer += card_value(new_card[1])
  end

  puts '================='
  prompt "Dealer has: #{cards_delaer} for a total of #{total_dealer}"
  prompt "You have: #{cards_player} for a total of #{total_player}"
  prompt display_result(total_player, total_dealer)
  puts '================='
  break if play_again?
end

prompt "Thanks for playing!"
