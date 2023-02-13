require 'pry'
=begin
numbers = [7, 3, 5, 2, 1, 8, 4]
counter = numbers.size

loop do
  number = numbers[-counter]
  for num in 1..number
    puts num
  end

  break if counter == 1
  counter -=1
end


x = "I see a bear."

def counter(str, sub)
  str.count(sub)
end

p counter(x, 'ee')


n = 9

row = (1..n).step(2).to_a
rows +=[0..-2].reverse

rows.each do |row|
  puts ('*' * row).center(n)
end

def fix(value)
  p value.object_id
  value = value.upcase!
  p value.object_id
  #binding.pry
  value.concat('!')
end

s = 'hello'
t = fix(s)
=end

def add_name(arr, name)
  p arr.object_id
  arr = arr << name
  p arr.object_id
end
names = ['bob', 'kim']
add_name(names, 'jim')
puts names
p names.object_id