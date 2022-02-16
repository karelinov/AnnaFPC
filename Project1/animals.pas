{$MODE OBJFPC}
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

  constructor Create; virtual;
  constructor Create (pname : String); 
  procedure say; virtual;
  procedure SetState ( new_state : animal_state );
end;

cat = class (animal)
public
  constructor Create1; 
  procedure say; override;
end;

dog = class (animal)
public
  procedure say; override;
end;


implementation
uses sysutils, name_provider;

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
begin
  inherited Create;
  self.state:=sit;

  if Self is dog then begin
    self.name := name_provider.get_name;
  end
  else begin
     self.name := 'неызвестная жывотная'; 
  end;
 
end;

constructor animal.Create (pname : String);
begin
  Create;

  if pname <> '' then begin
    name := pname;
    Writeln('override default name with '+pname);
  end;  
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

constructor cat.Create1; 
begin
  inherited Create;
  self.name := name_provider.ehe;  
end;

end. 