
# TIC TAC TOE

# 1. Display the initial empty 3x3 board.
#    - initialize_board: create a hash connected to the board 
#                        {1=>" ", 2=>" ",.. , 8=>" ", 9=>" "}
#    - display_board(brd): creat the board with simple #puts method,
#                          place a placehold on each square #{brd[1]},
#                          #system 'clear' to refresh the board
# 2. Ask the user to mark a square.
#    - empty_squares(brd): take trace of still available square creating
#                          an array performing #selct on brd.keys array.
#    - start a loop that goes on till there's a winner or a tie
#      - someone_won?(board)
#        - detect_winner(brd)
#      - board_full?(board)
#    - simple prompt
# 3. Computer marks a square.
#    - computer_places_piece!(brd)
# 4. Display the updated board state.
# 5. If winner, display winner.
# 6. If board is full, display tie.
# 7. If neither winner nor board is full, go to #2
# 8. Play again?
# 9. If yes, go to #1
# 10. Good bye!

# There is gonna be a loop between point 2-7:

# - display board  |
# - ask user       |__ at one point there will
# - ask computer   |   be a winner or a tie
# - display board  |

######## 1. DISPLAY THE INITIAL EMPTY 3X3 BOARD

# The displayed board will look like this:

     |     |
     |     |     
     |     |
-----+-----+-----
     |     |
     |     |     
     |     |
-----+-----+-----
     |     |
     |     |     
     |     |

# It will be populated with 'X' and 'O':

     |     |
     |  O  |  O  
     |     |
-----+-----+-----
     |     |
     |  X  |     
     |     |
-----+-----+-----
     |     |
  X  |     |     
     |     |

# To build it we use the basic #puts method. In the middle of each
# square there will be a placeholder, like #{brd[1]}.
# Placeholders are initialized as one space ' '.

def display_board(brd)
  system 'clear'  # used to clean the terminal at each board refresh
  puts ''
  puts '     |     |'
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}  "
  puts '     |     |'
  puts '-----+-----+-----'
  puts '     |     |'
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}  "
  puts '     |     |'
  puts '-----+-----+-----'
  puts '     |     |'
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}  "
  puts '     |     |'
  puts ''
end

# Let's see how the "real board" is built.

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

# The board is actually a hash with 9 pairs:
# {1=>" ", 2=>" ", 3=>" ", 4=>" ", 5=>" ", 6=>" ", 7=>" ", 8=>" ", 9=>" "}
# Instead of assigning ' ' to each variable in the each loop, we set
# the INITIAL_MARKER constant:

INITIAL_MARKER = ' '

# We also set other 2 constants for the symbols used later on by player and 
# computer:

PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

# When program starts, that's what is going to happens:

board = initialize_board  # we create the hash
display_board(board)      # we pass the hash to the template board so that each
                          # value will be used to set the central element of
                          # each square as single space.

################################################################
# --------------------- STEP 1

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

def display_board(brd)
  system 'clear'
  puts ''
  puts '     |     |'
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}  "
  puts '     |     |'
  puts '-----+-----+-----'
  puts '     |     |'
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}  "
  puts '     |     |'
  puts '-----+-----+-----'
  puts '     |     |'
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}  "
  puts '     |     |'
  puts ''
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

board = initialize_board  # create the hash
display_board(board)

################################################################
# RESULT:

     |     |
     |     |     
     |     |
-----+-----+-----
     |     |
     |     |     
     |     |
-----+-----+-----
     |     |
     |     |     
     |     |

################################################################


######## 2. ASK THE USER TO MARK A SQUARE

# We quickly create a #prompt method for the user dialog:

def prompt(msg)
  puts "=> #{msg}"
end

# We have now to create a method that is going to take input by
# user and MODIFY the state of the board.

# The user has to choose one number between 1-9. The program could ask
# something like this:

prompt "Choose a square (1-9):"

# but there's a problem. This could be OK as first choice but then
# we have to keep track of the remaining numbers.

# The initial board looks like this:

{1=>" ", 2=>" ", 3=>" ", 4=>" ", 5=>" ", 6=>" ", 7=>" ", 8=>" ", 9=>" "}

# After the first choice could be like this:

{1=>" ", 2=>"X", 3=>"O", 4=>" ", 5=>" ", 6=>" ", 7=>" ", 8=>" ", 9=>" "}

board.keys   # [1, 2, 3, 4, 5, 6, 7, 8, 9]
# Using #select we can create a new array which displays only the
# keys that have value ' ': [1, 4, 5, 6, 7, 8, 9]

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

# Now we can change the prompt like this, so that only the
# still available square can be shown to users:

prompt "Choose a square (#{empty_squares(brd).join(', ')}):"

# #empty_squares can be used as validation check:
break if empty_squares(brd).include?(square)  # 'square' is the chosen number

# Now we can set player_places_piece!(brd) with loop inside:

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{empty_squares(brd).join(', ')}):"
    square = gets.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end
  brd[square] = PLAYER_MARKER
end

################################################################
# --------------------- STEP 2

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

def prompt(msg)
  puts "=> #{msg}"
end

def display_board(brd)
  system 'clear'
  puts ''
  puts '     |     |'
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}  "
  puts '     |     |'
  puts '-----+-----+-----'
  puts '     |     |'
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}  "
  puts '     |     |'
  puts '-----+-----+-----'
  puts '     |     |'
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}  "
  puts '     |     |'
  puts ''
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  # Updating the still empty and available squares
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{empty_squares(brd).join(', ')}):"
    square = gets.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end
  brd[square] = PLAYER_MARKER
end

board = initialize_board
display_board(board)
player_places_piece!(board)  # 5
display_board(board)

################################################################
# RESULT:

     |     |
     |     |     
     |     |
-----+-----+-----
     |     |
     |  X  |     
     |     |
-----+-----+-----
     |     |
     |     |     
     |     |

################################################################


######## 3. COMPUTER MARKS A SQUARE

# It's time to create computer's input using #empty_squares and
# #sample method.

def computer_places_piece!(brd)
  square = empty_squares(brd).sample  # randomly select a number
  brd[square] = COMPUTER_MARKER
end

# the last part of the program will be updated like this:

board = initialize_board
display_board(board)
player_places_piece!(board)  # 5
computer_places_piece!(brd)  # 6
display_board(board)

################################################################
# RESULT:

     |     |
     |     |     
     |     |
-----+-----+-----
     |     |
     |  X  |  O  
     |     |
-----+-----+-----
     |     |
     |     |     
     |     |

################################################################

######## 4-7 DISPLAY WINNER/TIE

# We have now to turn this code into a loop so that user and computer
# will go on filling tha board till there will be a winner or a tie:

board = initialize_board
display_board(board)
player_places_piece!(board)
computer_places_piece!(board)
display_board(board)

# Let's change it:

loop do
  display_board(board)

  player_places_piece!(board)
  break if someone_won?(board) || board_full?(board)

  computer_places_piece!(board)
  break if someone_won?(board) || board_full?(board)
end

display_board(board)

# Let's create #board_full? methods. The board is full when there
# are any empty spaces left. If we call #select in that case we
# get an empty array.
# We can than use the existing #empty_squares(brd) method to check
# whether the board is full: 

def board_full?(brd)
  empty_squares(brd).empty? # same as: empty_squares(brd) == []
end

# Let's see #someone_won? method.
# First we want a conditional structure like this:

if someone_won?(board)
  prompt "#{detect_winner(board)} won!"
else
  prompt "It's a tie!"
end

# There are two new methods to implement. Let's see #someone_won?:

def someone_won?(brd)
  !!detect_winner(brd)
end

# What does it mean?
# 
# #detect_winner is going to return a string ('Player' or 'Computer') in
# case of winner, or 'nil' in case of a tie.
# Code should work anyway because of thruthines/falsey state of the objects,
# but we want the function to return a pure boolean value.
# 
# These are the values returned with 'nil':
#   nil   => nil (falsy)
#   !nil  => true
#   !!nil => false
# 
# And this with 'Player' (but also 'Computer'):
#   'Player'   => 'Player' (thruthy)
#   !'Player'  => false
#   !!'Player' => true

# Let's see in the details #detect_winner method.
# 
# We create the winning_lines nested array, with all the combination
# of three square that could contain the triple winning sequence XXX or OOO.
# 
# Then we loop each the array to check whether any sub array contains 3 times
# the character 'X'. If it's found the method return 'Player'.
# 
# We repeat the loop to check for triple 'O' character. If found method returns
# 'Computer'.
# 
# If no triple combination has been found, the method returns 'nil'.

def detect_winner?(brd)
  winning_lines = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                  [[1, 5, 9], [3, 5, 7]]              # diagonals

  winning_lines.each do |line|
    if brd[line[0]] == PLAYER_MARKER &&
       brd[line[1]] == PLAYER_MARKER &&
       brd[line[2]] == PLAYER_MARKER
       return 'Player'
    elsif brd[line[0]] == COMPUTER_MARKER &&
          brd[line[1]] == COMPUTER_MARKER &&
          brd[line[2]] == COMPUTER_MARKER
          return 'Computer'
    end
  end
  nil
end


################################################################
# FINAL CODE

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

def prompt(msg)
  puts "=> #{msg}"
end

def display_board(brd)
  system 'clear'
  puts ''
  puts '     |     |'
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}  "
  puts '     |     |'
  puts '-----+-----+-----'
  puts '     |     |'
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}  "
  puts '     |     |'
  puts '-----+-----+-----'
  puts '     |     |'
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}  "
  puts '     |     |'
  puts ''
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  # Updating the still empty and available squares
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{empty_squares(brd).join(', ')}):"
    square = gets.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end
  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  square = empty_squares(brd).sample
  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  detect_winner(brd)
end

def detect_winner(brd)
  winning_lines = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                  [[1, 5, 9], [3, 5, 7]]              # diagonals

  winning_lines.each do |line|
    if brd[line[0]] == PLAYER_MARKER &&
       brd[line[1]] == PLAYER_MARKER &&
       brd[line[2]] == PLAYER_MARKER
       return 'Player'
    elsif brd[line[0]] == COMPUTER_MARKER &&
          brd[line[1]] == COMPUTER_MARKER &&
          brd[line[2]] == COMPUTER_MARKER
          return 'Computer'
    end
  end
  nil
end

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
  prompt "#{detect_winner(board)} won!"
else
  prompt "It's a tie!"
end
