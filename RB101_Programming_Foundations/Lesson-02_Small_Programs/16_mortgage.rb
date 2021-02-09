# ASSIGNMENT: MORTGAGE / CAR LOAN CALCULATOR
#
# Take everything you've learned so far and build a mortgage calculator
# (or car payment calculator -- it's the same thing).
#
# You'll need three pieces of information:
#
#     the loan amount
#     the Annual Percentage Rate (APR)
#     the loan duration
#
# From the above, you'll need to calculate the following things:
#
#     monthly interest rate
#     loan duration in months
#     monthly payment
#
# You can use the following formula: M = P (J / 1-(1+J**(-N)))
# Translated to Ruby, this is what the formula looks like:
# m = p * (j / (1 - (1 + j)**(-n)))
#
#    m = monthly payment
#    p = loan amount
#    j = monthly interest rate
#    n = loan duration in months
# When you write your program, don't use the single-letter variables
# m, p, j, and n; use explicit names. For instance, you may want to use
# loan_amount instead of p.
#
# Finally, don't forget to run your code through Rubocop.
#
# Hints:
#
#     Figure out what format your inputs need to be in. For example, should
#     the interest rate be expressed as 5 or .05, if you mean 5% interest?
#     If you're working with Annual Percentage Rate (APR), you'll need to
#     convert that to a monthly interest rate.
#     Be careful about the loan duration -- are you working with months or
#     years? Choose variable names carefully to assist in remembering.
#     You can use this loan calculator to check your results:
#     https://www.calculator.net/loan-calculator.html

def prompt(message)
  puts "=> #{message}"
end

def valid_number?(num)
  num != '' && num.to_f > 0
end

def set_number
  num = ''
  loop do
    num = Kernel.gets().chomp()
    if valid_number?(num)
      break
    else
      prompt('Please enter a valid number.')
    end
  end
  num
end

prompt('Welcome to Mortgage Calculator')

loop do
  prompt('Enter the loan amount:')
  loan_amount = set_number().to_f

  prompt('Enter the interest rate:')
  prompt('(Example: 5 for 5% or 2.5 for 2.5%)')
  interest_rate = set_number().to_f / 100 # percentage

  prompt('Enter the loan duration in years:')
  loan_duration = set_number().to_i() * 12 # convert to monthly

  monthly_payment = loan_amount *
                    (interest_rate /
                    (1 - (1 + interest_rate)**(-loan_duration)))

  prompt("Your monthly payment is $#{monthly_payment.round(2)}")
  prompt('Would you like to perform another calculation?
        (Y to calculate again)')
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thanks for using the Mortgage Calculator!")

# WHAT I HAVE DONE:
# compare to the solution I set a couple of methods because because
# the same routine was going to be repeated:
# valid_number?(num) and set_number
# Also to round float to 2 decimals, I've used 'round' method.

# THINGS TO THINK ABOUT:
# Where did that format method come from?
# ANSWER: it's a Kernel method and helps with the numbers format.
# Note how we have to be very careful about converting inputs to integers
# or floats.
# This "$#{format('%.2f', monthly_payment)}" is really hard to read, what's
# happening? Hint: study the Kernel#format documentation here.
# ANSWER: it's going to use 2 digits after decimal point of the value
#         monthly_payment variable.
# What does the code look like with the optional parentheses removed? Can
# you still recognize it?
# ANSWER: Yes I can for two reasons: 1) text editor is highlighting methods
#         2) I'm used to 'gets' and 'chomp' methods.
#         but I have to admit that without knowing a method and without
#         syntax highlighting... it could be tricky!
