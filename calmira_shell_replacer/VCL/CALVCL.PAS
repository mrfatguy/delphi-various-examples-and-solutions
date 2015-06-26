{*********************************************************}
{                                                         }
{    Calmira Visual Component Library 1.0                 }
{    by Li-Hsin Huang,                                    }
{    released into the public domain January 1997         }
{                                                         }
{*********************************************************}

unit CalVCL;

interface

procedure Register;

implementation

uses Classes, MultiGrd, DropServ, DropClnt, BarGauge, StylSped,
 ApHolder, FormDrag, ChkList, ScrTree, SysMenu, IconDlg;

procedure Register;
begin
  RegisterComponents('Calmira',
    [TMultiGrid, TDropServer, TDropClient, TBarGauge,
      TStyleSpeed, TFormDrag, TAppHolder, TCheckList, TScrollTree,
      TSystemMenu]);

  RegisterComponents('Dialogs', [TIconDialog]);
end;


end.
 