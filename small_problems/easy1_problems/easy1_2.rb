#Easy 1 - 2

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

               