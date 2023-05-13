=begin
4/3

P:
identify why the given code is returnign a SystemStackError

A:
the move method uses recursion to calll itself from within the method body.
However, there is no break condition present. The recurive method empties the
second array into the first and then continue populating the first array with
empty array. On iteration, n continue to be decremented by 1. Each recursive call
creates another stack level. Eventuall, the stack runs out of memory? and throws
the system stack error. The code can be fixed by append a return statement with
the condition to return from the method if n drops to below 1.


=end