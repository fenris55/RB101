=begin

problem:
write a method `multisum` that tfind all multiples of three or five between 1
and given num (arg) and returns sum

input: integer
output: no
return: integer

rules:
-assume input int is postive and greater than 0
-collect all value that are multiples of 3 and 5 in the range 1..num
-add values and return result

data:
-could use a single local variable with a starting value of 0 and increment as each int is found
-could add multiples to an array and then sum the result

algorithm:
set range from 1 to given year
iterate throguh each number, checking if:
-- num % 5 == 0
-- num % 3 == 0
-select values that evaluate as true
-add returned values together

-could use select
-could use each and increment local variable
-could use Array#sum to add values once collected in array

examples:
multisum(3) == 3
multisum(5) == 8
multisum(10) == 33
multisum(1000) == 234168

#works! also trying out lesson solution below
def multisum(number)
  values = (1..number).select do |num|
    num % 5 == 0 || num % 3 == 0
  end
  values.sum
end

#notes:
# this first method seems like a handy way of solving similar/more complex
# problems in the future, but the 2nd method seems unnecessarily complex?

#challenge: rewrite using Ennumerable#inject

def multiple?(number, divisor)
  number % divisor == 0
end

def multisum(max_value)
  sum = 0
  1.upto(max_value) do |number|
    if multiple?(number, 3) || multiple?(number, 5)
      sum += number
    end
  end
  sum
end


# omg. spent forever on this. Just needed to replace sum with inject
# was not able to find a 3rd way to solve using inject
def multisum(number)
  values = (1..number).select do |num|
    num % 5 == 0 || num % 3 == 0
  end
  values.inject(:+)
end


p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168

retrying 1/30
- did this yesterday but didn't save??

problem: write a method that finds all multiples of 3 and 5 between 1 and input
integer and returns the sum of those numbers

input: integer
output: none
return: integer

rules:
-write method def
-one integer as input
-find all multiples of 3 and 5 between 1 and input int
-add total of all selected multiples
-return result

data: iterative

examples:
multisum(3) == 3
multisum(5) == 8
multisum(10) == 33
multisum(1000) == 234168

code:
-set range upto int
-select if multiple of 3 or 5
-iterative over result number performing addition
-return
=end

def multiple(int)
  int % 3 == 0 || int % 5 == 0
end

def multisum(int)
  multiples = (1..int).select {|num| multiple(num) }
  multiples.inject {|total, num| total += num }
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168















