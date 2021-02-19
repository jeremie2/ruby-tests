
############ Down the Rabbit Hole

# Sometimes, the documentation is going to leave you scratching your head.

# In a very early assignment at Launch School, you are tasked with writing
# a program that loads some text messages from a YAML file. We do this with
# YAML::load_file:

require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

# Find the documentation for YAML::load_file.

##### ANSWER

# https://ruby-doc.org/stdlib-1.8.6/libdoc/yaml/rdoc/YAML.html#method-c-load_file

##### FROM SOLUTION

# More info about ::load_file here inside Psych docs: 
# https://ruby-doc.org/stdlib-2.6.3/libdoc/psych/rdoc/Psych.html#method-c-load_file
