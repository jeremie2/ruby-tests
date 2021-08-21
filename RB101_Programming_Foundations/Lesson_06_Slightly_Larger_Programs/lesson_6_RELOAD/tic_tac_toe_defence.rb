# Computer AI: Defense
#
# The computer currently picks a square at random. That's not very
# interesting. Let's make the computer defensive minded, so that if
# there's an immediate threat, then it will defend the 3rd square.
# We'll consider an "immediate threat" to be 2 squares marked by the
# opponent in a row. If there's no immediate threat, then it will just
# pick a random square.

# ANSWER
#
# Some optimization with #init_board method and EMPTY_MARK
#
#   immediate_treat?(arr)
# This intercepts dangerous line like 'X' 'X' ' ' returning 'true'
#
#   computer_choice(marks)
# is now checking for #immediate_treat? and in that case the empty
# will be filled with COMPUTER_MARK.
#
# The method iterates through the WIN_COMBO.
# Let's take for example the first element: [1, 2, 3]
# We create the variable 'line' which looks like: [marks[4], marks[5], marks[6]]
# These are elements of the board and if immediate_treat?(line) return true
# we can set computer's choice for the empty square.
# (!) Important to break the loop when we have immediate_treat, other wise
#     we'll get weird result.
#   ...
#   WIN_COMBO.each do |arr|
#     line = [marks[arr[0]], marks[arr[1]], marks[arr[2]]]
#     if immediate_treat?(line)
#       choice = arr.select { |el| el if marks[el] == EMPTY_MARK }.first
#       break if choice
#     else
#       choice = free_square(marks).sample
#     end
#   end
#   ...

require 'pry'

PLAYER_MARK = 'X'
COMPUTER_MARK = 'O'
EMPTY_MARK = ' '

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

def init_board
  board = {}
  (1..9).each { |el| board[el] = EMPTY_MARK }
  board
end

def free_square(marks)
  marks.keys.select { |el| el if marks[el] == EMPTY_MARK }
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

def immediate_treat?(arr)
  arr.count(PLAYER_MARK) == 2 && arr.count(EMPTY_MARK) == 1
end

def computer_choice(marks)
  choice = nil
  WIN_COMBO.each do |arr|
    line = [marks[arr[0]], marks[arr[1]], marks[arr[2]]]
    if immediate_treat?(line)
      choice = arr.select { |el| el if marks[el] == EMPTY_MARK }.first
      break if choice
    else
      choice = free_square(marks).sample
    end
  end
  choice
end

def set_mark(current_player, marks)
  if current_player == 'player'
    marks[player_choice(marks)] = PLAYER_MARK
  else
    marks[computer_choice(marks)] = COMPUTER_MARK
  end
end

def win_arr_player?(arr)
  arr == [PLAYER_MARK, PLAYER_MARK, PLAYER_MARK]
end

def win_arr_computer?(arr)
  arr == [COMPUTER_MARK, COMPUTER_MARK, COMPUTER_MARK]
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

############################### BEGIN

marks = init_board

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
