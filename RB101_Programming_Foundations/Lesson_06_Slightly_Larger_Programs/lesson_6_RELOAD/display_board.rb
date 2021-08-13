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

def computer_choice(marks)
  free_square(marks).sample
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
