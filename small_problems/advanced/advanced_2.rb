=begin
4/3

P:
write a method that takes an integer n and displays an 8-pointed star; the midline
should display the number of stars indicated by the input integer, while all other
lines should hold only 3 stars each in an nXn grid

input: integer
return: nil
output: 8-pointed star (on grid the size indicated by input integer)

rules:
-smallest input integer will be  7
-input integer will always be odd
-midline shoould hold number of stars indicated by input int
-all other lines should hold only 3 stars each

E:
input: 7 -> start with 2 spaces between each star (7 - 5 = 2)
first: star 2 spaces star 2 spaces star
second: star 1 space star 1 space star
third: star 0 space star 0 space star
middle: n * stars
third: star 0 space star 0 space star
second: star 1 space star 1 space star
first: star 2 spaces star 2 spaces star

7 starts with 2 spaces - 5
9: starts with 3 space - 6
11: starts with 4 space - 7
13: starts with 5 space - 8

observations: each time the input number increments by 2 (or 1 odd number)
spaces increment by 1

how to make code reflect this?
input int - 7 == dif
  if diff == 0
    start space is 2
  else
    start space = diff / 2 + start space ?? not quite but close

D:
iterative structure to output the correct number of spaces between stars
same iterative structure with reversed iteration

A:
-set start_space to 2
-find the difference between the input integer and 7
  -if difference is 0 (input integer is 7)
    -start_space
  -else
  start_space += (diff / 2)
-begin iteration from start_space down to 0 (#downto)
  -output star, space times start_space, start, space times start_space, star
  * + ' ' * start_space + * + ' ' * spart+space + *
    -iteration drops start space to next lowest
    -repeat until 0 spaces
-output * times input integer
-repeat above iteration in reverse (0 upto start_space)
  output stars and spaces until iterate ends

=end
LOWEST_NUM = 7

def find_start_space(int)
  start_space = 2
  difference = int - LOWEST_NUM
  start_space += (difference / 2)
end

def star(int)
  start_space = find_start_space(int)
  start_space.downto(0) { |space_size| puts ("*#{' ' * space_size}*#{' ' * space_size}*").center(int) }
  puts '*' * int
  0.upto(start_space) { |space_size| puts ("*#{' ' * space_size}*#{' ' * space_size}*").center(int) }
end

star(7)
star(9)
