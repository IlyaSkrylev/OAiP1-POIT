Program Razm3;
{
 The program is designed to find a more eco-
 nomical purchase of floppy disks specified
 by the user and the amount of rubles
 saved thanks to this set.
}

// Determining the type of console program.
{$APPTYPE CONSOLE}

{$R *.res}

// Setting the name of the module.
Uses
  System.SysUtils;

// Assign certain data types to variables.
Var
  N, Ak, Aj: integer;
  D, K, J: real;
  P1, P2, P3: real;
  F: boolean;
  {
   N, AK, AJ - the number of floppy disks.
   D, K, J - the cost of floppy disks.
   P1, P2, P3 - auxiliary variables.
   F - a logical variable.
  }

Begin

  // Request to enter the values of the main
  // variables and check for correctness.
  Repeat
    Try

      // The user enters the value of the cost
      // of floppy disks in different quantities
      // and the required number of floppy disks.
      write('������� ��������� ����� ������� (� ������): ');
      read(D);
      write('������� ��������� ����� ������� (� ������): ');
      read(K);
      write('������� ��������� ������ ����� (� ������): ');
      read(J);
      write('������� ������ ���������� ��� ������: ');
      read(N);

      // If non-positive or illogical data is
      // entered, the user is prompted to
      // enter new data.
      While ((D<=0) or (K<=0) or (J<=0) or (N<0) or (K<D) or (J<K)) do
      begin
        writeln('________________________________________');
        writeln;
        writeln('���� ����� ������������� ��� ������������� �����!');
        writeln('��������� ������ ������ ���� ������ ��������� ������� � ���������!');
        writeln('��������� ������� � ��������� ������ ���� ������ ��������� ����� � ���������!');
        writeln('________________________________________');
        writeln;
        write('������� ��������� ����� ������� (� ������): ');
        read(D);
        write('������� ��������� ����� ������� (� ������): ');
        read(K);
        write('������� ��������� ������ ����� (� ������): ');
        read(J);
        write('������� ������ ���������� ��� ������: ');
        read(N);

      // If the correct data is
      // entered, the cycle ends.
      end;

      // Except for repetition.
      F := True;
    Except
      writeln('________________________________________');
      writeln(' ');
      writeln('�� ����� ������������ ������');
      writeln('________________________________________');
      writeln(' ');

      // Transition to repetition.
      F := False;
    End;
  Until F;

  // Finding and displaying the cost of
  // floppy disks, if bought separately.
  P1 := N * D;
  writeln('____________________________________________');
  writeln;
  writeln('��� ������� ������ �� ������������ ����������� ' + floattostr (P1) + ' ������.');

  // Counting the number of boxes and boxes
  // that will be purchased if it is profitable
  // to buy a certain number of floppy
  // disks with a box or a box.
  Aj := N div 144;
  N := N mod 144;
  Ak := N div 12;
  N := N mod 12;
  readln;

  // If the cost of several floppy disks is more
  // than the cost of a box of floppy disks,
  // then it is more profitable to buy a box.
  if N*D >= K then
  begin
    N := 0;
    Ak := Ak + 1;
  end;

  // If the cost of several boxes is more than
  // the cost of a box with floppy disks, then
  // it is more profitable to buy a box.
  if Ak*K >= J then
  begin
    K := 0;
    N := 0;
    Aj := Aj + 1;
  end;

  // Counting auxiliary variables to
  // output more economical results.
  P2 := Aj*J + Ak*K + N*D;
  P3 := Aj*144 + Ak*12 + N;

  // Output of a more economical
  // set of floppy disk purchases.
  writeln('��� �������� ����� ������: ');
  writeln('���������� ������: ', Aj);
  writeln('���������� �������: ', Ak);
  writeln('���������� ������: ', N);
  writeln('___________________________________________');
  writeln;

  // Output of auxiliary variables
  // for a more detailed description
  // of the money saved.
  writeln('��������� ������ ������ ��������: ' + floattostr (P2) + ' ���.');
  writeln('���������� ������, ������� ����� ������� � �������: ' + floattostr (P3) + '.');
  writeln('��� ������� ������ ������ �������� ��������: ' + floattostr (P1-P2) + ' ���.');

  readln;
end.
