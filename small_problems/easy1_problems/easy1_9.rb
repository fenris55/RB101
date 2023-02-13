=begin

Write a method that takes one argument, a positive integer, and returns the sum
of its digits. For a challenge, try writing this without any basic looping
constructs (while, until, loop, and each).

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45

p:
take a postive integer and return the sum of its digits

input: integer
output: integer

rules:
-integers are positive
-perform addition on all digits include in input integer (number)
and return as integer (sum)
-dont use a basic loopng structure (no each, loop, while, until)

e:
puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45

d:
will need an array to hold digits once they're split apart from the input
(number) in order to add them togetehr for the output (sum)

a:
take big number
split apart the digits and save them in a collection
add together all the numbers in the collection
return the result

lower:
-convert the integer to a string
-split apart each number in the string and save in an array
-convert array elements back to iteger
-add together the array elements
- return result

def sum(number)
 number.to_s.chars.reduce { |sum, num| sum.to_i + num.to_i}
end

 puts sum(23) == 5
 puts sum(496) == 19
 puts sum(123_456_789) == 45

 Exercises changed - 9 is now Get Middle Character

 problem: method that takes a string and return middle character/s

 input: string
 output: string

 rules:
 -if string length is odd, return middle character
 -if string length is even, return the 2 middle characters
 -return empty string is middle character is a space
 -assume input string is not empty
 - if input is single character, return that character

 examples:
 "readings" -> "e"

algorithm:

-find length of string (and divide by 2 below)
-if even
   -integer division will return 2nd of the 2 middle character
   -return element at index referenced by result of division and result -1
-if odd
 - rely on integer division and zero-base index:
 - use string reference to return element at string/2

=end

def center_of(string)
 length = string.length
 middle = length / 2

 length.even? ? string[middle - 1, 2] : string[middle]

end

p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'
