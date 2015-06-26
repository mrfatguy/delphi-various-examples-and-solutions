{*********************************************************}
{                                                         }
{    Calmira Visual Component Library 1.0                 }
{    by Li-Hsin Huang,                                    }
{    released into the public domain January 1997         }
{                                                         }
{*********************************************************}

unit Sysmenu;

{ TSystemMenu provides a thin wrapper for the Windows API menu functions,
  and is used to change a form's system menu.  It's most useful in the
  OnCreate handler, when you can modify the menu before the form appears.
  Mainly, it saves you having to remember (or look up) the multitude of
  parameters. }

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Controls, Forms;

type
  TSystemMenu = class(TComponent)
  private
    { Private declarations }
    FHandle : HMenu;
  protected
    { Protected declarations }
    procedure Loaded; override;
  public
    { Public declarations }
    procedure Reset;
    procedure Add(Caption: PChar; Command: Word);
    procedure Insert(Index: Integer; Caption: PChar; Command: Word);
    procedure AddSeparator;
    procedure Delete(Index: Integer);
    procedure DeleteCommand(Command: Word);
    procedure Rename(Command: Word; Caption: PChar);
    property Handle: HMenu read FHandle;
  published
    { Published declarations }
  end;

procedure Register;

implementation

procedure TSystemMenu.Loaded;
begin
  inherited Loaded;
  FHandle := GetSystemMenu((Owner as TForm).Handle, False);
end;

procedure TSystemMenu.Reset;
begin
  FHandle := GetSystemMenu((Owner as TForm).Handle, True);
end;

procedure TSystemMenu.Add(Caption: PChar; Command: Word);
begin
  AppendMenu(FHandle, MF_ENABLED, Command, Caption);
end;

procedure TSystemMenu.AddSeparator;
begin
  AppendMenu(FHandle, MF_SEPARATOR, 0, nil);
end;


procedure TSystemMenu.Delete(Index: Integer);
begin
  DeleteMenu(FHandle, Index, MF_BYPOSITION);
end;

procedure TSystemMenu.DeleteCommand(Command: Word);
begin
  DeleteMenu(FHandle, Command, MF_BYCOMMAND);
end;

procedure TSystemMenu.Rename(Command: Word; Caption: PChar);
begin
  ModifyMenu(FHandle, Command, MF_BYCOMMAND, Command, Caption);
end;

procedure TSystemMenu.Insert(Index: Integer; Caption: PChar; Command: Word);
begin
  InsertMenu(FHandle, Index, MF_BYPOSITION, Command, Caption);
end;

procedure Register;
begin
  RegisterComponents('Gadgets', [TSystemMenu]);
end;

end.
