=begin

Problem: incorrect output

Issues:
-On line 14 a ternary operator is using reassignment (=) insteads of equals (==)

Challenge: is a ternary operator necessary? (no)


def valid_series?(nums)
  return false if nums.sum != 47

  odd_count = nums.count { |n| n.odd? }
  odd_count == 3
end

p valid_series?([5, 6, 2, 7, 3, 12, 4, 8])        # should return true
p valid_series?([1, 12, 2, 5, 16, 6])             # should return false
p valid_series?([28, 3, 4, 7, 9, 14])             # should return false
p valid_series?([20, 6, 9, 4, 2, 1, 2, 3])        # should return true
p valid_series?([10, 6, 19, 2, 6, 4])             # should return false

reviewing 4/3

P:
identify why the code is failing in the final test case

-the method returns the result of the ternary operator. The ternary is meant
to check whether the count of odd numbers is equal to 3. How the == equality
comparator is not use; instead, = is used, which reassigns the value of odd_count
to 3. only the final test case fails because this is the only example that
sums to 47 and does not contain 3 odd numbers; the other cases appear correct
because they do contain 3 odd number, so the reassignment happens to reflect
the content of the array

#note: since == already returns a boolean, the ternary operator is not necessary



=end













