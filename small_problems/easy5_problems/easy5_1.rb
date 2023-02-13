=begin

1/28
- skipping easy 4 for now. Second time getting stuck there due to the math

-wrtie a method that calculates the combined ASCII value of string elements

input: string
output: none
return: integer

rules:
-1 string input
-identify ASCII character vlaue of each string element
- perform addition on values and return
- empty string should return 0
-suggestion - use #ord to find ascii value

data:
-array to hold string chars
-iterative structure for finding ascii values
-iterative structure for adding ASCII values

examples:
ascii_value('Four score') == 984
ascii_value('Launch School') == 1251
ascii_value('a') == 97
ascii_value('') == 0

algorithm
-split string input into array of chars
-iterate over array (#map)
  - return new array containing ASCII value of each element
- initialize variable to hold return value
-iterate over array of ascii values
  - add each value to return value

#WORKS! first time, no problems
#glanced at solution - retrying again but simpler

def ascii_value(string)
  letters = string.chars
  values = letters.map do |letter|
    letter.ord
  end

  result = 0
  values.each do |value|
    result += value
  end

  result
end

challenge: mystery mathod is #chr - returns value based on encoding

def ascii_value(string)
  result = 0
  string.chars { |el| result += el.ord } # can also use #each_char
  result
end


p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0


retrying 2/6

problem:
write a method that returns the sum of the ASCII values of a sring argument

input: string
output: none
return: integer

examples:
ascii_value('Four score') == 984
ascii_value('Launch School') == 1251
ascii_value('a') == 97
ascii_value('') == 0

rules:
-add ASCII values of each string element
-empty string input should return 0
- can use String#ord to find ASCII value

data:
array to hold string elements
empty value to hold result of addition
iterative structure

code:
-split string input input array of chars (#chars)
-initialize empty variable to hold result
  (or could return from iteration with inject?)
-iteratie over chars array, performing addition
-return result

# easy, trying again with inject

def ascii_value(string)
  chars = string.chars
  result = 0
  chars.each { |el| result += el.ord  }
  result
end

#below; to make #inject work, had to consider strings with less than 2 chars
(1 char or empty) as edge cases and handle separately
=end

def ascii_value(string)
  return 0 if string.empty?
  return string.ord if string.length == 1
  chars = string.chars
  chars.inject { |total, el| total.ord + el.ord }
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0











