{*********************************************************}
{                                                         }
{    Calmira Visual Component Library 1.0                 }
{    by Li-Hsin Huang,                                    }
{    released into the public domain January 1997         }
{                                                         }
{*********************************************************}

unit Iconsel;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, Grids, StylSped;

type
  TIconSelForm = class(TForm)
    Grid: TDrawGrid;
    CancelBtn: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    OpenDialog: TOpenDialog;
    OKBtn: TBitBtn;
    BrowseBtn: TStyleSpeed;
    FileEdit: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure GridDrawCell(Sender: TObject; Col, Row: Longint; Rect: TRect;
      State: TGridDrawState);
    procedure GridSelectCell(Sender: TObject; Col, Row: Longint;
      var CanSelect: Boolean);
    procedure FormShow(Sender: TObject);
    procedure BrowseBtnClick(Sender: TObject);
  private
    { Private declarations }
    Icons : TList;
    FIndex : Integer;
    procedure SearchFile(const filename: TFilename);
  public
    { Public declarations }
    property Index : Integer read FIndex write FIndex;
  end;

var
  IconSelForm: TIconSelForm;

implementation

{$R *.DFM}

uses ShellAPI;

procedure TIconSelForm.SearchFile(const filename: TFilename);
var
  i : Integer;
  h : THandle;
  s : array[0..79] of Char;
begin
  FileEdit.Text := Lowercase(filename);
  Update;

  h := ExtractIcon(HInstance, StrPCopy(s, filename), 0);

  if h <= 1 then begin
    StrPCopy(s, Application.ExeName);
    MessageDlg(Format('There are no icons in this file.  Please choose one ' +
      'from %s', [ExtractFilename(Application.ExeName)]),
      mtInformation, [mbOK], 0);
    FileEdit.Text := Lowercase(Application.ExeName);
  end
  else DestroyIcon(h);

  Screen.Cursor := crHourGlass;
  try
    for i := 0 to Icons.Count-1 do DestroyIcon(Word(Icons[i]));
    Icons.Clear;

    i := 0;
    h := ExtractIcon(HInstance, s, i);
    while h > 1 do begin
      Icons.Add(Pointer(h));
      Inc(i);
      h := ExtractIcon(HInstance, s, i);
    end;

    Grid.ColCount := Icons.Count;
    if Index >= Icons.Count then Index := Icons.Count-1;
    Grid.LeftCol := Index;
    Grid.Col := Grid.LeftCol;
    Index := 0;
  finally
    Screen.Cursor := crDefault;
  end;
  Grid.Invalidate;
end;


procedure TIconSelForm.FormCreate(Sender: TObject);
begin
  Icons := TList.Create;
  Index := 0;
end;

procedure TIconSelForm.FormDestroy(Sender: TObject);
var i: Integer;
begin
  for i := 0 to Icons.Count-1 do DestroyIcon(Word(Icons[i]));
end;

procedure TIconSelForm.GridDrawCell(Sender: TObject; Col, Row: Longint;
  Rect: TRect; State: TGridDrawState);
begin
  if Col < Icons.Count then
    DrawIcon(Grid.Canvas.Handle, Rect.Left + 4, Rect.Top + 4, HIcon(Icons[Col]));
end;

procedure TIconSelForm.GridSelectCell(Sender: TObject; Col, Row: Longint;
  var CanSelect: Boolean);
begin
  CanSelect := Col < Icons.Count;
end;

procedure TIconSelForm.FormShow(Sender: TObject);
begin
  if FileEdit.Text = '' then begin
    FileEdit.Text := Application.ExeName;
    Index := 0;
  end;
  SearchFile(FileEdit.Text);
end;

procedure TIconSelForm.BrowseBtnClick(Sender: TObject);
begin
  with OpenDialog do begin
    Filename := FileEdit.Text;
    if Execute then SearchFile(Filename);
  end;
end;

end.
