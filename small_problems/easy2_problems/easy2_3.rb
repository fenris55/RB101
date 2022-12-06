require 'pry'

=begin

Create a simple tip calculator. The program should prompt for a bill amount and
a tip rate. The program must compute the tip and then display both the tip and
the total amount of the bill.

p

given a bill amount and a tipping percentage, return both the tip amount and bill total

input: 2 integers (`bill` and `tip_percentage`)
output: 2 floats (`tip_total` and `total_with_tip`)

rules:
-both return values are floats
-both returns are showing dollar amounts, so decimals will need to be roudned to 2 points
-both returns should be interpolated into a sentence explaining result

algorithm
- prompt user to enter bill amount
  -validate as dollar amount and /convert to float

- prompt user to input tip percentage
- validate as percentage amount

- take `tip_percentage` input and divide by 100 (result is `converted_percent`)
- multiply `bill` by `converted_percent` and save result (``tip_total`)
- add `tip_total` to `bill`; save as `total_with_tip`
-round both return amount to 2 decimals places
- return both results interpolated in string output

questions:
will the tip amount always be a float?

e
What is the bill? 200
What is the tip percentage? 15

The tip is $30.0
The total is $230.0

=end

bill_input = 0
tip_input = 0

loop do # bill amount validation
  puts "What is the bill?"
  bill_input = gets.chomp
  break if (bill_input.to_i > 0) && (bill_input.to_i.to_s == bill_input)
  puts "Enter a valid dollar amount"
end

loop do # tip percentage validation
  puts "What is the tip percentage?"
  tip_input = gets.chomp
  break if (tip_input.to_i < 100) && (tip_input.to_i > 0) && (tip_input.to_i.to_s == tip_input)
  puts "Enter a valid percentage amount (choose a number between 0 and 100)."
end

converted_tip = tip_input.to_f / 100
tip_total = bill_input.to_f * converted_tip
bill_total_with_tip = bill_input.to_f + tip_total.to_f

# convert to 2 decimal places

puts "The tip is $#{format('%.2f', tip_total)}."
puts "The bill is $#{format('%.2f', bill_total_with_tip)}."
