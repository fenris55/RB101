=begin
2/20

problem:
modify previous problem so that non-letter chars are still returned, but do not
count when alternating betwwen upper and lower

input: string
output: none
return: new string

rules:
-can use method from previous solution
- return new string
- alternate letters only between upper and lower
- include non-letter chars, but do not count

examples:
staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
staggered_case('ALL CAPS') == 'AlL cApS'
staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

algorithm:
-take previous method
-modify iteration so that it skips to next character unless current char is a letter

def staggered_case(string)
  result = ''
  need_upper = true

  string.chars.each do |char|
    if char =~ /[^A-Za-z]/
      result << char
      next
    elsif need_upper
      result += char.upcase
    else
      result += char.downcase
    end
    need_upper = !need_upper
  end
  result
end

#Challenge: modify so that user can choose whether non-letters are coutned or not
opted for helper methods but I think that's lazy - lots of repetetive code
=end

def count_all_chars(string)
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

def count_only_letters(string)
  result = ''
  need_upper = true

  string.chars.each do |char|
    if char =~ /[^A-Za-z]/
      result << char
      next
    elsif need_upper
      result += char.upcase
    else
      result += char.downcase
    end
    need_upper = !need_upper
  end
  result
end

def staggered_case(string, count = 'all')
  if count == 'letters'
    count_only_letters(string)
  else
    count_all_chars(string)
  end
end

p staggered_case('I Love Launch School!', 'letters') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS', 'letters') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'