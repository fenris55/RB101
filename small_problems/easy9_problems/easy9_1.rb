=begin
2/24

problem:
write a method that takes two arguments, an array and a hash. Returna a greeting
that include all array elements join by spaces and both hash values

input: array and hash
output/return: unclear -- instructions say to return greeting, but example
implies it hsould be output. Choosing to use p to achieve both (despite the
advice that a method should not both output and return a meaningful value)

rules:
-method takes array and hash arguments
-hash will have 2 key-value pairs (title and occupation)
-array will have 2 or more elements
-together, array elements make up a full name
-method should join all array elements into a string, with elements separated by spaces
-method's output should include full name taken from array, as well as both
hash values
-output be in the form of a greeting

example:
greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
=> "Hello, John Q Doe! Nice to have a Master Plumber around."

algorithm:
shortest: invoke p and pass string argument
-within string, interpolate array with #join and (' ') argument
--alternatively, could achieve WITHOUT using #join by using array index
  reference for all values - might need loop and counter since there's an
  unknown number fo array elements
-interpolate both hash values separately using hash reference

NOTES: My thoughts on hash reference were wrong. I tried to access using the
names of the hash keys, which were not accessible. Instead, needed to call
#values, returning an array of the hash values, and then use index reference on
the array to access the correct value.

LOL NOPE -- hash values are acciessble. But here they are a symbol and I didn't
use a symbol. So, first thoughts/initial alg were correct

ALSO -- lesson solution does NOT output -- simply returns string

CHALLENGE: method is too long and doesn' pass rubocop due t line length. What's
the best way to shorten lines to satify rubocop? -- best way is to use a
backslash to split the string into 2 lines? Could also save the 3 interpolated
values into shorter variable names

def greetings(array, hash)
  p "Hello, #{array.join(' ')}! Nice to have a #{hash.values[0]} #{hash.values[1]} around!"
end
=end

def greetings(array, hash)
  "Hello, #{array.join(' ')}! Nice to have a #{hash[:title]}\
  #{hash[:occupation]} around!"
end

p greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
#=> "Hello, John Q Doe! Nice to have a Master Plumber around."
