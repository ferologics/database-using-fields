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
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Edit1: TEdit;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

type
    Person = record
      name  :string;
      age   :string;
      height:string;
    end;
    p = Array of Person;

var namee:string;
    path:string;
    database:p;
    i,j:integer;
    addingToDatabase:boolean;

procedure clear();
begin
  Form1.Memo1.Clear;
end;

procedure writeM(s:string);
begin
  Form1.Memo1.Lines.Add(s);
end;
procedure disableOrEnableUnwantedButtons();
begin
                  if addingToDatabase=true then
  begin
  Form1.Button2.Enabled:=false; //Form1.Button2.Visible:=false;
  Form1.Button3.Enabled:=false; //Form1.Button3.Visible:=false;
  Form1.Button4.Enabled:=false; //Form1.Button4.Visible:=false;
  Form1.Button8.Enabled:=false; //Form1.Button8.Visible:=false;
  Form1.Button6.Enabled:=false; //Form1.Button6.Visible:=false;
  end
                                else
  begin
  Form1.Button2.Enabled:=true; Form1.Button2.Visible:=true;
  Form1.Button3.Enabled:=true; Form1.Button3.Visible:=true;
  Form1.Button4.Enabled:=true; Form1.Button4.Visible:=true;
  Form1.Button8.Enabled:=true; Form1.Button8.Visible:=true;
  Form1.Button6.Enabled:=true; Form1.Button6.Visible:=true;
  end;
end;

procedure addToDatabase();
var F:TextFile;
    line:string;
begin
  addingToDatabase:= true;
  disableOrEnableUnwantedButtons();

  AssignFile(F, namee);
  Append(F);
  SetLength(database,j+1);
  i+=1;

    if i = 1 then writeM('Enter name.');
    if i = 2 then begin database[j].name:= Form1.Edit1.Text;
                        writeM('Enter age.');
                  end;
    if i = 3 then begin database[j].age:= Form1.Edit1.Text;
                        writeM('Enter height.');
                  end;
    if i = 4 then begin
                  database[j].height:= Form1.Edit1.Text;

                  line:= 'U ' + IntToStr(j) + ' ' + database[j].name
                                            + ' ' + database[j].age
                                            + ' ' + database[j].height;
                  i:= 0;

                  writeln(F, line);
                  writeM('Succesfully added new person to database: ->');
                  writeM(line);
                  j+=1;
                  addingToDatabase:= false; disableOrEnableUnwantedButtons();
    end;

  CloseFile(F);
end;

procedure loadOrCreateTxt(n:string);
var F:TextFile;
    ch:char;
    m,r:integer;
begin
  namee:= n + '.txt';
  AssignFile(F, namee);

  if not(FileExists(namee)) then
  begin
       Rewrite(F);
       writeM('Created new text database file named -'+namee+'- at '+path+'.');
  end
  else
      begin
        writeM('Loaded text database file named '+namee+'.');
        while not(EOF(F)) do
        begin
             read(F,ch);
                case ch of 'U','u': begin
                                readln(F,m,r);
                                j:= r;     // FCKING ELNOUTERROR jdawiohudhcoahidsFEWASGWES
                               end;
                end;

        end;
      end;
end;

procedure deleteFile(n:string);
var F:TextFile;
begin
  AssignFile(F,'root path - /Users/ginie/Documents/lazarus/database-using-fields/' + n + '.txt');
  Erase(F);

  if (FileExists(namee)) then writeM('Unable to delete file named -'+ namee +'- try to cheack your path/name again.')
                         else writeM('Successfully deleted fie named -'+ namee +'- !');
end;

/////////////////////////////////////{ TForm1 }\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

procedure TForm1.Button1Click(Sender: TObject);
begin  // add to current database file
  addToDatabase();
end;

procedure TForm1.Button2Click(Sender: TObject);
begin  // list database named <>

end;

procedure TForm1.Button3Click(Sender: TObject);
begin  // remove from current database (name/age/height)

end;

procedure TForm1.Button4Click(Sender: TObject);
begin // list current database based on filter (name/age/height)

end;

procedure TForm1.Button5Click(Sender: TObject);
begin // clear memo
  clear();
end;

procedure TForm1.Button6Click(Sender: TObject);
begin // write path to root
  writeM('root path - '+path);
end;

procedure TForm1.Button7Click(Sender: TObject);
begin // delete file named <>
  deleteFile(Form1.Edit1.Text);
  i:=0; j:=0;
end;

procedure TForm1.Button8Click(Sender: TObject);
begin // load or create new database file named <>
  loadOrCreateTxt(Form1.Edit1.Text);
  i:=0; j:=0;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin // STARTUP
  clear();
  namee:= Form1.Edit1.Text + '.txt';
  path:= '/Users/ginie/Documents/lazarus/database-using-fields/';
  i:=0; j:=0;
end;

end.

