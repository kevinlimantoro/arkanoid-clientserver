unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ScktComp;

type
  TForm1 = class(TForm)
    Shape1: TShape;
    ServerSocket1: TServerSocket;
    Shape2: TShape;
    Timer1: TTimer;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure ServerSocket1ClientRead(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ServerSocket1ClientConnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  x,y:integer;
  temp:string;
  total:integer=-1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
 serversocket1.Port:=2000;
 serversocket1.Open;
 timer1.Interval:=50;
 timer1.Enabled:=false;
 label1.Caption:='Now = Server';
 label2.Caption:='From = ';
end;

procedure serverbroadcast(serper:tserversocket;total:integer;pesan:string);
var
i:integer;
begin
for i:=0 to total do
serper.Socket.Connections[i].SendText(pesan);
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
if shape2.left+33>=form1.width then
begin
timer1.Enabled:=false;
serverbroadcast(serversocket1,total,'kalah');
end
else if (shape2.left<=0) and (x=-10) then
begin
timer1.Enabled:=false;
shape2.Hide;
serversocket1.Socket.Connections[0].SendText(inttostr(shape2.top)+'!'+inttostr(shape2.left)+'@'+inttostr(x)+'#'+inttostr(y))
end;
if shape2.top+33>=form1.Height then
y:=-10
else if shape2.top<=0 then
y:=10;
if (shape2.Left+shape2.Width>=shape1.Left) and (shape2.top>=shape1.Top) and (shape2.top<=shape1.Top+shape1.Height) then
x:=-10;


shape2.left:=shape2.Left+x;
shape2.top:=shape2.top+y;
end;

procedure TForm1.ServerSocket1ClientRead(Sender: TObject;
  Socket: TCustomWinSocket);
begin
temp:=socket.ReceiveText;
if copy(temp,1,5)='kalah' then
showmessage('Selamat Server Anda Menang')
else if copy(temp,1,3)='now' then
begin
label2.Caption:='From = '+copy(label1.Caption,7,length(label1.Caption)-6);
label1.Caption:='Now = '+copy(temp,4,1);
serverbroadcast(serversocket1,total,'now'+copy(temp,4,length(temp)-3));
end
else
begin
shape2.Top:=strtoint(copy(temp,1,pos('!',temp)-1));
shape2.Left:=0;
x:=strtoint(copy(temp,pos('@',temp)+1,2));
y:=strtoint(copy(temp,pos('#',temp)+1,length(temp)-pos('#',temp)));
shape2.Visible:=true;
timer1.Enabled:=true;
serverbroadcast(serversocket1,total,'nowServer');
label2.Caption:='From = '+copy(label1.Caption,7,length(label1.Caption)-6);
label1.Caption:='Now = Server';
end;
end;

procedure TForm1.FormKeyPress(Sender: TObject; var Key: Char);
begin
if key='s' then
shape1.Top:=shape1.Top+10
else if key='w' then
shape1.Top:=shape1.Top-10;
end;

procedure TForm1.ServerSocket1ClientConnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
total:=total+1;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
x:=-10;
y:=10;
button1.Enabled:=false;
timer1.Enabled:=true;
end;

end.
