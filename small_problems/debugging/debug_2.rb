=begin

Problem: `#upcase!` is mytating, but its not producing expected output - fix

Thoughts: `name.chars` array is the calling object for the `each` method call and
block, rather than the local variable `name` . So, the array elements ( a copy)
are being mutated, but not the string referenced by `name` .

How to fix?:
-could save array of chars as a new variable. Saved array serves as calling
object to `each`. use `join` to convert to string

=end
#OMG solution just calls `upcase!` directly on `name`

def shout_out_to(name)
  letters = name.chars
  letters.each { |c| c.upcase! }
  puts 'HEY ' + letters.join
end

shout_out_to('you')