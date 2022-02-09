{$MODE OBJFPC}
{$H+}
{$codepage utf-8}


unit name_provider;
interface
function get_name : String;
implementation
uses fphttpclient,sysutils, classes;

function get_name : String;

var 
  http_client : TFPHttpClient;
  name_result : string;
  s: UTF8String;
  inputStream: TMemoryStream;
  buffer: array[0..4096] of byte;
  readcount:integer;
begin
  http_client := TFPHttpClient.Create(Nil);
  inputStream:=TMemoryStream.Create();
  http_client.get('http://api.randomdatatools.ru/?gender=man&params=FirstName&unescaped=false', inputStream);
  Writeln(inputStream.Size);
  Writeln(inputStream.Position);
  inputStream.Seek(0,soFromBeginning);
  readcount:=inputStream.Read(buffer,inputStream.Size);
  Writeln(readcount);
  s:=TEncoding.UTF8.GetString(buffer,0,readcount);

  get_name:= s;  
end;
end.