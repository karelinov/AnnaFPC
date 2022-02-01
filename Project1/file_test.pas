{$H+}
{$codepage utf-8}

unit file_test;

interface
procedure MemoryStream_test(fname:string);
procedure FileStream_test(fname:string);
procedure StringStream_test(fname:string);


implementation
uses
  classes,sysutils;


procedure FileStream_test(fname:string);
var
  fs:TFileStream;
  buffer: array[0..4096] of byte;
  readcount:integer;
  s:string;
  s1:string;
begin
  fs:=TFileStream.Create(fname, fmOpenRead);
  readcount:=fs.Read(buffer,fs.Size);
  s:=TEncoding.UTF8.GetString(buffer,0,readcount);
  s1:=TEncoding.ANSI.GetString(buffer,0,readcount);
  Writeln('размер файла=',readcount);
  Writeln(s);
  Writeln(s1);
end;


procedure MemoryStream_test(fname:string);
var
    ms:TMemoryStream;  
    su:UnicodeString;
    s:string;
begin
    ms:=TMemoryStream.Create();
    ms.LoadFromFile(fname);
    ms.Read(su,ms.Size);
    ms.Free;
    Writeln(su);
    AnsiToUTF8(s);
end;  


procedure StringStream_test(fname:string);
var
    ss:TStringStream;  
begin
    ss:=TStringStream.Create('',TEncoding.UTF8);
    ss.LoadFromFile(fname);
    Writeln(ss.DataString);
    Writeln(ss.UnicodeDataString);
end;  

end.