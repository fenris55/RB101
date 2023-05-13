=begin
3/25

P:
write a method that takes an integer representing a year and returns the correct
century as a string

input: integer
return: string

rules:
-input years can be any year (assumption: no negative years?)
-a century start at XX01 and goes to 00 of the next century
-return string must include ordinal ending
task:
  -find correct century
  -attached coorect ordinal ending

D:
-control flow (case) to attached correct ordinal ending depnding on final century digit

E:
century(2000) == '20th'
century(2001) == '21st'
century(1965) == '20th'
century(256) == '3rd'
century(5) == '1st'
century(10103) == '102nd'
century(1052) == '11th'
century(1127) == '12th'
century(11201) == '113th'


A:
-divide input year by 100
-add 1
-result is century
-create case statement
-take final digit of century
-add st, nd, rd,  or th

#nope -= had to check lesson solution for both math and the case
=end

def century(year)
  century = (year / 100) + 1
  century -= 1 if year.to_s.slice(-2, 2) == '00'
  century.to_s + century_suffix(century)
end

def century_suffix(century)
  return 'th' if [11, 12, 13].include?(century % 100)
  last_digit = century % 10

  case last_digit
  when 1 then 'st'
  when 2 then 'nd'
  when 3 then 'rd'
  else
    'th'
  end
end


p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'