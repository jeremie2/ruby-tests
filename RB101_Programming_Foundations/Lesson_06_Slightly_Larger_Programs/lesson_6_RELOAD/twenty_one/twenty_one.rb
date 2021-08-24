def prompt(msg)
  puts ">> #{msg}"
end

def generate_deck
  system 'clear'
  suits = ['H', 'D', 'C', 'S']
  val = (2..10).to_a + ['J', 'Q', 'K', 'A']
  suits.product(val).shuffle
end

def distribute_cards(deck, player_cards, dealer_cards)
  2.times do
    player_cards << deck.pop
    dealer_cards << deck.pop
  end
end

def correct_ace(total, values)
  if total > 21
    values.each { |el| total -= 10 if el == 'A' && total > 21 }
  end
  total
end

def total(cards)
  total = 0
  values = []
  cards.each { |arr| values << arr[1] }

  values.each do |el|
    total += if ['J', 'Q', 'K'].include?(el)
               10
             elsif el == 'A'
               11
             else
               el
             end
  end
  correct_ace(total, values)
end

system 'clear'
winner = nil
deck = generate_deck
player_cards = []
dealer_cards = []
distribute_cards(deck, player_cards, dealer_cards)
total_player = total(player_cards)
total_dealer = total(dealer_cards)

prompt "Welcome to Twenty-One!"
prompt "Dealer has #{dealer_cards.sample} and (?)"
prompt "You have #{player_cards.first} and #{player_cards.last}"
prompt "You got a total of #{total(player_cards)}"

loop do
  prompt "Hit or Stay?"
  prompt "(Press 'S' to stay, any key to hit)"
  answer = gets.chomp
  break if answer.downcase == 's'
  player_cards << deck.pop
  total_player = total(player_cards)
  prompt "You now have: #{player_cards} for a total of: #{total_player}"
  if total_player > 21
    prompt "You bust, dealer wins!"
    winner = 'dealer'
    break
  end
end

if winner.nil?
  loop do
    break if total_dealer >= 17
    dealer_cards << deck.pop if total_dealer < 17
    total_dealer = total(dealer_cards)
    if total_dealer > 21
      winner = "player"
      prompt "Dealer total is now #{total_dealer}"
      prompt "Dealer busts, you win!"
      break
    end
  end
end

if winner.nil?
  prompt "Total dealer: #{total_dealer}"
  prompt "Total player: #{total_player}"
  if total_player < total_dealer
    prompt "Dealer wins!"
  elsif total_player > total_dealer
    prompt "You win!"
  else
    prompt "It's a tie!"
  end
end
