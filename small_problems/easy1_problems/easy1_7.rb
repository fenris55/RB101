=begin

Write a method that takes one argument, a positive integer, and returns a
string of alternating 1s and 0s, always starting with 1. The length of the
string should match the given integer.

P
def a method (stringy) that takes one integer (int) and returns a string (str)
of 1s and 0s

input: integer
output: string

explicit rules:
length of str should equal int value
str should always begin with 1
int should be positive

implicit rules:
method should not output anything

questions:

what should zero return - an empty string?

E
puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

D
string to hold return value (str)
looping structure to add correct number of 1s and 0s to str

A

-def string method with one parameter (int)
initialize empty string (str) to hold return value
initialize counter equal to int
begin iteration
set break condition if counter equals zero
add 1 to str
decrement counter
add zero to int
once iteration stops, return str

FEEDBACK initial algorithm/formal a don't work
why? because currently both 1 and 0 are being added on each iteration. Need a
way to ensure only one is added on each iteration
-nested loop? any other options? talk it out

empty string is initilaized to hold result
counter is initialized equal to int
iteration begins
--how can nesting iteration solve the issue? - nesting not necessary
(could alternate with an if/else statement and changing counter to 0
--for str[0] add 1; beyond that, if counter is odd add 0, if even, add 1 )

formal algorithm:

START
given a positive integer (int)

SET str = ''
SET counter = 0

UNTIL counter == int
SET break statement IF counter == int
IF counter is even (zero evaluates to even)
str << '1'
ELSIF counter is odd
str << '0'

counter = counter + 1
END iteration

RETURN str

END

C

def stringy(int, start_num=1)
  str = ''
  counter = 0

  loop do
    break if counter == int
    if start_num == 0
      str << '0' if counter.even?
      str << '1' if counter.odd?
    else
      str << '1' if counter.even?
      str << '0' if counter.odd?
    end
    counter += 1
  end
  str
end


puts stringy(6, 0) # == '101010'
puts stringy(9, 0) #== '101010101'
puts stringy(4, 0)# == '1010'
puts stringy(7) == '1010101'


solution uses times method and an array to hold values
 practing pedac on this

 -initialize an empty array (numbers) to hold iteration result
 -iterate over int using a counter (uses .times to iterate and |index| as counter)
 -on each iteration, return 1 if even and 0 if odd and save result to block
 variable number
 -add number to numbers array
 -end iteration
 return numbers array converted to a string (.join)


def stringy(int)
  numbers = []

  int.times do |index|
    number = index.even? ? 1 : 0
    numbers << numbers
  end

  numbers.join
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

Problems changed - 7 is now Madlibs

1/15

p: prompt for four words and return a madlibs

input: user input 4 strings (noun, verb, adjective, adverb)
output: string (sentence with user string interpolated)

rules:
prompt user for the 4 words
interpolate and output

data:
-could use loops for user input validation
-save user input as variables and interpolate into sentence

algorithm:
prompt user for noun
save as local variable
-repeat for verb, adverb, adjective

output story sentence with strings interpolated

=end

puts "Let's play MadLibs!"
puts "Emter a noun:"
noun = gets.chomp

puts "Enter a verb:"
verb = gets.chomp

puts "Enter an adjective:"
adjective = gets.chomp

puts "Enter an adverb"
adverb = gets.chomp

puts "You saw a #{adjective} #{noun} #{adverb} #{verb}?? That's crazy!"