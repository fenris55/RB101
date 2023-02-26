=begin
2/23

problem: write a method that takes a string a results a list of incremented
substrings beginning with the start of the string

input: string
output: none
return: array (of substrings)

rules:
-return an array holding incremented substrings
-array should naturally be sorted shortest to longest

assumption:
-assume all input is a valid string -- with only 1 word?

examples:
leading_substrings('abc') == ['a', 'ab', 'abc']
leading_substrings('a') == ['a']
leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

algorithm:
-initialize empty array
-convert input string to array of chars
-on each iteration, concatenate current char to previous and add to array (need a placeholder?)

NOTES: my solution initializes and empty array to hold the result and a
placeholder variable to hold the accumulated substring. On each iteration, the
current array element is concatenated to the previous substring and placeholder
is reassigned to reference this. new substring is then added to result.

def leading_substrings(string)
  result = []
  placeholder = ''

  string.chars.each do |el|
    result << (placeholder += el)
  end

  result
end

#lesson solution below -- used index reference to chop off each substring and
add to result array
=end

def leading_substrings(string)
  result = []
  0.upto(string.size - 1) do |index|
    result << string[0..index]
  end
  result
end

p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
