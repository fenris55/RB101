=begin

problem:

prompt user for current age and retirement
return number of working years left and retirement year

rules:
- all numbers are integers
- interpolate result integers into strings to display

algorithm:

X- prompt user for `current_age`
X-- validate
X- prompt user for `retirement_age`
X-- validate

X- asubtract`current_age` from `retirement_age`
X-- save result as `years_til_retirement`

-take the current year and add `years_til_retirement`
---how to get current year? method?

 - output strings with return values interpolated


example:
What is your age? 30
At what age would you like to retire? 70

It's 2016. You will retire in 2056.
You have only 40 years of work to go!


current_age = ''
retirement_age = ''
current_year = Time.new.year

loop do # age input validation
  puts "What is your age?"
  current_age = gets.chomp
  break if current_age.to_i > 0 && (current_age.to_i.to_s == current_age)
  puts "Please enter a valid age."
end

loop do # years validation loop
  puts "At what age would you like to retire?"
  retirement_age = gets.chomp
  break if retirement_age.to_i > 0 && (retirement_age.to_i.to_s == retirement_age)
  puts "Please enter a valid retirement age."
end

years_til_retirement = retirement_age.to_i - current_age.to_i
retirement_year = current_year + years_til_retirement

puts "It's #{current_year}. You'll retire in #{retirement_year}."
puts "You have only #{years_til_retirement} years of work to go!"


retrying 1/18

build a retirement calculator - take age and returement age and display current
year, reitrement year, and number of years til retirement

input: 2 integers (user's current age and retirement age)
output: strings with 3 integers: current year, retirement year, and years til retirement

rules:
- assume all numbers are integers
- need to use user input to calculate years
- need to use a method (Time.new?) to find current year
- need to subtract current age from retirement age and output years_left
- need to add years_left to current year
- output should contain 3 sentences/2 lines

data: just local variable to hold integers/calculation results

algorithm:

-prompt user for age
-prompt user for retirement_age
  - can validate user input by wrapping both in loops
-subtract age from retirement_age and save as years_left
- find current_year (use Time.new-?)
- add years_left to current_year and save as returement_year
-interpolate all three values above into string output

Note - again, forget to convert user input to integer in pedac

=end

puts "How old are you?"
age = gets.chomp.to_i

puts "At what age do you want to retire?"
retirement_age = gets.chomp.to_i

years_left = retirement_age - age

current_year = Time.now.year # taken from docs - can also use Time.new.year
retirement_year = current_year + years_left

puts "The current year is #{current_year}. You'll retire in #{retirement_year}."
puts "#{years_left} years to go!"