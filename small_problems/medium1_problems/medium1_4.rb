=begin
3/3

problem:
write a method that takes an integer. from 1 to the integer, cycle through counting
by each number until n-1 cycles are complete. If an number is divisible by one of
the counter, it is eliminated; it is is divisible by a following counter, it is
reintroduced. At the end of the cycles, return an array of the numbers that are
still included

input: integer
return: array of integers

rules:
-set a range from 1 to the input integer
-cycle through each number in the range
  - if a range number is divisible by the current range number, discard
  - else (if not divisible) include
-so essentially partioning the range /array of possible numbers
-if a previously discarded number is divisible by the number number, it is reincluded
-so for each iteration, included and discarded numbers change
-at the end of iterations, return an array holding the numbers that are still included

E:
input: 5 => output: [1, 4]
because:
on 1: 1, 2, 3, 4, 5 are included
on 2: 2, 4 are discarded; 1, 3, 5 are included
on 3: 2, 3 4 are discarded; 1,5 are included
on 4: 2, 3 are discarded, 1, 4, 5 are included
on 5: 2, 3, 5 are discarded; 1, 4 are included

input: 10 => output: [1, 4, 9]
on 1: 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 are included
on 2: 2, 4, 6, 8, 10 are discarded; 1, 3, 5, 7, 9 are included
on 3: 2, 3, 4, 8, 9, 10 are discarded; 1, 5, 6, 7 are included
on 4: 2, 3, 9, 10 are discarded; 1, 4, 5, 6, 7, 8 are included
on 5: 2, 3, 5, 9 are discarded; 1, 4, 6, 7, 8 are included
on 6: 2, 3, 5, 6, 9 are discarded; 1, 4, 7, 8 are included
on 7: 2, 3, 5, 7, 9 are discarded; 1, 4, 8 are included
on 8: 2, 3, 5, 7, 8, 9 are discarded; 1, 4, are included
on 9: 2, 3, 5, 7, 8 are discarded; 1, 4, 9 are included

D:
need an array of numbers from 1 to n
need a range to iterate over
need placeholder array to keep track of discarded and included elements

A:
-initialize a an array holding integers from 1 to input integer
-initialize a range from 1 to n
-iterate over range
  within iteration
    -iterate over number array
      -check if current array element modulo range number is 0
        -if yes add to off array
        -if no add to on array
        -complete for all elements
      -return to outer iteration
      -next range number is called (2)
        -return to inner itertion
        -iterate over off array
        -if el % range num, add to on array
        -iterate over on array
        -if el % num, add to off array
-at the end, return the on array
-so, actually we need to start off initializing the 2 empty array
(also could skip 1st iteration)

# well. got it working with the first test case
#crazy long and some aspect of the switching back and forth isn't workign properly
#moving on to lesson solution below, which uses a hash. much simpler, but it was
good practice to strip this down to what the numbers are doing and execute that.

def lights(int)
  return [1] if int == 1 || int == 2

  input_arr = (1..int).to_a
  off_arr, on_arr = input_arr.partition { |el| el % 2 == 0 }

  off_placeholder = []
  on_placeholder = []

  (3..int).each do |range_num|

    off_arr.each do |element|
      if element % range_num == 0
        on_placeholder << element
        off_arr.delete(element)
      end
    end
p off_arr
p on_placeholder

    on_arr.each do |element|
      if element % range_num == 0
        off_placeholder << element
        on_arr.delete(element)
      end
    end
p on_arr
p off_placeholder

  if !off_placeholder.empty?
    off_placeholder.each { |new_el| off_arr << new_el }
  end

  if !on_placeholder.empty?
    on_placeholder.each { |new_el| on_arr << new_el }
  end
  on_placeholder = []
  off_placeholder = []
 p on_arr
 p off_arr
  end
 p on_arr.sort

end

p lights(5) #== [1, 4]
p lights(10) # == [1, 4, 9]

#lesson solution
=end

def initialize_lights(num)
  lights = Hash.new
  1.upto(num) { |num| lights[num] = 'off' }
  lights
end

def on_lights(lights)
  lights.select { |_position, state| state == 'on' }.keys
end

def toggle_every_nth_light!(lights, nth)
  lights.each do |position, state|
    if position % nth == 0
      lights[position] = (state == 'off') ? 'on' : 'off'
    end
  end
end

def toggle_lights(number_of_lights)
  lights = initialize_lights(number_of_lights)
  1.upto(lights.size) do |iteration_number|
    toggle_every_nth_light!(lights, iteration_number)
  end
  on_lights(lights)
end

p toggle_lights(1000)
