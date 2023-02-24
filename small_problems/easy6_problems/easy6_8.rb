=begin
2/18

problem:
-given an array with one duplicate value, find and return that value

input: array (of integers)
output: none
return: integer

rules:
-assume input array has only one duplicate value
-identify and return that value
-assume input array is not empty and only holds integers

data:
-iterative structure to iterate over array elements checking for a repeat
- could hold return as variable

examples:
find_dup([1, 5, 3, 1]) == 1
find_dup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
          38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
          14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
          78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
          89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
          41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
          55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
          85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
          40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
          7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) == 73

algorithm1:
- could iterate, checking count of each el, return el with count > 1

algorithm2:
- could iterate, save value to new array unless new array already includes it;

algorthim3:
-count sort_by occurence and return 1st el of sorted array?

def find_dup(arr)
  arr.each { |el| return el if arr.count(el) > 1 }
end

def find_dup(arr)
  sorted_arr = arr.sort_by { |el| arr.count(el) }
  sorted_arr.last # this works but not sure why - keeps array intact but the duplicate element (count == 2) comes last - it's just in order?
end

#lesson solution below uses Ennumerable#find, but still also uses #count.
- was hoping to find a way to do this without relying on #count
- i guess using my suggestion in alg2 above if how to achieve that. Trying below.

def find_dup(array)
  array.find { |el| array.count(el) == 2 }
end

=end

def find_dup(arr)
  new_arr = []
  arr.each do |el|
    return el if new_arr.include?(el)
    new_arr << el
  end
end

p find_dup([1, 5, 3, 1]) == 1
p find_dup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
          38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
          14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
          78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
          89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
          41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
          55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
          85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
          40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
          7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) == 73

p find_dup([1, 2, 3, 4, 2]) == 2
p find_dup([3, 4, 3]) == 3