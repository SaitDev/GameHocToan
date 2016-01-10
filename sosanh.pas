unit SoSanh;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, MMSystem;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
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
  Form1: TForm1;
  x,y, pheptinh: integer;

implementation

uses MainWindow;

{$R *.lfm}

{ TForm1 }


procedure TForm1.RandomQuestion;
begin
   x:=random(10*grade);
   y:=random(10*grade);
   pheptinh:=random(30) mod 3;
   case pheptinh of
   0: label1.Caption:=IntToStr(x) + ' > ' + IntToStr(y);
   1: label1.Caption:=IntToStr(x) + ' < ' + IntToStr(y);
   2: label1.Caption:=IntToStr(x) + ' = ' + IntToStr(y);
   end;
end;

procedure TForm1.CorrectAnswer;
begin
   Inc(Score,5);
   Label2.Caption:='Score : ' + IntToStr(Score);
   sndPlaySound('Sound\correct.wav',SND_ASYNC or SND_NODEFAULT);
end;

procedure TForm1.WrongAnswer;
begin
   sndPlaySound('Sound\wrong.wav',SND_ASYNC or SND_NODEFAULT);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
   case pheptinh of
   0: if x>y then CorrectAnswer
      else WrongAnswer;
   1: if x<y then CorrectAnswer
      else WrongAnswer;
   2: if x=y then CorrectAnswer
      else WrongAnswer;
   end;
   RandomQuestion;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
   case pheptinh of
   0: if x<=y then CorrectAnswer
      else WrongAnswer;
   1: if x>=y then CorrectAnswer
      else WrongAnswer;
   2: if x<>y then CorrectAnswer
      else WrongAnswer;
   end;
   RandomQuestion;
end;

procedure TForm1.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
   Main.Show;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
   Randomize;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
   RandomQuestion;
   Score:= 0;
   Label2.Caption:= 'Score : 0';
   //ShowMessage('You choose Lớp ' + IntToStr(grade));
end;


end.

