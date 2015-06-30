unit Splash;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  PicShow, ExtCtrls;

type
  TSplashForm = class(TForm)
    PicShow: TPicShow;
  private
    procedure Initialize;
  public
    class function Execute: TSplashForm;
  end;

implementation

{$R *.DFM}

procedure TSplashForm.Initialize;
var
  Background: TBitmap;
  DC: HDC;
begin
  // First we set position of the form on the center of desktop.
  // We set Position property of the form to poDesigned because we
  // need the form's position before showing it.
  Left := (Screen.DesktopWidth - Width) div 2;
  Top := (Screen.DesktopHeight - Height) div 2;
  // We create a bitmap object for storing the screen behind the form.
  Background := TBitmap.Create;
  Background.Width := Width;
  Background.Height := Height;
  // We get device context of the screen and copy the screen behind the form
  // to the created bitmap.
  DC := GetDC(0);
  try
    BitBlt(Background.Canvas.Handle, 0, 0, Width, Height, DC, Left, Top, SRCCOPY);
  finally
    ReleaseDC(0, DC);
  end;
  // We set Backgrund property of PicShow to captured screen image. By this trick,
  // the form will seem as transparent.
  PicShow.BgPicture.Assign(Background);
  // To reduce chance of flickering (only when PicShow is used as non-windowed
  // control we may sometime have flickers) we set background color of the form
  // to color of upper left pixel of the captured screen.
  Color := Background.Canvas.Pixels[0,0];
  // We don't need the bitmap object, then we free it.
  Background.Free;
  // Finally we select a transition effect as random.
  Randomize;
  PicShow.Style := Random(High(TShowStyle))+1;
end;

class function TSplashForm.Execute: TSplashForm;
begin
  Result := TSplashForm.Create(nil);
  with Result do
  begin
    // Makes PicShow seem as transparent.
    Initialize;
    // Displays the splash form.
    Show;
    // To prevent flickering, updates the form immediately.
    Update;
    // Starts image transition. For splash forms don't use PicShow as Threaded.
    // When threaded is true, transition will start after activation of main form.
    PicShow.Execute;
    // Waits one second before continuing the rest of application. If your
    // applications creates lot of forms you don't need to wait here, the splash
    // will remain on the screen until creating the last form of the application.
    Sleep(1000);
  end;
end;

end.
