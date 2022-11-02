=begin

Question 1
would expect code to output the original array because uniq is not a mutating
method (as opposed to uniq!)

** puts calls .to_s on its argument
** when an array is passed to puts, each array element is output on a new line
** p instead calls .inspect on its argument, which would lead to a different
  format (here, an array)

Question 2
! can be called a not operator or a bang operator
--when appended to the beginning of an object, it indicates that the object's
  boolean value is opposite what it would otherwise be
--when appended to the end of a method name, the bang operator can indicate that
  a method mutates the caller

? can be used in ternary expressions and in method naems
--when used in a ternary expression, ruby understands to assess the boolean
  value of the object to the left of `?`, and then return either the object to
  the right if true, or the final object if false
--when used in a method name, `?` indicates that the method will return a
  boolean value

**text answer is that you can't know from looking

1. `!=` means 'not equal'. you can use it in an evaluation expression or
  if/else loop
2. `!` before something means not that thing, ie !user_name means 'not user_name'
3. `!` after something indicates a that a method is mutating
4. ? before something indicates aternary expression? and that the remaining code
  will be evaluated and only part of it will be used?
5. `!!` before some thing is the double not operator, and is a double negative.
  - it forces the object it is called on to have a boolean value and then doubly
   negates it, thus validating the initial boolean value

Question 3

replace the word 'important' with 'urgent'

advice = "Few things in life are as important as house training your pet dinosaur."
advice.gsub!('important', 'urgent')

p advice

Question 4
numbers = [1, 2, 3, 4, 5]
numbers.delete_at(1)
numbers.delete(1)

-the first will delete at the index referenced in the argument (1), which is
  number 2, returning 2 and mutating the array object
-the second will delete the argument from the caller, returning 1 and
  mutating the array object

Question 5
Programmatically determine if 42 lies between 10 and 100.

(10...100).include?(42)

solution uses the new method `.cover?`

Question 6

famous_words = "seven years ago..."
#famous_words.insert(0, "Fourscore and ")
famous_words[0] = "Fourscore and "
p famous_words

omg, checked answers

p 'Fourscore and ' + famous_words
p 'Fourscore and ' << famous_words
p famous_words.prepend("Fourscore and ")

Question 7
["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]].flatten

better to use full code with variable name flintstones
--need to use mutating method flatten!

Question 8
=end
flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }

new_array = flintstones.select {|k, v| v == 2}

p new_array.to_a.flatten