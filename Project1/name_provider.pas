{$MODE OBJFPC}
{$H+}
{$codepage utf-8}
unit name_provider;
interface
function ehe : String;
function get_name : String;


implementation
uses fphttpclient,sysutils, classes, fpjson, jsonparser;

function get_name : String;

var 
  http_client : TFPHttpClient;
  s: UTF8String;
  inputStream: TMemoryStream;
  buffer: array[0..4096] of byte;
  readcount:LongInt;
  jData : TJSONData;
  jObject : TJSONObject;
 begin
  try
    http_client := TFPHttpClient.Create(Nil);
    inputStream:=TMemoryStream.Create();
    http_client.get('http://api.randomdatatools.ru/?gender=man&params=FirstName&unescaped=false&typeName=rare', inputStream);
    inputStream.Seek(0,soFromBeginning);
    readcount:=inputStream.Read(buffer,inputStream.Size);
    s:=TEncoding.UTF8.GetString(buffer,0,readcount);

    jData := GetJSON(s);
    jObject := jData as TJSONObject;
    s := jObject.get('FirstName');   
  except
    on Err: Exception do
    begin
      s:='';
    end;
  end;
 

  get_name:= s;  
end;

function ehe : String;
var
  s:string;
  names:array of String = ('Асмодей', 'Абаддон', 'Константин', 'Срунвтапки', 'Бельфегор', 'МуркаБандит');
begin
  s := names[Random(length(names)-1)];



  ehe := s;
end;


end.