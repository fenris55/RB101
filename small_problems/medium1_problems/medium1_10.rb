=begin

P:
write a method that computes the nth fibonacci number and return the final digit
of that number:

input: integer (position infibonacci sequence)
output: integer (1-digit integer - final digit of number at position indicated
by input integer)

rules:
-return final digit of the fibonaccci number at position indicated by input num
- large test cases indicate that the fibonacci number needs to be retrieved
procedurally rather than recursively
-after retrieving fib number, access and return final digit
  -options:
    -convert number to an array of digits, reverse, and return final array element
    -convert number to a string and extract final string element using index reference
    -convert back to integer and return

E:
fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
fibonacci_last(123456789) # -> 4

D:
-helper method to find the finbonacci number indicated by the input integer
-variable to hold reutnr value of helper method (fib num)
-variable to hold string version of fib num
-variable to hold the final element in string num

A:
set up helper method to perform extraction of number
-capture return value in a variable
-convert return value to a string
-use index reference to access the final element of string
-convert final element back to an integer


#working, but going too slow and final output isn't appearing. Trying again
#using metho solution approach with an array
def fibonacci_last(nth)
  n1 = 1
  n2 = 1
  return 1 if nth <= 2
  n3 = 0
  (nth - 2).times do |_|
    n3 = n1 + n2
    n1 = n2
    n2 = n3
  end
n3.to_s[-1].to_i
end

def fibonacci_last(nth)
  fib_value = fibonacci(nth)
  string_fib = fib_value.to_s
  string_final_digit = string_fib[-1]
  string_final_digit.to_i
end

#above method refactored
def fibonacci_last(nth)
  string_fib = fibonacci(nth).to_s
  string_fib[-1].to_i
end

=end
# had to take this solution from lesson to handle size of final test case
def fibonacci_last(nth)
  last2 = [1, 1]
  3.upto(nth) do
    last2 = [last2.last, (last2.first + last2.last) % 10]
  end
  last2.last
end

p fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
p fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
p fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
p fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
p fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
p fibonacci_last(123456789) # -> 4