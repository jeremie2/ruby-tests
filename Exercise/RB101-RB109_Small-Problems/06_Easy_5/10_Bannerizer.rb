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

def print_in_box(string)
  ori_border = "+-#{'-' * string.size}-+"
  padding = "| #{' ' * string.size} |"
  text = "| #{string} |"

  puts ori_border
  puts padding
  puts text
  puts padding
  puts ori_border
end

print_in_box('To boldly go where no one has gone before.')
print_in_box('')


##### FURTHER EXPLORATION

# Modify this method so it will truncate the message if it will be too wide to fit 
# inside a standard terminal window (80 columns, including the sides of the box). 
# For a real challenge, try word wrapping very long messages so they appear on 
# multiple lines, but still within a box.

MAX_LENGTH = 80
ORI_MARGIN = 4
STR_MAX_LEN = MAX_LENGTH - ORI_MARGIN

def message_format(string)
  if string.size <= STR_MAX_LEN
    puts "| #{string} |"
  else
    str_ausiliar = string
    while str_ausiliar.size > STR_MAX_LEN
      puts "| #{str_ausiliar[0, STR_MAX_LEN]} |"
      str_ausiliar = str_ausiliar[STR_MAX_LEN..-1]
    end
    puts "| #{str_ausiliar.ljust(STR_MAX_LEN)} |"
  end
end

def print_in_box(string)
  string.size > STR_MAX_LEN ? text_len = STR_MAX_LEN : text_len = string.size

  ori_border = "+-#{'-' * text_len}-+"
  vert_padding = "| #{' ' * text_len} |"

  puts ori_border
  puts vert_padding
  message_format(string)
  puts vert_padding
  puts ori_border
end

text = "bumba la bamba ye! bumba la bamba ye! \
bumba la bamba ye! bumba la bamba ye! bumba la \
bamba ye! bumba la bamba ye!"

print_in_box(text)

# result:
# +------------------------------------------------------------------------------+
# |                                                                              |
# | bumba la bamba ye! bumba la bamba ye! bumba la bamba ye! bumba la bamba ye!  |
# | bumba la bamba ye! bumba la bamba ye!                                        |
# |                                                                              |
# +------------------------------------------------------------------------------+
#
# # Dedicated to 'maestro' Giorgio Bracardi
# # https://www.youtube.com/watch?v=RLnTgv-Q5K0&list=PL5A3A28E763245197&index=9
