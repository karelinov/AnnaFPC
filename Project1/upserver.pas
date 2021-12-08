{
  The Micro Pascal WebServer

  This is a very simple example webserver implemented with the Synapse library.

  It works with blocking sockets and a single thread, so it
  can only handle one request at a given time.

  It will write the headers that it receives from the browser
  to the standard output.

  It serves a fixed webpage for the / URI
  For any other URI it will return 404 not found
}

{$ifdef fpc}
  {$mode delphi}
{$endif}

unit upserver;
interface
procedure Run();

implementation
uses
  Classes, blcksock, sockets, Synautil, SysUtils;

{@@
  Attends a connection. Reads the headers and gives an
  appropriate response
}

procedure AttendConnection(ASocket: TTCPBlockSocket);
var
  timeout: integer;
  s: string;
  method, uri, protocol: string;
  OutputDataString: string;
  ResultCode: integer;
begin
  timeout := 120000;

  WriteLn('Received headers+document from browser:');

  //read request line
  s := ASocket.RecvString(timeout);
  WriteLn(s);
  method := fetch(s, ' ');
  uri := fetch(s, ' ');
  protocol := fetch(s, ' ');

  //read request headers
  repeat
    s := ASocket.RecvString(Timeout);
    WriteLn(s);
  until s = '';

  // Now write the document to the output stream

  if uri = '/' then
  begin

    // Write the output document to the stream
    OutputDataString :=
      '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"'
      + ' "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">' + CRLF
      + '<html><h1>Teste</h1></html>' + CRLF;

    // Write the headers back to the client
    ASocket.SendString('HTTP/1.0 200' + CRLF);
    ASocket.SendString('Content-type: Text/Html' + CRLF);
    ASocket.SendString('Content-length: ' + IntTostr(Length(OutputDataString)) + CRLF);
    ASocket.SendString('Connection: close' + CRLF);
    ASocket.SendString('Date: ' + Rfc822DateTime(now) + CRLF);
    ASocket.SendString('Server: Servidor do Felipe usando Synapse' + CRLF);
    ASocket.SendString('' + CRLF);

  //  if ASocket.lasterror <> 0 then HandleError;

    // Write the document back to the browser
    ASocket.SendString(OutputDataString);
  end
  else
    ASocket.SendString('HTTP/1.0 404' + CRLF);
end;


procedure Run();
var
  ListenerSocket, ConnectionSocket: TTCPBlockSocket;

begin
  ListenerSocket := TTCPBlockSocket.Create;
  ConnectionSocket := TTCPBlockSocket.Create;

  ListenerSocket.CreateSocket;
  ListenerSocket.setLinger(true,10);
  ListenerSocket.bind('0.0.0.0','1500');
  ListenerSocket.listen;

  repeat
    if ListenerSocket.canread(1000) then
    begin
      ConnectionSocket.Socket := ListenerSocket.accept;
      WriteLn('Attending Connection. Error code (0=Success): ', ConnectionSocket.lasterror);
      AttendConnection(ConnectionSocket);
      ConnectionSocket.CloseSocket;
    end;
  until false;

  ListenerSocket.Free;
  ConnectionSocket.Free;
end;

end.