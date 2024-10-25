Program Razm5;
{
 The program determines the difference
 between two numbers in the number systems
 from 2 to 32, each number can have up
 to 50 digits.
}

// Determining the type of console program.
{$APPTYPE CONSOLE}

// Setting the name of the module.
uses
  System.SysUtils;

// Description of constant variables.
Const
  N = 51;

// Assign certain data types to variables.
Var
  A, B, C: Array[1..N] of Int64;
  Sa, Sb, Sc, Tmp: string;
  I, J, NumSystem, x: integer;
  Flag, Minus: Boolean;
  {
   A, B, C - array of digits of numbers;
   Sa, Sb, Sc - numbers as a string;
   I, J - auxiliary variables;
   Tmp - to exchange numbers;
   NumSystem - to enter the number system;
   Flag - logical variable.
   Minus - determining the sign of a number.
  }

begin
  x := 0;
  repeat
  // Request to enter the values of the main
  // variables and check for correctness.
  Repeat
      writeln('Введите систему счисления, в которой');
      write('хотите посчитать разность двух чисел: ');
      readln(NumSystem);

      // If the number system is entered incorrectly,
      // the user is prompted to enter a new one.
      while (NumSystem < 2) or (NumSystem > 32) do
      begin
        writeln('_________________________________');
        writeln;
        writeln('Выберите систему счисления от 2-чной до 32-чной!');
        writeln('Введите систему счисления, в которой');
        write('хотите посчитать разность двух чисел: ');
        readln(NumSystem);
      end;

      writeln('Введите первое число:');
      readln(Sa);
      writeln('Введите второе число:');
      readln(Sb);


      // In case of excessive input of digits in the
      // number, the user is prompted to enter new ones.
      while (Length(Sa) > 50) or (Length(Sb) > 50) do
      begin
        writeln;
        writeln('Количество цифр в числе не должно превышать 50!');
        writeln('Введите первое число:');
        readln(Sa);
        writeln('Введите второе число:');
        readln(Sb);
      end;

      // If the second number is greater than the first, then swap them and add a minus to the final number.
      Minus := False;
      If Length(Sb) > Length(Sa) then
      begin
        Tmp := Sa;
        Sa := Sb;
        Sb := Tmp;
        Minus := True;
      end;

      // If the lengths are the same, then
      // check which number is greater.
      If Length(Sa) = Length(Sb) then
      begin
        Flag := True;
        I := 1;

        // Checking which number is greater.
        While (I <= Length(Sa)) and Flag do
        begin

          // If the second number is greater than
          // the first, then put a minus before
          // the final number.
          If Ord(Sb[I]) > Ord(Sa[I]) then
            Minus := True;

          if Ord(Sb[I]) = Ord(Sa[I]) then
            Inc(I)
          else
            Flag := False;
        end;

        // If the second number is greater
        // than the first, then swap them.
        If Minus then
        begin
          Tmp := Sa;
          Sa := Sb;
          Sb := Tmp;
        end;
      end;

      Sa := UpperCase(Sa);
      Sb := UpperCase(Sb);
      Flag := True;

      // Converting a string of the first number
      // into an array of digits.
      J := N;
      For I := Length(Sa) downto 1 do
      begin

        // Converting digits to a number for an array.
        If Sa[I] in ['0'..'9'] then
          A[J] := StrToInt(Sa[I]);

        // Translating letters into array numbers.
        If Sa[I] in ['A'..'V'] then
          A[J] := ord(Sa[I]) - 55;

        If ((Ord(Sa[I]) < 48) or (Ord(Sa[I]) > 57)) and ((Ord(Sa[I]) < 65) or (Ord(Sa[I]) > 86)) then
          Flag := False;

        // If the value of the number does not fit
        // the entered number system, then offer
        // to re-enter the numbers.
        If A[J] >= NumSystem then
          Flag := False;

        J := J - 1;
      end;

      // Converting a string of the second number
      // into an array of digits.
      J := N;
      For I := Length(Sb) downto 1 do
      begin

        // Converting digits to a number for an array.
        If Sb[I] in ['0'..'9'] then
          B[J] := StrToInt(Sb[I]);

        // Translating letters into array numbers.
        If Sb[I] in ['A'..'V'] then
          B[J] := ord(Sb[I]) - 55;

        If ((Ord(Sb[I]) < 48) or (Ord(Sb[I]) > 57)) and ((Ord(Sb[I]) < 65) or (Ord(Sb[I]) > 86)) then
          Flag := False;

        // If the value of the number does not fit the
        // entered number system, then offer to
        // re-enter the numbers.
        If B[J] >= NumSystem then
          Flag := False;

        J := J - 1;
      end;

      // If the entered numbers do not belong to the
      // number system, the following warning is displayed.
      if Flag = False then
      begin
        writeln;
        writeln('Введенные числа не соответствуют');
        writeln('данной системе счисления!');
        writeln('Либо введены неподходящие знаки!');
        writeln;
      end
      else
        Flag := True;
  Until Flag;

  // Finding the difference of the entered numbers.
  J := 0;
  For I := N downto 1 do
  begin
    C[I] := A[I] - B[I] - J;

    // If the difference between two numbers
    // is less than 0, then take a certain
    // value from the element in front of the data.
    if (C[I] < 0) then
    begin
      C[I] := NumSystem + A[I] - B[I] - J;
      J := 1;
    end
    else
      J := 0;
  end;

  writeln('Разность введенных чисел равна:');
  if Minus then
    Sc := '-'
  else
    Sc := '';

  Flag := False;

  // We remove all zeros before the number.
  for I := 1 to N do
    if (C[I] <> 0) or Flag then
    begin

      // Translating numbers into a string.
      if C[I] in [0..9] then
        Sc := Sc + IntToStr(C[I]);

      // Translating numbers into a string.
      if C[I] in [10..31] then
        Sc := Sc + chr(C[I] + 55);

      Flag := True;
    end;

  if Length(Sc) = 0 then
    Sc := '0';
  writeln(Sc);
  until x =1;
  readln;
End.
