{$H+}
{$codepage utf-8}

unit animals;

interface

type 

animal_state = (sit, lie, sleep);

animal = class
public
  state : animal_state;
  name: String;

  constructor Create;
  constructor Create (pname : String);
  procedure say; virtual;
  procedure SetState ( new_state : animal_state );
end;

cat = class (animal)
public
  procedure say; override;
end;

dog = class (animal)
public
  procedure say; override;
end;


implementation
uses sysutils;
var
 usednumbers: array of integer;


procedure animal.say; 
var
 statestr: string;
begin
  case state of 
    animal_state.sit: statestr:=  ': сижу ';
    animal_state.lie: statestr:=  ': лежу ';
    animal_state.sleep: statestr:=': хрю хрю ';
  end;

  write  (ClassName + ' ' + name + ' says '); 
  write  (' что делаю: ', statestr );
end;

constructor animal.Create;
var
 n: integer;
 i: integer;
 already_used : boolean;
begin
  self.state:=sit;

  if Self is dog then begin
    repeat
      Writeln('Stepped into repeat');
      Writeln('usednumbers length='+IntToStr(Length(usednumbers)));
    
      n:= Random(10);
      Writeln('Generated '+IntToStr(n));

      already_used:= false;
      for i:= 0 to Length(usednumbers)-1 do begin
        Writeln('check usednumbers[i] ='+IntToStr(usednumbers[i])+ 'n='+ IntToStr(n));
        if usednumbers[i] = n then 
          already_used:= true;
          break;
      end;
      Writeln('already_used ='+booltoStr(already_used));

    until not already_used;
    SetLength(usednumbers, Length(usednumbers) +1);
    usednumbers[Length(usednumbers) -1] := n;
    

    self.name := 'Бобик_' + IntToStr(n);
    Writeln('generated name  ='+self.name);
  end
  else begin
     self.name := 'неызвестная жывотная'; 
  end;
 
end;

constructor animal.Create (pname : String);
begin
  Create;

  if pname <> '' then
    name := pname;
end;


procedure cat.say; 
begin
  Inherited;
  WriteLn(' кукареку! ');
end;

procedure dog.say; 
begin
  Inherited;
  writeln('Гав!!!');
end;

procedure animal.SetState ( new_state : animal_state );
begin
  self.state:=new_state;
end;
end. 