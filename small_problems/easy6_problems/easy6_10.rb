=begin
2/18

problem: what will the code print and why?

Code:
array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2

Answer:
these two different array objects are holding the same elements. When a mutating
method is used to modify the first array, the changes should be reflected in the
second array - CURLY SHEMP and CHICO should be upcased in both -- correct

=end

array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2
