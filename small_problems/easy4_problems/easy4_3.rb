=begin

input: year
output: no
return: boolean (indicating whether input is leap year or not)



a leap year is any year divisble by 4
-UNLESS year is also divisible by 100
--UNLESS is it also divisible by 400

-check if divisble by 4
-if not, return false
-if true, check if divisible by 100
--if not, return false
--if true, check if divisible by 400
---if not, return false
---if ture, return true

# needed to check answer for this too

def leap_year?(year)
  if year % 400 == 0
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
p leap_year?(1700) == false
p leap_year?(1) == false
p leap_year?(100) == false
p leap_year?(400) == true


retrying 1/29

problem:
write a method that take a year as input and return true if it's a leap year

input: integer (year)
output: none
return: boolean

rules:
- only consider positive years (1 or greater)
- return boolean true if year is a leap year, else return false
- follow math explanations to determine if year is leap year:
  - leap year is evenly divisible by 4
    - UNLESS also divisible by 100 AND 400

data:
- primary code here is just checking division results

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
leap_year?(1700) == false
leap_year?(1) == false
leap_year?(100) == false
leap_year?(400) == true

code:
-one way to do this is to check if the year IS divisible by 4
 - if no, return false
 - else, check if divisible by 100
   if no, return false
 else, check if divisible by 400
 if no, return false
 if yes, return true

Notes:
This was pretty easy this time! hit a few snags with the logic flow but worked
it out: maybe ~10 minutes total including pedac


def leap_year?(year)
  return false if year % 4 != 0
  return true if year % 100 != 0
  year % 400 == 0  ? true : false
end

now playing with lesson solutions below. I recalled they start with evaluating
for 400 but wanted to try it in this order -- easier to follow the logic
presenting in the problem

#solution 1
def leap_year?(year)
  if year % 400 == 0 # ugh MATH. if 400 has no remainder, than so do 4 and 100. don't need to test
    true
  elsif year % 100 == 0 # false bc must be evenly divisible by 400 AND 100
    false
  else
    year % 4 == 0 # ?? is this a true boolean and does it matter here?
  end
end
=end

# solution 2
def leap_year?(year)
  (year % 400 == 0) || (year % 4 == 0 && year % 100 != 0)
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
p leap_year?(1700) == false
p leap_year?(1) == false
p leap_year?(100) == false
p leap_year?(400) == true












