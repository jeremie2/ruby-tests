# Write a method that will take a short line of text, and print it within a box.
#
# Example:
#
# print_in_box('To boldly go where no one has gone before.')
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+
#
# print_in_box('')
# +--+
# |  |
# |  |
# |  |
# +--+
#
# You may assume that the input will always fit in your terminal window.


##### ANSWER

# def print_in_box(string)
#   ori_border = "+-#{'-' * string.size}-+"
#   padding = "| #{' ' * string.size} |"
#   text = "| #{string} |"

#   puts ori_border
#   puts padding
#   puts text
#   puts padding
#   puts ori_border
# end

# print_in_box('To boldly go where no one has gone before.')
# print_in_box('')


##### FURTHER EXPLORATION

# Modify this method so it will truncate the message if it will be too wide to fit 
# inside a standard terminal window (80 columns, including the sides of the box). 
# For a real challenge, try word wrapping very long messages so they appear on 
# multiple lines, but still within a box.


def print_in_box(string)
  if string.size > 76
    text_length = 76
  else
    text_length = string.size
  end

  ori_border = "+-#{'-' * text_length}-+"
  padding = "| #{' ' * text_length} |"

  puts ori_border
  puts padding
  
  if string.size <= 76
    puts "| #{string} |"
  else
    str_ausiliar = string
    while str_ausiliar.size > 76
      puts "| #{str_ausiliar[0, 76]} |"
      str_ausiliar = str_ausiliar[76..-1]
    end
    puts "| #{str_ausiliar.ljust(76)} |"
  end

  puts padding
  puts ori_border
end

print_in_box('To boldly go where no one has gone before. To boldly go where no one has gone before. To boldly go where no one has gone before.')
print_in_box('')
