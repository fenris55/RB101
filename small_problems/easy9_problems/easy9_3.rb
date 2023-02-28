=begin
2/26

problem:
write a method that takes an integer argument and returns an array of all
numbers from 1 up to argument

input: integer
output: none
return: array

rules:
-assume argument is a valid integer greater than 0
-return an array of all integers from 1 to integer
-input of 1 should simply return [1]

examples:
sequence(5) == [1, 2, 3, 4, 5]
sequence(3) == [1, 2, 3]
sequence(1) == [1]

data:
-iteration structure to iterate over all integers from 1 to arg
-array to hold result

algorithm:
-could set a range from 1 to arg and iterate, adding each to array
-could use built in method (#upto, maybe #times?)

Notes:
#upto returns caller (1)
#times does not work with this, since it starts at 0 and ends one short of caller
# hmm..looks like upto and downto are the only way I can figure out doing this
without resorting to a manual loop

def sequence(int)
  number_array = []
  1.upto(int) { |num| number_array << num }
  number_array
end

#trying another below:

def sequence(num)
  result = []
  num.downto(1) { |el| result << el }
  result.reverse
end

#trying a third:

def sequence(num)
  result = []
  loop do
    break if num < 1
    result << num
    num -= 1
  end
  result.reverse
end

#OMG lesson solution below:

def sequence(num)
  (1..num).to_a # just sets a range and convert to an array
end

#Challenge: make it work with negative numbers
Note: made it work, but not sure if return should still go all the way to 1
=end

def sequence(num)
  (1..num).to_a if num > 0
  (num..1).to_a if num < 0
end
p sequence(-5) #== [1, 2, 3, 4, 5]
p sequence(-3) #== [1, 2, 3]
p sequence(-1) #== [1]
