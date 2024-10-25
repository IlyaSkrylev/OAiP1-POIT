Program lab2;
{
 The program finds the values and the number
 of numbers in the interval from A to N, which,
 when the sum of the products of the digits
 of the number (do a similar situation until
 the calculations give 1 or 4), give 1.
}

// Determining the type of console program.
{$APPTYPE CONSOLE}

{$R *.res}

// Setting the name of the module.
Uses
  System.SysUtils;

// Assign certain data types to variables.
Var
  N, A: integer;
  Sum, K, F, I: integer;
  Kol: integer;
  Z: boolean;
  {
   N, A are variables for entering the interval.
   Sum, K, F, I are variables for finding
   the required numbers in a given interval.
   Kol is a variable for finding the number
   of given numbers.
   Z is an auxiliary variable.
  }

Begin

  // Request to enter the values of the main
  // variables and check for correctness.
  Repeat
    Try
      write('¬ведите начальное значение промежутка (не менее 1): ');
      readln(A);
      write('¬ведите конечное значение промежутка (не более 30000): ');
      readln(N);
      writeln('______________________________________________________________');
      writeln;

      // While the user enters incorrect data,
      // the program requests the correct
      // input of the interval value.
      While (A < 1) or (N > 30000) or (A > N) do
      begin
        writeln('ѕромежуток должен быть в пределах от 1 до 30000!');
        writeln(' онечное значение промежутка должно быть больше начального!');
        writeln('____________________________________________________________');
        writeln;
        write('¬ведите начальное значение промежутка (не менее 1): ');
        readln(A);
        write('¬ведите конечное значение промежутка (не более 30000): ');
        readln(N);

      // If the data entered is correct,
      // the cycle ends.
      end;

      // Except for repetition.
      Z:=True;
    Except
      writeln('____________________________________________________________');
      writeln;
      writeln('¬ведены некорректные данные!');
      writeln('____________________________________________________________');
      writeln;

      // Transition to repetition.
      Z:=False;
    End;
  Until Z;

  Kol:=0;
  I := A;
  // Starting a loop to find the required
  // numbers in the interval from A to N.
  While I <= N do
  begin

    // Reset variables for further counting.
    K:=I;
    F:=0;
    Sum:=0;

    // As long as K is positive , the cycle
    // of counting the sum of the products of
    // the digits of the number I is performed .
    While (K > 0) do
    begin

      // Calculating the sum of the products
      // of the digits of the number I.
      F := K mod 10;
      Sum := Sum + F * F;
      K := K div 10;

      // If K has reached 0, but the sum is not
      // equal to 1 or 4, then the variables
      // are reset to repeat the cycle.
      If (K = 0) and (Sum <> 1) and (Sum <> 4) then
      begin

        // Reset variables to repeat the loop.
        K := Sum;
        Sum := 0;

      // The end of the loop with the reset of variables.
      end;

    // The end of the cycle with the calcula-
    // tion of the sum of the products of
    // the digits of the number I.
    end;

    // A loop to output the required number
    // and find the number of such numbers.
    If Sum = 1 then
    begin
      writeln('Ќайдено число: ', I);
      Kol := Kol + 1;

    // The end of the cycle with the
    // output of the required numbers.
    end;

    I := I + 1;

  // The end of the cycle with
  // finding the required numbers.
  end;

  // Output the number of required numbers.
  writeln(' оличество найденных чисел на заданном промежутке: ', Kol);

  readln;
End.
