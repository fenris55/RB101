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

=end

def multiplier(num1, num2)
  num1 * num2
end

def power_to_the_n(num, power)
    multiplier(num, 1) ** power
end

p power_to_the_n(78, 5)

#solution taken from a student submission
# need more practice with this type of math