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

=end

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

