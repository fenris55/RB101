=begin
2/27

problem:
write a method that takes on integer and returns the sum of its digits

input: integer
output: none
return: integer

rules:
-try to not use basic looping strucure (while, until, loop, each)
-take input integer and return sim of digits

examples:
puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45

algorithm1
-convert int to digits and add

algorithm2
-convert int to string, to chars, to i, and add

def sum(int)
  int.digits.sum
end

# well, look at that. beautiful.
=end

def sum(int)
  int.to_s.chars.map(&:to_i).reduce(&:+)
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45
