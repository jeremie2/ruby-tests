# Improved "join"
# 
# If we run the current game, we'll see the following prompt:
# 
# => Choose a position to place a piece: 1, 2, 3, 4, 5, 6, 7, 8, 9
# 
# This is ok, but we'd like for this message to read a little better. We want 
# to separate the last item with a "or", so that it reads:
# 
# => Choose a position to place a piece: 1, 2, 3, 4, 5, 6, 7, 8, or 9
# 
# Currently, we're using the Array#join method, which can only insert a 
# delimiter between the array elements, and isn't smart enough to display a 
# joining word for the last element.
# 
# Write a method called joinor that will produce the following result:
# 
# joinor([1, 2])                   # => "1 or 2"
# joinor([1, 2, 3])                # => "1, 2, or 3"
# joinor([1, 2, 3], '; ')          # => "1; 2; or 3"
# joinor([1, 2, 3], ', ', 'and')   # => "1, 2, and 3"
# 
# Then, use this method in the TTT game when prompting the user to mark a square.


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

################################ ANSWER

def joinor(arr, sep=',', conj='or')
  size = arr.size
  if size.size == 0
    ''
  elsif size == 1
    arr[0]
  else
    new_arr = arr.clone
    last_num = new_arr.pop
    "#{new_arr.join(', ')}#{sep} #{conj} #{last_num}"
  end
end

################################ SOLUTION
# 
# def joinor(arr, delimiter=', ', word='or')
#   case arr.size
#   when 0 then ''
#   when 1 then arr.first
#   when 2 then arr.join(" #{word} ")
#   else
#     arr[-1] = "#{word} #{arr.last}"
#     arr.join(delimiter)
#   end
# end

def player_choice(marks)
  choice = nil
  loop do
    availabe_square = free_square(marks)
    prompt("Select a square: #{joinor(availabe_square, ';', 'and')}")
    choice = gets.to_i
    break if availabe_square.include?(choice)
    prompt('Not a valid choice')
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
  winner = winner(marks)
  break if winner == 'player' || free_square(marks).empty?

  marks[computer_choice(marks)] = COMPUTER_MARK
  winner = winner(marks)
  break if winner == 'computer' || free_square(marks).empty?
end

display_board(marks)

case winner
when 'player' then prompt('You are the winner!')
when 'computer' then prompt('Computer won!')
else prompt("It's a tie!")
end
