
########### ASSIGNMENT: TTT BONUS FEATURES

# At this point you should have a simple command line Tic Tac Toe game working 
# properly. Let's try to add some additional features.


##### 1. IMPROVED "JOIN"

# If we run the current game, we'll see the following prompt:
# 
# => Choose a position to place a piece: 1, 2, 3, 4, 5, 6, 7, 8, 9
# 
# This is ok, but we'd like for this message to read a little better. We want to 
# separate the last item with a "or", so that it reads:
# 
# => Choose a position to place a piece: 1, 2, 3, 4, 5, 6, 7, 8, or 9
# 
# Currently, we're using the Array#join method, which can only insert a delimiter 
# between the array elements, and isn't smart enough to display a joining word for 
# the last element.
# 
# Write a method called joinor that will produce the following result:
# 
# joinor([1, 2])                   # => "1 or 2"
# joinor([1, 2, 3])                # => "1, 2, or 3"
# joinor([1, 2, 3], '; ')          # => "1; 2; or 3"
# joinor([1, 2, 3], ', ', 'and')   # => "1, 2, and 3"
# 
# Then, use this method in the TTT game when prompting the user to mark a square.


## ANSWER

def joinor(arr, separator=', ', conjunction='or')
  if arr.size == 2
    arr.join(" #{conjunction} ")
  else
    end_str = "#{separator}#{conjunction} #{arr.pop.to_s}"
    arr.join("#{separator}") + end_str   
  end
end

puts joinor([1, 2])                   == "1 or 2"
puts joinor([1, 2, 3])                == "1, 2, or 3"
puts joinor([1, 2, 3], '; ')          == "1; 2; or 3"
puts joinor([1, 2, 3], ', ', 'and')   == "1, 2, and 3"

# It works to solve the examples but it doesn't work with edge cases
# like arr = [1], arr = [].

## SOLUTION

def joinor(arr, delimiter=', ', word='or')
  case arr.size
  when 0 then ''
  when 1 then arr.first
  when 2 then arr.join(" #{word} ")
  else
    arr[-1] = "#{word} #{arr.last}"
    arr.join(delimiter)
  end
end

# Then, you could use it in the game like this:

prompt "Choose a position to place a piece: #{joinor(empty_squares(brd))}"


##### 2. KEEP SCORE

# Keep score of how many times the player and computer each win. Don't use 
# global or instance variables. Make it so that the first player to 5 wins 
# the game.

# Insert these 2 variables to keep track of the scores
player_score = 0
computer_score = 0

# Then changed the if condition:
  if someone_won?(board)
    winner = detect_winner(board)
    prompt "#{winner} won!"
    player_score += 1 if winner == 'Player'
    computer_score += 1 if winner == 'Computer'
  else
    prompt "It's a tie!"
  end

# Displayed the provisional result:
  puts "Player - Computer: #{player_score}-#{computer_score} "
  puts "\nPress [Enter] to go on.."
  gets
  if player_score == 5
    puts "Player is the champion! 🏆️"
    break
  elsif computer_score == 5
    puts "Computer is the champion! 🏆️"
    break
  end

# Altogether looks like this:

player_score = 0
computer_score = 0

loop do
  board = initialize_board

  loop do
    display_board(board)

    player_places_piece!(board)
    break if someone_won?(board) || board_full?(board)

    computer_places_piece!(board)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)

  if someone_won?(board)
    winner = detect_winner(board)
    prompt "#{winner} won!"
    player_score += 1 if winner == 'Player'
    computer_score += 1 if winner == 'Computer'
  else
    prompt "It's a tie!"
  end

  puts "Player - Computer: #{player_score}-#{computer_score} "
  puts "\nPress [Enter] to go on.."
  gets
  if player_score == 5
    puts "Player is the champion! 🏆️"
    break
  elsif computer_score == 5
    puts "Computer is the champion! 🏆️"
    break
  end
end

puts "\nThanks for playing! :)\n\n"


##### 3. COMPUTER AI: DEFENSE

# The computer currently picks a square at random. That's not very interesting. 
# Let's make the computer defensive minded, so that if there's an immediate 
# threat, then it will defend the 3rd square. We'll consider an "immediate threat" 
# to be 2 squares marked by the opponent in a row. If there's no immediate threat, 
# then it will just pick a random square.

## ANSWER

# ..fail

## SOLUTION

# #computer_places_piece!(brd) needs to be updated introducing a loop
# through WINNING_LINES array. The target is to find an "immediate threat" square
# (an empti square near or in between 2 'X' in one of the winning line).
# The square will be found by #find_at_risk_square(line, brd) method.

def computer_places_piece!(brd)
  square = nil
  WINNING_LINES.each do |line|
    square = find_at_risk_square(line, brd)
    break if square
  end

  square = empty_squares(brd).sample if !square
  brd[square] = COMPUTER_MARK
end

def board_full?(brd)
  empty_squares(brd).empty?
end

# Here the new method:

def find_at_risk_square(line, brd)
  if brd.values_at(*line).count(PLAYER_MARK) == 2
    brd.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first
  else
    nil
  end
end

# Let's see what happens:
# - from WINNING_LINES.each do |line| we take for axample the first
#   element line = [1, 2, 3] which is passed to #find_at_risk_square
# - brd.values_at(*line) = [brd[line[0]], brd[line[1]], brd[line[2]]]
#   = for example [' ', 'X', 'X'] or [' ', 'O', 'X']
#   - [' ', 'X', 'X'].count(PLAYER_MARK) == 2   # => true
#   - [' ', 'O', 'X'].count(PLAYER_MARK) == 2   # => false
# - if the previous condition returns true (1st example):
#   brd.select { |k, v| line.include?(k) && v == INITIAL_MARKER }  = 
#   brd.select { |k, v| [1, 2, 3].include?(1) && v == ' ' }
#     # => {1 => ' '}
#   {1 => ' '}.keys   # => [1]
#   [1].first  # => 1
# 
# Then #computer_places_piece! will in this case return brd[1] = COMPUTER_MARK
