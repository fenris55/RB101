=begin
2/12

problem:
-write a method that converts the interger/float degrees in the circle to a
string representing degrees, minutes, and seconds

input: float or integer
output: none
return: string

rules:
-method can take float or integer
-input represents decimal degrees in a circle
-need to convert to string and convert to degrees, minutes, seconds
-degrees are the same as the whole numbers left of the decimal point
-with integers, minutes and seconds are 0
-minutes are the number right of the decimal multiplied by 60
-seconds are the remainder of the above calculation multiplied by 60
-string output must include correct signs:
  (degree sign, minute sign (') and second sign (''))
-all returns should have format: %(xxxx)
-360 degrees should return 360 or 0 (see example output)
-use constant for decimal sign

data:
-will need to break up the number (string) but also use the chunks to do math (floats/integers)
-will need constants to represent degree signs, minute/second multiplier (60)

examples:
dms(30) == %(30°00'00")
dms(76.73) == %(76°43'48")
dms(254.6) == %(254°36'00")
dms(93.034773) == %(93°02'05")
dms(0) == %(0°00'00")
dms(360) == %(360°00'00") || dms(360) == %(0°00'00")

algorithm:
-set constant for deciaml sign
-set constants for minutes and seconds
-?? set constants for minute sign (') and second sign; ('')
Step 1
find degrees:
  -could convert to integer (#to_i) and save result (degrees) -- (these approachs leaves more work to find decimals in step 2)
  -could also convert to string and split at '.', using multiple assignment to save before and after decimal
  -could also use divmod(1) to split whole number (degrees) from decimals (minute decimal)
output: set up output string
  -set overall string with %()
  -interpolate degrees and degree sign constant
Step 2
find minutes:
- take saved decimals and multiple by 60 (constant) to find minutes -- does this need to be a float so it doesn't do integer division??

#didn't finish pedac - started to implement step 1 and it all flowed - fast and easy!
- wasn't able to get format correct for " sign

next: practice lesson solution and look at challenge

DEGREE = "\xC2\xB0"
MINUTE = "'"
SECOND = '"'
MINUTE_MULTIPLIER = 60.00
SECOND_MULTIPLIER = 60.00

def dms(float)
  degrees, minute_decimal = float.divmod(1) # finding decimal value
  minutes, seconds_in_decimal = (minute_decimal * MINUTE_MULTIPLIER).divmod(1)
  seconds, extra = (seconds_in_decimal * SECOND_MULTIPLIER).divmod(1)

  #%(#{degrees}#{DEGREE}#{format('%02d', minutes)}#{MINUTE}#{format('%02d', seconds)}#{SECOND})"
  #copying solution below
  format(%(#{degrees}#{DEGREE}%02d'%02d"), minutes, seconds) # ok would not have guess this
end

# lesson solution: (works backward from finding total seconds)

DEGREE = "\xC2\xB0"
MINUTES_PER_DEGREE = 60
SECONDS_PER_MINUTE = 60
SECONDS_PER_DEGREE = MINUTES_PER_DEGREE * SECONDS_PER_MINUTE

def dms(degrees_float)
  total_seconds = (degrees_float * SECONDS_PER_DEGREE).round
  degrees, remaining_seconds = total_seconds.divmod(SECONDS_PER_DEGREE)
  minutes, seconds = remaining_seconds.divmod(SECONDS_PER_MINUTE)
  format(%(#{degrees}#{DEGREE}%02d'%02d"), minutes, seconds)
end

p dms(30) == %(30°00'00")
p dms(76.73) == %(76°43'48")
p dms(254.6) == %(254°36'00")
p dms(93.034773) == %(93°02'05")
p dms(0) == %(0°00'00")
p dms(360) == %(360°00'00") || dms(360) == %(0°00'00")

#Challenge: modify code so that input outside of 0-360 range returns value in range
=end


DEGREE = "\xC2\xB0"
MINUTES_PER_DEGREE = 60
SECONDS_PER_MINUTE = 60
SECONDS_PER_DEGREE = MINUTES_PER_DEGREE * SECONDS_PER_MINUTE

def dms(degrees_float)
  case
  when degrees_float > 360
   degrees_float -= 360 until degrees_float < 360
  when degrees_float < 0
    degrees_float += 360 until degrees_float > 0
  else
    degrees_float
  end

  total_seconds = (degrees_float * SECONDS_PER_DEGREE).round
  degrees, remaining_seconds = total_seconds.divmod(SECONDS_PER_DEGREE)
  minutes, seconds = remaining_seconds.divmod(SECONDS_PER_MINUTE)
  format(%(#{degrees}#{DEGREE}%02d'%02d"), minutes, seconds)
end

p dms(400) == %(40°00'00")
p dms(-40) == %(320°00'00")
p dms(-420) == %(300°00'00")

#NOTES: achieve challenges with if/else. then refactored with case statement.
#tests cases return true. Tried to furhter refator by placing case statement
#into a helper method but that kept returning nil -- not sure why?
