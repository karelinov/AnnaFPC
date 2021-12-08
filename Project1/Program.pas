program dead_inside;

uses sysutils, Crt; 
var dead_count : integer =1000;
begin
  while dead_count >= 0 do begin 
    dead_count:= dead_count - 7;
    writeln ('dead_count=', dead_count);
  end;
  TextColor(Red);
 writeln ('you died!')   

  

end.

