unit classexample;

interface

type xxxclass = class  
    field1:integer;
    field2:integer;

    public function f1Andf2:integer;
end;

type xxxrecord = record
    rfield1:integer;
    rfield2:integer;
end;


implementation

function xxxclass.f1Andf2:integer;
begin
  f1Andf2:=self.field1+self.field2;
end;


end.