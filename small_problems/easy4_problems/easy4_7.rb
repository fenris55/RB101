=begin
retrying 3/26

P:
write a method that takes a string number and converts it to an integer without
using any standard built-in conversion methods

input: string (of numbers)
return: integer

rules:
-convert numeric input string to an integer
-do not use built-in conversion methods
-assume all input is valid / numeric

E:
string_to_integer('4321') == 4321
string_to_integer('570') == 570

D:
-hash with string integers and keys and corresponding integers as values
-array of elements of intput string ( is array necessary - each_char and with_index?)

A:
-initialize result number to 0
-initialize number hash from 0 to 9 with string numbers as keys and integers as value
-convert input string to an array of chars and reverse
  -use hash reference to access the numeric value associated with current key/element
  -multiply by placeholder by 10 and add accessed number
-return result

=end
NUMBERS = {'0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6,
            '7' => 7, '8' => 8, '9' => 9 }

def string_to_integer(string)
  result = 0
  string.chars.each do |num|
  result = (result * 10) + NUMBERS[num]
  end
  result
end

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570