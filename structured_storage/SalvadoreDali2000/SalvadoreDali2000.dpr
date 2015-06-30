program SalvadoreDali2000;

uses
  Forms,
  frmMain in 'frmMain.pas' {MainForm},
  frmView in 'frmView.pas' {ViewAlbum},
  frmNewEdit in 'frmNewEdit.pas' {NewEditForm},
  frmWhatNow in 'frmWhatNow.pas' {WhatNowForm},
  frmSettings in 'frmSettings.pas' {SettingsForm},
  pasProcs in 'pasProcs.pas',
  frmPreview in 'frmPreview.pas' {PreviewForm},
  frmProgress in 'frmProgress.pas' {ProgressForm},
  frmPhotoInfo in 'frmPhotoInfo.pas' {PhotoInfoForm},
  frmMyInputDialog in 'frmMyInputDialog.pas' {InputDialog},
  frmImport in 'frmImport.pas' {ImportForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Salvadore Dali 2000';
  Application.CreateForm(TViewAlbum, ViewAlbum);
  Application.CreateForm(TNewEditForm, NewEditForm);
  Application.CreateForm(TImportForm, ImportForm);
  Application.CreateForm(TWhatNowForm, WhatNowForm);
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TSettingsForm, SettingsForm);
  Application.CreateForm(TPreviewForm, PreviewForm);
  Application.CreateForm(TProgressForm, ProgressForm);
  Application.CreateForm(TPhotoInfoForm, PhotoInfoForm);
  Application.CreateForm(TInputDialog, InputDialog);
  Application.Run;
end.
