program n_27;
const 
  n=8;
var
  i: Integer;
  j: Integer;
  x: Integer;
  imax: Integer;
const 
  a: array[1..8] of Integer = (0, 1, 9, 2, 4, 3, 6, 5);
begin 
  for i:=1 to n-1 do begin
    imax:=i;
    for j:=i+1 to n do if a[j]>a[imax] then imax:=j;
    x:=a[i];
    a[i]:=a[imax];
    a[imax]:=x;
  end;

  for i:=1 to n do
    begin
      WriteLn ('a[', i, ']=', a[i])
    end;
      
end.