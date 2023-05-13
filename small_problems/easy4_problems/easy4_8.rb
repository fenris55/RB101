=begin

retrying 3/27

P:
write a method that takes a string number and convert it to an integer. The number can
be positive or negative. The first char of the string input can be + - or unsigned;
if unsigns or leading char is + return positive; if leading sign in - return negative

input: string (unmber; can be signed or unsigned)
output: intger (positive or negative)

rules:
-can use helper method from previous problem (convert string to integer)
-input may or may not include a leading sign
-need to remove sign to complete conversion to integer
-if no sign or + sign, do nothing
-if -, make negative (multiply return value by -1)

E:
string_to_signed_integer('4321') == 4321
string_to_signed_integer('-570') == -570
string_to_signed_integer('+100') == 100

D:
-control flow to check if element at index 0 or + or -
- variable to hold leading sign after it's removed
-helper method to covert string to integer
-control flow to check if saved leading sig is -

A:
-create array hold + and - signs
-check if element at index 0 of input string is included in the signs array
-if yes:
  -save element at index 0 to a variable
  -delete element at index 0
-invoke help method to perform string -to - int conversion
-check if saved leading sign is -
  -if yes, multiply result integer by -1 and return
  -else, return result integer

=end
NUMBERS = {'0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6,
            '7' => 7, '8' => 8, '9' => 9 }

SIGNS = %w(+ -)

def string_to_integer(string)
  result = 0
  string.chars.each do |num|
  result = (result * 10) + NUMBERS[num]
  end
  result
end

def normalize_string(string)
  if SIGNS.include?(string[0])
    leading_sign = string[0]
    string.delete!(leading_sign)
  end
  leading_sign
end

def string_to_signed_integer(string)
  leading_sign = normalize_string(string)
  result = string_to_integer(string)
  leading_sign == '-' ? result * -1 : result
end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100