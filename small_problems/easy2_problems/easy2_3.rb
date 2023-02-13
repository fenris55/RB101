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

redoing 1/18

problem: create tip calculator

input: 2 integer/float - bill amount and tip percent
output: strings w/ 2 floats: tip amount and new bill total with tip

rules:
-output 2 strings, each identifying the calculation
- within program:
  - find tip percentage of bill amount
  - add tip amount to bill amount for bill total
- float results should be rounded to 2 decimals (dollar amount)

algorithm:
-prompt user for bill amount and validate
-prompt user for tip percentage and validate (to ensure correct form is entered)
- divide tip percentage by 100 and multiply result by bill amount - save as tip amount
-add tip amount to bill amount and save as bill total
-output tip amount
-output bill total

Notes:
in pedac, forgot to mention converting user input to float
-also forgot to mention deciaml formatting
  - know from past experience that #round doesn't work on this:
    - need to use...either regex or that funky method
    - method is #format - added to notes. memorize - good to know

-challenge is to fix dollar output but already did this

=end

bill_amount = 0
tip_percent = 0

loop do
  puts "What's your bill total?"
  bill_amount = gets.chomp.to_f
  break if bill_amount > 0
  puts "Sorry, enter a valid number greater than 0."
end

loop do
  puts "What percentage would you like to tip? (Enter a whole number)"
  tip_percent = gets.chomp.to_f
  break if tip_percent > 0
  puts "Sorry, enter a valid whole number greater than 0."
end

tip_amount = (tip_percent / 100) * bill_amount
bill_total = tip_amount + bill_amount

puts "Your total tip is: #{format('%.2f', tip_amount)}."
puts "Your bill total is #{format('%.2f', bill_total)}."
