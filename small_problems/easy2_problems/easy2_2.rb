=begin

Build a program that asks a user for the length and width of a room in meters
and then displays the area of the room in both square meters and square feet.

Note: 1 square meter == 10.7639 square feet

P:
problem:
ask user for length and width of room in meter and return area in squre meters
and square feet

input: 2 integers
output string containing 2 integers: sq ft measurement and sq meters measurement

rules:
input should be in meters
calculate area in sq meters
convert meters to ft
calculate area in sq feet
output calculations in a string

E:
Enter the length of the room in meters:
10
Enter the width of the room in meters:
7
The area of the room is 70.0 square meters (753.47 square feet).

D:
variables to reference user input and result of math
string to output result

A:
-ask user 2 questions: length and width of room
--specify meters
-save length and width and convert to floats (user input is a string)
-multiply length and width to find sq meters and save (sq_meters)
convert length and width to floats
-multiply float length and width by 10.7639 to find ft and save result
--(Note: 1 square meter == 10.7639 square feet)
-multiply length by width to find sq feet and save (sq_ft)
output string interpolating and explaining results (sq_meters and sq_ft)

=end

=begin

SQFT_TO_SQMT = 10.7639

puts "Enter the length of the room in meters:"
length = gets.chomp.to_f

puts "Enter the width of the room in meters:"
width = gets.chomp.to_f

sq_meters = (length * width).round(2)
sq_ft = (sq_meters * SQFT_TO_SQMT).round(2)

puts "The area of the room is #{sq_meters} square meters " + \
"(#{sq_ft} square feet)."

=end
#solved and then implements some solutions features (constant, newline, round
#instead of truncate)

=begin
modify by asking for measurements in feet and outputting sq ft, sq inches, sq cm

a:
most implementation is the same - get input, perform calculations, output
set new constants for conversions between ft, in, cm

=end

SQFT_TO_SQINCHES = 144
SQINCHES_TO_SQCM = 6.4516

puts "Enter length of room in feet:"
length = gets.chomp.to_f

puts "Enter width of room in feet:"
width = gets.chomp.to_f

sq_ft = (length * width).round(2)
sq_inches = (sq_ft * SQFT_TO_SQINCHES).round(2)
sq_cm = (sq_inches * SQINCHES_TO_SQCM).round(2)

puts "Your room measurements are: #{sq_ft} square feet, #{sq_inches} square " +\
"inches, and #{sq_cm} square centimeters."