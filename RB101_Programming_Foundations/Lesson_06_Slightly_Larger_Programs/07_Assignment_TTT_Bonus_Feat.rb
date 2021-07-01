
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


##### 4. COMPUTER AI: OFFENSE

# The defensive minded AI is pretty cool, but it's still not performing as well as 
# it could because if there are no impending threats, it will pick a square at 
# random. We'd like to make a slight improvement on that. We're not going to add 
# in any complicated algorithm (there's an extra bonus below on that), but all we 
# want to do is piggy back on our find_at_risk_square from bonus #3 above and turn 
# it into an attacking mechanism as well. The logic is simple: if the computer 
# already has 2 in a row, then fill in the 3rd square, as opposed to moving at 
# random.

## ANSWER

# To implement an "offence strategy" we can use the existing #find_at_risk_square
# The only difference is that for a defence purpose the 2 existing marked squares
# in a row are both 'X', while for the 'attack mode' they should be both 'O'.
# 
# The easiest thing is to add the variable 'marker' to #find_at_risk_square, so
# that the method can be switch to defence or offence:

def find_at_risk_square(line, brd, marker)
  if brd.values_at(*line).count(marker) == 2
    brd.select{|k,v| line.include?(k) && v == INITIAL_MARKER}.keys.first
  else
    nil
  end
end

# Now #computer_places_piece!(brd) can be updated repeating #find_at_risk_square
# passing as variable one time COMPUTER_MARKER and one time PLAYER_MARKER:

def computer_places_piece!(brd)
  square = nil

  # offense first
  WINNING_LINES.each do |line|
    square = find_at_risk_square(line, brd, COMPUTER_MARKER)
    break if square
  end

  # defense
  if !square
    WINNING_LINES.each do |line|
      square = find_at_risk_square(line, brd, PLAYER_MARKER)
      break if square
    end
  end

  # just pick a square
  if !square
    square = empty_squares(brd).sample
  end

  brd[square] = COMPUTER_MARKER
end

# The solution uses first the 'defense' strategy. But I think this is wrong,
# because if Computer as the chance to fill a line with 3 'O' he has only
# to do it... match ends at that point.


##### 5. COMPUTER TURN REFINEMENTS

# a) We actually have the offense and defense steps backwards. In other words, if 
# the computer has a chance to win, it should take that move rather than defend. 
# As we have coded it now, it will defend first. Update the code so that it plays 
# the offensive move first.

## ANSWER
# 
# Done!


# b) We can make one more improvement: pick square #5 if it's available. The AI 
# for the computer should go like this: first, pick the winning move; then, 
# defend; then pick square #5; then pick a random square.

## ANSWER

def computer_places_piece!(brd)
  square = nil

  # offense
  WINNING_LINES.each do |line|
    square = find_at_risk_square(line, brd, COMPUTER_MARK)
    break if square
  end

  # defense
  if !square
    WINNING_LINES.each do |line|
      square = find_at_risk_square(line, brd, PLAYER_MARK)
      break if square
    end
  end

  # pick square #5
  if !square && brd[5] == INITIAL_MARKER
    square = 5
  end

  # just pick a square
  if !square
    square = empty_squares(brd).sample
  end

  brd[square] = COMPUTER_MARK
end


# c) Can you change the game so that the computer can move first? Ask the user at 
# before play begins who should go first.

## ANSWER

who_goes_first = nil

loop do
  prompt "Who does go first? Please select which player starts:"
  prompt "Player:   1"
  prompt "Computer: 2"
  who_goes_first = gets.to_i
  break if who_goes_first == 1 || who_goes_first == 2
  puts 'Not a valid choice!'
end

# Then the main loop is changed with:

loop do
  board = initialize_board
  computer_places_piece!(board) if who_goes_first == 2

  loop do
    display_board(board)

    player_places_piece!(board)
    break if someone_won?(board) #.....

# Basically if user choose 2 Computer will mark a square right after board 
# initialization. Otherwise everything goes on like the original version
# with Player starting first. 


# d) Can you add another "who goes first" option that lets the computer choose who 
# goes first?

## ANSWER

who_goes_first = rand(1..2)

loop do
  board = initialize_board
  computer_places_piece!(board) if who_goes_first == 2

  loop do
    display_board(board) #.......


##### 6. IMPROVE THE GAME LOOP

# There's a bit of redundant code in the main game loop:

loop do
  display_board(board)

  player_places_piece!(board)
  break if someone_won?(board) || board_full?(board)

  computer_places_piece!(board)
  break if someone_won?(board) || board_full?(board)
end

# Notice how we have to break after each player makes a move. What if we could have a 
# generic method that marks a square based on the player? We could do something like 
# this:

loop do
  display_board(board)
  place_piece!(board, current_player)
  current_player = alternate_player(current_player)
  break if someone_won?(board) || board_full?(board)
end

## ANSWER

def place_piece!(brd, current_player)
  if current_player == 'Player'
    player_places_piece!(brd)
  else
    computer_places_piece!(brd)
  end
end

def alternate_player(current_player)
  current_player == 'Player' ? 'Computer' : 'Player'
end

# Initial section:

player_score = 0
computer_score = 0
current_player = ['Player', 'Computer'].sample

system 'clear'
prompt "#{current_player} moves first."
prompt "Press enter to start"
gets

loop do
  board = initialize_board

  loop do
    display_board(board)
    place_piece!(board, current_player)
    current_player = alternate_player(current_player)
    break if someone_won?(board) || board_full?(board)
  end


########### ON YOUR OWN IDEAS

# On your own ideas

# 1. Below are some extra ideas you may want to explore on your own. They're too 
# challenging and out of scope for this course, but may be worth exploring for the 
# adventurous programmer.
# 
# 2. Minimax algorithm
# 
# 3. You can build an unbeatable Tic Tac Toe by utilizing the minimax algorithm.
# 
# 4. Bigger board
# 
# 5. What happens if the board is 5x5 instead of 3x3? What about a 9x9 board?
# 
# 6. More players
# When you have a bigger board, you can perhaps add more than 2 players. Would it be 
# interesting to play against 2 computers? What about 2 human players against a 
# computer?
