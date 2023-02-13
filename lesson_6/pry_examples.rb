=begin

Examples of using pry from the Lesson 6 pry video
typing out here for future reference

helpful commands:
-ls lists available methods
-show-source Array#cycle -d (in place of show-doc)
-whereami - in lesson it returns to code; for me it sends a location message
-pry-nav and pry-debugger are alternatives to pry-byebug

--Example 1

require 'pry'

a = 1 # pry returns 1
b = 2 # pry returns 2
binding.pry
c = 3 # pry returns nil - pry can see c (same scope), but not its value
# entering 'd' into pry returns a NameError (undefined local variable)

--Example 2 - pry variable scope

require 'pry'

def my_method(num) #within pry:
  a = 1 # a returns 1
  binding.pry
  b = 2 # b returns nil - same scope, so variable is visible but not its value
end

c = 3 # returns NameError - c is defined outside of pry's scope (within method def)
my_method(c)

--Example 3 - pry placement and return value

require 'pry'

def double_num(num)
  num * 2
end

arr = [1, 2, 3].map do |num|
  double_num(num)
  #if binding.pry is placed here, it becomes the block's return value and the
  #code will output an array of nils [nil, nil, nil] rather than the expected return
  #LESSON: be careful about placing binding.pry at the end of a method or block
end

p arr

--Example 4

require 'pry'

a = 0
b = 0

loop do
  a += 1
  binding.pry
  b += 1
  break if b >= 3
end

--Example 5 - debugging

# using pry to identify precedence issues
# the below code output returns false - returned arrays dont match test case
# - can be solved by placing parentheses around (num <- 15 || num % 3 == 0)

require 'pry'

def select_nums(num)
  new_arr = []
  arr.each do |num|
    binding.pry
    new_arr << num if num.odd? && num <= 15 || num % 3 == 0
  end
  new_arr
end

p select_nums([1, 2, 5, 6, 9, 12, 15, 17, 19, 21]) == [1, 5, 9, 15, 21]
p select_nums([6, 12, 16]) == []
p select_nums([3, 5, 7, 11, 15, 21]) == [3, 5, 7, 11, 21]

--Example 6  - using pry-byebug
=end

require "pry"
#require "pry-byebug"

def double_num(num)
  num * 2
end

def double_evens(arr)
  arr.map do |num|
    new_num = num.even? ? double_num(num) : num
  end
end

p double_evens([1, 2, 3, 4, 5]) == ([1, 4, 3, 8, 5])
