=begin

write a metod that computes sqaure of argument using method from last exercise


chellenge: generalize this method to a "power to the n" type method: cubed, to
the 4th power, to the 5th, etc. Use the multiply method.

challenge PEDAC

input should now be a number and a power
multiplier method already returns a square, so we need some control flow
- if power == 2,
-- return multiplier method
- else,
-- subtract 2 from power and save as multiplier
-- invoke multiplier method (which uses 2)
-- return result of multiplier method and then multiply by multiplier

def multiplier(num1, num2)
  num1 * num2
end

def square(num)
  multiplier(num, num)
end

p square(5) == 25
p square(-8) == 64


def multiplier(num1, num2)
  num1 * num2
end

def power_to_the_n(num, power)
    multiplier(num, 1) ** power
end

p power_to_the_n(78, 5)

#solution taken from a student submission
# need more practice with this type of math


retrying 1/21

problem:

write a method that computes square of its argument - use multiplier method
from previous exercise

input: integer
output: n/a
return: integer

rules
-write method that takes one integer argument and computes its square
- use multiplier method

algorithm

-define method square with one param - within invoke multiplier method
-pass square arg as both args to multiplier


def multiply(num1, num2)
  num1 * num2
end

def square(int)
  multiply(int, int)
end

p square(5) == 25
p square(-8) == 64

Challenge: modify about code to create a power to the n method

Note: I have the hardest time with these. Got close but had to check user
submission. Playing with a few below.

def multiply(num1, num2)
  num1 * num2
end

def power(int, power)
  square = int
  while power > 1 do
    int = multiply(square, int)
    power -= 1
  end
  int
end

p power(5, 2 )== 25
p power(3, 3 ) == 27
p power(2, 4) == 16

=end

def multiply(num1, num2)
  num1 * num2
end

def power(num, exponent)
  multiply(num, 1) ** exponent













