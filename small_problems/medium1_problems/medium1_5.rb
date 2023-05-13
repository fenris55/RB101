=begin
3/22

P:
write a method that takes a positive odd integer and returns a four-pointed
diamond in an  integer x integer grid

input: integer
output: diamond (made of * and spaces)
return: nil?

rules:
-integer integer set set of square grid
-middle row of grid will contain number of * set by input integer
first and last rows of grid will contain one * at the midpoint,
preceded and followed by an each number of spaces on each side
-input integer will always be odd

E: see lesson

D:
iteratve structure to loop up to the number
iterative structure to loop from number downto 1

A:
-initialze spaces to input integer / 2
-initialize star_count to 1
-iterate from 1 upto input int/2
  -take spaces variable and multiply by ' '
  -at half + 1 output star
  -repeat ' ' * spaces
  increment star_count by 1
  decrement spaces by 1
-output ubot integer times *
-repeat above loop in reverse:
iterate int / 2 downto 1
-multiple spaces by ' '
-at half + 1 output star
decrement spaces
decrement star

def top_half(int)
  spaces = int / 2
  star_count = 1

  1.upto(int / 2).each do |number|
    puts "#{' ' * spaces} #{'*' * star_count} #{' ' * spaces }"
    spaces -= 1
    star_count += 2
  end
end

def midline(int)
  puts ' ' + '*' * int
end

def bottom_half(int)
  spaces = 1
  star_count = int - 2

  (int / 2).downto(1).each do |row|
    puts "#{ ' ' * spaces} #{'*' * star_count} #{' ' * spaces}"
    spaces += 1
    star_count -= 2
  end
end

def diamond(int)
  top_half(int)
  midline(int)
  bottom_half(int)
end

diamond(1)
diamond(3)
diamond(9)

#lesson solution
=end

def print_row(grid_size, distance_from_center)
  number_of_stars = grid_size - 2 * distance_from_center
  stars = '*' * number_of_stars
  puts stars.center(grid_size)
end

def diamond(grid_size)
  max_distance = (grid_size - 1) / 2
  max_distance.downto(0) { |distance| print_row(grid_size, distance) }
  1.upto(max_distance) { |distance| print_row(grid_size, distance) }
end


diamond(1)
diamond(3)
diamond(9)