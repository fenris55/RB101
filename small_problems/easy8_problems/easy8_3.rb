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
during iteration, which is a bad practice. Checking solution

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




retrying 3/23
p:
write a method that takes a string and returns an array holding all substrings

input: string
return: array (of all substrings)

rules:
-order of substrings in retrun array should mirror appearance in input string
  -all substrings at index 0 should appear first, from shorted to longest
-assume valid input?
-assume string is not empty?
-return self if string has one element?
-return empty array is string is empty?

E:
substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]

D:
-nested loop to iterate A. over each index position and B. to determine length of ss
-array to hold result

A:
- initialize empty result array (substrings)
-iterate from 0 to length of input string - 1 (represents index of string elements)
  -within iteration:
    -iterate from index to length of string - 1 (represent length of substring being taken)
    -from outer index with length of length, add substrign to substring array
return substring array

=end

def substrings(string)
  substring_arr = []
  (0...string.size).each do |idx|
    (1..string.size - idx).each do |length|
      substring_arr << string[idx, length]
    end
  end
  substring_arr
end


p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]










