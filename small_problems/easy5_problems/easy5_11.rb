=begin

problem:
write a method that takes an integer input and returns list of digits as array

input: integer
output: array of integers

rules:
-array output should list digits of integer input
- array should reflect order of digits as they appear in integer

code:
-convert integer to array of digits (#digits) and reverse for correct order (#reverse)
- alternatively, could convert to string, array of chars, and then convert each
element back to integer


examples:
puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true

def digit_list(integer)
  integer.digits.reverse
end

solving again without using #digits method

Notes:
both of these were easy and quick to come up with
coming back tomorrow to dig into the first "brute force" solution
-- once again, divmod/ division by 10 is used to manipulate numbers and I'm having
trouble wrapping my brain around what is happening there.


def digit_list(integer)
  string_digits = integer.to_s.chars
  result = string_digits.map { |num| num.to_i}
end

#refactoring below

def digit_list(integer)
  integer.to_s.chars.map(&:to_i)
end

now looking at LS's "brute force" approach below


def digit_list(number)
  digits = []

  loop do
    number, remainder = number.divmod(10) #number is being reassigned each iteration
    digits.unshift(remainder)
    break if number == 0 # on final invokation of divmod, 10/1 is 0 (integer division)
  end

  digits
end

puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true


retrying 2/12

problme:
write a method that takes an integer and returns an array of the integer
of the input int

input: integer
output: none
return: array of integers

rules:
-return array of the integers in the given input integer
-array should reflect order of ints in input
-single-digit int returns single-element array

rules:
-could use a method (like #digits) to split the int into an array (AND REVERSE)
-could convert input to a string, iterate over adding each element to a new array
  (#map, each_with_object) and then convert array elements back to ints

examples:
puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true

def digit_list(int)
  int.digits.reverse
end

#or:
=end

#did this quickly, doesn't work -- take a closer look
# fixed - needed to split with ('')
def digit_list(int)
  int.to_s.split('').map { |num| num.to_i }
end

puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true














