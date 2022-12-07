=begin

prompt user for 2 numbers and return required outputs; don't validate

=end

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

