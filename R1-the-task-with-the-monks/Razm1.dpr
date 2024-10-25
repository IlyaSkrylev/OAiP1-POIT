Program Razm1;
{
 The program is designed to count the number of
 monks in different groups with a given total
 number of monks and pies and the number of pies
 eaten by a separate group of monks.
}

// Determining the type of console program.
{$APPTYPE CONSOLE}

{$R *.res}

// Setting the name of the module.
Uses
  System.SysUtils;

// Assign certain data types to variables.
Var
  mon,ved, prost, uch: integer;
  pir, pirV, pirP, pirU: real;
  p1, p2, p3, p4: real;
  F:boolean;
  // mon, ved, prost, uch - determine the number
  // of monks according to the meaning.
  // pir, pirV, pirP, pirU - determine the number
  // of pies according to the meaning.
  // p1, p2, p3, p4 - auxiliary variables .

begin

  // Request to enter the values of the main
  // variables and check for correctness.
  repeat
    try
      write('Введите количество монахов: ');
      readln(mon);
      write('Введите количество пирогов: ');
      readln(pir);
      write('Введите кол-во пирогов для ведущих монахов: ');
      readln(pirV);
      write('Введите кол-во пирогов для простых монахов: ');
      readln(pirP);
      write('Введите кол-во пирогов для учеников: ');
      readln(pirU);

      // If the user enters negative numbers, the cycle
      // repeats until the user enters the correct data.
      while ((mon<0) or (pir<0) or (pirV<0) or (pirP<0) or (pirU<0)) do
        begin
          writeln('___________________________________________________');
          writeln;
          writeln('Поле ввода предназначено для неотрицательных чисел');
          writeln('___________________________________________________');
          writeln;
          write('Введите количество монахов: ');
          readln(mon);
          write('Введите количество пирогов: ');
          readln(pir);
          write('Введите кол-во пирогов для ведущих монахов: ');
          readln(pirV);
          write('Введите кол-во пирогов для простых монахов: ');
          readln(pirP);
          write('Введите кол-во пирогов для учеников: ');
          readln(pirU);

        // If the data entered is correct,
        // the cycle ends.
        end;

        // Except for repetition.
      F:=true;
      except
        writeln('___________________________________');
        writeln;
        writeln('Вы ввели некорректные данные!');
        writeln('Для подсчета требуется ввод чисел!');
        writeln('___________________________________');
        writeln;

        // Transition to repetition.
        F:=false;
    end;
  until F;

  // Counting auxiliary variables.
  p1:=pirV-pirU;
  p2:=pirP-pirU;
  p3:=pir-mon*pirU;

  // Finding the number of leading Monks.
  for ved:=0 to round(p3/p1) do
  Begin
    p4:=(p3-ved*p1)/p2;

    // Checking for the integer
    // value of the leading monks.
    if round(p4)=p4 then
    begin

      // Number of simple monks.
      prost:=round(p4);

      // Number of students.
      uch:=mon-(ved+prost);

      // The output of the received
      // number in each group of monks.
      if (ved>=0) and (prost>=0) and (uch>=0) then
      begin
        writeln('___________________________________');
        writeln;
        writeln('Количество ведущих монахов: ', ved);
        writeln('Количество простых монахов: ', prost);
        writeln('Количество учеников: ', uch);
        F:=false;
      end;
    // The end of the cycle with the finding of
    // students and the output of the number of
    // monks in different groups.
    end;

  // The end of the cycle with the selection of
  // leading monks and finding simple monks.
  end;

  // If the calculation is not possible,
  // then the following line is output.
  If F then
  begin
    writeln('_______________________________________________');
    writeln;
    writeln('При введенных данных комбинаций не существует.');
    writeln('_______________________________________________');
    writeln;
  end;

  readln;
end.
