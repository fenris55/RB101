#Easy 1 - 2

#10/5/22
=begin
Trying written PEDAC here
P: input - one integer
   output - true if integer is odd
   rules
   explicit- must define a method
           integer can be positive, negative, or zero
           cannot used .odd?/.even? methods
           assume integer is valid
   implicit - output "false" if not odd
              don't print from within method, call with puts
   mental model : write a method that takes one integer and return
                  true only if the integer is odd
E: example1 - input: 7 output: true
   example2 - input: 6 output: false
   example3 - input: 0 putput: false
D: data structure - single integer
A: algorithm - test if integer has a remainder when divided by 2
               if so, output true

C: below

def is_odd?(integer)
  if integer % 2 != 0
    "true"
  else
    "false"
  end
end

puts is_odd?(3)
puts is_odd?(4)
puts is_odd?(0)
puts is_odd?(101)
=end
#solution is way simpler

# rewriting without module

=begin
def is_odd?(integer)
  integer.remainder(2) != 0
end

puts is_odd?(-4)
puts is_odd?(-7)
puts is_odd?(-9)
puts is_odd?(-3)
puts is_odd?(-5)
puts is_odd?(-8)

#initially fogot to test for/code for negative number
#changed > 0 to != 0

=end

#retrying Easy 1.2 on 10/12/22
=begin
P: write a method that takes an integer and returns true if number is odd

  input: one integer, can be 0, negative, or positive
  output: boolean value (true or false)

  explicit rules: assume integer is valid (no validation needed)
                  input can be positive, negative or zero
                  return either true (if odd) or false (if not odd)
  implicit rules: check integer value using boolean set to return true if odd
                  don't print from within method (call with puts)

E: input: 2 output: false
  input: 3 output: true
  input -17 output: true
  input: 0 output: false

D: working with integers and operators

A: def method is_odd? with one parameter
   set operation that evaluates to true if integer divided by zero has a
   remainder

def is_odd?(integer)
  integer % 2 == 1
end

puts is_odd?(5)
puts is_odd?(4)

=end

=begin

retrying 11/16

P:
write a method that takes and integer and returns `true` if the value is odd.

input: integer
output: boolean

explicit rules: integer can be positive, negative, or zero
                assume all input is a valid integer
                assess absolute value (ignore negative within method)
                return `true` is integer is odd

implicit rules: assess and return boolean value
                do not print from within the method

E:
input: 5 output: true
input: 2 output: false
input 0 output: false
input -9 output: true
input 'hi' output: error message

D: use a simple logical assessment to determine value
  (options: if/else, case?)

A:

define method `is_odd?` with one parameter
identify whether argument is odd or even
  -if even, return false
  -if odd, return true

C:

=end

=begin

def is_odd?(integer)
  if integer.odd?
    true
  else
    false
  end
end

def is_odd?(integer)
  integer.odd?
end

def is_odd?(integer)
  case
  when integer.odd?
    true
  else
    false
  end
end

def is_odd?(integer)
  if integer == 0
    false
  elsif integer % 2 == 0
    false
  else
    true
  end
end

#oops - was not supposed to use off. retrying shorter modulo

def is_odd?(integer)
  integer % 2 == 1
end

p is_odd?(5)
p is_odd?(-2)
p is_odd?(0)
p is_odd?(10)


repeating for practice 1/10

problem: take an integer and return `true` if odd

input: integer
ouput: no output; return boolean

rules:
- write a method definition
- input can be positive, negative, or zero
- method should only consider integer's absolute value (no action needed)
- return `true` if odd
  - since a nil return can create problems, should also return false if not odd
- method returns a boolean
- method has no output
- assume input is valid integer
- cannot use methods `odd?` or `even?`

examples:
puts is_odd?(2)    # => false
puts is_odd?(5)    # => true

data:
use math

algorithm
opt 1 - if..else statement using modulo to determine if number continuously
multiplied by 2 results in 0 (even) or 1 (odd)

opt 2 - ternary using the same math above

ACTUALLY, both are unneccesary - the math alone is enough

personal challenge: can you solve without using modulo? - not realllyyy but
learn the module method can be used instead: 3.modulo(2) == 1

def is_odd?(integer)
  integer % 2 == 1
end


def is_odd?(integer)
  integer.modulo(2) == 1
end


puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false
puts is_odd?(7)    # => true

retrying 1/12
=end

def is_odd?(integer)
  integer.modulo(2) == 1
end

puts is_odd?(9)
puts is_odd?(-13)
puts is_odd?(4)