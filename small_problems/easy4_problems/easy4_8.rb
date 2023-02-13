=begin

same as last exercise, and ok to use method written there;
only different is to return positive or negative (a signed number)

-assume all input is valid
-assume input without a sign is positive


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



retrying 2/4

using #string_to_integer method from previous exercise, extend method to return
a signed number (+ or -); assume positive if argument has no leading character

input: string
output: signed integer

rules:
-can use method from previous exercise
-input argument may or may not have - or + as a leading character
-identify output integer sign if negative ONLY


code:
- def method as #string_to_signed integer
- check character at index 0
  - if + or -
    - shift off first char and save as 'sign' variable
    - invoke string_to_int
    - if sign == -, add to return value and return
  - else
    - invoke string_to_int
     -return

def string_to_integer(string)

  s_and_i = {'0' => 0, '1' => 1, '2'=> 2, '3' => 3, '4' => 4,
             '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9 }

  result = 0
  digits = string.chars.map { |num| s_and_i[num] }
  digits.each { |num| result = 10 * result + num } # order here is tricky; overt reassignment within the block

  result
end


def string_to_signed_integer(string)
  if %w(+ -).include?(string[0])
    sign = string[0]
    string.delete!(string[0])
    int = string_to_integer(string)
    return (-1 * int) if sign == '-'
    int
  else
    string_to_integer(string)
  end
end

# the above works but it's so messy. Solution uses a case statement:

def string_to_integer(string)

  s_and_i = {'0' => 0, '1' => 1, '2'=> 2, '3' => 3, '4' => 4,
             '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9 }

  result = 0
  digits = string.chars.map { |num| s_and_i[num] }
  digits.each { |num| result = 10 * result + num } # order here is tricky; overt reassignment within the block

  result
end

def string_to_signed_integer(string)
  case string[0] # wow #1
  when '-' then -string_to_integer(string[1..-1]) #wow #2 and 3 - you can add a negative to a method call???
  when '+' then string_to_integer(string[1..-1])
  else
    string_to_integer(string)
  end
end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100

# reposting entire lesson solution below

Challenge: refactor given solution so that string_to_integer and string[1..-1]
           are both only invoked once

code: s
need to control flow from the strt by simply checking if the first character is + or -
- if '-', save and remove first char
   - pass string[1..-1]
-if '+', delete first char and pass string to method

def string_to_integer(string)

  s_and_i = {'0' => 0, '1' => 1, '2'=> 2, '3' => 3, '4' => 4,
             '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9 }

  result = 0
  digits = string.chars.map { |num| s_and_i[num] }
  digits.each { |num| result = 10 * result + num } # order here is tricky; overt reassignment within the block

  result
end

def string_to_signed_integer(string)
  if %w(- +).include?(string[0])
   leading_char = string.delete!(string[0])
  end
  result = string_to_integer(string)
  if leading_char == '-'
      return -1 * result # not working
  else
    result
  end
end
=begin

UGH made a hige mess of this. Basically a messier version of my original code,
not a refactor and couldn't furgure out how to use string[1..-1] only one time
without invoked the helper method twice.
  case string[0] # wow #1
  when '-' then -string_to_integer(string[1..-1]) #wow #2 and 3 - you can add a negative to a method call???
  when '+' then string_to_integer(string[1..-1])
  else
    string_to_integer(string)
  end
end

checking out student-submitted challenge solutions below
ACTUALLY don't see any that meet the two challenge requirements of using
string[1..-1] and string_to_integer method once each

=end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570')# == -570
p string_to_signed_integer('+100') == 100














