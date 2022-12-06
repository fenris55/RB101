=begin

Build a program that randomly generates and prints Teddy's age. To get the age,
you should generate a random number between 20 and 200.

P
generate a random number representing Teddy's age and add it to a sentence

input: none
output: sentence with random number interpolated

rules:
number must be generated randomly
number must be netwwen 20 and 200
number must be added to sentence and output
implicit: should be an integer

E
Teddy's age is 45!

D
string - for output
variable - to hold randomly generated number

A
generate and save a random number
--how?
-rand method
  -how can this be achieved without using rand (or any bult in method?)
add random number to sentnece and output (string interpolation)

=end

=begin
age = rand(20..200)
puts "Teddy is #{age} years old!"
=end

=begin
modify the above code by asking for a name. Out put the user's name and random
age. If no age is given, use Teddy as default

a:
ask user for name
save user name
interpolate both name and random age into sentence
if user doesn't give a name, set 'Teddy' to appear as default name

=end

puts "What's your name?"
name = gets.chomp.capitalize
age = rand(20..200)

if name.empty?
  puts "Teddy is #{age} years old!"
else
  puts "#{name} is #{age} years old!"
end

# can solve easily with if/else -- not sure about how to set a default in the
# context of user input

