=begin

explain the code and guess what it will output

=end

name = 'Bob'
save_name = name
name.upcase!
puts name, save_name

=begin

on line 7 local variable `name` is initialized to point to the string object `Bob`.
on line 8 local variable `save_name` is initialized to point to the same string object referenced by local variable `name`
on line 9 the destructive method `String#upcase!` is called on the string object referenced by local variable `name`
--since the method call mutates the original string object referenced by both local variables `name` and `save_name`,
string object `'Bob'` has been changed to the uppercase version `'BOB'`
on line 10, the `Kernel#puts` method is invoked and passed the two local variables as arguments
the code outputs `'BOB'` twice, on two separate lines
this is an example of mutability

=end