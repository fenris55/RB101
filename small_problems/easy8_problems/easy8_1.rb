=begin
2/22

problem:
write a method that takes an array and calculates the sum of each subsequence
ie [a, b, c, d] => (a) + (a+b) + (a+b+c) + (a+b+c+d) = ? - return result

input: array
output: none
return: integer

rules:
-find sum of sums of each leading subsequence
-result result
-assume array always has at least one number

data:
iterative strucure
variable to hold result of ongoing/previous addition

examples:
sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
sum_of_sums([4]) == 4
sum_of_sums([1, 2, 3, 4, 5]) == 35

algorithm:
-

#lesson solution 1
def sum_of_sums(array)
  result = 0
  placeholder = 0

  array.each do |el|
    placeholder += el
    result += placeholder

  end
  result
end

#lesson solution 2
=end

def sum_of_sums(arr)
  result = 0
  1.upto(arr.size) do |num|
    result += arr.slice(0, num).reduce(:+)
  end
  result
end

p sum_of_sums([3, 5, 2]) #== (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35
