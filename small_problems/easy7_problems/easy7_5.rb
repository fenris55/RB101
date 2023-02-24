=begin
2/19

problem:write a method that takes a string and returns a new string with
alternating upper and lower case characters

input: string
output: none
return: new string

rules:
- return a new string
- returned string should have alternating upper and lower case chars
-first char (index 0) should be capitalized
-non-letter chars and spaces count for alterations

examples:
staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
staggered_case('ALL_CAPS') == 'AlL_CaPs'
staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

algorithm:
-convert input string to array of individual chars
-iterate over
-if index is odd, upcase
-if index is even, downcase
-join array into string and return

-oh nope need to first consider if el if a letter - NOPE doesn't matter since it's a string

LETTERS = ('A'..'Z').to_a << ('a'..'z').to_a

def staggered_case(string)
  result = ""
  string.chars.each_with_index do |el, index|
    result << el.upcase if index.even?
    result << el.downcase if index.odd?
  end
  result
end

#lesson solution below
- uses empty string to save result. Uses #each to iterate over array of chars.
starts by setting alternating counter to true. uses control flow to either
upcase or downcase, and then resets boolean to opposite using the not operator

#Challenge - modify so user can choose when first char is upcase or downcase

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

=end

def staggered_case(string, choice = 'uppercase')
  result = ''
  if choice == 'lowercase'
    need_upp = false
  else
  need_upper = true
  end

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

p staggered_case('I Love Launch School!', 'uppercase') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS', 'lowercase') #== 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'
