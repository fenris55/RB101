=begin

Write a method that takes two arguments, a positive integer and a boolean, and
calculates the bonus for a given salary. If the boolean is true, the bonus
should be half of the salary. If the boolean is false, the bonus should be 0.

puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000

P

take a salary and a boolean (indicating wether a bonus will be given). Output
50% the salaray (indicating bonus amount) if boolean is ture, and 0 if false

input: integer and boolean
output: integer

explicit rules
input tkae two arguments: integer and boolean
integer is positive
return:
--0 is boolean is false
-- integer / 2 if true

E

D:
conditional statement to check boolean and control flow to correct output

A
-pass salary (salary) and true/false (bonus) to a conditional statement
-if bonus is false
  -return 0 and end
-if boolean is true
  -divide salary by 2 and return result (bonus amount)

=end

=begin

def calculate_bonus(salary, bonus_approval)
  if bonus_approval == false
    0
  elsif bonus_approval == true
    salary / 2
  end
end

puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000

p calculate_bonus(3000, true)

=end

#retrying with ternary operator

def calculate_bonus(salary, bonus)
  bonus ? (salary / 2) : 0
end

puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000
