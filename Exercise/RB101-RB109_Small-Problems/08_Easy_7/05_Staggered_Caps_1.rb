# Write a method that takes a String as an argument, and returns a new String that 
# contains the original value using a staggered capitalization scheme in which 
# every other character is capitalized, and the remaining characters are lowercase. 
# Characters that are not letters should not be changed, but count as characters 
# when switching between upper and lowercase.

#### ANSWER

def staggered_case(str)
  new_str = ''
  str.chars.each_with_index do |ch, idx|
    idx.even? ? new_str << ch.upcase : new_str << ch.downcase
  end
  new_str
end

puts staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
puts staggered_case('ALL_CAPS') == 'AlL_CaPs'
puts staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'


#### SOLUTION

def staggered_case(string)
  result = ''
  need_upper = true
  string.chars.each do |char|
    if need_upper
      result += char.upcase
    else
      result += char.downcase
    end
    need_upper = !need_upper
  end
  result
end


#### Further Exploration

# Can you modify this method so the caller can request that the first character be 
# downcased rather than upcased? If the first character is downcased, then the 
# second character should be upcased, and so on.

#### ON MY EXAMPLE
# 
# just replaced idx.even? with idx.odd?

def staggered_case(str)
  new_str = ''
  str.chars.each_with_index do |ch, idx|
    idx.odd? ? new_str << ch.upcase : new_str << ch.downcase
  end
  new_str
end

#### ON SOLUTION EXAMPLE
# 
# Just set 'need_upper = false'

def staggered_case(string)
  result = ''
  need_upper = false
  string.chars.each do |char|
    if need_upper
      result += char.upcase
    else
      result += char.downcase
    end
    need_upper = !need_upper
  end
  result
end
