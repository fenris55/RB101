=begin

# Program is not behaving. Fix code.

Problem:
the `decrease` method is intended to decrement the integer referenced by
`counter`, outputing numbers 1-10 in descending order.

Issue:
Instead, code simply oututs `10` 10 times. That's because integers are immutable.
The decrementation ocurring in the `decrease` method is returning a new object,
which has no impact on the integer referenced by `counter` in the program's
main scope.

Solution:
Need to capture the result of the `decrease` method and reassign `counter` to
reference that return value after each iteration.

Algorythm:

-invoke the `decrease` method and save the result as a new local variable.
-reassign counter to reference that variable


Followup
-algorithm above didn't work - why
  - I saved the result of the `decrease` method call with argument ` counter`
  -I then reassigned `counter` to reference the variable pointing to the
  method call's return value
  -this resulted in the counter (10) being passed into the method call,
  decrementing to 9; 9 was saved as the method return value and the new counter
  value.
  -estentially abstracted a layer and was left with the same original issue,
  this time method outputs all 9 instead of all 10.


What can fix this?
-option one - continue trying the code as-is to make the method call work
-dispense with the metho and decrement from withing the `#times` block

=end

=begin

ok - initial solution. I discarded the method. Now implementing the solution. My
thinking was in the right line -- needed to save the return value of the method.

-solution reassigns counter to the return value of the `decrease` method call
within the times block and instead of performing reassignment in the method,
simply call `#-` with argument 1.

Question - what difference does -= v - make within the method?
answer - none; it's removed simply because it's irrelevant

def decrease(counter)
  counter -= 1
end

counter = 10

10.times do
  puts counter
  counter -=1
#  decrease(counter)
end

puts 'LAUNCH!'

=end

# added challenge - only specify `10` once

def decrease(counter)
  counter - 1
end

counter = 10

counter.times do
  puts counter
  counter = decrease(counter)
end

puts 'LAUNCH!'