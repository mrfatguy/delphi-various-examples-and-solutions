{*********************************************************}
{                                                         }
{    Calmira System Library 1.0                           }
{    by Li-Hsin Huang,                                    }
{    released into the public domain January 1997         }
{                                                         }
{*********************************************************}

unit Objlist;

{ TObjectList is a simple descendant of TList that assumes each item
  is a descendant of TObject.  It defines two new methods :

  ClearObjects calls Free for each pointer before clearing the list.
  FreeObject calls Free for a list item before calling Delete.

  Destroy is overriden to free all objects.
}

interface

uses Classes;

type

TObjectList = class(TList)
public
  destructor Destroy; override;
  procedure ClearObjects;
  procedure FreeObject(i: Integer);
end;

implementation

destructor TObjectList.Destroy;
begin
  ClearObjects;
  inherited Destroy;
end;

procedure TObjectList.ClearObjects;
var i: Integer;
begin
  for i := 0 to Count-1 do TObject(List^[i]).Free;
  Clear;
end;

procedure TObjectList.FreeObject(i: Integer);
begin
  TObject(Items[i]).Free;
  Delete(i);
end;

end.
