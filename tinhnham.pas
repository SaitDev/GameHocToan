unit TinhNham;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, MMSystem;

type

  { TForm2 }

  TForm2 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RandomQuestion;
    procedure CorrectAnswer;
    procedure WrongAnswer;
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

var dapan: LongInt;

{$R *.lfm}

{ TForm2 }



procedure TForm2.RandomQuestion;
begin
   x:= Random(range);
   y:= random(range);
   pheptinh:= random(40) mod 4;
   case pheptinh of
   0: Label1.Caption:= IntToStr(x) + ' + ' + IntToStr(y) + ' =';
   1: begin
             while (x<y) do
             begin
                x:= Random(range);
                y:= random(range);
             end;
             Label1.Caption:= IntToStr(x) + ' - ' + IntToStr(y) + ' =';
      end;
   2: begin
             if x>20 then y:=random(10);
             if y>20 then x:=random(10);
             Label1.Caption:= IntToStr(x) + ' x ' + IntToStr(y) + ' =';
        end;
   3: begin
             if x>100 then y:=random(10);
             if y>100 then x:=random(10);
             while (x mod y <> 0) do
             begin
                x:= Random(range);
                y:= 1 + Random(range - 1);
                if x>100 then y:=random(10);
             end;
             Label1.Caption:= IntToStr(x) + ' : ' + IntToStr(y) + ' =';
        end;
   end;
   Edit1.Text:='';

   case pheptinh of
   0: dapan:= x + y;
   1: dapan:= x - y;
   2: dapan:= x * y;
   3: dapan:= trunc(x/y);
   end;
end;

procedure TForm2.CorrectAnswer;
begin
   Inc(Score,5);
   Label2.Caption:= 'Score : ' + IntToStr(Score);
   sndPlaySound('Sound\correct.wav',SND_ASYNC or SND_NODEFAULT);
end;

procedure TForm2.WrongAnswer;
begin
   sndPlaySound('Sound\wrong.wav',SND_ASYNC or SND_NODEFAULT);
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
   if StrToInt(Edit1.Text) = dapan then CorrectAnswer
   else WrongAnswer;
   RandomQuestion;
end;

procedure TForm2.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
   Main.Show;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
   Randomize;
end;

procedure TForm2.FormShow(Sender: TObject);
begin
   range := 10 * grade;
   RandomQuestion;
   Score:=0;
   Label2.Caption:= 'Score : 0';
   //ShowMessage('You choose Lớp ' + IntToStr(grade));
end;


end.

