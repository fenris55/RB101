=begin
2/23

problem:
=write a method that returns all possible substrings from a given string

input: string
output none
return: array of strings

rules:
-return all substring in a given string
-order results:
  -all substrings at index 0 first, etc
  -substrings at index 0 should be ordered shortest to longest etc
-use #leading_substrings method from previous exercise

assumptions:
-string input will only contain 1 word?
  - does not specificy how to hand spaces

data:
-array to hold result
-double iterative
  -1 to mark beginning index
  -another to oiterate over each incremented substring

examples:
substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]

algorithm:
-helper method with find all possible substrings starting at 0
-so first pass in the entire string
-then chop off the first el to the 1 shifts to 0
repeat until only the final el is passed to the helper
--helper returns array; on each iteration pass to result array
-flatten and return

#NOtes: solved! used a loop. trynig again with an iterative method

def leading_substrings(string)
  result = []
  0.upto(string.size - 1) do |index|
    result << string[0..index]
  end
  result
end

def substrings(input_string)
  substring_array = []
  loop do
    break if input_string.empty?
    returned_strings = leading_substrings(input_string)
    substring_array << returned_strings
    input_string.slice!(0)
  end
  substring_array.flatten
end

#ugh cannot think of another way to do this. Also my solution modifies the string
during iteration, which is a bad practice. Checking solution.
=end

def leading_substrings(string)
  result = []
  0.upto(string.size - 1) do |index|
    result << string[0..index]
  end
  result
end

def substrings(input_string)
  result = []

  (0..input_string.size).each do |start_index| #iterates over a range from 0 to string size for starting index
    this_substring = input_string[start_index..-1] #uses changing index above to set substring range from index to end of stringg
    result.concat(leading_substrings(this_substring)) #passes substring from above into helper and concatenates to resutl array
  end
  result
end

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]

