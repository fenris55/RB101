=begin
4/2

P:
write a method that takes an integer representing a return and returns an integer
representing the number of Friday the 13ths in the given year

input: integer (year)
return: integer (count of Firday the 13ths)

rules:
-assume year swill not be less than 1752
-no given end date for possible input year

E:
friday_13th(2015) == 3
friday_13th(1986) == 1
friday_13th(2019) == 2

D:
variable to hold/increment the count of fridays
-array of month names to iterative over and find date?
-control flow to check if an accessed date is a friday

A:
-initialize count variable to 0
-initialize array of numbers reprensenting month (1-12)
-iterative over months array
  -create a new date with input year as year, current month as month, and
  13 as date
  -check if given date is a friday
  -if friday, increment count variable
-return count variable

=end
require 'date'

def friday_13th(year)
  count = 0
  months = (1..12).to_a
  months.each do |month|
   if Date.new(year, month, 13).friday?
     count +=1
   end
 end
 count
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2