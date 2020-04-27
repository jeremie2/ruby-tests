# What will the following code print to the screen?

def scream(words)
  words = words + "!!!!"
  return
  puts words
end

scream("Yippeee")

## ANSWER
# It doesn't return anything because inside the method there
# is an 'empty' return with no argument, which stops the method
# returning nothing.
