=begin

Print all even numbers from 1 to 99, inclusive, to the console, with each number
on a separate line.


(1..99).each do |num|
  puts num if num.even?
end

1.upto(99) { |num| puts num if num % 2 == 0 }

redoing 1/18

print all even numbers from 1-99 on separate lines
(trying different methods from previous solution)

evens = (1..99).to_a.select {|num| num.odd? }
puts evens

=end

num = 2
while num < 100
  puts num
  num += 2
end