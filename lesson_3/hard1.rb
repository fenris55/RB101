=begin

Question 1

if statement will return false, so invoking `greeting` should return nil since
there's nothing there -- it's neither true nor false

Quesiton 2

the original hash object will be mutated

on line one the local variable `greeting` is initialized to a hash object. on
line two the local variable `informal_greeting` is initialized, referincing the
value of the original hash. At this point, both local variable point to the same
object. The shovel operator is used to change the hash value of the orginal object.
This is a mutating method which directly alters the original hash

Question 3

in the first two examples, variable reassignement is used within the method,
creating and returning new objects. Since the method return value is never used,
the object pointed to be the original local variables remain unchanged

In the third exmaple, the mutatng method g.sub! is used to mutate the original objects;
the changes worked wihtin the method are performed on the same objects referenced by the original variables,
meaing those changes will be reflected in the output

(one is two, two is three, three is one)

Question 4

check that input only has 4 digits and output a false

first below is my attempt -- not sure it's right. Below is answer solution

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  if dot_separated_words.size == 4
    word = dot_separated_words.pop
    is_an_ip_number?(word)
  end

end

=end
def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false unless dot_separated_words.size == 4

  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_an_ip_number?(word)
  end

  true
end
