=begin
4/2

P:
write a method that takes an integer n and finds the difference between squaring
the sum of all number from 1 to n and finding the sum of the squares of all numbers
from 1 to n

input: integer
return: integer:

rules:
-perform given calculation on all integers from 1 up to and including the integer
-find the sum of all integers and then find the square of that sum -- square_of_sums
-find the square of all integers and then find the sum of those squares -- sum of squares
-find the difference - subtract sum_of_squares from square_of_sums
-assume integers are positive
-return value can be 0

E:
sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
sum_square_difference(10) == 2640
sum_square_difference(1) == 0
sum_square_difference(100) == 25164150

D:
2 iterative structures
 - one to find the square of sums
 - one to find the sum_of_squares

A:
-initialize sums variable to 0
-initialize a sum_of_squares variable to 0

-iterate from 1 upto the input integer
  -add current number to sums
-when iteration is complete, find the square_of_sums (**2)

-iterate again from 1 upto input integer
  -find square of current number (**2)
  -add square to sum_of_squares variable

-subtract sum_of_square from the square_of_sums

#note: refactoring below based on solution -- incrementation of both variables
can happen from within a single iteration

def sum_square_difference(int)
  sums = 0
  sum_of_squares = 0

  1.upto(int).each do |num|
    sums += num
  end

  1.upto(int).each do |num|
    sum_of_squares += num **2
  end

  square_of_sums = sums ** 2
  square_of_sums - sum_of_squares
end


def sum_square_difference(int)
  sums = 0
  sum_of_squares = 0

  1.upto(int).each do |num|
    sums += num
    sum_of_squares += num **2
  end

  sums**2 - sum_of_squares
end

p sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150

=end

def shout_out_to(name)
 name = name.chars.map { |c| c.upcase! }.join

  puts 'HEY ' + name
end

p shout_out_to('you') # expected: 'HEY YOU'
