// tabs = 2
// -----------------------------------------------------------------------------------------------
//
//                      MySQL Client API for Delphi 4 and later - Test Suite
//
//                      Copyright © 1999, 2000 Medienagentur Fichtner & Meyer
//                                  Written by Matthias Fichtner
//
// -----------------------------------------------------------------------------------------------
//
// This application was written in order to test the mysql.pas unit. It calls each and every
// function in the MySQL-Win32 client library libmySQL.dll - including those functions that are
// depricated in MySQL 3.22.24. It also tests all available macros. The application doesn't do
// anything useful (in fact it does some really stupid things ;-), its only purpose is to verify
// the proper definition of all types, constants, functions and procedures in mysql.pas.
//
// In order to run this application, you need to have TCP/IP access to a MySQL server, and you
// need to have access to an account that has the full set of rights available on that server.
// And of course you need a copy of libmySQL.dll (version 3.22.24 or later), the client library
// that comes with the MySQL-Win32 distribution.
//
// -----------------------------------------------------------------------------------------------
//               The latest release of mysql_test.dpr will always be available from
//            the mysql.pas distribution site at: http://www.fichtner.net/delphi/mysql/
// -----------------------------------------------------------------------------------------------
//                       Please send questions, bug reports and suggestions
//                      regarding this code to: mfichtner@fichtner-meyer.com
// -----------------------------------------------------------------------------------------------
//                        This code is provided "as is" without express or
//                     implied warranty of any kind. Use it at your own risk.
// -----------------------------------------------------------------------------------------------

program mysql_test;

uses
	Forms,
	mysql_test_main in 'mysql_test_main.pas' {Main},
	mysql_test_dialog in 'mysql_test_dialog.pas' {Dialog};

{$R *.RES}

begin
	Application.Initialize;
	Application.Title := 'mysql.pas for Delphi 4 and later';
	Application.CreateForm(TMain, Main);
	Application.CreateForm(TDialog, Dialog);
	Application.Run;
end.
