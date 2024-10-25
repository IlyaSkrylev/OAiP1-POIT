Program Lab6;
{
 The program is designed to determine the
 day ofthe week on which the date entered
 by the user falls.
}

// Determining the type of console program.
{$APPTYPE CONSOLE}

// Setting the name of the module.
Uses
  System.SysUtils;

// Description of additional types.
Type
  TWeek = (Mon, Tue, Wed, Thu, Fri, Sat, Sun);

// Assign certain data types to variables.
Var
  S, S1: String[17];
  Week: TWeek;
  Day: array[1..12] of integer = (31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
  Month: array[1..12] of string = ('января', 'февраля', 'марта', 'апреля', 'мая', 'июня', 'июля', 'августа', 'сентября', 'октября', 'ноября', 'декабря');
  D, M, Y: integer;
  I, J, K: integer;
  Flag: Boolean;
  {
   S, S1 - main and additional lines;
   Week - defines the day of the week;
   Day - determines the number of days in a month;
   Month - defines the month;
   D, M, Y - date numeric value;
   I, J, K - for the For loop;
   Flag - a logical variable.
  }

Begin

  // Request to enter the values of the main
  // variables and check for correctness.
  Repeat
    Try

      // Determining the correct date entry.
      Repeat
        Flag:= True;
        write('Введите дату: ');
        Readln(S);

        // Convert the entered string to a number.
        I:=1;
        Repeat
          I := I+1;
        Until (S[I] = '.') or (S[I]=' ');
        S1:=S;
        Delete(S1, I, 14);
        Delete(S, 1, I);
        D := StrToInt(S1);

        // Translation of the entered string per month.
        I:=1;
        Repeat
          I := I+1;
        Until (S[I] = '.') or (S[I]=' ');
        S1:=S;
        Delete(S1, I, 10);

        // Finding the month by date.
        if s[i]='.' then
        begin
          Delete(S1, I, 10);
          M := StrToInt(S1);
        end;

        // Finding the month by word.
        if s[i]=' ' then
        begin
          Delete(S1, I, 10);
          for J := 1 to 12 do
            if Month[J]=S1 then
              M := J;
        end;
        Delete(S, 1, I);

        //Translation of the entered string into a year.
        Y := StrToInt(S);

        // If you enter incorrectly, you must repeat the entry.
        If (D < 1) or (D > 31) then
        begin
          writeln('День может быть в пределах от 1 до 31!');
          Flag := False;
        end;

        // If you enter incorrectly, you must repeat the entry.
        If (M < 1) or (M > 12) then
        begin
          writeln('Месяц может быть в пределах от 1 до 12!');
          writeln('Либо проверьте правильность ввода названия месяца!');
          Flag := False;
        end;

        // If you enter incorrectly, you must repeat the entry.
        If Y < 1 then
        begin
          writeln('День недели не определяется до нашей эры!');
          Flag := False;
        end;

        // If you enter incorrectly, you must repeat the entry.
        If Y > 10000 then
        begin
          writeln('Год может быть в пределах от 1 до 10.000!');
          Flag := False;
        end;

        If not Flag then
          writeln;
      Until Flag;

      // Except for repetition.
      Flag := True;
    Except
      writeln('____________________________________');
      writeln;
      writeln('Вы ввели некорректные данные!');
      writeln('____________________________________');
      writeln;

      // Transition to repetition.
      Flag := False;
    End;
  Until Flag;

  Week := Mon;
  // Cycle A1. Iteration of the date by years before the entered one.
  For I := 1 to Y do
  begin

    // Search for a leap year.
    If (I mod 4 = 0) then
      Day[2] := 29
    else
      Day[2] := 28;
    If I mod 100 = 0 then
      Day[2] := 28;
    If I mod 400 = 0 then
      Day[2] := 29;

    // Cycle A2. Iteration of the date by months before the entered one.
    For J := 1 to 12 do
    begin

      // Cycle A3. Iteration of the date by days before the entered one.
      For K := 1 to Day[J] do
      begin

        // When an entered date is found, display the day of the week on which this date falls.
        If (I=Y) and (J=M) and (K=D) then
        begin
          write('Введенная дата выпадает на ');

          // Specifies the day of the week on which the entered date falls.
          Case week of
            Mon: write('понедельник.');
            Tue: write('вторник.');
            Wed: write('среду.');
            Thu: write('четверг.');
            Fri: write('пятницу.');
            Sat: write('субботу.');
            Sun: write('воскресенье.');
          end;

          // When entering the loop, no further warning will be displayed.
          Flag := False;
        end;

        // Move to the next day of the week.
        If Week = Sun then
          Week := Mon
        else
          Week := Succ(Week);

      // End of cycle A3.
      end;

    // End of cycle A2.
    end;

  // End of cycle A1.
  end;

  // If a certain day is missing in the month, then display a warning about this.
  If Flag then
  begin
    Case M of
      2:
        If Day[2]= 28 then
          writeln('В этом году в феврале 28 дней!')
        else
          writeln('В этом году в феврале 29 дней!');
      4: writeln('В апреле 30 дней!');
      6: writeln('В июне 30 дней!');
      9: writeln('В сентябре 30 дней!');
      11: writeln('В ноябре 30 дней!');
    end;
  end;

  readln;
End.
