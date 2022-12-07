=begin

ask for a word or phrase and return number of characters, not including spaces

input: string
output; string (with integer result interpolated)

algorithm

prompt user for input
validation - that input is not empty?
--notes: need to remove spaces before counting characters
-split input up by individual characters and place in array
-opt1: check for and delete any empty elements (can a delete method remove multiple instances?)
-opt2: iterate through and delete empty spaces (use map)
-check length of the new array returned by map and save result (`count`)
output response and interpolate count

# 1st used `delete_if; trying again below with XXXmap - select works, not map

puts "Please write word or multiple words:"
input = gets.chomp
#skipping validation - seems unnecessary
chars = input.split('')
letters =  chars.delete_if {|letter| letter == ' '}
count = letters.count

p "The number of characters in #{input} is #{count}."


puts "Please write word or multiple words:"
input = gets.chomp
chars = input.split('')
letters = chars.select {|letter| letter != ' '}
count = letters.count
p "The number of characters in '#{input}' is #{count}."

SOUTION - no need for array - can simply delete ' ' frmo input and chain size

=end

puts "Please write word or multiple words:"
input = gets.chomp
chars = input.delete(' ').size
p "The number of characters in '#{input}' is #{chars}."