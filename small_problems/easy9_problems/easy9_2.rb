=begin
2/26

problem:
write a method that returns the integer argument if it's a double number, and
returns double the integer arg otherwise

input: integer
output: none
return: integer

rules:
-double numbers are even numbers with the same requence repeated once
  -345345 is double, 3443 is not
-method takes one integer argument
-if argument is a double number, return it
-if not a double number, multiply by 2 and return
-0 is not mentioned - assume 0 is not a double number, and will return self (0*0 = 0)

examples: see below

data:
control flow for determine whether to return arg or arg * 2

algorithm:
-need to access digits - can convert to string or convert to array of digits
- trying option 2 to avoid convert to string adn back to int
--convert argument to array of digits contained in the integer
--take size of digits array and divide by 2 to find half
--compare start of array to half and half plus one to end
-if equal, return arg
-if not equal, multiply arg by 2 and return

NOTES: failed to think some things through
1. digits returns reverse order -- need to reverse array
2. edge case: numbers with only 1 digit will evaluate as true for double number ie (self==self)
3. to solve, automatically multiplied and return arguments with an odd number of digits or 1 or less digits
in sum the code works, but integer * 2 is used twice -- could def be cleaner

def twice(integer)
  digits = integer.digits.reverse

  if digits.size.odd? || digits.size <=1
    return integer * 2
  else
  half = digits.size / 2
  digits[0..half-1] == digits[half..-1] ? integer : integer * 2
  end
end

#lesson solution below: same approach, but used string instead of array
=end

def twice(number)
  string_number = number.to_s
  center = string_number.size / 2
  left_side = center.zero? ? '' : string_number[0..center-1] # uses Numeric#zero? to return a boolean
  right_side = string_number[center..-1]

  return number if left_side == right_side
  return number * 2
end

p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10