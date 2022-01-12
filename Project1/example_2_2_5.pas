{$codepage utf-8}

program example_2_2_5;
const
 n = 15;
var
 s:integer;
 i:integer;
 a: array[1..n] of integer;
begin
randomize;
for i:=1 to n do begin
    a[i]:=random(100);
    Writeln('a[', i, ']=',a[i]);
end;    

s:=0;
for i:=1 to n do 
 if (a[i]>50) and (a[i]<60) then
   s:=s+a[i]; 
Writeln(' сумма=',s);
end.