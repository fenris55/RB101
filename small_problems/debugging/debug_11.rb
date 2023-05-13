=begin
4/2

P:
the code is attempting to output the returned array by using the p method; this
is taking precedent over the do..end block, resulting p arr with the block ignored

this can be solved by:
1. using curly braces instead of a do..end block
2. wrapping the entire argument to p in parentheses


=end

arr = ["9", "8", "7", "10", "11"]
p arr.sort { |x, y| y.to_i <=> x.to_i }

# Expected output: ["11", "10", "9", "8", "7"]
# Actual output: ["10", "11", "7", "8", "9"]