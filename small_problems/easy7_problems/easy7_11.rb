=begin
2/22

problem: write a method that counts the number of occurences in a given array
and prints the result as key/value pairs

input: array
output: strings (separate lines for each pair)
return - unspecified -- assume nil?

rules:
-convert each unique element in a string to a hash key and make the value the
count of time that element appears in array
-occurences are case sensitive
-print result as hash pairs

assumptions
-example uses string, but problem does not specify array el type
-example output uses hash rocket, but using a hash is not speicified anywhere
  - output should NOT be a hash, should be single line ie truck => 2

examples:
car => 4
truck => 3
SUV => 1
motorcycle => 2

algorithm:
-initialize empty hash (or could iterate with each_with_object)
-iterate over array (each)
-add el as hash key unless hash keys include el
  -set value to 1
-if keys include el
 - increment value by one
output -- ?

def count_occurrences(array)
  pairs_hash = {}

  array.each do |el|
    if pairs_hash.keys.include?(el)
      pairs_hash[el] += 1
    else
      pairs_hash[el] = 1
    end
  end

 pairs_hash.each { |k, v| puts "#{k} => #{v}"  }
end

# lesson solution below

def count_occurrences(array)
  pairs_hash = {}

  array.uniq.each { |el| pairs_hash[el] = array.count(el) }

  pairs_hash.each { |el, count| puts "#{el} => #{count}" }
end

#Challenge: make it case-insensitive
=end

def count_occurrences(array)
  pairs_hash = {}

  array = array.map { |el| el.downcase }

  array.uniq.each { |el| pairs_hash[el] = array.count(el) }

  pairs_hash.each { |el, count| puts "#{el} => #{count}" }
end

vehicles = [
  'car', 'car', 'truck', 'CAR', 'SUV', 'Truck',
  'motorcycle', 'motorcycle', 'Car', 'truck'
]

count_occurrences(vehicles)

