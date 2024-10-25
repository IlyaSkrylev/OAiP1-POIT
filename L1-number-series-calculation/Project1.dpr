Program lab1;

// The function f(x,n) is given.
// Calculate the value of f(x,n)
// with x belonging from 0.6 to
// 1.1 and n belonging from 10 to 15.

// Determining the type of console program
{$APPTYPE CONSOLE}

// Setting the name of the module.
Uses
  SysUtils;

// Assign constant values to variables.
Const
  nStart=1;
  nFinish=15;
  nOutput=10;
  xStart=0.6;
  xFinish=1.1;
  // nStart, nFinish define the range n.
  // When n is greater than nOutput, f,
  // n, x are calculated.
  // xStart, xFinish defines the range of x.

// Assign certain data types to variables.
Var
  x,f,sum: real;
  n: integer;
  root1, root2, den: real;
  // f is the value of the function.
  // x, n variables of the function f.
  // root1, root2, den, sum - auxiliary variables.

begin

  // Starting an external loop.
  x:=xStart;
  while x<=xFinish do
  begin

    // Resetting variables to start the summation cycle.
    sum:=0;

    // We assign the initial value to the variable n,
    // from which the cycle starts.
    n:=nStart;
    while n<=nFinish do
    begin

      // Calculation of negative variables.
      root1:=exp(ln(abs(sin(n*x)*cos(n*x)))/(3+n));
      root2:=exp(ln(abs(exp(1.2*n*ln(exp(1)))))/n);
      den:=n+ln(exp(ln(n*x)/2));
      sum:=sum+(root1*root2)/den;

      // The loop outputs the value of the function
      // f(x,n) if the condition is true
      If n>=nOutput then
      begin

        // Calculating the value of the function f(x,n).
        f:=(n*exp(-sin(n*x)*ln(exp(1)))/17)*sum;
        writeln('x=',x:3:1,'    n=',n,'    f=',f:3);
      end;

      // If the condition is met, then n is incremented
      // by 1 to calculate other values of the sum.
      n:=n+1;
    end;

    // If the condition is met, then x is incremented
    // by 0.1 to calculate other sum values.
    x:=x+0.1;
  end;

  readln;
end.
