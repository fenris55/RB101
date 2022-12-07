=begin

write method that takes 2 args, mutiply, and returns result

input: 2 integers
output: no output (just return value)

=end

def multiplier(num1, num2)
  num1 * num2
end

p multiplier([2, 3) == 15

#challenge:
p multiplier([1, 2, 3], 3)

# if first arg is an array, the method multiplies its occurence
# notes say that the repeated values maintain the original object id