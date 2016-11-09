unit uFormUtama;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ScktComp, ZConnection;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    ClientSocket1: TClientSocket;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit3: TEdit;
    pabxdb: TZConnection;
    emeralddb: TZConnection;
    procedure ClientSocket1Read(Sender: TObject; Socket: TCustomWinSocket);
    procedure FormActivate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ConnectDB;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  Button1.Enabled := False;
  Button2.Enabled := True;

  ConnectDB;

  ClientSocket1.Host := Edit1.Text;
  ClientSocket1.Port := StrToInt(Edit3.Text);
  ClientSocket1.Open;

end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Button1.Enabled := True;
  Button2.Enabled := False;

  ClientSocket1.Close;
end;

procedure TForm1.FormActivate(Sender: TObject);
var hostn : TStrings;
begin
  hostn := TStringList.Create;
  hostn.LoadFromFile('hostn.txt');

  Edit2.Text := hostn.Strings[0];
  Edit1.Text := hostn.Strings[2];
  Edit3.Text := hostn.Strings[3];
end;

procedure TForm1.ClientSocket1Read(Sender: TObject; Socket: TCustomWinSocket);
var oritext : String;
begin
  oritext := Socket.ReceiveText;
  Memo1.Lines.Add(oritext);

  if pabxdb.Connected then begin

  pabxdb.ExecuteDirect('insert into pbxraw (trdt,smdr) ' +
                  ' values ('+QuotedStr(FormatDateTime('yyyy-mm-dd hh:nn:ss',Now))+
                  ','+QuotedStr(oritext)+
                  ')');
  end;

end;

procedure TForm1.ConnectDB;
begin
  //
  pabxdb.Disconnect;
  pabxdb.HostName := Edit2.Text;
  pabxdb.User := 'root';
  pabxdb.Password := 'p3nd3kar';
  pabxdb.Database := 'pbx';
  pabxdb.Connect;

  emeralddb.Disconnect;
  emeralddb.HostName := Edit2.Text;
  emeralddb.User := 'root';
  emeralddb.Password := 'p3nd3kar';
  emeralddb.Database := 'emerald';
  emeralddb.Connect;


end;

end.
