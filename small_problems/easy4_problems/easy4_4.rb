=begin

modify code below
-keep current code if year is >= 1752
-if year is less than 1752, true for any year divisible by four

def leap_year?(year)
  if year < 1752 && year % 4 == 0
    true
  elsif year % 400 == 0
    true
  elsif year % 100 == 0
    false
  else
    year % 4 == 0
  end
end

p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == true
p leap_year?(1) == false
p leap_year?(100) == true
p leap_year?(400) == true


tried this first - all above tests evaluate to true except for: p leap_year?(1) == false
-not sure why it's not running correctly or why the change to one line solved it
---from solutions page - there's no return value for years < 1752 is eval is false

def leap_year?(year)
  if year < 1752 &&
    if year % 4 == 0
      true
    end
  elsif year % 400 == 0
    true
  elsif year % 100 == 0
    false
  else
    year % 4 == 0
  end
end

retrying 1/29

- continuation of Easy 4.4

problem: update method from previous exercise so that any year before 1752 is a
leap year if divisible by 4

input: integer (year)
output: none
return: boolean (true for leap year)

rules:
-update metod from Easy4.4
-modify with some control flow
- if year argument is < 1752, year % 4 == 0 is a leap year (no 100 or 400 rules)

data:
out outer control flow based on input date

examples:
leap_year?(2016) == true
leap_year?(2015) == false
leap_year?(2100) == false
leap_year?(2400) == true
leap_year?(240000) == true
leap_year?(240001) == false
leap_year?(2000) == true
leap_year?(1900) == false
leap_year?(1752) == true
leap_year?(1700) == true
leap_year?(1) == false
leap_year?(100) == true
leap_year?(400) == true


def leap_year?(year)
  if year < 1752
   year % 4 == 0
  else
  (year % 400 == 0) || (year % 4 == 0 && year % 100 != 0)
  end
end

p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == true
p leap_year?(1) == false
p leap_year?(100) == true
p leap_year?(400) == true

retrying 1/29

problem:
write method that finds all multiples of 3 and 5 from 1 up to input number, then
return the sum of those multiples

input: integer
output: none
return: integer

rules:
-assume argument is greater than 1
-find all multiples of 3 or 5 betwwen 1 and input number
-find sum of selected multiples
-return sum

data:
-iterative structure to iterate over range from 1 to int
-empty array to hold selected multiples

examples:
multisum(3) == 3
multisum(5) == 8
multisum(10) == 33
multisum(1000) == 234168

code:
Step 1 select multiples
-initialize empty digits array # actually could ksip this and use select
-set range from 1 to input integer (#select)
-check if each element % 3 or 5 == 0

Step 2: perform addition
-initialize result variable to 0
-iterate over multiples array
-add each to value to result
-return result

code:

def multisum(int)
  multiples = (1..int).select do |num|
    num % 3 == 0 || num % 5 == 0
  end

  add_digits(multiples)
end

def add_digits(array)
  result = 0
  array.each { |num| result += num }
  result
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168

Challenge: rewrite using inject/reduce

=end

def multiples(num, divisor)
  num % divisor == 0
end

def multisum(int)
  multiples = (1..int).select do |num|
    multiples(num, 3) || multiples(num, 5)
  end

  add_digits(multiples)
end

def add_digits(array)
  array.reduce { |total, el| total += el }
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168










