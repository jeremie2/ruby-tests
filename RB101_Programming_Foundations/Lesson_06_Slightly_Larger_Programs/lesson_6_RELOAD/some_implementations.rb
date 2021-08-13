
#######################################################
########### BOARD 3x3

# Let's try to design a simple board like this:
#
#      |     |
#   X  |  X  |  X
#      |     |
# -----+-----+-----
#      |     |
#   X  |  X  |  X
#      |     |
# -----+-----+-----
#      |     |
#   X  |  X  |  X
#      |     |
# 
# Each mark should be replaced with the variable 'mark'.
# Here a test code:

mark = 'X'
board = "
       |     |
    #{mark}  |  #{mark}  |  #{mark}
       |     |
  -----+-----+-----
       |     |
    #{mark}  |  #{mark}  |  #{mark}
       |     |
  -----+-----+-----
       |     |
    #{mark}  |  #{mark}  |  #{mark}
       |     |

"

system 'clear'
puts board


#######################################################
########### INSERT MARKS

# To store marks we could use a hash:

marks = {1 => ' ', 2 => ' ', 3 => ' ',
         4 => ' ', 5 => ' ', 6 => ' ',
         7 => ' ', 8 => ' ', 9 => ' '}

# Each element is by default a one-space string ' '.
# 
#      |     |
#      |     |   
#      |     |
# -----+-----+-----
#      |     |
#      |     |   
#      |     |
# -----+-----+-----
#      |     |
#      |     |   
#      |     |
# 
# While playng, players will chose a square and a different symbol
# will be assigned ('X' or 'O').
# The boeard needs to be generated with a method that takes as argument
# the hash 'marks':

def display_board(marks)
  system 'clear'
  puts "
         |     |
      #{marks[1]}  |  #{marks[2]}  |  #{marks[3]}
         |     |
    -----+-----+-----
         |     |
      #{marks[4]}  |  #{marks[5]}  |  #{marks[6]}
         |     |
    -----+-----+-----
         |     |
      #{marks[7]}  |  #{marks[8]}  |  #{marks[9]}
         |     |

  "
end

# If we assign some values:

marks[1] = 'X'
marks[9] = 'O'

# then performing:

display_board(marks)

# we'll see as result the updated board:
# 
#      |     |
#   X  |     |   
#      |     |
# -----+-----+-----
#      |     |
#      |     |   
#      |     |
# -----+-----+-----
#      |     |
#      |     |  O
#      |     |


#######################################################
########### PLAYER AND COMPUTER MOVE

# We need an updated list of still available squares (with no marks).
# Method #free_square does the job returning the array made of the
# the mark's hash keys so that mark[key] == ' ':

def free_square(marks)
  marks.keys.select { |el| el if marks[el] == ' ' }
end

# It's now possible to implement a method to insert marks into the board.
# First we define two constants to set both player's and computer's marks:

PLAYER_MARK = 'X'
COMPUTER_MARK = 'O'

# For the player we need a loop in which we check for the still available
# squares and the we ask the user to choose one of them.
# An if/else statement will check for the correct input.

def player_choice(marks)
  choice = nil
  loop do
    availabe_square = free_square(marks)
    prompt("Select a square: #{availabe_square}")
    choice = gets.to_i
    if !availabe_square.include?(choice)
      prompt('Not a valid choice')
    else
      break
    end
  end
  choice
end

# In the meantime a small method has been created to improve the output:

def prompt(msg)
  puts "=> #{msg}"
end

# The computer choice looks easier being a 'sample' performed on a array:

def computer_choice(marks)
  free_square(marks).sample
end

# At this stage the program run like this:

loop do
  display_board(marks)
  marks[player_choice(marks)] = PLAYER_MARK
  marks[computer_choice(marks)] = COMPUTER_MARK
end

# The board will be displayed with updated marks till it will be full
# and loop at this stage will not finish...
# We still need to define conditions so that particular combinations of
# the marks will stop the loop with a winner or with a tie.


#######################################################
########### WINNER

# Who reaches 3 squares in a row wins. We have to store those winning
# combinations.

WIN_COMBO = [[1, 2, 3], [4, 5, 6], [7, 8, 9],
             [1, 4, 7], [2, 5, 8], [3, 6, 9],
             [1, 5, 9], [3, 5, 7]]

# Two methods tell us whether a line got 3 'X' or 3 'O':

def win_arr_player?(arr)
  arr == ['X', 'X', 'X']
end

def win_arr_computer?(arr)
  arr == ['O', 'O', 'O']
end

# Now we can implement a method that iterates through the winning combination.
# We use the element of the winning array as keys of 'marks' hash.
# If all 3 hash's values have the same mark ('X' or 'O'), then we have a winner.
# Method #winner return a string ('player' or 'computer') in case of winner, 
# 'nil' otherwise: 

def winner(marks)
  winner = nil
  WIN_COMBO.each do |arr|
    if win_arr_player?([marks[arr[0]], marks[arr[1]], marks[arr[2]]])
      winner = 'player'
    elsif win_arr_computer?([marks[arr[0]], marks[arr[1]], marks[arr[2]]])
      winner = 'computer'
    end
  end
  winner
end

# The main routine looks now like this:

marks = { 1 => ' ', 2 => ' ', 3 => ' ',
          4 => ' ', 5 => ' ', 6 => ' ',
          7 => ' ', 8 => ' ', 9 => ' ' }

winner = nil

loop do
  display_board(marks)

  marks[player_choice(marks)] = PLAYER_MARK
  display_board(marks)
  winner = winner(marks)
  break if winner == 'player'

  marks[computer_choice(marks)] = COMPUTER_MARK
  display_board(marks)
  winner = winner(marks)
  break if winner == 'computer'

  break if free_square(marks).empty?
end

if winner == 'player'
  prompt('You are the winner!')
elsif winner == 'computer'
  prompt('Computer won!')
else
  prompt("It's a tie!")
end
