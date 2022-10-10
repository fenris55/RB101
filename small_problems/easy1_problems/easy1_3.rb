#Easy 1 - 3
=begin
using PEDAC
P: input: one integer
   output: list of integers
   explicit requirements: must be a method
                          must take one argument (integer)
                          integer must be positive
                          must return a list
   implicits reqs         do not print from within method
                          --examples calls method with puts
                          examples are diff frmo explanation
                          Examplesk just verify true/false
   mental model: give an integer and receive back a list of the numbers in the integer
E: input: 456
   output: 4, 5, 6
   input: 2
   output: 2
   input: 9283
   output: 9, 2, 8, 3
D: integers; arrays
A: accept initial integer
   splits components of integer
   creates and returns list/array of split integer
C: see below
=end

# this took some work to nail; was missing the block with map/the return to integer
def digit_list(integer)
  integer.to_s.split('').map {|char| char.to_i} #OR (&:to_i)
end

puts digit_list(57) == [5, 7]

  
                          