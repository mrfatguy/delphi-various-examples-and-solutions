(****************************)
(* F!C  v1.1  4 Delphi 4    *)
(* Build 07.07.2001         *)
(* by ^^oyT                 *)
(* Mail: vvoyt@hotmail.com  *)
(****************************)
unit Unit1;
interface
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, ShellAPI;
type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Edit2: TEdit;
    label2: TLabel;
    Button1: TButton;
    OpenDialog1: TOpenDialog;
    Edit3: TEdit;
    Label3: TLabel;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure IAeverButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  Form1: TForm1;
implementation

{$R *.DFM}

procedure TForm1.Button1Click(Sender: TObject);
var
  fname: string;
  f    : file;
begin
  OpenDialog1.Filter:='All files (*.*)|*.*';
  if opendialog1.execute then
     try
       AssignFile(f,OpenDialog1.FileName);
       Reset(F,1);
       CloseFile(f);
       fname:= opendialog1.FileName;
       Edit1.Text:=fname;
     except
        MessageDlg('File not found.',mterror,[mbok],0);
     end;
end;
{ UKRYWANIE BAJTÓW PLIKU PRZEZ XOROWANIE ZNAKAMI HAS£A - Start! }
procedure TForm1.IAeverButton2Click(Sender: TObject);
type cyc = record
              A: LongInt;
              B: Byte;
           end;
var
  f           : file;
  Key         : string;
  adres, bajt : cyc;
  bb          : Byte;
  CodedByte   : Char;
  StanScan    : Integer;
  Selektor    : LongInt;
  i, j        : Integer;
label 1, 2, 3;

begin
     if length(edit1.text)=0  then
        begin
          MessageDlg('Choose file to encrypt/decrypt !', mtError, [mbOk], 0);
          goto 1;
        end;
     if length(edit2.text)=0  then
        begin
          MessageDlg('Insert your Key !', mtError, [mbOk], 0);
          goto 1;
        end;
     if (Length(edit2.text)<>0) and (Length(edit2.text)<10) then
        begin
          MessageDlg('Key must be at least 10 characters long !', mtInformation, [mbOK], 0);
          goto 1;
        end;
{*** CZY WPISANY KLUCZ ZAWIERA PRZYNAJMNIEJ DWA RÓ¯NE ZNAKI ? ***}
     j:=1;            // indeks pocz. symbolu klucza
     Key:=Edit2.Text;
  2: for i:=1 to (10-j) do
                        begin
                          if Key[j]<>Key[i+j] then goto 3;//jesli chocia¿ 2 znaki ró¿ne, to...
                        end;                             //wyjdŸ z pêtli i rozpocznij szyfrowanie
     if j=9 then       //jeœli klucz sklada siê z jednakowych znaków, to...
              begin
                MessageDlg('At least 2 of the first 10 characters in Key must be different !', mtInformation, [mbOK], 0);
                goto 1;
              end;
     Inc(j);
     goto 2;
{*** KONIEC PRAWDZANIA ***}     
  3: StanScan:=0;     //wartoœæ pocz¹tkowa licznika procentów
     Selektor:=400;  //uruchom % licznik postêpu od 400 bajtu
     Edit3.Clear;
     AssignFile(f,opendialog1.FileName);
     Reset(f,1);
     adres.A := 1; //offset startowy
     Key:=Edit2.text;
     repeat
       Application.ProcessMessages;
       StanScan:=((adres.A)*100)div(FileSize(f));//ile procent roboty za nami?
       if adres.A = Selektor then //jeœli czas na zwiêkszenie licznika procentów, to...
                             begin
                               Edit3.Clear;
                               Edit3.Seltext:=IntToStr(StanScan);//wyœwietl nowy stan licznika %
                               Selektor:=Selektor+400;
                             end;
       seek(f,adres.A);
       bb:=bajt.B;
       BlockRead(f,bb,1); //ustaw siê na bajt spod wskazanego adresu
       CodedByte:=Char(bb xor Ord(Key[10]) xor Ord(Key[9])
                          xor Ord(Key[8])  xor Ord(Key[7])
                          xor Ord(Key[6])  xor Ord(Key[5])
                          xor Ord(Key[4])  xor Ord(Key[3])
                          xor Ord(Key[2])  xor Ord(Key[1]));
       adres.A:=adres.A-1;
       seek(f,adres.A) ;
       bb:=bajt.B;
       BlockRead(f,bb,1);
       BlockWrite(f,CodedByte,1);  //podmieñ-ukryj
       adres.A:=adres.A+2;
     until adres.A>=FileSize(f);
     Edit3.Clear;
     Edit3.SelText:='100';
     CloseFile(f);
     MessageBoxA(0, 'Encryption/Decryption finished !','F!C',MB_ICONINFORMATION);
1:end;

end.
