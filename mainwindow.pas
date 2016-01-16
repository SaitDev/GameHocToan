unit MainWindow;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls;

type

  { TMain }

  TMain = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Timer1: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure LabelClick(Sender: TObject);
    procedure LabelMouseLeave(Sender: TObject);
    procedure LabelMouseEnter(Sender: TObject);
    procedure Timer1StopTimer(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Main: TMain;
  Score,grade: Integer;
  speed : Integer = 20;
  range: LongInt;

implementation

uses sosanh, tinhnham;
var lastchoose: TObject;

{$R *.lfm}

{ TMain }


procedure TMain.Button3Click(Sender: TObject);
begin
   Close;
end;

procedure TMain.LabelClick(Sender: TObject);
begin
   if lastchoose<>Nil then
   begin
      TLabel(Sender).Color:=$00047AF0;
      TLabel(Sender).Font.Color:=clWhite;
      TLabel(Sender).Font.Style:=[fsItalic];
      TLabel(lastchoose).Color:=clNone;
      TLabel(lastchoose).Font.Style:=[];
   end
   else Timer1.Enabled:=True;
   lastchoose:=Sender;
   grade:= TLabel(Sender).Tag;
end;


procedure TMain.LabelMouseLeave(Sender: TObject);
begin
   TLabel(Sender).Font.Color:=clWhite;
end;

procedure TMain.LabelMouseEnter(Sender: TObject);
begin
   if lastchoose<>Sender then TLabel(Sender).Font.Color:=$00047AF0;
end;

procedure TMain.Timer1StopTimer(Sender: TObject);
begin
   TLabel(lastchoose).Color:=$00047AF0;
   TLabel(lastchoose).Font.Color:=clWhite;
   TLabel(lastchoose).Font.Style:=[fsItalic];
end;

procedure TMain.Timer1Timer(Sender: TObject);
begin
   if Panel2.Left>120 then
   begin
      if Panel1.Left>-120 then Panel1.Left:=Panel1.Left - speed
      else speed:=10;
      Panel2.Left:=Panel2.Left - speed;
   end
   else Timer1.Enabled:=False;
end;

procedure TMain.Button1Click(Sender: TObject);
begin
   Main.Visible:=false;
   Form1.Show;
end;

procedure TMain.Button2Click(Sender: TObject);
begin
   Main.Visible:=false;
   Form2.Show;
end;

end.

