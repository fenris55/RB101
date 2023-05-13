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


retrying 3/27
P: write a method that takes a string and returns all substrings that are
palindromes

input: string
output:
array (of palindrome substrings from iput string)

rules:
-palindromes are case sensitive
-non-letter characters are included when considering if letters are palindromes
-use substrign method created in previous problem
-substring in return array should mirror order of appearance in input string
-if string contains no palindromes, return an empty array
-if a palindromic substring appears multiple times, it should appear multiple
times in return array
-palindromic substring must have a length of at least 2

E:
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

D:
-helper method to create all palindromes
-loop to iterative over palindromes array
  (select all substrings with size 2 or greater that are the same forwards and backwards)

A:
-write helper method to get all substrings from the input string
  -since palindromic string must have a length of at least 2, helper can start at length 2
-pass input string to helper method to get array of all substrings
-iterative over substrigns array
  -select all substrings that are equal to self when reversed
return palindromic array

=end

def get_substrings(string)
  substrings = []
  (0...string.size).each do |idx|
    (2..string.size - idx).each do |length|
      substrings << string[idx, length]
    end
  end
  substrings
end

def palindromes(string)
  string = string.gsub(/[^a-z]/, '')
  substrings = get_substrings(string)
  substrings.select { |ss| ss == ss.reverse }
end

p palindromes('abcd') #== []
p palindromes('madam') #== ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') #== [
#  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
#  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
#  '-madam-', 'madam', 'ada', 'oo'
#]
p palindromes('knitting cassettes') #== [
#  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
#]





