=begin

retrying 3/27

P:
write a method that takes a positive integer and converts it to a string number
without using a built-in conversion method

input: integer (positive or 0)
return: string (positive number)

rules:
-convert a positive number to a string
- do not use built in methods
-input can be 0 or positive integer
-assume all input is valid

E:
integer_to_string(4321) == '4321'
integer_to_string(0) == '0'
integer_to_string(5000) == '5000'

D:
-hash with integers as keys and corresponding string numbers as values
-array holding the digits of the input number
-loop to iterate over digit array and replace/convert each using the numbers hash
-placehold string for appending each string number taken from hash

A:
-initialize a number hash with integers as key and string numbers as values
-initialize a result variable to an empty string
-convert input integer to a digits array (and reverse)
  (is this considered using a conversion method?
  can also break apart number using %)
  or loop using #divmod(10) - returns 2 elemnet array
-iterate over digits array
  -use hash reference to access the string associated iwth the current number
  -append string number to empty result string
-return result string

NOTES: ok, I feel like this doesn't meet the requirements since #digits is
technically a conversion method. trying again belong using divmod

NUMBERS = { 0 => '0', 1 => '1', 2 => '2', 3 => '3', 4 => '4', 5 => '5', 6 => '6',
            7 => '7', 8 => '8', 9 =>'9' }

def integer_to_string(int)
  result = ''
  int.digits.reverse.each do |num|
    result << NUMBERS[num]
  end
  result
end

p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'

#initially used a wwile loop but had to handle 0 separately
# switching to a loop allowed the break statement ot be placed at the end,
so that 0 goes through one iteration instead of none

NUMBERS = { 0 => '0', 1 => '1', 2 => '2', 3 => '3', 4 => '4', 5 => '5', 6 => '6',
            7 => '7', 8 => '8', 9 =>'9' }

def integer_to_string(int)
  result = ''
  loop do
    int, current_num = int.divmod(10)
    result.insert(0, NUMBERS[current_num])
    break if int == 0
  end
 result
end

=end

