=begin

write method xor, which true true only if one of the operands is true

examples:

xor?(5.even?, 4.even?) == true
xor?(5.odd?, 4.odd?) == true
xor?(5.odd?, 4.even?) == false
xor?(5.even?, 4.odd?) == false


def xor?(op1, op2)
  !!(op1 == true && op2 == false) || !!(op1 == false && op2 == true)
end

p xor?(5.even?, 4.even?) == true
p xor?(5.odd?, 4.odd?) == true
p xor?(5.odd?, 4.even?) == false
p xor?(5.even?, 4.odd?) == false

retrying 1/21

problem

wtie method xor that takes two arguments are returns a boolean true if only one
of the arguments is truthy.

input: two method calls w/ calling objects
output: boolean

rules:
- xor must return a boolean, not a truthy value
  - || and && return truthy values, not booleans
- method produces an exclusive or -- only one argument can be true

Assumptions:
- use || or &&?
- can use !! to convert return to boolean

data: comparators

examples:
xor?(5.even?, 4.even?) == true
xor?(5.odd?, 4.odd?) == true
xor?(5.odd?, 4.even?) == false
xor?(5.even?, 4.odd?) == false

algorithm:
- use || to check whether 1 is false and 2 os true or vice versa
- use double not operator !! to force a boolean
  -- take a truthy value, coerce to boolean opposite (false), and then coerce
  back to boolean true

Notes:
-solution uses explicit return. Trying that below.
- my solution is in answer too! needed to change format -- only need 1 !!, with
  the entire or statement wrapped in another set of parentheses.

def xor?(arg1, arg2)
  !!((arg1 == true && arg2 == false) || (arg1 == false && arg2 == true))

end

p xor?(5.even?, 4.even?) == true
p xor?(5.odd?, 4.odd?) == true
p xor?(5.odd?, 4.even?) == false
p xor?(5.even?, 4.odd?) == false

=end

def xor?(arg1, arg2)
  return true if arg1 && !arg2
  return true if !arg1 && arg2
  false
end

p xor?(5.even?, 4.even?) == true
p xor?(5.odd?, 4.odd?) == true
p xor?(5.odd?, 4.even?) == false
p xor?(5.even?, 4.odd?) == false







