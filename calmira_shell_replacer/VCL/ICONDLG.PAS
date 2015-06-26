{*********************************************************}
{                                                         }
{    Calmira Visual Component Library 1.0                 }
{    by Li-Hsin Huang,                                    }
{    released into the public domain January 1997         }
{                                                         }
{*********************************************************}

unit Icondlg;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs;

type
  TIconDialog = class(TComponent)
  private
    { Private declarations }
    FFilename  : TFilename;
    FIconIndex : Word;
    FHistory : TStrings;
    procedure SetHistory(value : TStrings);
  protected
    { Protected declarations }
  public
    { Public declarations }
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;
    function Execute : Boolean;
  published
    { Published declarations }
    property Filename : TFilename read FFilename write FFilename;
    property IconIndex : Word read FIconIndex write FIconIndex default 0;
    property HistoryList : TStrings read FHistory write SetHistory;
  end;

procedure Register;

implementation

uses IconSel;

constructor TIconDialog.Create(AOwner : TComponent);
begin
  inherited Create(AOwner);
  FFilename := Application.Exename;
  FIconIndex := 0;
  FHistory := TStringList.Create;
end;

destructor TIconDialog.Destroy;
begin
  FHistory.Free;
  inherited Destroy;
end;

procedure TIconDialog.SetHistory(value : TStrings);
begin
  FHistory.Assign(value);
end;


function TIconDialog.Execute : Boolean;
var form : TIconSelForm;
begin
  form := TIconSelForm.Create(Application);
  with Form do
  try
    FileEdit.Text := Filename;
    OpenDialog.HistoryList.Assign(FHistory);
    Index := IconIndex;

    if ShowModal = mrOK then begin
      Result := True;
      Filename := Lowercase(FileEdit.Text);
      IconIndex := Grid.Col;
      if FHistory.IndexOf(Filename) = -1 then FHistory.Insert(0, Filename);
      if FHistory.Count > 24 then FHistory.Delete(24);
    end
    else Result := False;
  finally
    Free;
  end;
end;


procedure Register;
begin
  RegisterComponents('Dialogs', [TIconDialog]);
end;

end.
