=begin
method that returns an Array that contains every other element of an Array that
is passed in as an argument

examples:
oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
oddities(['abc', 'def']) == ['abc']

pedac
-def array with one param
2 options
 - manually iteration through array, incrementing index with a counter
 --if counter is odd, add element to returned array


# coutner and manua iteration work
--how to achieve using methods?

def oddities(array)
  counter = 0
  new_array = []
  loop do
    break if counter == array.length
    new_array << array[counter] if counter.even?
    counter +=1
  end

  new_array
end

p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]

challenge below: write companion method for even numbers, but solve 2 different ways

#attempt 1 works; trying a 3rd approach below

def evensies(array)
  new_arr = []
  array.each_index do |ind|
    new_arr << array[ind] if ind % 2 == 0
  end
  new_arr
end

=end


def evensies(array)
  array.select.each_with_index do |el, index|
    index.even?
  end
end

p evensies([]) == []
p evensies([1, 2, 3, 4, 1]) #== [1, 3, 1]
p evensies([2, 3, 4, 5, 6]) == [2, 4, 6]
p evensies([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p evensies(['abc', 'def']) == ['abc']
p evensies([123]) == [123]

