Program Lab4;
{
 The program finds the numbers of duplicate
 elements with the same value, outputs their
 value, the number of duplicate elements with
 the same value and the maximum value of the
 duplicate elements.
}

// Determining the type of console program.
{$APPTYPE CONSOLE}

// Setting the name of the module.
Uses
  System.SysUtils;

// Assign certain data types to variables.
Var
  Arr: array[1..10] of integer = (5, 5, 8, 6, 8, 3, 5, 6, 5, 9);
  N, Max: integer;
  I, J, K: integer;
  Flag, IsRepetition: boolean;
  {
   N - the number of duplicate elements with
   the same value;
   Max - maximum value of duplicate elements;
   I, J, K - variables for iterating over
   elements in an array;
   Arr - array with type TArray;
   Flag, IsRepetition - logical variables.
  }

Begin
  IsRepetition := True;

  // Cycle A1. Iterating through the array elements.
  For I := 1  to 10 do
  begin

    // Initialization of variables.
    Flag := True;
    N := 1;

    // Cycle A2. Checking for repetitions up
    // to a certain element.
    For J := 1 to (I-1) do

      // If there is a repetition up to a certain
      // element, assigning a false value to a
      // logical variable so that the value is
      // not compared in the future.
      If (Arr[I] = Arr[I-J]) then
        Flag := False;

    // If there is no repetition, we enter the
    // loop to search for duplicate elements
    // after this element.
    If Flag then
    begin

      // Cycle A3. Iterating through the auxiliary
      // variable to find duplicate elements.
      For K := 1  to 9 do
      begin

        // If there is a repeating element, the
        // branching operator is entered.
        If (Arr[I] = Arr[I+K]) and (I+K <= 10) then
        begin

          // Increasing the value of the number of
          // duplicate elements with the same value.
          N:=N+1;

          // Output the number of an element with
          // a duplicate value.
          If Flag then
          begin
            write(I, '-й');
            Flag := False;
          end;
          write(', ', I+K, '-й');
        end;

      // End of cycle A3.
      end;
    end;

    // Output of required variables.
    If (N>1) then
    begin
      writeln(' элементы имеют одинаковое значение.');
      writeln(Arr[I],' - значение повтор€ющихс€ элементов.');
      writeln(N, ' - количество элементов с одинаковым значением.');
      writeln('________________________________________________');
      writeln;
      IsRepetition := False;

      // Search for the maximum value from
      // duplicate elements.
      If Max < Arr[I] then
        Max := Arr[I];
    end;

  // End of cycle A1.
  end;

  // If no duplicate elements are found,
  // then enter the branching operator.
  If IsRepetition then
    writeln('ѕовтор€ющихс€ элементов не найдено.')

  // Otherwise, an additional value of
  // the variable is output.
  Else
    writeln(Max, ' - значение максимального повтор€ющегос€ элемента.');

  readln;
End.
