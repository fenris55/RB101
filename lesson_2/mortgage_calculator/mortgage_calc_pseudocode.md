P:problem: create a mortgage calculator

  input: loan amount, annual percentage rate (APR), and loan duration
  ouput: monthly interest rate, loan duration in months, total loan duration
          final output: monthly payment

  explicit rules: -use the 3 inputs to factor the 3 outputs
                  -use the given equation to perform calculation and return
                  final output (monthly rate)
                  -use specific variable names in equation
                  -finish by using rubocop

  implicit rules: express interest rate percentage correctly (0.05) = 5%
                  convert annual percentage rate (APR) to a monthly rate
                  convert loan duration from years to months
                  check results with online loan calculator
                  verify that valid input is being entered

E: LOL can't do examples yet

D: all user input will come in as strings and need to be converted to..floats?
   use loops to verify smaller prompts and one main loop for the entire calc

A: prompt user for loan amount
   -save result and convert to a float
   prompt user for APR
   - convert input to float/ correct decimal form
   prompt user for loan duration (?choose 15 or 30 years?)
    - save duration as float (in years?)

  use variables saved from user to plug into equation

  output string with result
  ask user if they'd like to try another calculation

#ok, coming back for a inner PEDAC
- successfully completed first loop for loan amount and integer validation
_having trouble with APR-to-monthly rate so PEDACing that below

P problem: need to take user's APR rate, validate (?), and send to method that
          converts it to a monthly rate

  input: APR rate - float(? tricky part - how will user input this: .0 or .00?)
  output: monthly interest rate - float

  explicit rules: need to accept annual rate, convert to uniform format, and
                  return monthly rate

  implicit rules:

#10/14
Ok, retrying after a day away. maybe wasn't think about this properly
trying to figure out number validation is throwing me off and that isn't a
requirement, so eliminating that for now - can always go back and optimize

P: create mortgage calculator
   4 steps to this process (PEDAC and solve each seperately):
    1. prompt for loan amount (just save data)
    2. prompt for APR and convert to monthly interest rate (method)
    3. prompt for loan duration in years and convert to months (method)
    4. take above outputs and plug into formula for final output (monthly paym.)

# m = p * (j / (1 - (1 + j)**(-n)))
