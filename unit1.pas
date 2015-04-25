unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Edit1: TEdit;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

var name:string;

procedure addToDatabase(par:string);

begin

end;

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin  // add to database

end;

procedure TForm1.Button2Click(Sender: TObject);
begin  // list the wole database

end;

procedure TForm1.Button3Click(Sender: TObject);
begin  // list based on filter

end;

procedure TForm1.Button4Click(Sender: TObject);
begin // remove from database based on filter

end;

end.

