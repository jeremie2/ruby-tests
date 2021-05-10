# Modify the method from the previous exercise so it ignores non-alphabetic 
# characters when determining whether it should uppercase or lowercase each letter. 
# The non-alphabetic characters should still be included in the return value; they 
# just don't count when toggling the desired case.

#### ANSWER

def staggered_case(str)
  new_str = ''
  set_upcase = true
  str.chars do |ch|
    if ch.match(/[a-z]/i)
      set_upcase ? new_str << ch.upcase : new_str << ch.downcase
      set_upcase = !set_upcase
    else
      new_str << ch
    end
  end
  new_str
end

puts staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
puts staggered_case('ALL CAPS') == 'AlL cApS'
puts staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'


#### SOLUTION

def staggered_case(string)
  result = ''
  need_upper = true
  string.chars.each do |char|
    if char =~ /[a-z]/i
      if need_upper
        result += char.upcase
      else
        result += char.downcase
      end
      need_upper = !need_upper
    else
      result += char
    end
  end
  result
end


#### FURTHER EXPLORATION

# Modify this method so the caller can determine whether non-alphabetic characters 
# should be counted when determining the upper/lowercase state. That is, you want a 
# method that can perform the same actions that this method does, or operates like 
# the previous version.
# 
# Hint: Use a keyword argument.

def staggered_case(str, modality=true)
  new_str = ''
  modality = true  # if true doesn't include special characters
  set_upcase = true
  str.chars do |ch|
    if ch.match(/[a-z]/i)
      set_upcase ? new_str << ch.upcase : new_str << ch.downcase
      set_upcase = !set_upcase if modality
    else
      new_str << ch
    end
    set_upcase = !set_upcase if !modality
  end
  new_str
end


#### from user LUKE CARLSON

def staggered_case(str, toggle = false, count_syms = false)
  str.chars.map do |c|
    toggle = !toggle if /[a-zA-Z]/.match(c) || count_syms
    toggle ? c.upcase : c.downcase
  end.join
end
