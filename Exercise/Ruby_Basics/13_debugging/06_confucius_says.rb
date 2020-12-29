# You want to have a small script delivering motivational quotes,
# but with the following code you run into a very common error
# message: no implicit conversion of nil into String (TypeError).
# What is the problem and how can you fix it?
# 
# def get_quote(person)
#   if person == 'Yoda'
#     'Do. Or do not. There is no try.'
#   end
# 
#   if person == 'Confucius'
#     'I hear and I forget. I see and I remember. I do and I understand.'
#   end
# 
#   if person == 'Einstein'
#     'Do not worry about your difficulties in Mathematics. I can assure you mine are still greater.'
#   end
# end
# 
# puts 'Confucius says:'
# puts '"' + get_quote('Confucius') + '"'


def get_quote(person)
  if person == 'Yoda'
    return 'Do. Or do not. There is no try.'
  end

  if person == 'Confucius'
    return 'I hear and I forget. I see and I remember. I do and I understand.'
  end

  if person == 'Einstein'
    return 'Do not worry about your difficulties in Mathematics. I can assure you mine are still greater.'
  end
end

puts 'Confucius says:'
puts '"' + get_quote('Confucius') + '"'


# ANSWER:
# 
# Without explicit return statements inside the method
# only the last line will be executed. In case we chose
# 'Confucius' the last if returns nil.
# 
# Another way is to use if/elsif/elsif statements.


# BETTER WAY by Jack Clarke-Parker
# case/when is probably more indicated in this case
# 
# def get_quote(person)
#   case person
#   when 'Yoda'
#     'Do. Or do not. There is not try.'
#   when 'Confucius'
#     'I hear and I forget. I see and I remember. I do and I understand.'
#   when 'Einstein'
#     'Do not worry about your difficulties in Mathematics. I can assure you mine are still greater.'
#   end
# end
# 
# puts 'Confucius says:'
# puts '"' + get_quote('Confucius') + '"'