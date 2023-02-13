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

exercises changed

1/17

problem:
build a program that generates a random age between 20-200

input: none
output: string (with name Teddy and random age)

rules:
-must generate one random age between 20 and 200
-must print result
-must interpolate age into string
-must specify age is Teddy's

data: can set a range and randomly select age

example: Teddy is 69 years old!

algorithm

-set inclusive range from 20 to 200
- randomly select a number from range and save as variable
  - can use #sample method
print string with variable interpolated


Notes:
Okayy, harder than I expected/
1. apparently #sample does not work on a range? thought i've seen that before
2. #rand takes a max argument but no minimum
3. went with a loop to ensure age is over 20; could have probably also used if

OMG rand takes a range as an argument. code below.

def teddys_age
  age = 0

  loop do
   age = rand(200)
   break if age >= 20
  end

  puts "Teddy's age is #{age}!"
end

teddys_age

age = rand(20..200)
puts "Teddy's age is #{age}!"

challenge: add user's name and default name to Teddy

=end

puts "What's your name?"
name = gets.chomp

age = rand(20..200)

name.empty? ? (puts "Teddy's age is #{age}!") : (puts "#{name}'s age is #{age}!")
