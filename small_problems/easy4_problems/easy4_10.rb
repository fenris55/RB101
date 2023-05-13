=begin

P:
expand the solution from the previous problem  - write a method that converts a
SIGNED number (integer) to a signed string

input: integer (positive, negative, or 0)
return: string number with - or + leading sign (unless 0)

rules:
-input will have no leading sign if 0 or positive
-input will start with - if negative
-string output should have leading sign (- or +) unless 0
-can use conversion metho from previous problem

D:
-control flow to start:
  - if input is negative, must be multiplied by -1 for divmod to work correctly
-helper method to complete conversion
-control flow for after conversion
  -if input was < 0, insert -
  -if  input was > 0, insert +

A:
initialize sign variable to empty string
if input number is < 0
  -multiply by -1
  save '-' to sign
  -elsif iput is greater than 0
  save '+' to sign

invoke helper method for conversion-insert sign at index 0
  -should automatically give -, +, or do nothing if result is 0

=end


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
=begin
#my solution - commenting out to try lesson solution below
def get_leading_sign(int)
  leading_sign = ''
  if int < 0
    leading_sign = '-'
  elsif int > 0
    leading_sign = '+'
  end
  leading_sign
end

def signed_integer_to_string(int)
  leading_sign = get_leading_sign(int)
  int *= -1 if int < 0
  result = integer_to_string(int)
  result.insert(0, leading_sign)
end
=end

def signed_integer_to_string(int)
  case int <=> 0
  when -1 then "-#{integer_to_string(-int)}"
  when 1 then "+#{integer_to_string(int)}"
  else
    "#{integer_to_string(int)}"
  end
end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'
