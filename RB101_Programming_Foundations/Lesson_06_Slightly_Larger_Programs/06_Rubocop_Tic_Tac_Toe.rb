# See file tictactoe_rbcop.rb for final result.

# REMEMBER! 
# You have the final word. If you think your code is more helpful
# the way it is, just leav it as it is.


######## SKIP RUBOCOP OFFENSES

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

# If you need to skip more option, just add it after a comma
# ...Metrics/AbcSize, Other/Problem...


######## REFACTORING DETECT_WINNER METHOD

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

#### winning_lines can be rewritten as a constant:

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                [[1, 5, 9], [3, 5, 7]]              # diagonals

# updated method:

def detect_winner(brd)
  WINNING_LINES.each do |line|
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

#### Avoiding repetitions with #values_at:

# https://ruby-doc.org/core-2.7.2/Hash.html#method-i-values_at
# 
# h = { "cat" => "feline", "dog" => "canine", "cow" => "bovine" }
# h.values_at("cow", "cat")  #=> ["bovine", "feline"]
# It returns an array.

brd = {1=>" ", 2=>"X", 3=>"O", 4=>"X", 5=>"X", 6=>"X", 7=>" ", 8=>" ", 9=>" "}
brd.values_at(1, 2, 3)  # => [' ', 'X', 'O']
brd.values_at(4, 5, 6)  # => ['X', 'X', 'X']

# We can now mix #values_at with #count:

a = [1, 10, ,0]
a.count(10)  # => 2

# In our case once that:

brd.values_at(line[0], line[1], line[2]  # => ['X', 'X', 'X']

# then:

['X', 'X', 'X'].count('X')  # => 3  this intercepts the winning condition.

# So we have:

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(line[0], line[1], line[2]).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(line[0], line[1], line[2]).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

# Further refactoring:

line[0], line[1], line[2]

# can be rewritten as:

*line

# to pass one by one all the elements of the array to the method:

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
