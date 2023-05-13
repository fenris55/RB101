=begin

Problem: `#upcase!` is mytating, but its not producing expected output - fix

Thoughts: `name.chars` array is the calling object for the `each` method call and
block, rather than the local variable `name` . So, the array elements ( a copy)
are being mutated, but not the string referenced by `name` .

How to fix?:
-could save array of chars as a new variable. Saved array serves as calling
object to `each`. use `join` to convert to string

#OMG solution just calls `upcase!` directly on `name`

def shout_out_to(name)
  letters = name.chars
  letters.each { |c| c.upcase! }
  puts 'HEY ' + letters.join
end

shout_out_to('you')

retrying 4/3

P:
explained why the code isn't printing the expected output and fix
when string string object 'you' is passed into the shout_out_to method, the
#chars method is called on it, creating an array which each character of the
string as an element. #each is then called on this array. within the block, the
destructive #upcase! method is called on each letter in the array. the array
copy of the name string is mutated, but the string is not touched. One option
to fix this is to rejoin the mutated array back into a string (#join) and then
reassign name to reference the new stirng. However, this created a new string object
could also iterate over the name string directly using #each_chars and upcase each
element as it is passed into the block, but this return value would still need
to be captured reassigned to name as a new object

-using each_chars directly doesn't work because the string object is converted
into an enumerable

-to mutate the name string passed into the reference, solutions are:
  1. call the mutating #upcase! method directly on the string referneced by name


=end

def shout_out_to(name)

  puts 'HEY ' + name.upcase
end

shout_out_to('you') # expected: 'HEY YOU'








