=begin

Print all odd numbers from 1 to 99, inclusive, to the console, with each number
on a separate line.

for i in (1..99)
  puts i if i.odd?
end

bonus: try a different solution


(1..99).each { |i| puts i if i % 2 != 0}

100.times { |i| p i if i.odd?}

arr = (1..99).select { |i| i.odd? }
puts arr.join(' ') # not sure how to make this print each on its own line

=end

1.upto(99) { |i| puts i if i.odd?}



