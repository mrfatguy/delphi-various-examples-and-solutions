// tabs = 2
// -----------------------------------------------------------------------------------------------
//
//                          MD5 Message-Digest for Delphi 4 - Test Driver
//
//                      Copyright © 1997-1999 Medienagentur Fichtner & Meyer
//                                  Written by Matthias Fichtner
//
// -----------------------------------------------------------------------------------------------
//
// This application is a GUI implementation of the Test Driver described in RFC 1321. You can use
// it to test the MD5String and MD5File functions, to view the results of the MD5 test suite as
// described in RFC 1321 and to perform the time trial described in RFC 1321.
//
// -----------------------------------------------------------------------------------------------
//                The latest release of md5_test.dpr will always be available from
//              the md5.pas distribution site at: http://www.fichtner.net/delphi/md5/
// -----------------------------------------------------------------------------------------------
//                       Please send questions, bug reports and suggestions
//                      regarding this code to: mfichtner@fichtner-meyer.com
// -----------------------------------------------------------------------------------------------
//                        This code is provided "as is" without express or
//                     implied warranty of any kind. Use it at your own risk.
// -----------------------------------------------------------------------------------------------

program md5_test;

uses
	Forms,
	md5_test_main in 'md5_test_main.pas' {Main};

{$R *.RES}

begin
	Application.Initialize;
	Application.Title := 'md5.pas for Delphi 4';
	Application.CreateForm(TMain, Main);
	Application.Run;
end.

