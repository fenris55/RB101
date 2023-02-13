=begin
write a method that take year and returns century

input: integer (year)
output: no output - returns a STRNG century with ordinal ending appended

rules:
must be a method with one parameter
no output
return value is a string
--century number and ordinal ending (st, nd, rd, or th )
new century begin at year --01
--so, 1900 is still the 19th century, but 1901 is the 20th century
--7 is the 1st century
2000 is the 20th century, but 2001 is the 21 century
-needs to consider future years that haven't occured yet
-BC (negative) years aren't included in examples or rules

data
seems like a case statement lends itself best to outlining
--maybe use a range?
----that way can append century num and suffix simultaneously
-actually. since the program needs to account for literally any year into the future
(example uses the year 10103) seems like a calculation is a better solution than
manually typing out each range, which would be infinite.

SO they do need ot be separate. A single calculation, and then a case statement to
assess the final digit and append the correct suffix.

mapping:
1-100: 1st century
101-200: 2nd century
201-300: 3rd century
301-400: 4th century
401-500: 5th century
...
901-1000: 10th century
1001-1100: 11th century

notes:

from solution: year / 100 + 1 == century
--except for years ending in zero: those are simply divisible by 100


algorithm
if the last digit of the year is 0
-divide by 100 to return century
else
-divide by 100 and add 1 to return century


examples
century(2000) == '20th'
century(2001) == '21st'
century(1965) == '20th'
century(256) == '3rd'
century(5) == '1st'
century(10103) == '102nd'
century(1052) == '11th'
century(1127) == '12th'
century(11201) == '113th'

Close, but this doesn't. copying solution below


def century(year)
  if year <= 100
    cent = 1
  elsif year % 100 == 0
    cent = year / 100
  else
    cent = (year / 100) + 1
  end
  century = cent.to_s

  case century[-2..-1]
  when '11', '12', '13', '*0' then century + 'th'
  when '*1' then century + 'st' #nope
  when '*2' then century + 'nd' # nope
  when '*3' then century + 'rd' #nope these splats don't work - rest of program does
  else
    century + 'th'
  end
end

p century(2000) # == '20th'
p century(2001) #== '21st'
p century(1965) #== '20th'
p century(256) #== '3rd'
p century(5) #== '1st'
p century(10103) #== '102nd'
p century(1052) #== '11th'
p century(1127) #== '12th'
p century(11201) # == '113th'



# ok, not surprised I didn't solve this. this math..

=begin
def century(year)
  century = year / 100 + 1
  century -= 1 if year  % 100 == 0
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

p century(2000) # == '20th'
p century(2001) #== '21st'
p century(1965) #== '20th'
p century(256) #== '3rd'
p century(5) #== '1st'
p century(10103) #== '102nd'
p century(1052) #== '11th'
p century(1127) #== '12th'
p century(11201) # == '113th'


retrying 1/28

problem:
write a method that takes a year as input and returns the century

input: integer (year)
output: string (ordinal century)

rules:
-take year as input
-return century
-use ordinal ending (st, nd, rd, th)
-century goes from years XX01 to XX00
-can take any year into the future


data:
-need control flow or hash to add ordinal ending based on final digit
-need math to identify and return correct century

assumptions:
-assume all years entered are AD? - per examples

examples:
century(2000) == '20th'
century(2001) == '21st'
century(1965) == '20th'
century(256) == '3rd'
century(5) == '1st'
century(10103) == '102nd'
century(1052) == '11th'
century(1127) == '12th'
century(11201) == '113th'

coding:
two basic steps here:
1. identify century
2. add correct ordinal ending

step 1 code:
-convert integer input to string
- if final 2 digits (-2, 2) are included in range 01..99
  -century equals first 2 digits (0, 2) plus 1
  -else, century equals first 2 digits

NOTEs:
- coming back
- main issue - need to account for length of year
  - single-digit years are returning nil bc index reference doesn't work
  - years longer or shorter than 4 digits are losing place value
  - basically this code only works for 4-digit years

- ugh so much is wrong here
- think i need to do some kind of iteration over the input year,multiply by 10
to get the right number but idk how. Case also doesn't work for 11, 12, 13
- checking and practicing answer below my code

step 2 code:
set case statement:
-when century ends 1 => st, 2 => nd, 3=> rd, else th
-add correct ordinal ending to century and return result

#below does not really work

def century(year)
 year = year.to_s
 #puts year[-2, 2]
 #year_ending = year[-2, 2]
  if (01..99).include?(year[-2, 2].to_i)
    century = ((year[0, 2]).to_i + 1)
  else
    century = year[0, 2].to_i
  end

  century = century.to_s

  p century[-1]
  case
  when century[-1] == '1'
    century + 'st'
  when century[-1] == '2'
    century + 'nd'
  when century[-1] == '3'
    century + 'rd'
  else
    century + 'th'

  end
end

#p century(2000) == '20th'
p century(2001) #== '21st'
#p century(1965) == '20th'
#century(256) == '3rd'
#century(5) == '1st'
#century(10103) == '102nd'
p century(1052) #== '11th'
p century(1127) #== '12th'
#century(11201) == '113th'

# lesson solution below

def century(year)
  century = year / 100 + 1 # integer division leaves century
  century -= 1 if year % 100 == 0 # dropping down one if cent. is a year like 2000
  century.to_s + century_suffix(century) # invoking helper method
end

def century_suffix(century) # defining helper method to add suffix
  return "th" if [11, 12, 13].include?(century % 100) #edge cases
  last_digit = century % 10

  case last_digit
  when 1 then "st"
  when 2 then "nd"
  when 3 then "rd"
  else "th"
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

retrying 1/29

problem:

write a method that takes ANY year as input and returns the century

input: integer
output: none
return: string (century and ordinal suffix)

rules:
-take year and return century with ordinal suffix
-centuries begin with years ending in 01
-centuries end with years ending in 00
-can be any AD year from 1 to any future year
  -do not assume a 4-digit year format

assumptions:
-examples show no BC years

data:
-1 method to ID century number
-1 method to assign correct ending
  - can use case statement
  - can check separately for exceptions 11, 12, 13

examples:
century(2000) == '20th'
century(2001) == '21st'
century(1965) == '20th'
century(256) == '3rd'
century(5) == '1st'
century(10103) == '102nd'
century(1052) == '11th'
century(1127) == '12th'
century(11201) == '113th'

code:
method 1:
-perform integer division on input year
 - divide year by 100 and
 - unless last 2 digits of year are 00
   - add 1 to result to get century
 pass century to century suffix method below and return result

method 2: works
-take century as input
- if final 2 digits are 11, 12, 13
   - add 'th'
- else, use control flow (case statement) to assign correct suffix based on final digit

commenting below out for now
- tried to take what I recall from yesterday
- not sure why this code is not adding the 1 correctly
- also, doesn't work for single-digit years
- thinking - lesson solution automatically adds 1 and only removes it if
year % 100 == 0 -- THIS order of operations makes single digit years return 1st and not 0th

def century(year)
  cent = year / 100
  unless cent.to_s[-2, 2] == 00
    cent + 1
  end
  century_suffix(cent)

end

# method 1 below is from lesson solution
=end

def century(year)
  century = year / 100 + 1
  century -= 1 if year % 100 == 0
  century_suffix(century) # lesson returns suffix only and adds it here - might be cleaner
end   # instead of mutating from within helper method

def century_suffix(century)
century = century.to_s
final_digits = century[-2, 2]
  if ['11', '12', '13'].include?(final_digits)
    century << 'th'
  else
    case century[-1]
    when '1' then century << 'st'
    when '2' then century << 'nd'
    when '3' then century << 'rd'
    else
    century << 'th'
    end
  end
  century

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











