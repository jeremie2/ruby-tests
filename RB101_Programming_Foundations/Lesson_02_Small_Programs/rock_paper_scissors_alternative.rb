ITEMS = { 'r' => 'rock',
          'p' => 'paper',
          's' => 'scissors' }

WIN_COMBOS = [['rock', 'scissors'],
              ['scissors', 'paper'],
              ['paper', 'rock']]

def valid_choice(char)
  ['r', 'p', 's'].include?(char)
end

def assign_user_item
  user_choice = nil
  loop do
    puts "Select one items:
    => R: #{ITEMS['r']}
    => P: #{ITEMS['p']}
    => S: #{ITEMS['s']}
    "
    user_choice = gets.chomp.downcase
    break if valid_choice(user_choice)
    puts 'Not a valid choice!'
  end
  user_choice
end

def winner(user_item, computer_item)
  combo = [user_item, computer_item]
  return 'user' if WIN_COMBOS.include?(combo)
  combo = [computer_item, user_item]
  'computer' if WIN_COMBOS.include?(combo)
end

winner = nil

user_item = ITEMS[assign_user_item]
computer_item = ITEMS[ITEMS.keys[rand(3)]]

puts "user: #{user_item}"
puts "computer: #{computer_item}"

winner = winner(user_item, computer_item) if winner(user_item, computer_item)

if winner.nil?
  puts "It's a tie!"
else
  puts "The winner is #{winner}!"
end
