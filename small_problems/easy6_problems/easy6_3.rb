=begin
2/17

problem: write a method that calculates and returns the index of the first
fiboncci number with the number of digits specified by the argument

input: integer (target digit length)
output none
return: integer (target digit index)

rules:
-assume all input integers are 2 or greater
-first fibonacci has index 1 - so NOT using 0-based index
  (or use 0-based index and +1)
-must return index for FIRST fib number with length specified by input

thoughts:
-so needing to calculate fibonacci sequence until length of the previous number
is equal to input
-should these be saved - to an array
-find index of final number and add 1

data:
iteration - maybe manual (until, while) to generate sequence
array - to hold sequence
index reference to check index of final number and add 1

examples:
find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
find_fibonacci_index_by_length(10) == 45
find_fibonacci_index_by_length(100) == 476
find_fibonacci_index_by_length(1000) == 4782
find_fibonacci_index_by_length(10000) == 47847

algorithm:
creating sequence:
-set starting array holding [1, 1]
-begin until loop
add final two elements of array (arr[-1] + arr[-2]) and add to array (<<)
break if arr.last.length == input

finding index:
find index of arr.last
add 1
return

#works! - initially had an infinite loop using while -- not sure why

def find_fibonacci_index_by_length(length)
  fib_arr = [1, 1]

  until fib_arr.last.to_s.length >= length
    fib_arr << (fib_arr[-1] + fib_arr[-2])
  end
  (fib_arr.index(fib_arr[-1]) + 1)
end


#NOTE - both my solution and given lesson solution produce an infinite loop for
the final test case

#lesson solution below -- same in that it uses a loop and the same break
condition/ size checking method; different in that it doesn't bother saving the
fib sequence -- instead only the last 2 digits are saved, and the loop rewrites
over the variables holding the most recent numbers on each iteration

=end
def find_fibonacci_index_by_length(number_digits)
  first = 1
  second = 1
  index = 2

  loop do
    index += 1
    fibonacci = first + second
    break if fibonacci.to_s.size >= number_digits

    first = second
    second = fibonacci
  end

  index
end

p find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
P find_fibonacci_index_by_length(10000) == 47847 # UGH cannot figure out why this creates infinite loop for both solutions