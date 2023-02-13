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

redoing 1/18

problem:

prompt user for integer and operation (sum or product); output operation for all
integers from 1 to int

input: integer (string), string
output: integers

rules:
-perform either multiplication or addition on all integers between 1 and int
-remember, user input is string - convert to integer
- output result interpolated into string with message

data:
- if/else for control through
-iterative structure for completing operation for each inter in range

example:
4, sum => (1 + 2 + 3 + 4) 10
3, product => (1 * 2 * 3) 6


Notes: probably could be much simpler. Opted for user validation loops. Went
with two different ways of performing operations: first used #each, second
used an until loop and decremented

ooh..solution used #upto method within 2 helper methods
Challenge: explain how #inject works and complete problem again using that method
** says #inject is a "more Rubyish" way of achieving the goal

num = 0
operation = ''

loop do
  puts "Enter a positive integer greater than 0:"
  num = gets.chomp.to_i
  break if num > 0
  puts "Please enter a valid positive integer."
end

loop do
  puts "Please choose: sum or product?"
  operation = gets.chomp.downcase
  break if %w(sum product).include?(operation)
end

if operation == 'sum'
  sum_total = 0
  (1..num).each do |num|
    sum_total += num
  end
  puts "The sum of the integers between 1 and #{num} is #{sum_total}."
else
  product_total = 1
  until num == 1
  product_total *= num
  num -=1
  end
  puts "The product of the integers between 1 and #{num} is #{product_total}."
end

=end

def prompt(message)
  puts "=> #{message}"
end



def find_and_display_sum(number)
  sum = (1..number).inject(:+)
  prompt "The sum of all the numbers between 1 and #{number} is #{sum}."
end

def find_and_display_product(number)
  product = (1..number).inject(1, :*)
  prompt "The product of all the numbers between 1 and #{number} is #{product}."
end

integer = 0
loop do
  prompt "Enter a positive number greater than 1:"
  integer = gets.chomp.to_i
  break if integer > 0
  prompt "Sorry, try entering a valid number."
end

operation = ''
loop do
  prompt "Please choose: sum or product."
  operation = gets.chomp.downcase
  break if %w{sum product}.include?(operation)
end

find_and_display_product(integer) if operation == 'product'


















