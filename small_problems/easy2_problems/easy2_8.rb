=begin

Write a program that asks the user to enter an integer greater than 0, then
asks if the user wants to determine the sum or product of all numbers between 1
and the entered integer.

input: interger and string (number and type of calculation)
output: string with integer (response and completed calculation

rules:
-positive integer greater than zero
-must be able to perform either addition or multiplication
- complete calculation on each number from 1 upto given integer)
return result using string interpolation

algorithm:
-ask user for number
--validation necessary (make sure it's positive, an integer, and not zero)

-ask user to chose calculaiton (sum or product)
-if sum
--add each number from 1 upto input number and svae as result
-if product
--multiply each number from 1 upto input number and svae result
-output string displaying range, calculation, and interpolated result


number = ''
calculation  = ''

loop do
  puts "Please enter an integer greater than 0: "
  number = gets.chomp
  if (number.to_i > 0) && (number.to_i.to_s == number)
    number = number.to_i
    break
  else
   puts "Please enter a positive number greater than zero."
  end
end

loop do
  puts "Enter 's' to compute the sum or 'p' to compute the product: "
  calculation = gets.chomp.downcase
  break if %w(s p).include?(calculation)
  puts "The only valid options are 's' and 'p'. Try again."
end

sum_result = 0
product_result = 1
if calculation == 's'
  (1..number).each {|num| sum_result += num }
  puts "The sum of the integers between 1 and #{number} is #{sum_result}."
elsif calculation == 'p'
  (1..number).each {|num| product_result *= num }
  puts "The product of the integers between 1 and #{number} is #{product_result}."
end

Challenge: implement above code using `inject` method

=end

number = ''
calculation  = ''

loop do
  puts "Please enter an integer greater than 0: "
  number = gets.chomp
  if (number.to_i > 0) && (number.to_i.to_s == number)
    number = number.to_i
    break
  else
   puts "Please enter a positive number greater than zero."
  end
end

loop do
  puts "Enter 's' to compute the sum or 'p' to compute the product: "
  calculation = gets.chomp.downcase
  break if %w(s p).include?(calculation)
  puts "The only valid options are 's' and 'p'. Try again."
end

if calculation == 's'
 sum_result = (1..number).inject {|sum, num| sum + num }
  puts "The sum of the integers between 1 and #{number} is #{sum_result}."
elsif calculation == 'p'
 product_result = (1..number).inject {|product, num| product * num }
  puts "The product of the integers between 1 and #{number} is #{product_result}."
end
