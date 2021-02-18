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

def opearation_to_message(op)
  word = case op
         when '1'
           'Adding'
         when '2'
           'Subtracting'
         when '3'
           'Multiplying'
         when '4'
           'Dividing'
         end
  word
end

################### BEGIN
prompt("Welcome to Calculator! Enter your name:")

name = ''
loop do
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt('Make sure to use a valid name.')
  else
    break
  end
end

prompt("Hi #{name}!")

loop do # main loop
  ################### CHOOSE OPERATION
  operator_prompt = <<-MSG
What operation would you like to perform?
    1) add
    2) subtract
    3) multiply
    4) divide 
  MSG

  prompt(operator_prompt)
  operator = ''

  loop do
    operator = Kernel.gets().chomp()

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt('Must choose 1, 2, 3 or 4')
    end
  end

  ################### NUMBER 1
  number1 = ''
  loop do
    prompt("What's the first number?")
    number1 = Kernel.gets().chomp()

    if valid_integer?(number1) || valid_float?(number1)
      number1 = assign_number(number1)
      break
    else
      prompt("Hmm... that doesn't look like a valid number")
    end
  end

  ################### NUMBER 2
  number2 = ''
  loop do
    prompt("What's the second number?")
    number2 = Kernel.gets().chomp()

    if operator == '4' && number2 == '0'
      prompt("Can't divide by zero!")
    elsif valid_integer?(number2) || valid_float?(number2)
      number2 = assign_number(number2)
      break
    else
      prompt("Hmm... that doesn't look like a valid number")
    end
  end

  ################### OPERATION
  prompt("#{opearation_to_message(operator)} the two numbers...")

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

  prompt("The result is #{result}")
  prompt("Do you want to perform another calculation? (Y to calculate again)")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt('Thank you for using Calculator. Good bye!')
