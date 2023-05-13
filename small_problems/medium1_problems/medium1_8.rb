=begin
3/26

P:
write a recursive method that computes the nth fibonacci number (with n as
the method argument)

input: integer
return: integer (fibonacci number)

rules:
-method must take an integer and return the corresponding fibonacci number
-method must use recursion
  recursion involves:
    1. method must call itself
    2. method must have a break condition to stop recursion
    3. method must use its own return value

thoughts:
-recursive function here is to take the input integer and find the next fibonacci
-number in the sequence
-recursively use the calculation (n - 1) + (n - 2)

E:
fibonacci(1) == 1
fibonacci(2) == 1
fibonacci(3) == 2
fibonacci(4) == 3
fibonacci(5) == 5
fibonacci(12) == 144
fibonacci(20) == 6765

D:
-control flow clause determine whether nuber meet break condition or should be
passed back recusively
-recurvise method call

A:
-define method with parameter n
-set an if-else calus eot control flow
  -if n < 2
    -return n (for fib, can return 0 or 1) - (this is break condition)
  -else, reassign n to reference the return value of the recursively method call
    -to return fib, we need two method invocations:
      -fib(n - 1) + fib(n - 2)

#code and algorithm written after reading the fib blog post
def fibonacci(n)
  if n < 2
    n
  else
    n = fibonacci(n - 1) + fibonacci(n - 2)
  end
end

=end
#alt solution featured in lesson materials:

def fibonacci(num)
  return 1 if num <= 2

  fibonacci(num - 1) + fibonacci(num - 2)
end

p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5
fibonacci(12) == 144
p fibonacci(20) == 6765