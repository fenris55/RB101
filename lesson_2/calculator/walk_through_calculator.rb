#trying alone first before watching video
=begin
PEDAC
P: input - two numbers, selected operation (2 integers and 1 string)
   output - result of user's selected operation (integer)
   explicit rules: must take 2 integers
                   must select one of the 4 operators
                   must display result
   implicit rules: does not specify positive or negative - specify not 0
                   must not accept 0
   mental model: ask user for 2 integers and one of four math operations, then 
                 display result of their choices
E: 4, 5, addition: 9
   2, 9, subtraction: -7
   8, 2, division: 4
D: variables storing user input
A: ask user to enter first number, specify not 0
   save first number
   ask user to enter second number
   save second number
   ask user to choose one of four operations
   save choice
   use control flow to direct which math operation to perform
   set up statements performing add, subtract, multiply, divide with the 
     stored integers
   output a statement giving the result
C: see below
=end
=begin
choice = nil
num1 = 0
num2 = 0

loop do
puts "Enter any number that isn't zero:"
num1 = Kernel.gets().chomp().to_i
break if num1 != 0 #does not account for if text is entered rather than a number
puts "Number must not be zero. Try again."
end

loop do
puts "Enter a second number. Must not be zero:"
num2 = Kernel.gets().chomp().to_i #same as above - needs to do a number validation?
break if num2 != 0
puts "Number must not be zero. Try again."
end

loop do
puts "Choose a math operation. Type add, subtract, multiply, divide."
choice = Kernel.gets().chomp().downcase()
break if choice == "add" || choice == "subtract" || choice == "multiply"|| choice == "divide"
end

result = case choice
          when "add" then num1 + num2
          when "subtract" then num1 - num2
          when "multiply" then num1 * num2
          else num1 / num2
         end

puts "Your result is #{result}!"
=end 

#It works! Issues: 
#much longer than it needs to be. Try combining number inputs into one loop.
#doesn't address if text is entered for a number
#can Numeric be used to validate input?
#attempting to shorten below
#opted to allow negatives since assignment doesn't specify positive 

choice = nil
num1 = 0
num2 = 0

loop do
Kernel.puts("Enter any number that isn't zero:")
num1 = Kernel.gets().chomp().to_i
Kernel.puts("Enter a second number")
num2 = Kernel.gets().chomp().to_i
Kernel.puts( "Choose a math operation. Type add, subtract, multiply, divide.")
choice = Kernel.gets().chomp().downcase()
break if num1 != 0 && num2 != 0 && choice != nil #does not account for if text is entered rather than a number
Kernel.puts("Something's not right. Try again.")
end

result = case choice
          when "add" then num1 + num2
          when "subtract" then num1 - num2
          when "multiply" then num1 * num2
          else num1.to_f / num2.to_f #does this change work?
         end

Kernel.puts("Your result is #{result}!")


#ok, short but doesn't solve the og issues - still long and doesn't account for text
# also, 0 really should be allowed for addition and subtraction

#video brings up issue of integer division - the above division doesn't work
#change .to_f?

#now coding along wth video below
=begin
Kernel.puts("Welcome to Calculator!")

Kernel.puts("What's the first number?")
number1 = Kernel.gets().chomp()

Kernel.puts("What's the second number?")
number2 = Kernel.gets().chomp()

Kernel.puts("What operation would you like to perform? 1) add 2) subtract 3) multiply 4) divide")
operator = Kernel.gets().chomp()
if operator == "1"
  result = number1.to_i() + number2.to_i()
elsif operator == '2'
  result = number1.to_i() - number2.to_i()
elsif operator == '3'
  result = number1.to_i() * number2.to_i()
else 
  result = number1.to_f() / number2.to_f()
end

Kernel.puts("The result is #{result}")

=end