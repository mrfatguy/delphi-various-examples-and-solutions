{______________________________________________________________________________

                     (c) 1998 Marcin Wieczorek ( T-1000 )
                         email:wieczor@polbox.com
 ______________________________________________________________________________}

unit Debug;

interface

uses SysUtils;

type EDebugException=class(Exception)end;

procedure TestMsg(V:Boolean;S:String);
procedure Test(V:Boolean);
procedure Error(S:String);

implementation

procedure TestMsg(V:Boolean;S:String);
begin
 if not V then Error(S);
end;

procedure Test(V:Boolean);
begin
 TestMsg(V,'Test statement failed');
end;

procedure Error(S:String);
begin
 raise EDebugException.Create(S);
end;

end.
