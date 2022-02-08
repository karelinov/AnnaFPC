{$MODE OBJFPC}
{$H+}
{$codepage utf-8}


unit name_provider;
interface
function get_name : String;
implementation
uses fphttpclient;

function get_name : String;
var 
  http_client : TFPHttpClient;
  name_result : String;
begin
  http_client := TFPHttpClient.Create(Nil);
  name_result :=  http_client.get ('http://api.randomdatatools.ru/?gender=man&params=FirstName&unescaped=false');
  get_name:= name_result;  
end;
end.