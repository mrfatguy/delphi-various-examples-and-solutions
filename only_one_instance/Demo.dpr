{
 "How to prevent a second instance and take its parameters..." example
 Author : Theo Bebekis <bebekis@otenet.gr>

 NOTE  : The example uses atoms to pass string information from one
         application instance to another
 LOGIC :
         1. Before any form creation the app emumerates all top-level
            windows using the EnumWindows WinAPI function.
         2. For any top-level window passed in checks the ClassName of
            that window and a user defined application ID.
            The class name of the top-level window is retrieved using
            the GetClassName WinAPI function.
            The user defined application ID is retrieved using a user
            defined windows message (UM_APP_ID_CHECK)
         3. If those two elements matches to its own relative elements
            then assumes that a previous instance is running and passes
            the command line params to it using a message (UM_PREVIOUS_INST_PARAMS)
         4. Else proceeds creating its main form and then handling the command
            line parameters (frmMain.HandleParams method)

 HOW TO TEST IT : 
         Compile the sources and then use Start->Run to run the app
         passing parameters to it


}

program Demo;

uses
  Windows,
  Messages,
  SysUtils,
  Forms,
  Main in 'Main.pas' {frmMain};

{$R *.RES}






var
  hPrevious    : THandle;
  aAtom        : TAtom;
  i            : integer;
  sParams      : string;



{----------------------------------------------------------------------------------
 Description    : a callback function that receives top-level window handles as a
                  result of a call to the EnumWindows
 Parameters     : see notes
 Error checking : ?
 Notes          : check "EnumWindows" and "EnumWindowsProc" WinAPI help topics
-----------------------------------------------------------------------------------}
function EnumWindowsFunc(Handle: HWND; Param: LParam): boolean; stdcall;

  {---------------------------------------}
  function IsAPrevInstanceRunning: boolean;
  var
    ClassName : array[0..30] of Char;
    iAppID    : integer;
  begin

    { get the class name for the top-level window specified by Handle }
    GetClassName(Handle, ClassName, 30);

    { get the APP_ID for the application where the top-level window specified by Handle belongs }
    iAppID := SendMessage(Handle, UM_APP_ID_CHECK, 0, 0);

    { if ClassName matches to the this application's Main Form class name...}
    { and iAppID matches to to the this application's APP_ID}
    Result :=  (StrIComp(ClassName, MAIN_FORM_CLASS) = 0) and (iAppID = APP_ID);
  end;
  {---------------------------------------}
  
begin
  { must be True to continue the enumeration }
  Result := not IsAPrevInstanceRunning;
  if not Result then hPrevious := Handle;
end;

{----------------------------------------------------------------------------------
 Description    : restores the previous instance and passes the params to it
 Parameters     : none
 Error checking : YES
 Notes          : check "Atoms" WinAPI help topic
-----------------------------------------------------------------------------------}
procedure PassParamsToPreviousInstance;
begin
  PostMessage(hPrevious, UM_RESTORE_APPLICATION, 0, 0);
  if (ParamCount > 0) then
  begin
    aAtom := GlobalAddAtom(PChar(sParams));
    if aAtom = 0
    then RaiseLastWin32Error
    else
      begin
        SendMessage(hPrevious, UM_PREVIOUS_INST_PARAMS, aAtom, 0);
        GlobalDeleteAtom(aAtom);
      end;
  end;
end;

{----------------------------------------------------------------------------------
 Description    : program's main body
 Parameters     :
 Error checking :
 Notes          :
-----------------------------------------------------------------------------------}
begin
  hPrevious := 0;
  aAtom     := 0;
  EnumWindows(@EnumWindowsFunc, 0);

  sParams := '';

  { this is here because some long file names contain spaces }
  if ParamCount > 0 then
    for i := 1 to ParamCount do sParams := sParams + ' ' + ParamStr(i);


  sParams := Trim(sParams);


  { if a previous instance is already running then pass the command line
    parameters to it and exit... }
  if hPrevious <> 0
  then
    begin
      PassParamsToPreviousInstance;
      Exit;
    end
  else
    { ...else run the app normaly and handle the params }
    begin
      Application.Initialize;
      Application.CreateForm(TfrmMain, frmMain);
      if ParamCount > 0 then frmMain.HandleParams(sParams);
      Application.Run;
    end;

end.

