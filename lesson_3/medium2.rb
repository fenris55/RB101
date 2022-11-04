=begin

Question 1

a and c reference the same object, while b references a different object

Question 2

They all reference the same object becuase integers are immutable and object id doesn't change

Question 3

-the string in the method now references a new object because variable
reassignment is used in the method; however, new method is locally scoped to the
method and not accessible outside the method
final line will output the original string

-the shovel concatenatro is used to modify the original array; thus the final
line will output the original array object with the addition of the string
array element added in the method

Question 4

Isn't a question, just a reversed exmple of the above problem

Question 5

def tricky_method(a_string_param, an_array_param)
   a_string_param += "rutabaga"
   an_array_param += ["rutabaga"]
   return a_string_param, an_array_param
end

my_string = "pumpkins"
my_array = ["pumpkins"]
my_string, my_array = tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

Question 6

simplify the code
=end

def color_valid(color)
  color == 'blue' || color == 'green'
end

p color_valid('blue')
p color_valid('green')
p color_valid('purple')
p color_valid(3)
