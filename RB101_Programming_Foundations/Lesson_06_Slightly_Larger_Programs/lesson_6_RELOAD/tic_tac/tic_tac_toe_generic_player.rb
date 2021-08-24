# (QUESTION IS BASED ON ORIGINAL SOLUTION)
#
# Improve the game loop
#
# There's a bit of redundant code in the main game loop:
#
# loop do
#   display_board(board)
#
#   player_places_piece!(board)
#   break if someone_won?(board) || board_full?(board)
#
#   computer_places_piece!(board)
#   break if someone_won?(board) || board_full?(board)
# end
#
# Notice how we have to break after each player makes a move. What if we
# could have a generic method that marks a square based on the player?
# We could do something like this:
#
# loop do
#   display_board(board)
#   place_piece!(board, current_player)
#   current_player = alternate_player(current_player)
#   break if someone_won?(board) || board_full?(board)
# end
#
# There are two new methods there: place_piece! and alternate_player. The
# place_piece! is a generic method that will know how to place the piece on the
# board depending on the current_player. That is, it will call
# player_places_piece! or computer_places_piece! depending on the value of
# current_player. The trick, then, is to keep track of a current_player, and to
# switch that variable's value after every turn.
#
# See if you can build those two methods and make this work.
#
#
# MY ANSWER:
#
#   current_player = ['player', 'computer'].sample
# at the beginning of the routine define which player begins.
#
#   set_mark(current_player, marks)
# depending of the current player will assign 'X' or 'O' to one of the board's
# square.
#
#   break if !winner.nil?...
# this has been change so that loop will be stopped if just we have a winner
#
#   current_player = alternate_player(current_player)
# If there isn't any winner and the board is not full, then we change current
# player.

PLAYER_MARK = 'X'
COMPUTER_MARK = 'O'

WIN_COMBO = [[1, 2, 3], [4, 5, 6], [7, 8, 9],
             [1, 4, 7], [2, 5, 8], [3, 6, 9],
             [1, 5, 9], [3, 5, 7]]

def prompt(msg)
  puts "=> #{msg}"
end

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

def free_square(marks)
  marks.keys.select { |el| el if marks[el] == ' ' }
end

def player_choice(marks)
  choice = nil
  loop do
    availabe_square = free_square(marks)
    prompt("Select a square: #{availabe_square.join(', ')}")
    choice = gets.to_i
    break if availabe_square.include?(choice)
    prompt('Not a valid choice')
  end
  choice
end

def computer_choice(marks)
  free_square(marks).sample
end

def set_mark(current_player, marks)
  if current_player == 'player'
    marks[player_choice(marks)] = PLAYER_MARK
  else
    marks[computer_choice(marks)] = COMPUTER_MARK
  end
end

def win_arr_player?(arr)
  arr == ['X', 'X', 'X']
end

def win_arr_computer?(arr)
  arr == ['O', 'O', 'O']
end

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

def alternate_player(current_player)
  current_player == 'player' ? 'computer' : 'player'
end

marks = { 1 => ' ', 2 => ' ', 3 => ' ',
          4 => ' ', 5 => ' ', 6 => ' ',
          7 => ' ', 8 => ' ', 9 => ' ' }

winner = nil
current_player = ['player', 'computer'].sample

loop do
  display_board(marks)

  set_mark(current_player, marks)
  winner = winner(marks)
  break if !winner.nil? || free_square(marks).empty?
  current_player = alternate_player(current_player)
end

display_board(marks)

case winner
when 'player' then prompt('You are the winner!')
when 'computer' then prompt('Computer won!')
else prompt("It's a tie!")
end
