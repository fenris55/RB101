# Easy 1 - 1

=begin

#10/5/22

#initially this attempt didn't work - didn't need a block paramter
#bc this is an integer method, not a block?

def repeat(string, integer)
  integer.times do
    puts string
  end
end

repeat("Howdy", 5)


#2nd attempt works

def repeat(string ="Hi!", integer = 3)
  while integer > 0
    puts string
    integer -= 1
  end
end

#repeat("Howdy", 5)
#repeat('Hello', 3)
repeat(7)
repeat("How are you?")
#tried adding default parameters - the default integer works but
#the default string does not - instead it uses the integer as the string input
=end

#second try a week later - 10/12
# made same error

# retrying easy 1

=begin
P: write a methods that takes a string and a positive integer and print string
   integer number of times

   input: string, positive intger
   output: string (* integer number)

   explicit rules: method must accept string and integer
   integer must be positive
   --optimize to perform integer validation and confirm int > 0
   --optimize to ensure string is not empty and is a string, not int
   must output string as many times as integer specifies

   implicit rules: string is case-insensitive
                   print from within method - calling method should print
                   without p

E: input: "howdy", 3 output: howdy howdy howdy \n
   input "", 2 output: "" -> "please enter some text"
   input "hey!", 0 output -> "please enter an integer greater than zero"

D: string and integer -> (integer times method?)

A: def repeat method with two paramters, string and integer
  use integer to print string int number of times
  X--call times method on integer - NOPE prints int and starts at zero
  X--use block to pass in and print string
  - use a loop and incrementation
=end


# endless loop created if integer is 0
# OMG. First attempt was correct (using times integer), but didn't work bc I
# used a block
=begin
def repeat(string, integer)
   loop do
    puts string
    integer -= 1
   break if integer == 0
   end
end


# repeat("ciao", 3)
# repeat("", 2)
repeat("hi!", 0)
=end

#trying first attempt again

def repeat(string, integer)
  integer.times { puts string } # so using pipe operaters || is the error here
end                             # WHY?? - not sure why pipes aren't required

repeat("howdy", 7)
