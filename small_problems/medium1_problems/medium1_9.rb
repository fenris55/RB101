=begin
3/28

P: rewrite a method that calculates the nth number in teh fibonacci sequences
using a procedural approach rather than a recursive approach

input: integer (position/occurrence in the fibonacci sequence)
output: integer (fibonacci number at posiiton indicated by input integer)

rules:
-write a method that find the number at nth positionin fibonacci seqeunces and
returns that number
-do no use recursion
-must be efficient to handle large numbers
-if the input integer is 1 or 2, return 1
-fibonacci numbers are calculates using equation:
  f(nth) = f(nth - 1) + f(nth - 2)

E:
fibonacci(20) == 6765
fibonacci(100) == 354224848179261915075
fibonacci(100_001) # => 4202692702.....8285979669707537501

Notes:
-starting at 1
  -go 1 up to nth position
  num1 = 1
  num2= 1

  num3 = num1 + num2 ( 1 + 1 == 2)
  reassign num2 is now num1
  num 3 (return value is now num2)perform again

  num1 (1) + num2 (2) = 3
  num1 = 2
  num2 = 3
  num1 + num2 = 5

D:
-variables to hold the first 2 fib values
  (initialized to num1 =1 and num = 1)
-explicit return for if input is 1 or 2 (return 1)
-loop to perform calculation and variable reassignment (input int - 2 times)

A:
-define method finbonacci method with one parameter (nth)
-initialize local variables n1 and n2 to 1
-place an explicit return:
  -return 1 if nth == 1 or 2
-initialize method local variable n3
-nth - 2 times
  -initialize loop (#times, #upto, range) - #times is most appropriate
    perform calculation:
    n3 = (n1 + n2)
    n1 = n2
    n2 = n3
-when iteration is complete, return n3

Notes:

errors: none! pedac and code went smoothly
what i learned:
-was able to idenitfy and accomodate for the first 2 numbers as edge cases
-was able to track the logic of needing to subtract 2 from the input
  to accomodate for the 2 initial edge cases (ie, recognized that to get to the
  nth position, there would not actually be nth iteration -- there would be
  nth minus 2 because the first 2 must be handled separately)

=end
# yes! solved without issues or checking solution
def fibonacci(nth)
  n1 = 1
  n2 = 1
  return 1 if nth <= 2
  n3 = 0
  (nth - 2).times do |position|
    n3 = n1 + n2
    n1 = n2
    n2 = n3
  end
  n3
end

p fibonacci(20) == 6765
p fibonacci(100) == 354224848179261915075
#p fibonacci(100_001) # => 4202692702.....8285979669707537501