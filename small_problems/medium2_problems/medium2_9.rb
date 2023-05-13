=begin
4/2

P:
write a method that takes an array and iterates over the array, comparing 2
elements at a time and swapping them if the 1st is greater than the second.
Iteration repeats until no swaps are performed, meaning the array is fully sorted

input: array
output: same array (mutated)

rules:
-array can hold numbers or string (or more?)
-need to start at index 0 and compare to index 1
  -swap elements in-place is the 1st element is greater than the second
  -moved to compare index 1 and 2
  -repeat until array[-2] and array[-1 are compared] (up to 2 less than length of array)
-need to check whether a swap has occured on each round of iteration
-exit the method is no swaps have occured (this means array is sorted)
-array will hold at least 2 elements

E:
array = [5, 3]
bubble_sort!(array)
array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)

D:
iterative structure to loop over index from 0 to array length - 2
-copy of array to compare before and after iteration -- when the elements are
in the same order, exit the method
-loop to repeat iteration until break condition is met

A:
initialize loop
-create copy of array
-iterate from 0 to 2 less than the length of the array
-use index reference to compare element at current index to element at the next index
  -if first is greater, comparison will return 1
    -swap index and index + 1
  -else
    move to next iteration
break if array is the same as the array copy (this means no swaps have occurred
on previous iteration)

def bubble_sort!(arr)
  loop do
    copy = arr.dup
    (0...arr.size.pred).each do |idx|
      if (arr[idx] <=> arr[idx.succ]) == 1
        arr[idx], arr[idx.succ] = arr[idx.succ], arr[idx]
      end
    end
    break if arr == copy
  end
 arr
end

#challenge notes
-in each comparision, the largest number wins
-this means the largest number travels to the end of the array on the first
iteration, and then does not move again
-this repeats with the second-largest on the next iteration, etc
-the bubble sort can be optimized to skip comparision of these elements at the
end of the array that are already fully sorted
so after each iteration, the indices compared should reduce by one
-currently, iteration rune frmo index 0 to index 2 less than end of array
-optimize by saving this range to a variable, and then decrementing the variable
after each iteration
=end

def bubble_sort!(arr)
  range_end = arr.size.pred
  loop do
    copy = arr.dup
    (0...range_end).each do |idx|
      if (arr[idx] <=> arr[idx.succ]) == 1
        arr[idx], arr[idx.succ] = arr[idx.succ], arr[idx]
      end
    end
    range_end -= 1
    break if arr == copy
  end
 arr
end


array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4] #[2, 6, 1, 4, 7]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)