# P:
# write a method that takes an integer year as input and returns a string 
# with the century as an ordinal number

# rules: 
# - endings are: st, nd, rd, or th
# - new century is a year ending in 01
# century spans years X01-X00 
# method should account for future years (more than 4 digit integers)
# method should account for years with one, two, or three digits
# all years are BC (no years <= 0) 

# E: 
# century(2000) == '20th'
# century(2001) == '21st'
# century(1965) == '20th'
# century(256) == '3rd'
# century(5) == '1st'
# century(10103) == '102nd'
# century(1052) == '11th'
# century(1127) == '12th'
# century(11201) == '113th'

# D: 
# input: integer
# output: string (string number and ordinal ending)

# control flow (case statement) to check last number
# and append correct ordinal ending

#loop/iteration to chop off numbers to find century

# notes from lesson solution: ********************************
# a century is the current year / 100 = 1

# A: 

# -divide input year by 100
#-add 1 to result unless final digit in input year is 0
 

def century(year)

  century = year.div(100)
  century += 1 unless year.digits.first.zero?
  century = century.to_s
  
  return century << 'th' if %w(11 12 13).include? century[-2, 2]

  case century[-1]
  when '1' then return century << 'st'
  when '2' then return century << 'nd'
  when '3' then return century << 'rd'
  else          return century << 'th'
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