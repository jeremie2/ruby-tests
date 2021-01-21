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

def messages(message, lang='en')
  MESSAGES[lang][message]
end

################### METHODS
def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_integer?(num)
  num.to_i().to_s() == num
end

def valid_float?(num)
  num.to_f().to_s() == num
end

def assign_number(num)
  num = num.to_i if valid_integer?(num)
  num = num.to_f if valid_float?(num)
  num
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

  ################### NUMBER 1
  number1 = ''
  loop do
    prompt(messages('first_number', LANGUAGE))
    number1 = Kernel.gets().chomp()

    if valid_integer?(number1) || valid_float?(number1)
      number1 = assign_number(number1)
      break
    else
      prompt(messages('not_valid_number', LANGUAGE))
    end
  end

  ################### NUMBER 2
  number2 = ''
  loop do
    prompt(messages('second_number', LANGUAGE))
    number2 = Kernel.gets().chomp()

    if operator == '4' && number2 == '0'
      prompt(messages('not_zero_divide', LANGUAGE))
    elsif valid_integer?(number2) || valid_float?(number2)
      number2 = assign_number(number2)
      break
    else
      prompt(messages('not_valid_number', LANGUAGE))
    end
  end

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

  result = result.to_i if result - result.to_i == 0.0

  print('=> ', messages('result', LANGUAGE), "#{result}\n")
  prompt(messages('another_calculation', LANGUAGE))
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt('Thank you for using Calculator. Goodbye!')
