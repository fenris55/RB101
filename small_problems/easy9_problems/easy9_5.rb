=begin
2/26

problem:
write a method that takes a string holding a first and last name and returns
a new string with the names reverse and separated by a comma

input: string
output: none
return: new string

rules:
-reverse order of the two elements in the string argument
-separate with a comma
-assume valid input?

examples:
swap_name('Joe Roberts') == 'Roberts, Joe'

algorithm:
-convert names to array
-reverse array
-join back to string separating with a comma

=end

def swap_name(name)
  name.split.reverse.join(', ')
end

p swap_name('Joe Roberts') == 'Roberts, Joe'
