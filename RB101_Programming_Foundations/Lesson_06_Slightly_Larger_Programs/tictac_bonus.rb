require 'pry'

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                [[1, 5, 9], [3, 5, 7]]              # diagonals

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/AbcSize
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
# rubocop:enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

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

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a position to place a piece: #{joinor(empty_squares(brd))}"
    square = gets.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end
  brd[square] = PLAYER_MARKER
end

def immediate_threat?(brd)
  # Detect double 'XX' and 1 ' ' space in a line.
  WINNING_LINES.each do |line|
    player_mark_counter = brd.values_at(*line).count(PLAYER_MARKER)
    initial_mark_counter = brd.values_at(*line).count(INITIAL_MARKER)
    return true if player_mark_counter == 2 && initial_mark_counter == 1
  end
  false
end

def ai_defense(brd)
  WINNING_LINES.each do |line|
    player_mark_counter = brd.values_at(*line).count(PLAYER_MARKER)
    initial_mark_counter = brd.values_at(*line).count(INITIAL_MARKER)
    if player_mark_counter == 2 && initial_mark_counter == 1
      line.each do |square|
        brd[square] = COMPUTER_MARKER if line[square] == INITIAL_MARKER
        binding.pry
      end
    end
  end
end

def computer_places_piece!(brd)
  if immediate_threat?(brd)
    ai_defense(brd)
  else
    square = empty_squares(brd).sample
    brd[square] = COMPUTER_MARKER
  end
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
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
