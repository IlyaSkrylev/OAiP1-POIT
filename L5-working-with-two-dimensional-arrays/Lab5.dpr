Program Lab5;
{
 The program displays random values of matrix elements.
}

// Determining the type of console program.
{$APPTYPE CONSOLE}

// Setting the name of the module.
Uses
  System.SysUtils;

// Set the number of rows and columns in the matrix.
Const
  N = 10;

// Define an additional type for variables.
Type
  TArray = Array[1..N,1..N] of integer;

// Assign certain data types to variables.
Var
  X: TArray;
  I, J: integer;

begin
  writeln('Матрица: ');
  randomize;

  // Loop A1 to iterate over the rows of the matrix.
  for I := 1 to N do
  begin
    // Loop A2 to iterate over the elements in the rows.
    for J := 1 to N do
    begin
      X[I,J] := Random(10);
      write(X[I,J], ' ');

    // End of cycle A2.
    end;
    writeln;

  // End of cycle A1.
  end;
  readln;
end.
