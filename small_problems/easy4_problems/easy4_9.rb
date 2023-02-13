=begin

trying 2/5

basically reverse of previous exercises

problem: write a method that takes an integer (0 or higher) and converts to a string

input: integer
output: none
return: string

rules:
-input integer can be zero or positive
-convert to string representation of given integer
-do not use built-in methods like Integer#to_s, String(), or Kernel#format

examples:
integer_to_string(4321) == '4321'
integer_to_string(0) == '0'
integer_to_string(5000) == '5000'

data:
same as before: use hash for associations
iterative structure to evaluate each digit and select associated hash value

algorithm:
- create hash with integers as keys and associated string numbers as values
- initialize empty result variable
- can use #digits to split into array (good to know alternative methods for this)
- iterate over given integer
  - use hash reference to access string associated with digit
  - append to result string (#<<)


def integer_to_string(integer)
  numbers = { 0 => '0', 1 => '1', 2 => '2', 3 => '3', 4 => '4', 5 => '5',
              6 => '6', 7 => '7', 8 => '8', 9 => '9'
  }

  result = ''
  integer.digits.each { |el| result << numbers[el] }
  result.reverse
end

# easy. Trying out lesson solution, which uses an array, loop, #divmod, and #prepend
=end

DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '7', '9']

def integer_to_string(number)
  result = ''
  loop do
    number, remainder = number.divmod(10)
    result.prepend(DIGITS[remainder])
    break if number == 0
  end
  result
end

p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'

