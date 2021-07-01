require 'pry'

INITIAL_MARKER = ' '
PLAYER_MARK = 'X'
COMPUTER_MARK = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9],
                 [1, 4, 7], [2, 5, 8], [3, 6, 9],
                 [1, 5, 9], [3, 5, 7]]
NUMBER_OF_MATCHES = 1

def initialize_board
  hash = {}
  (1..9).each { |el| hash[el] = INITIAL_MARKER }
  hash
end

def display_board(brd)
  system 'clear'
  print "
       |     |
    #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}
       |     |
  -----+-----+-----
       |     |
    #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}
       |     |
  -----+-----+-----
       |     |
    #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}
       |     |

"
end

def prompt(msg)
  puts "=> #{msg}"
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Please select a square: #{empty_squares(brd).join(', ')}:"
    square = gets.to_i
    break if empty_squares(brd).include?(square)
    puts "Sorry, that's not a valid choice."
  end
  brd[square] = PLAYER_MARK
end

def computer_places_piece!(brd)
  square = empty_squares(brd).sample
  brd[square] = COMPUTER_MARK
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARK) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARK) == 3
      return 'Computer'
    end
  end
  nil
end

def someone_won?(brd)
  !!detect_winner(brd)
end

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
    puts "#{winner} won!"

    case winner
    when 'Player'
      player_score += 1
    when 'Computer'
      computer_score += 1
    end
  else
    puts "It's a tie!"
  end

  puts "Player - Computer: #{player_score}-#{computer_score} "
  puts "\nPress [Enter] to go on.."
  gets

  if player_score == NUMBER_OF_MATCHES || computer_score == NUMBER_OF_MATCHES
    puts "#{winner} is the champion! 🏆️"
    break
  end
end
