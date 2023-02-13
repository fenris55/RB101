=begin

prompt user for 2 numbers and return required outputs; don't validate

puts "Enter the first number:"
num1 = gets.chomp.to_i

puts "Enter the second number:"

num2 = gets.chomp.to_i

add_result = num1 + num2
subtract_result = num1 - num2
multiply_result = num1 * num2
divide_result = num1 / num2
mod_result = num1 % num2
exp_result = num1 ** num2

puts "#{num1} + #{num2} = #{add_result}"
puts "#{num1} - #{num2} = #{subtract_result}"
puts "#{num1} * #{num2} = #{multiply_result}"
puts "#{num1} / #{num2} = #{divide_result}"
puts "#{num1} % #{num2} = #{mod_result}"
puts "#{num1} ** #{num2} = #{exp_result}"


retrying 1/21

problem:
prompt user for 2 positive integers and output results of using input to perform
1.add 2. substract 3. product 4.quotient 5. remainder 6. power

input: 2 integers
output: string (showing operation and result)

rules:
-don't validate; assume input is 2 positive integers
- output full operation
-perform 6 different operations

algorithm:
-prompt user twice for a positive integer
-create string representation of input integers performing given calculation
-interpolate result into output string

note:
solution uses a prompt, as in the examples. Make note be be careful and imitate
stylistic etc elements like this when looking at examples
code:
=end

puts "Enter the first number:"
num_1 = gets.chomp.to_i

puts "Enter the second number:"
num_2 = gets.chomp.to_i

puts "#{num_1} + #{num_2} = #{num_1 + num_2}"
puts "#{num_1} - #{num_2} = #{num_1 - num_2}"
puts "#{num_1} * #{num_2} = #{num_1 * num_2}"
puts "#{num_1} / #{num_2} = #{num_1 / num_2}"
puts "#{num_1} % #{num_2} = #{num_1 % num_2}"
puts "#{num_1} ** #{num_2} = #{num_1 ** num_2}"