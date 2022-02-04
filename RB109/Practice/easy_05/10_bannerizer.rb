=begin

Write a method that will take a short line of text, and print it within a box.

Example:

print_in_box('To boldly go where no one has gone before.')
+--------------------------------------------+
|                                            |
| To boldly go where no one has gone before. |
|                                            |
+--------------------------------------------+

print_in_box('')
+--+
|  |
|  |
|  |
+--+

You may assume that the input will always fit in your terminal window.

=end

# def print_in_box(str)
#   size = str.size + 2
#   ori_border = "+#{'-' * size}+"
#   fill = "|#{' ' * size}|"

#   puts ori_border
#   puts fill
#   puts "| #{str} |"
#   puts fill
#   puts ori_border
# end

# print_in_box('To boldly go where no one has gone before.')
# print_in_box('')

# FURTHER EXPLORATION

# Modify this method so it will truncate the message if it will be too
# wide to fit inside a standard terminal window (80 columns, including
# the sides of the box). For a real challenge, try word wrapping very
# long messages so they appear on multiple lines, but still within a box.

MAX_WIDTH = 80
MAX_STR_WIDTH = MAX_WIDTH - 4

def print_in_box(str)
  size = str.size <= 80 ? (str.size + 2) : (MAX_WIDTH - 2)
  ori_border = "+#{'-' * size}+"
  fill = "|#{' ' * size}|"

  puts ori_border
  puts fill
  str_section(str)
  puts fill
  puts ori_border
end

def str_section(str)
  if str.size <= MAX_STR_WIDTH
    puts "| #{str} |"
  else
    while str.size > MAX_STR_WIDTH
      puts "| #{str[0..MAX_STR_WIDTH-1]} |"
      str = str[MAX_STR_WIDTH..-1]
    end
    empty_right = ' ' * (MAX_WIDTH - str.size - 3)
    puts "| #{str}#{empty_right}|"
  end
end

print_in_box('To boldly go where no one has gone before. To boldly go where no one has gone before.')
