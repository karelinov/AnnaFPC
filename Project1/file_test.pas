{$H+}
{$codepage utf-8}

unit file_test;

interface
procedure MemoryStream_test(fname:string);
procedure FileStream_test(fname:string);


implementation
uses
  classes,sysutils;


procedure FileStream_test(fname:string);
var
  fs:TFileStream;
  buffer: array[0..4096] of byte;
  buffer1: array of byte;
  readcount:integer;
  s:string;
begin
  fs:=TFileStream.Create(fname, fmOpenRead);
  readcount:=fs.Read(buffer,fs.Size);
  s:=TEncoding.UTF8.GetString(buffer,0,readcount);
  Writeln(s);
end;


procedure MemoryStream_test(fname:string);
var
    Instream:TFilestream;  
    ms:TMemoryStream;  
    su:UnicodeString;
    s:string;
begin
    ms:=TMemoryStream.Create();
    ms.LoadFromFile(fname);
    ms.Read(su,ms.Size);
    Writeln(su);

    instream := TFilestream.Create(fname, fmOpenRead);    
    instream.Read(s,instream.Size);
    Writeln(instream.Size);
    Writeln(Length(s));
    Writeln(AnsiToUTF8(s));
    instream.Free;
end;    

end.