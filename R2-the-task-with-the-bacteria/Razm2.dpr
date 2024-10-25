Program Razm2;

// The program finds the number of red and green
// bacteria after reproduction for the number of
// cycles entered by the user.

// Determining the type of console program.
{$APPTYPE CONSOLE}

{$R *.res}

// Setting the name of the module.
uses
  System.SysUtils;

// Assign certain data types to variables.
Var
z, k, t: integer;
// Input of the main variables.
n, i: integer;
// Input of auxiliary variables.
F: boolean;
// Input of auxiliary variables.

begin
  repeat

    // Request to enter the values of the main
    // variables and check for correctness
    try
      write('Введите изначальное количество зеленых бактерий: ');
      readln(z);
      write('Введите изначальное количество красных бактерий: ');
      readln(k);
      write('Введите количество тактов времени: ');
      readln(t);

      // If the user enters negative values, a
      // loop is started in which he is asked
      // to enter new data. The cycle repeats
      // until the user enters the correct data.
      while ((z<0) and (k<0) and (t<0)) do
      begin
        write('Введите изначальное количество зеленых бактерий: ');
        readln(z);
        write('Введите изначальное количество красных бактерий: ');
        readln(k);
        write('Введите количество тактов времени: ');
        readln(t);

      // When the user re-enters the
      // correct data, the cycle ends.
      end;

      // Except for repetition
      F:=true;
      except
        writeln('____________________________________');
        writeln(' ');
        writeln('Вы ввели некорректные данные');
        writeln('____________________________________');
        writeln(' ');

      // Transition to repetition
      F:=false;
    end;
  until F;

  i:=1;

  // Starting the cycle, to iterate through the
  // clock cycles and count the number of bacteria.
  while i<=t do
  begin

    // Counting bacteria in 1 clock cycle.
    z:=k+z;
    k:=z-k;

    // Checking for counting overflow, if theэ
    // variables have started to take negative
    // values, then the variable counting cycle
    // starts on the previous clock cycle.
    if (z<0) or (k<0) or (z+k<0) then
    begin
      t:=i-1;

      // Counting variables on the previous clock cycle.
      k:=z-k;
      z:=z-k;
      F:=false;

    // The end of the cycle with the counting
    //of variables on the previous clock cycle.
    end;
    i:=i+1;


  // The end of the cycle with the count of
  // red and green bacteria from 1 to t.
  end;

  // Output of the values of the calculated variables.
  writeln('________________________________________');
  writeln(' ');

  // When an overflow occurs, the output
  // of a line that shows the clock cycle
  // at which the overflow occurred.
  if not F then
    writeln('При введенном количестве бактерий подсчет возможен только до ', t, '-го такта.');
  writeln('После ', t ,' такотов вышло:');
  writeln('1) ', z ,' зеленых бактерий;');
  writeln('2) ', k ,' красных бактерий.');
  writeln('Общее число бактерий: ', (k+z));

  readln;
end.

