=begin

write a method that converts a string to a number without using #to_i or Integer()
-calculate result by analyzing characters in string

#LOL discussed the with JD but cannot remember

input: string
output: no
return: integer

rules:
-convert string to integer
-don't use #to_i or Integer()
-assume valid positive input

thoughts:
how can this be achieved.
with a hash
create hash with strings as keys and numbers as corresonding integers
use string index reference to iterate over input string and save corresponding
hash value in an array
join and return array

examples:
string_to_integer('4321') == 4321
string_to_integer('570') == 570

#cannot solve. checking answer
# note - successfully created array of digits, but could not figure out how to
join as an integer


require 'pry'
def string_to_integer(string)
numbers = {'0'=> 0, '1'=> 1, '2'=>2, '3'=>3, '4'=>4, '5'=>5, '6'=>6, '7'=>7, '8'=>8, '9'=> 9}
result = []
counter = 0
loop do
  break if counter == string.size
  result << numbers[string[counter]]
  #binding.pry
  counter +=1
end
result[0] = result[0..-1]
result
end

p string_to_integer('4321') # == 4321
p string_to_integer('570') == 570


# from solution:
DIGITS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9'=> 9
}

def string_to_integer(string)
  digits = string.chars.map { |char| DIGITS[char] }

  value = 0
  digits.each { |digit| value = 10 * value + digit }
  value
end

#math above is incrementing the 10s space, bumping up each digit to the correct place value

p string_to_integer('4321')  == 4321
p string_to_integer('570') == 570

challenge:
do the same as above, but convert hexidecimal input to integer

example:
hexadecimal_to_integer('4D9f') == 19871

require 'pry'

HEXIDECIMALS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9'=> 9,
  'A' => 10, 'B' => 11, 'C' => 12, 'D' => 13, 'E' => 14,
  'F' => 15
}

def hexadecimal_to_integer(hex)
  digits = hex.upcase.chars.map { |char| char = HEXIDECIMALS[char] }
  digits.reverse!

  # so close! was trying to save to new value like above instead of an array and then adding result
  counter = 0
  loop do
    break if counter == digits.size
    digits[counter] = digits[counter] * (16 ** counter)
    counter +=1
  end
  digits.sum
end

p hexadecimal_to_integer('4D9f') #== 19871

# goes right to left:
15

=end

=begin

#retrying this 1/4/23

Problem:
write a method that takes a string of integers and returns the integer version -
without using any build in methods

Input: string
Output: Integer (integer version of string)

rules:
-assume valid input
-ignore leading + or - signs
- don't use built-in integer conversion methods

Examples:

string_to_integer('4321') == 4321
string_to_integer('570') == 570

Data:
-need to associate string version of number with integer:
  -case statement
  -hash
if hash is used, can use a collection iterator to create new integer

Algorithm:
-create table (hash) that associates string  with integer
-initialize empty variable to store result
-initialize a counter for iterating over string
-convert string to array

-iterate over string input at index counter
-check hash for value associated with current string element (key)
- add match to result variable
-increment counter
- repeat until count is equal to the length of the string
-return result

=end

def string_to_integer(string)
  numbers = { "0" => 0, "1" => 1, "2" => 2, "3" => 3, "4" => 4, "5" => 5, "6" => 6, "7" => 7, "8" => 8, "9" => 9 }
  digits = []
  counter = 0
  string_array = string.split('') #returns ["3", "4", "5", "6", "6"]

  loop do
    break if counter == string.length
    digits << numbers[string_array[counter]]
    counter += 1
  end
  value = 0
  digits.each do |digit|
    value = 10 * value + digit
    p value
  end

  value
end

p string_to_integer("34566")