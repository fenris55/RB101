=begin
4/2

P:
write a method that takes 3 integers representing the lengths of sides in a
triangle and returns a symbol depending on whether the trianlge is
equilateral, isosceles, scalene, or invalid

rules:
-3 integer input represents legnth of triangle sides
-a valid triangle can be equilateral, isosceles, or scalene
  -equilateral if all 3 sides are equal
  -isosceles if 2 sides are equal length
  -scalene if all 3 sides are different length
-this means:
    - if all 3 input integer are the same
        -return :equilateral
    -if 2 of the 3 input integers are the same
      -return isosceles
    -if all 3 input integers are different, return scales
-trianlge is invald if:
  -any side has a length of 0
    return :invalid if any input integer is 0
  -sum of 2 small sides is less than 3rd side
    retrn: invalid
  -notes: this can be checked by

E:
triangle(3, 3, 3) == :equilateral
triangle(3, 3, 1.5) == :isosceles
triangle(3, 4, 5) == :scalene
triangle(0, 3, 3) == :invalid
triangle(3, 1, 1) == :invalid

D:
-control flow statements to check validity of triangle:
  -checking input for 0
  -checking that the sum of the 2 smallest integers are greater than the third
-iterative structure
  -iterate over the array element and index
  -check if current element is equal to element + 1

-control flow structure to determine the output based on evaluation of the input array


A:
-check validity of the triangle:
  -return :invalid if any element of input array is 0
  -take 2 minimum value of the input array [#min]
  -sum them (#sum)
  -check if the sum is great than the largest element in the input array (#max)
  -if sum is not greater, return :invalid
-check for type of triangle
  -iterate over input array from index 0 to two less than size of array: [0, 1]
    -check is current element is equal to element at index + 1
    -perform transformation -- capture boolean return values in array
-check count of boolean array:
  -if 2,  return :equilateral
  -if 1, return :isosceles
  -if 0, return :scalene

=end

def triangle(s1, s2, s3)
  sides = [s1, s2, s3]
  return :invalid if sides.any? { |side| side.zero? }
  return :invalid if !(sides.min(2).sum > sides.max)

  booleans = (0...sides.length.pred).map do |index|
              sides[index] == sides[index.succ]
  end

  case booleans.count(true)
  when 2 then return :equilateral
  when 1 then return :isosceles
  else
    return :scalene
  end
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid