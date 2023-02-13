=begin
2/8

problem: take an a string showing time in hh:mm format and convert it to an
integer (between 0 and 1439) showing number of minutes. One method should show
minutes before midnight and the other show minutes after midnight
(reverse the previous exercise)

input: string
output: none
return: integer

rules:
- write two methods: after_midnight and before_midnight
- both take string times and return positive integers between 0 and 1439
- don't use Date or Time methods
- midnight is represented as '24:00'
- ignore irregularities like DSL time zones etc

data:
-constants to hold time numbers

examples:
after_midnight('00:00') == 0
before_midnight('00:00') == 0
after_midnight('12:34') == 754
before_midnight('12:34') == 686
after_midnight('24:00') == 0
before_midnight('24:00') == 0

after_midnight algorithm:
-define constants
-chop off minutes
-multiply hours by 60 and add to minutes

before_midnight algorithm:
-same as before but finding the reverse
-define constant for hours to minutes
- same approach - separate minutes and hours
  - return 0 for 24
  -would you find minutes til midnight and then subtract from 1439??


#success with after_midnight! I think this works fully. First, checks if time
== 24:00 (not a valid time) and returns 0 for midnight. saves hours and mintues
as separate variables. if hours is greater than 0, multiples the hour by 60 to
convert to minutes and adds existing minutes. finally, if hours are less than
zero, simply converts minutes to an integer and returns

#double success! kind of. all test cases return true and messed around with
other numbers, loks like this math works correctly if I change the time. So I
guess 0 and 24 are being regarded as edge cases. Kind of feels like I solved for
the test cases, but it does work. Feel like this could be short/cleaner than
the if/elsif/else structure used. But got it without checking answer!

# okay yes; lesson solution uses iteration and modulo. trying that out below.


MINUTES_PER_HOUR = 60
MINUTES_IN_A_DAY = 1440

def after_midnight(time)
  hours = time[0, 2]
  minutes = time[3, 2]
  if hours == '24'
    0
  elsif
    hours.to_i > 0
    (MINUTES_PER_HOUR * hours.to_i)  + minutes.to_i
  else
    minutes.to_i
  end
end

def before_midnight(time)
  minutes = after_midnight(time)
  return 0 if minutes == 0
  MINUTES_IN_A_DAY - minutes
end


#happy to see that my code is actually pretty similar.
=end

HOURS_PER_DAY = 24
MINUTES_PER_HOUR = 60
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

def after_midnight(time_str)
  hours, minutes = time_str.split(':').map(&:to_i)
  (hours * MINUTES_PER_HOUR + minutes) % MINUTES_PER_DAY # using modulo handles the 24:00 and 0 edge cases
end

def before_midnight(time_str)
  delta_minutes = MINUTES_PER_DAY - after_midnight(time_str)
  delta_minutes = 0 if delta_minutes == MINUTES_PER_DAY # 24:00 edge case
  delta_minutes
end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0
