=begin

what will the code output and why

=end

array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2

=begin

on line 1 local variable `array1` is initialized to an array object of string objects
on line 2 local variable `array2` is initialized to an empty array object
on line 3 the `Array#each` method is called on the array object point to be `array1`
- a block with one parameter, `value`, is passed to each as an argument
-within the block, on each iteration the array element currently being iterated over is
  bound to block local variable `value` and the shovel operator adds it to the array pointed to by local `array2`.
  -each does not care about the block's return value and returns the original array
on line 4 the 1`Array#each` method is again called on the array pointed to by `array1`
-a block with one parameter, `value`, is passed to the each method call as an argument
-within the block, on each iteration the array element currently being iterated over is bound to block local variable `value`
-the destructive `String#upcase! method is called on the array element pointed to by `value` and passed a condition if statement
-within the if statement, `String#start_with emthod is called on `value` and passed an argument of two strings
--`#start_with will check to see if the array element referenced by `value` starts with either a capital 'C' or a capital 's'
---if the if statement evaluates to `true`, the array element referenced by `value` will be mutated to an uppercase version if that object
---if the if statement evaluates to `false`, `value` will not be mutated
-each does not care about the block's return value and returns the original array;
-while `array1` has not been mutateted, the elements within `array1` have been mutated
on line 4 `Kernel#puts` is invoked, which returns nil and outputs the array referenced by `array2`
- array 1 and array2 are different objects, but the array elemtns they contain the same string objects.
Since both upcase! and the shovel operator are mutating methods, the contents of array2 reflect the changes performed on the contents of array1.

at this point, they content of both arrays are identitical; all names beginning with a C or an S are not uppercased



=end