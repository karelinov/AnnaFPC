{$codepage utf-8}
{$H+}
program file_test;
var 
  f: TextFile; 
  s: string;
begin
AssignFile(f, 'C:\Users\Anna\Desktop\file_test.txt', 65001);
//Rewrite (f);
// Append (f);
// writeln (f, 'труляля');
Reset(f);

repeat 
  Readln (f, s);
  Writeln (s, EOF(f));
until EOF(f); 
Flush();
Close (f);

end.