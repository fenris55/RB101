=begin
4/2

P:
write a method that takes 3 integers representing the degrees of angles in a
triable and returns the correct symbol depending in if the triangle is right,
acute, obtuse, or invalid

input: 3 integers
return: symbol

rules:
-triangle must be valid
-validity means:
  - sum of angle is 180
  -all angles are greater than 0
  -return :invalid if both of these conditions are not met
-if input contains 90
  -return :right
-if all 3 input integers are less than 90
  -return :acute
-if any input integer is greater than 90, return obtuse
-assume input integers represent degrees
-assume all input numbers are integers (no floats)

E:
triangle(60, 70, 50) == :acute
triangle(30, 90, 60) == :right
triangle(120, 50, 10) == :obtuse
triangle(0, 90, 90) == :invalid
triangle(50, 50, 50) == :invalid

D:
array to hold input integers
control flow statement

A:
-place input integers into angles array
-check for validity:
  -if the sum of angles does not equal 180 OR any angle is not greater than 0
    -return :invalid
-check for type of angle:
  -if angles array includes 90
    -right :right
  -if any angle is greater than 90
    -return :obtuse
  -if all angles are less than 90
    -return :acute

=end

def triangle(a1, a2, a3)
  angles = [a1, a2, a3]
  return :invalid if !(angles.sum == 180) || angles.any? { |a| a <= 0 }
  return :right if angles.include?(90)
  return :obtuse if angles.any? { |a| a > 90 }
  return :acute if angles.all? { |a| a < 90 }
end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid