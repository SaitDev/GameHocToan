unit MainWindow;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TMain }

  TMain = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Main: TMain;

implementation

uses sosanh, tinhnham;

{$R *.lfm}

{ TMain }

procedure TMain.Button3Click(Sender: TObject);
begin
   Close;
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

