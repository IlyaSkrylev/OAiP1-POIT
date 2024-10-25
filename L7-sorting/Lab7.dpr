Program Lab7;
{
 The program sorts the matrix according to the
 following principle: the elements of each row
 are sorted in descending order, and the rows
 are sorted in ascending order by the elements
 of the first column.
}

// Determining the type of console program.
{$APPTYPE CONSOLE}

// Setting the name of the module.
Uses
  System.SysUtils;

// Set the number of rows and columns in the matrix.
Const
  N=5;

// Assign certain data types to variables.
Var
  X: array[1..N,1..N] of integer;
  I, J, K: integer;
  IndMax, IndMin, Tmp: integer;
  {
   X: stores the elements of the matrix;
   I, J, K: for the For loop;
   IndMax, IndMin: temporary minimum and maximum values of elements;
   Tmp: auxiliary variable.
  }

Begin
  writeln('   Начальная матрица: ');

  // Set the elements of the matrix.
  For I := 1 to N do
  begin
    For J := 1 to N do
    begin
      Randomize;
      X[i,j]:=random(10);
      write(X[I,J]:3);
    end;
    writeln;
  end;
  writeln;

  // Cycle A1. Iterating over matrix rows.
  For I :=1 to N do
  begin

    // Cycle A2. Enumeration of elements in matrix rows.
    For J := 1 to N-1 do
    begin
      IndMax := J;

      // Cycle A3. Finding the maximum element in a string.
      For K := J + 1 to N do
      begin
        If X[I,K] > X[I,IndMax] then
          IndMax := K;

      // End of cycle A3.
      end;
      Tmp := X[I,J];
      X[I,J] := X[I,IndMax];
      X[I,IndMax] := Tmp;

    // End of cycle A2.
    end;

  // End of cycle A1.
  end;

  // Cycle A4. Iterating over matrix rows.
  For I := 1 to N-1 do
  begin
    IndMin := I;

    // Cycle A5. Search for minimal elements.
    For J := I+1 to N do
    begin
      If X[J,1] < X[IndMin,1] then
        IndMin := J;

    // End of cycle A5.
    end;

    // Cycle A6. Rearrange elements between lines.
    For K := 1 to N do
    begin
      Tmp := X[I,K];
      X[I,K] := X[IndMin,K];
      X[IndMin,K] := Tmp;

    // End of cycle A6.
    end;

  // End of cycle A4.
  end;

  writeln('   Отсортированная матрица: ');

  // Output of a sorted matrix.
  For I := 1 to N do
  begin
    For J := 1 to N do
      write(X[I,J]:3);
    writeln;
  end;

  readln;
End.
