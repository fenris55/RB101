#Easy 1 - 3
=begin
using PEDAC
P: input: one integer
   output: list of integers
   explicit requirements: must be a method
                          must take one argument (integer)
                          integer must be positive
                          must return a list
   implicits reqs         do not print from within method
                          --examples calls method with puts
                          examples are diff frmo explanation
                          Examplesk just verify true/false
   mental model: give an integer and receive back a list of the numbers in the integer
E: input: 456
   output: 4, 5, 6
   input: 2
   output: 2
   input: 9283
   output: 9, 2, 8, 3
D: integers; arrays
A: accept initial integer
   splits components of integer
   creates and returns list/array of split integer
C: see below
=end

# this took some work to nail; was missing the block with map/the return to integer
=begin
def digit_list(integer)
  integer.to_s.split('').map {|char| char.to_i} #OR (&:to_i)
end

puts digit_list(57) == [5, 7]



=end









=begin

p:
write a method that takes one integer argumetn and returns list of digits in number

input: integer
output: array object of integers

explicit rules: must take one integer argument
                integer must be positive
                must split apart the integer into single digit numbers
                must add number to a list
                must return list of digits
implicit rules: must return list as an array (per example
               -- zero is not handled in example)

e:
input: 1234 output: no output; returns [1, 2, 3, 4]

data: array to hold return value

a:
define method `digit_list` with one parameter
iterate through argumetn, removing each digit and adding to a new list
stop iteration when list is complete
return list

c:

def digit_list(int)
  array = []
  loop do
    int, remainder = int.divmod(10)
    array.unshift(remainder)
    break if int == 0
  end
  array
end

p digit_list(789)


repeating for practice 1/10
-- lesson were reorder, so this is now different than above

problem:
take an integer and return a string of alternating 1s and 0s beginning with 1

input: integer
output: no output: return string

rules:
- write a method
- string output should be length specified by integer input
- string should always begin with 1
- don't output from within the method
- assume integer is positive

assumptions: assume string input is not empty

examples:
puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

data:
- need an iterative structure to add each string element to returned string until
specified length is reached

ideas:
- could set range from 0 to integer, use map to perform transformation and
return new array, within block returning 1 or 0 if even or odd, and join new array

algorithm:
- define method
- use integer to set range from 0 to integer
  - this will iterate from 0 to one less than integer - i think? - WRONG
  - RANGE (inclusive) iterates over all numbers
  - it's just #times that does one less than integer
  - can fix by setting range to start at 1
  - AND then need to reverse 1 and 0 since iteration begins on an odd number
- call map on integer - this will return new array
- pass block to map
- on each iteration, check if input is even
  - if even, return 1 (since iteration starts at 0)
  - if odd, return 0
  - these block return values will be passed to #map and return as a new array
- (test out adding #join to the end of the map block - don't think it will work
   here since a single integer is being returned)
   - followup - correct - doesn't work -
     - throws error - no method 'join' for Enumerator
- assuming the above test doesn't work
  - save return value of calling map on range to new method variable
  - join returned array into a string as method return value


additional thoughts:
- thought I couldn't use #times to achieve this, but it's basically the same
thing - the same logic just need to be placed in block. Differnece is needing to
initialize a collection object (here a string) to hpld the returned value
(learned by checked student submissions.) Trying this approach below.

def stringy(integer)
  int_array = (1..integer).map do |num|
    num.even? ? 0 : 1
  end

  int_array.join
end


notes:
mistakes:
-forgot to return string
- had values backward and started with 0

def stringy(integer)
  string = ''

  integer.times do |num|
    string << '1' if num.even?
    string << '0' if num.odd?
  end

  string
end

below: NOT MY CODE but saw it submitted and interesting approach

def stringy(i)
  string = ''
  i.times do
    string += '10'
  end
  string[0, i]
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

retrying 1/12
=end

def string(integer)
  string = ''
  integer.times do |int|
    int.even? ? string << '1' : string << '0'
  end
  string
end

p string(6)














