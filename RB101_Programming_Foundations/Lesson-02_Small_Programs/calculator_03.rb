################### LOCALIZATION
chosen_language = ''
loop do
  puts("\nSelect language / Selezionare lingua")
  puts <<-MSG
    1) English
    2) Italiano
  MSG
  chosen_num = gets.chomp
  case chosen_num
  when '1'
    chosen_language = 'en'
    break
  when '2'
    chosen_language = 'it'
    break
  else
    puts "\nNot valid number - Numero non valido\n\n"
  end
end

LANGUAGE = chosen_language
require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

################### METHODS
def messages(message, lang='en')
  MESSAGES[lang][message]
end

def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  num.to_i().to_s() == num || num.to_f().to_s() == num
end

def denominator_zero?(num, first_or_second_num, operator)
  first_or_second_num == 'second_number' && operator == '4' && num == '0'
end

def point_replace_comma
  num = Kernel.gets().chomp()
  num.gsub!(',', '.') if num.include?(',')
  num
end

def set_number(first_or_second_num, operator)
  num = ''
  loop do
    prompt(messages(first_or_second_num, LANGUAGE))
    num = point_replace_comma
    if denominator_zero?(num, first_or_second_num, operator)
      prompt(messages('not_zero_divide', LANGUAGE))
    elsif valid_number?(num)
      break
    else
      prompt(messages('not_valid_number', LANGUAGE))
    end
  end
  num.to_f
end

def operation_to_message(op)
  message = case op
            when '1'
              prompt(messages('add_message', LANGUAGE))
            when '2'
              prompt(messages('sub_message', LANGUAGE))
            when '3'
              prompt(messages('mul_message', LANGUAGE))
            when '4'
              prompt(messages('div_message', LANGUAGE))
            end
  message
end

################### BEGIN
prompt(messages('welcome', LANGUAGE))

name = ''
loop do
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt(messages('welcome', LANGUAGE))
  else
    break
  end
end

print('=> ', messages('hi', LANGUAGE), "#{name}!\n")

loop do # main loop
  ################### CHOOSE OPERATION
  operator_prompt = messages('which_operation', LANGUAGE)

  prompt(operator_prompt)
  operator = ''

  loop do
    operator = Kernel.gets().chomp()

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(messages('must_choose', LANGUAGE))
    end
  end

  ################### NUMBER 1 & NUMBER 2
  number1 = set_number('first_number', operator)
  number2 = set_number('second_number', operator)

  ################### OPERATION
  puts operation_to_message(operator)

  result = case operator
           when '1'
             number1 + number2
           when '2'
             number1 - number2
           when '3'
             number1 * number2
           when '4'
             number1 / number2
           end

  if result - result.to_i == 0.0
    result = result.to_i # e.g. 23.00 => 23
  else
    result = result.round(2) # e.g. 23.152 => 23.15
  end

  print('=> ', messages('result', LANGUAGE), "#{result}\n")
  prompt(messages('another_calculation', LANGUAGE))
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt(messages('thanks', LANGUAGE))
