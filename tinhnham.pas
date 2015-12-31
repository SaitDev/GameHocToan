unit TinhNham;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls;

type

  { TForm2 }

  TForm2 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Image1: TImage;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form2: TForm2;
  x,y: LongInt;
  pheptinh: Integer;

implementation

uses MainWindow;

{$R *.lfm}

{ TForm2 }



procedure TForm2.Button1Click(Sender: TObject);
var dapan: LongInt;
begin
   case pheptinh of
   0: dapan:= x + y;
   1: dapan:= x - y;
   2: dapan:= x * y;
   3: dapan:= trunc(x/y);
   end;
   if StrToInt(Edit1.Text) = dapan then ShowMessage('Câu trả lời đúng')
   else ShowMessage('Câu trả lời sai');
   x:= Random(10);
   y:= random(10);
   pheptinh:= random(3);
   case pheptinh of
   0: Label1.Caption:= IntToStr(x) + ' + ' + IntToStr(y) + ' =';
   1: begin
             while (x<y) do
             begin
                x:= Random(10);
                y:= random(10);
             end;
             Label1.Caption:= IntToStr(x) + ' - ' + IntToStr(y) + ' =';
        end;
     2: Label1.Caption:= IntToStr(x) + ' x ' + IntToStr(y) + ' =';
     3: begin
             while (x mod y <> 0) do
             begin
                x:= Random(10);
                y:= random(10);
             end;
             Label1.Caption:= IntToStr(x) + ' : ' + IntToStr(y) + ' =';
        end;
   end;
end;

procedure TForm2.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
   Main.Show;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
   Randomize;
   x:= Random(10);
   y:= random(10);
   pheptinh:= random(3);
   case pheptinh of
   0: Label1.Caption:= IntToStr(x) + ' + ' + IntToStr(y) + ' =';
   1: begin
           while (x<y) do
           begin
              x:= Random(10);
              y:= random(10);
           end;
           Label1.Caption:= IntToStr(x) + ' - ' + IntToStr(y) + ' =';
      end;
   2: Label1.Caption:= IntToStr(x) + ' x ' + IntToStr(y) + ' =';
   3: begin
           while (x mod y <> 0) do
           begin
              x:= Random(10);
              y:= random(10);
           end;
           Label1.Caption:= IntToStr(x) + ' : ' + IntToStr(y) + ' =';
      end;
   end;
end;


end.

