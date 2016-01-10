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
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure LabelClick(Sender: TObject);
    procedure LabelMouseLeave(Sender: TObject);
    procedure LabelMouseEnter(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Main: TMain;
  Score,grade: Integer;

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
   if lastchoose=Nil then
   begin
        Panel1.Left:=-100;
        Panel2.Left:=140;
   end
   else TLabel(lastchoose).Color:=clGreen;
   TLabel(Sender).Color:=$000C7BCD;
   lastchoose:=Sender;
   grade:= TLabel(Sender).Tag;
end;


procedure TMain.LabelMouseLeave(Sender: TObject);
begin
   TLabel(Sender).Font.Color:=clWhite;
end;

procedure TMain.LabelMouseEnter(Sender: TObject);
begin
   if lastchoose<>Sender then TLabel(Sender).Font.Color:=$000C7BCD;
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

