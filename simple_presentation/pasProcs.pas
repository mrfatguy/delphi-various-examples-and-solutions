unit pasProcs;

interface

uses
    Windows, Controls, forms, classes, Sysutils, extctrls, graphics;

    function FirstDelimiter(Delimiter: Char; Start: Integer; var S: string): Integer;
    function TokenizeString(Line: String; Delimiter: Char): TStringList;

    procedure Delay(MSecs: Longint);
    procedure ShowAndHide(PlaceHolder: TImage; FileName: String; DelayBetween: Integer);
    procedure CenterControl(Control: TControl);
    procedure DrawTrRect(Canvas: TCanvas; const ARect: TRect; Color: TColor; Opacity: Integer);
    procedure PerformExit;

var
	aPath: String;

implementation

procedure CenterControl(Control: TControl);
var
	X, Y: Integer;
begin
	X := Control.Left;
	Y := Control.Top;
	if Control is TForm then
	begin
		with Control do
		begin
			if (TForm(Control).FormStyle = fsMDIChild) and (Application.MainForm <> nil) then
			begin
				X := (Application.MainForm.ClientWidth - Width) div 2;
				Y := (Application.MainForm.ClientHeight - Height) div 2;
			end
			else
			begin
				X := (Screen.Width - Width) div 2;
				Y := (Screen.Height - Height) div 2;
			end;
		end;
	end
	else if Control.Parent <> nil then
	begin
		with Control do
		begin
			Parent.HandleNeeded;
			X := (Parent.ClientWidth - Width) div 2;
			Y := (Parent.ClientHeight - Height) div 2;
		end;
	end;
	if X < 0 then X := 0;
	if Y < 0 then Y := 0;

  	with Control do SetBounds(X, Y, Width, Height);
end;

function TokenizeString(Line: String; Delimiter: char): TStringList;
var
	begin_pos,end_pos : Integer;
begin
	begin_pos := 1;
	end_pos := FirstDelimiter(delimiter,begin_pos,line);
	Result := TStringList.Create ;
	while end_pos <> -1 do
	begin
		Result.Add(Trim(copy(line,begin_pos,end_pos - begin_pos)));
		begin_pos := end_pos+1;
		end_pos := FirstDelimiter(delimiter,begin_pos,line);
	end;
end;

function FirstDelimiter(Delimiter: Char; Start: Integer; var S: string): Integer;
begin
	Result := start;
	while S[Result] <> #0 do
	begin
		if (S[Result] = Delimiter) then
			exit
		else
			Inc(Result);
	end;
  	Result := -1; //nie znalazl
end;

procedure Delay(MSecs: Longint);
var
	FirstTickCount, Now: Longint;
begin
	FirstTickCount := GetTickCount;
	repeat
		Application.ProcessMessages;
		Now := GetTickCount;
	until (Now - FirstTickCount >= MSecs) or (Now < FirstTickCount);
end;

procedure DrawTrRect(Canvas: TCanvas; const ARect: TRect; Color: TColor; Opacity: Integer);
type
	RGBARR = array [0..0] of TRGBQUAD;
	PRGBARR = ^RGBARR;
var
	prgb: PRGBARR;
	rgb, black: TRGBQUAD;
	i,j: Integer;
	tr: Integer;
	Clr: LongInt;
	bmp: TBitmap;
begin
	Clr := ColorToRGB(Color);
	rgb.rgbRed      := Clr and $000000FF;
	rgb.rgbGreen    := (Clr and $0000FF00) shr 8;
	rgb.rgbBlue     := (Clr and $00FFFFFF) shr 16;
	rgb.rgbReserved := 0;

	bmp:=TBitmap.Create;
	bmp.PixelFormat := pf32bit;
	bmp.Width := ARect.Right-ARect.Left;
	bmp.Height := ARect.Bottom-ARect.Top;
	bmp.Canvas.CopyRect(Rect(0,0,bmp.Width,bmp.Height), Canvas, ARect);

	FillChar(black, sizeof(black), 0);

	tr := 255 - Opacity;
	for i := 0 to bmp.Height-1 do
	begin
		prgb := PRGBARR(bmp.ScanLine[i]);
		for j := 0 to bmp.Width-1 do
		begin
			if not CompareMem(@(prgb[j]),@black,3) then
			begin
				with prgb[j] do
				begin
					rgbBlue  := (rgbBlue*tr  + rgb.rgbBlue*Opacity) div 255;
					rgbGreen := (rgbGreen*tr + rgb.rgbGreen*Opacity)div 255;
					rgbRed   := (rgbRed*tr   + rgb.rgbRed*Opacity) div 255;
				end;
			end;
		end;
	end;
	Canvas.Draw(ARect.Left, ARect.Top, bmp);
	bmp.Free;
end;

procedure ShowAndHide(PlaceHolder: TImage; FileName: String; DelayBetween: Integer);
var
	a: Integer;
	filbmp, tmpbmp: TBitmap;
begin
	filbmp:=TBitmap.Create;
	filbmp.LoadFromFile(FileName);
	tmpbmp := TBitmap.Create;

	for a:=12 downto 0 do
	begin
		tmpbmp.Assign(filbmp);
		DrawTrRect(tmpbmp.Canvas,Rect(0,0,tmpbmp.Width,tmpbmp.Height),clBlack,(a*20));
		PlaceHolder.Picture.Bitmap:=tmpbmp;
		PlaceHolder.Refresh;
	end;

	Delay(DelayBetween);

	for a:=0 to 12 do
	begin
		tmpbmp.Assign(filbmp);
		DrawTrRect(tmpbmp.Canvas,Rect(0,0,tmpbmp.Width,tmpbmp.Height),clBlack,(a*20));
		PlaceHolder.Picture.Bitmap:=tmpbmp;
		PlaceHolder.Refresh;
	end;

	tmpbmp.Free;
	filbmp.Free;
end;

procedure PerformExit;
begin
	if Application.MessageBox('Czy na pewno zakoñczyæ prezentacjê?','Pytanie...',MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2)=ID_NO then exit;
	Application.Terminate;
end;

end.
