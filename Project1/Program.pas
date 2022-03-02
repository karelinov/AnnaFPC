{$MODE OBJFPC}
{$H+}
{$codepage utf-8}

program Program1;

uses xxx, sysutils, animals, name_provider;
var 
  i : Integer;
  animal_list: array of animals.animal;

begin

  Randomize;
  SetLength (animal_list, Length(animal_list) +1);
  animal_list [Length(animal_list) -1] :=  dog.Create('Шарик');
  SetLength (animal_list, Length(animal_list) +1);
  animal_list [Length(animal_list) -1] :=  cat.Create('Маньяк');
  SetLength (animal_list, Length(animal_list) +1);
  animal_list [Length(animal_list) -1] :=  cat.Create('Евдоким');
  SetLength (animal_list, Length(animal_list) +1);
  animal_list [Length(animal_list) -1] :=  cat.Create1;
  SetLength (animal_list, Length(animal_list) +1);
  animal_list [Length(animal_list) -1] :=  cat.Create1;
  SetLength (animal_list, Length(animal_list) +1);
  animal_list [Length(animal_list) -1] :=  cat.Create1;
  SetLength (animal_list, Length(animal_list) +1);
  animal_list [Length(animal_list) -1] :=  dog.Create;
  SetLength (animal_list, Length(animal_list) +1);
  animal_list [Length(animal_list) -1] :=  dog.Create;
  SetLength (animal_list, Length(animal_list) +1);
  animal_list [Length(animal_list) -1] :=  dog.Create;
  SetLength (animal_list, Length(animal_list) +1);
  animal_list [Length(animal_list) -1] :=  dog.Create;
  SetLength (animal_list, Length(animal_list) +1);
  animal_list [Length(animal_list) -1] :=  dog.Create;
  SetLength (animal_list, Length(animal_list) +1);        
  animal_list [Length(animal_list) -1] :=  dog.Create;

  for i := 0 to Length(animal_list) -1 do begin
    animal_list[i].say;
  end;

   for i := 0 to Length(animal_list) -1 do begin
    if animal_list[i] is cat then begin
      animal_list[i].SetState (animal_state.sleep);
    end;
    if animal_list[i] is dog then begin
      animal_list[i].SetState (animal_state.lie);
    end;
  end;

  WriteLn;
  for i := 0 to Length(animal_list) -1 do begin
    animal_list[i].say;
  end;
 
end.

