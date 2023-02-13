=begin

explain the code and guess what it will output

name = 'Bob'
save_name = name
name.upcase!
puts name, save_name

on line 7 local variable `name` is initialized to point to the string object `Bob`.
on line 8 local variable `save_name` is initialized to point to the same string object referenced by local variable `name`
on line 9 the destructive method `String#upcase!` is called on the string object referenced by local variable `name`
--since the method call mutates the original string object referenced by both local variables `name` and `save_name`,
string object `'Bob'` has been changed to the uppercase version `'BOB'`
on line 10, the `Kernel#puts` method is invoked and passed the two local variables as arguments
the code outputs `'BOB'` twice, on two separate lines
this is an example of mutability

retrying 1/21

problem: describe code (just doing #2)

on line 1 local variable name is initialized to reference a string object with
value 'Bob'. On line 2 local variable save_name is initialized to reference the
same string object referenced by name ('Bob'). On line 3 the mutating #upcase!
method is called on the string object referenced by local variable name. This
method call mutates the calling object: "Bob" is now 'BOB'. Both local variables
name and save_name continue to reference the same string object, which has
now been mutated to 'BOB'. On line 4 the string object referenced by name and
save_name is passed as two seaprate arguements to the Kernel#puts method, which
returns nil and outputs the string to the screen on two separate lines. The code
outputs 'BOB' (new line) 'BOB' and demonstrates variables as pointers/mutating
methods.



=end























