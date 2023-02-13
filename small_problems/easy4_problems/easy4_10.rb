require 'pry'
=begin

2/5

problem: write a method that takes a positive or negative number and returns it
as a string

input: integer (positive, negative, or zero)
output: none
return: string (with leading character - or + unless -)

rules:
-can use integer_to_string method from previous problem
  - my solution used # digits; this only works with a positive number
  - using method solution
-input can be zero, negative, or positive without without +
-string output should include leading character - or + except for 0

examples:
signed_integer_to_string(4321) == '+4321'
signed_integer_to_string(-123) == '-123'
signed_integer_to_string(0) == '0'

data:
- helper method from previous - converts from int to string

algorith:
-helper method will do the conversion
-before invoking, need to
  1. check for leading character
  2. remove and save or skip that index during iteration
  3. check input for +, - or 0 and append char if needed


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

def signed_integer_to_string(int)
  case int
  when int < 0
    result = integer_to_string(-int) # not working
    result.prepend('-') #NOT WOKRING
  when int > 0
    result = integer_to_string(int)
    puts result      # not working
    p result.insert(0, '+') #not working
  else
    integer_to_string(int)
  end
end

#leaving this for the night. neither prepend or inject are working to add the +.
# also cannot puts/p after that method call. It's like its returning from the helper
# method and the rest of the case statement is not evaluating

# have tried abs and adding - but cannot prevent a negative number from being passed
# ot the helper method. So lots of little problems that seem like easy fixes but
# idk why they're happening and why I can't fix them

p signed_integer_to_string(4321) #== '+4321'
#p signed_integer_to_string(-123) == '-123'
#p signed_integer_to_string(0) #== '0'


coming back 2/6 and looking at this fresh
-hit some issues yesterday that I'll have to come back to and reexamine

problem: using the integer_to_string method from the previous exercise, write a
new method that takes a signed signed (or unsigned) integer input and returns
the string version with leading sign - or + (unless 0)

input: integer (can be signed or unsigned)
output: none
return: signed string (no sign if 0)

Algorithm
-can use integer_to_string method
-need to:
  1. check if input has sign (only negative will have sign??)
  2. if signed can:
    - find abs
    -add -
    -multiply by -1
    these all turn it postive, then re-add sign after using helper method
  3. inkove helper; trying only doing this once
  4. control flow (case statement?)
    -if input has signed, add -
    -if input == 0, return
    -else, add '+'

Code

#OMG same thing as happening with code above - string number is being resulted
and no efforts to manipulate it are outputting -- WHYY

So confused. I've tried so many ways of doing this above and below - passing in
the arg with .abs, using prepend, using insert. I'm seeing these attempts
working in the student submissions, but none of them are having any affect here
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

def signed_integer_to_string(number)
  absolute_num = number.abs
  string = integer_to_string(absolute_num)
  case number <=> 0
  when -1 then "-#{string}"
  when 1 then "+#{string}"
  else
    string
  end
end

#below, typing out exact method solution. the above is similar but tried to
#eliminate the multiple method calls - getting the string but cannot get sign on
# ok so my attempt above did work - idk what's going on

=begin
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

def signed_integer_to_string(number)
  case number <=> 0
  when -1 then "-#{intger_to_string(-number)}"
  when 1 then "+#{integer_to_string(number)}"
  else            integer_to_string(number)
  end
end
=end

p signed_integer_to_string(4321) #== '+4321'
#signed_integer_to_string(-123) == '-123'
#signed_integer_to_string(0) == '0'