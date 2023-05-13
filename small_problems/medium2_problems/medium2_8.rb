=begin
4/2

P:
write a method that takes an integer and returns the next greatest number that
is: 1.a mulitlpe of 7, 2. odd, and 3. does not contain the same digit more than
once

input: integer
return: integer (or error message)

rules:
-take integer and return next featured number
-a featured number has 3 criteria:
  1. multiple of 7
  2. must be odd
  3. contain contain a repeated digit
-if there is no next featured number, return an error message
-max possible number is 9_876_543_210

E:
featured(12) == 21
featured(20) == 21
featured(21) == 35
featured(997) == 1029
featured(1029) == 1043
featured(999_999) == 1_023_547
featured(999_999_987) == 1_023_456_987

featured(9_999_999_999) # -> There is no possible number that fulfills those requirements

D:
iterative strucutre to check if a number needs featured number requirements
-range to iterate over
-string to hold error message

A:
notes:
need to check each multiple of 7

iterate from one greater than input integer to max possible number
  -check if number is multiple of 7
    -if yes, check if:
      1. odd
      2. digits in the number are equal to the uniq digits in the number
    -if a number evaluates to true, return number (evaluation stops)
  else (evaluation runs with no return)
    -return error message

=end
MAX_NUM = 9_876_543_210

def featured(num)
  error_message = "There is no possible number that fulfills those requirements"
  return "#{error_message}" if num > MAX_NUM
  (num.succ..MAX_NUM).each do |el|
   next unless el % 7 == 0
   return el if el.odd? && el.digits == el.digits.uniq
 end
end

p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987

p featured(9_999_999_999) # -> There is no possible number that fulfills those requirements