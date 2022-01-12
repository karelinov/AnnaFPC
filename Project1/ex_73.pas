{$codepage utf-8}

program ex_73;
var 
i : integer; a : array [1..10] of integer;
begin
  for i := 1 to 10 do begin
  a[i] := i*i-5;
  writeln (' a[i] = ', a[i]) 
  end;
 writeln ('Ответ=',a[1] + a[6]);

end.