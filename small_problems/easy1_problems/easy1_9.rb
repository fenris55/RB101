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

=end

def sum(number)
 number.to_s.chars.reduce { |sum, num| sum.to_i + num.to_i}
end

 puts sum(23) == 5
 puts sum(496) == 19
 puts sum(123_456_789) == 45
