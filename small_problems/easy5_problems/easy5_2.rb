=begin
1/28

problem:
write method that takes time in minute-based format and return the time in 24
hour format

input: positive or negative integer
output: string (24-hour time format - hh:mm)

rules:
-method takes time in minute format
  - 1440 minutes in 24-hour period
-positive indicates minutes after midnight
-negative indicates minutes before midnight
-convert minutes to times in 24 hour format
- do not use Date or Time classes
- ignore DSL, time zones etc

data:

examples:
time_of_day(0) == "00:00"
time_of_day(-3) == "23:57"
time_of_day(35) == "00:35"
time_of_day(-1437) == "00:03"
time_of_day(3000) == "02:00"
time_of_day(800) == "13:20"
time_of_day(-4231) == "01:29"

thoughts:
midnight = 00:00 = 1400
00:01 = 1 OR -1439
23:59 = 1439 OR -1

retrying 2/6

write a method that takes a time in minutes (positive is minutes after
midnight, negative is minutes until midnight ) and returns time in hh:mm format

input: positive or negative integer (representing minutes before or after midnight)
output: none
return: string (numbers in military time format hh:mm)

rules:
-disregard DSL, time zones, etc
-do not rules Time or Date classes
-positive input is minutes after midnight
-1440 minutes in a 24 hour period
  BUT input can be any integer, ie 3000 == "02:00"
- i think that means if int.abs is >= 1440, divide by 1400?? ORr not. idk.
-suggests trying #divmod, %, and #format

-suggestions first solving for positive input between 0 and 1439
  -then deal with integers greater than 1439 (subtract)?
  -then solve for negative (reverse)

examples:
time_of_day(0) == "00:00"
time_of_day(-3) == "23:57"
time_of_day(35) == "00:35"
time_of_day(-1437) == "00:03"
time_of_day(3000) == "02:00"
time_of_day(800) == "13:20"
time_of_day(-4231) == "01:29"

data:
-control flow for positive, negative, over or under 1439
-empty string/array to hold result -- don't forget colon
-something to associate int to time -- thinking this is what the math/divmod is for


algorithm for positive 0-1439
-assuming input integer is a positive number between 0-1439

ok nope. no idea. copying solution below this sad small attempt

def time_of_day(int)
  if int <= 9
    "00:0#{int}"
  elsif int <= 99
    "00:#{int}"
  elsif int <= 999

  end
end


p time_of_day(0) == "00:00"
p time_of_day(35) == "00:35"
# time_of_day(800) == "13:20"


MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR #1440

# first normal input so only calulcating with ints 0-1439

def normalize_minutes_to_0_through_1439(minutes)
  while minutes < 0         # making input positive
    minutes += MINUTES_PER_DAY
  end
  minutes % MINUTES_PER_DAY # reducing for numbers >= 1440
end

def time_of_day(delta_minutes)
  delta_minutes = normalize_minutes_to_0_through_1439(delta_minutes)
  hours, minutes = delta_minutes.divmod(MINUTES_PER_HOUR)
  format('%02d:%02d', hours, minutes)
end

p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"


retrying 3/26

P:
write a method that takes an integer: positive represent mintues after midnight,
and negative represents minutes until midnight; convert the time represented by
the input intger to a string representing the time in hour and minute format

input: integer (positive or negative)
return: string ("HH:MM" format)

rules:
-positive input indiactes minutes after midnight
  1 -> 12:01
  60 => 01:00
  130 -> 02:10
-negative input represents minutes until midnight
  -3 -> 23:57
  -1439 -> 00:01
-inpt of 0 represents midngiht
-input of 0 should return 00:00
-there 1440 seconds in a 24-hour period
  -since time starts at 00:00 (like a zero-based index), total minutes in 24-hour  period are actually 1439
-input can be greater than 1439
-no limit to size of input integer

E:
time_of_day(0) == "00:00"
time_of_day(-3) == "23:57"
time_of_day(35) == "00:35"
time_of_day(-1437) == "00:03"
time_of_day(3000) == "02:00"
time_of_day(800) == "13:20"
time_of_day(-4231) == "01:29"

D:
constant to represent minutes in a 24-hour period (1440)
constant to represent minutes in an hour (60)

A:
-if abs value of input  integer is greater than or equal to 1440
-loop over input integer
  -if int is greater than 0, subtract 1440 until value is less than 1440
, if int is less than 0, add 1440 until value is greater than 0
- divide integer by 60 to find hour
-take integer and % 60 to find minutes
-convert mintues to string joined by :
-if time string length is 3
  -prepend 0

=end
MINUTES_IN_A_DAY = 1440
MINUTES_IN_AN_HOUR = 60

def format_mintutes(int)
  if int < 0
    until int > 0
      int += MINUTES_IN_A_DAY
    end
  elsif int >= MINUTES_IN_A_DAY
    until int < MINUTES_IN_A_DAY
      int -= MINUTES_IN_A_DAY
    end
  else
    int
  end
  int
end

def time_of_day(int)
  int = format_mintutes(int)
  return '00:00' if int == 0

   hour = (int / MINUTES_IN_AN_HOUR).to_s
   minutes = (int % MINUTES_IN_AN_HOUR).to_s

  hour.insert(0, '0') if hour.size == 1
  minutes.insert(-2, '0') if minutes.size == 1
   "#{hour}:#{minutes}"

end


p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"










