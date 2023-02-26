=begin
2/23

problem:
write a method that returns a list of all substring that are palindromes

input: string
output: none
return: array (of palindromic substrings)

rules:
-return array of all palindromic substrings in string input
-single characters are not palindromic
-case-sensitive
-repeated substring should be included
-substrings order should reflect their order in input string
-use substrings method from previous exercise
-return empty array if there are no substrings
-non-letter chars are included

examples:
palindromes('abcd') == []
palindromes('madam') == ['madam', 'ada']
palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]

algorithm
-helper method from previous exercise (with need both methods used there)
  substring method should already return all substrings
-iterate over array returned by substrings
-select substring if it's a palindrome
-return in new array

def leading_substrings(string)   #helper method 1
  result = []
  0.upto(string.size - 1) do |index|
    result << string[0..index]
  end
  result
end

def substrings(input_string) #helper method 2
  result = []

  (0..input_string.size).each do |start_index|
    this_substring = input_string[start_index..-1]
    result.concat(leading_substrings(this_substring))
  end
  result
end

def palindromes(string) # new method
  substrings(string).select { |subs| subs == subs.reverse && subs.size > 1 }
end

p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]

#Challenge: modify to only be case in-sensitive and only consider alphanumerics
alg:
- go to help 1
-downcase input
- instruct next unless char a..z or 0..9
=end

ALPHANUMERICS = ('A'..'Z').to_a << ('a'..'z').to_a << (0..9).to_a

def leading_substrings(string)   #helper method 1
  result = []
  0.upto(string.size - 1) do |index|
    result << string[0..index]
  end
  result
end

def substrings(input_string) #helper method 2
  result = []

  (0..input_string.size).each do |start_index|
    this_substring = input_string[start_index..-1]
    result.concat(leading_substrings(this_substring))
  end
  result
end

def palindromes(string) # new method
  all_subs = substrings(string).select do |subs|
  subs.downcase == subs.downcase.reverse && subs.size > 1
  end

#omg this took forever and still messy
  all_subs.select do |subs|
    subs.chars.all? { |el| ALPHANUMERICS.flatten.include?(el) }
  end
end

#p palindromes('abcd') == []
#p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [ #modified - deleted non alphanumerics
  'll', 'madam', 'ada', 'did', 'madam', 'ada', 'oo']
#p palindromes('knitting cassettes') == [
#  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt']