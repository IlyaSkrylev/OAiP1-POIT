Program Lab3;
{
 The program finds the value of a function
 with two precisions and finds the number
 of row elements in each precision.
}

// Determining the type of console program.
{$APPTYPE CONSOLE}

// Setting the name of the module.
Uses
  System.SysUtils;

// Declaration of constant variables.
Const
  XStart = 0.1;
  XFinish = 0.9;
  Eps1 = 1E-5;
  Eps2 = 1E-6;

// Assign certain data types to variables.
Var
  X, Y: real;
  K, A, Denum: integer;
  Num, Delta: real;
  F: boolean;
  {
   X - function variable Y;
   Y - function value;
   K - enumeration of values to calculate
   the value of an intermediate function;
   A - calculation of the factorial in the denominator;
   Den, Num - variables for setting the function;
   Delta - difference of functions at different values;
   F - a logical variable.
  }

begin
  Writeln(' ___________________________________________ ');
  writeln('|     |Eps 1 =', Eps1:0, ' |Eps 2 =', Eps2:0, ' |');
  writeln('|_____|__________________|__________________|');
  writeln('|  X  |      Y     |  N  |      Y     |  N  |');
  writeln('|_____|____________|_____|____________|_____|');

  // Assign the initial value to a variable.
  X := XStart;

  // While X has not reached the final
  // value, the cycle A1 is repeated.
  Repeat
    F := True;
    write('| ', X:3:1, ' |');

    // Counting the numerator, denominator
    // and calculating the function when
    // k is equal to 1.
    Num := X*X*X;
    Denum := 1;
    Y := -Num/Denum;
    Delta := Eps1 + 1;

    // Assigning an initial value
    // to auxiliary variables.
    A := 1;
    K := 2;

    // As long as the difference between the
    // values of the functions is greater than
    // the second precision, cycle A2 is repeated.
    Repeat
      A := A+2;
      Num := Num*X;
      Denum := Denum*(A-1)*A;

      // When raised to an even power of -1,
      // the result of the intermediate
      // function will be positive.
      If K mod 2 = 0 then
        Y := Y + Num/Denum

      // Otherwise, the result will be negative.
      Else
        Y := Y - Num/Denum;

      Delta := Num/Denum;

      // Variable output at first precision.
      If (abs(Delta) <= Eps1) and F then
      begin
        F := False;
        write(' ', Y:9:5, '  |');
        write('  ', K-1, '  |');

      // End of the loop with the output
      // of the first precision.
      end;

      // Increment of the K variable.
      K := K+1;
    Until abs(Delta) < Eps2;

    // Output of variables at the second precision.
    write('  ', Y:9:6, ' |');
    writeln('  ', K-1, '  |');

    // Increment of the X variable.
    X := X+0.1;

  // End of cycle A1.
  Until X > XFinish;

  writeln('|_____|____________|_____|____________|_____|');

  readln;
End.
