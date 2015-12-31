unit SoSanh;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Image1: TImage;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);

  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;
  x,y, pheptinh: integer;

implementation

uses mainwindow;

{$R *.lfm}

{ TForm1 }


procedure TForm1.Button1Click(Sender: TObject);
begin
   case pheptinh of
   0: if x>y then ShowMessage('Câu trả lời đúng')
      else ShowMessage('Câu trả lời sai');
   1: if x<y then ShowMessage('Câu trả lời đúng')
      else ShowMessage('Câu trả lời sai');
   2: if x=y then ShowMessage('Câu trả lời đúng')
      else ShowMessage('Câu trả lời sai');
   end;
   x:=random(1+9);
   y:=random(1+9);
   pheptinh:=random(2);
   case pheptinh of
   0: label1.Caption:=IntToStr(x) + ' > ' + IntToStr(y);
   1: label1.Caption:=IntToStr(x) + ' < ' + IntToStr(y);
   2: label1.Caption:=IntToStr(x) + ' = ' + IntToStr(y);
   end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
   case pheptinh of
   0: if x<=y then ShowMessage('Câu trả lời đúng')
      else ShowMessage('Câu trả lời sai');
   1: if x>=y then ShowMessage('Câu trả lời đúng')
      else ShowMessage('Câu trả lời sai');
   2: if x<>y then ShowMessage('Câu trả lời đúng')
      else ShowMessage('Câu trả lời sai');
   end;
   x:=random(10);
   y:=random(10);
   pheptinh:=random(2);
   case pheptinh of
   0: label1.Caption:=IntToStr(x) + ' > ' + IntToStr(y);
   1: label1.Caption:=IntToStr(x) + ' < ' + IntToStr(y);
   2: label1.Caption:=IntToStr(x) + ' = ' + IntToStr(y);
   end;
end;

procedure TForm1.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
   Main.Show;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
   Randomize;
   x:=random(10);
   y:=random(10);
   pheptinh:=random(2);
   case pheptinh of
   0: label1.Caption:=IntToStr(x) + ' > ' + IntToStr(y);
   1: label1.Caption:=IntToStr(x) + ' < ' + IntToStr(y);
   2: label1.Caption:=IntToStr(x) + ' = ' + IntToStr(y);
   end;
end;


end.

