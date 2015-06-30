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
//                       Please see mysql_test.dpr for detailed information.
//
// -----------------------------------------------------------------------------------------------
//                       Please send questions, bug reports and suggestions
//                      regarding this code to: mfichtner@fichtner-meyer.com
// -----------------------------------------------------------------------------------------------
//                        This code is provided "as is" without express or
//                     implied warranty of any kind. Use it at your own risk.
// -----------------------------------------------------------------------------------------------

unit mysql_test_main;

// -----------------------------------------------------------------------------------------------
INTERFACE
// -----------------------------------------------------------------------------------------------

uses
	Windows, SysUtils, Forms, Classes, Controls, StdCtrls, Dialogs;

type
	TMain = class(TForm)
		Report: TMemo;
		Save: TSaveDialog;
		procedure FormActivate(Sender: TObject);
	end;

var
	Main: TMain;

// -----------------------------------------------------------------------------------------------
IMPLEMENTATION
// -----------------------------------------------------------------------------------------------

{$R *.DFM}

uses
	mysql, mysql_test_dialog;

const
	CRLF = #13#10;

procedure TMain.FormActivate(Sender: TObject);
var
	MySQL: PMYSQL;
	MyHost: string;
	MyPort: integer;
	MyUser: string;
	MyPass: string;
	MyTime: longword;
	MyComp: integer;
	MyDebg: boolean;
	MyShut: boolean;

	procedure Fail(Msg: string = '');
	begin
		// mysql_errno, mysql_error
		if Msg = '' then Msg := Format('%d - %s', [mysql_errno(MySQL), mysql_error(MySQL)]);
		raise Exception.Create(CRLF + CRLF + 'Fatal Error' + CRLF + '===========' + CRLF + Msg);
	end;

	procedure Versions;
	begin
		Report.Lines.Add(CRLF);
		Report.Lines.Add('Versions');
		Report.Lines.Add('========');
		// mysql_get_server_info
		Report.Lines.Add('Server: ' + mysql_get_server_info(MySQL));
		// mysql_get_client_info
		Report.Lines.Add('Client: ' + mysql_get_client_info);
		// mysql_get_proto_info
		Report.Lines.Add('Protocol: ' + intToStr(mysql_get_proto_info(MySQL)));
	end;

	procedure Statistics;
	var
		Stats: string;
		P: integer;
	begin
		Report.Lines.Add(CRLF);
		Report.Lines.Add('Statistics');
		Report.Lines.Add('==========');
		// mysql_stat
		Stats := mysql_stat(MySQL);
		P := pos('  ', Stats);
		while P > 0 do begin
			Report.Lines.Add(copy(Stats, 1, P - 1));
			Stats := copy(Stats, P + 2, MaxInt);
			P := pos('  ', Stats);
		end;
		Report.Lines.Add(Stats);
	end;

	procedure Processes;
	var
		Phantom: PMYSQL;
		ThreadId: longword;
		Processes: PMYSQL_RES;
		Process: PMYSQL_ROW;
		Fields: longword;
		Rows: my_ulonglong;
		Prefix: string;
		Index: longword;
	begin
		Report.Lines.Add(CRLF);
		Report.Lines.Add('Processes');
		Report.Lines.Add('=========');
		// mysql_init
		Phantom := mysql_init(nil);
		if Phantom = nil then Fail('Couldn''t init PMYSQL object');
		// mysql_connect
		if mysql_connect(Phantom, pChar(MyHost), pChar(MyUser), pChar(MyPass)) = nil then Fail;
		try
			// mysql_thread_id
			Report.Lines.Add(Format('* Created phantom process (Thread Id: %d).', [mysql_thread_id(Phantom)]));
			// mysql_thread_id
			ThreadId := mysql_thread_id(MySQL);
			// mysql_kill
			if mysql_kill(MySQL, ThreadId) <> 0 then Fail;
			Report.Lines.Add(Format('* Killed main process (Thread Id: %d).', [ThreadId]));
			// mysql_ping, mysql_error
			if mysql_ping(MySQL) <> 0 then Report.Lines.Add('* ' + mysql_error(MySQL) + '.');
			// mysql_ping
			if mysql_ping(MySQL) <> 0 then Fail;
			// mysql_thread_id
			Report.Lines.Add(Format('* Re-connected using Ping (Thread Id: %d).', [mysql_thread_id(MySQL)]));
			// mysql_list_processes
			Processes := mysql_list_processes(MySQL);
			if Processes = nil then Fail;
			try
				// mysql_num_fields
				Fields := mysql_num_fields(Processes);
				// mysql_num_rows
				Rows := mysql_num_rows(Processes);
				while Rows > 0 do begin
					// mysql_fetch_row
					Process := mysql_fetch_row(Processes);
					for Index := 0 to Fields - 1 do begin
						if Index = 0 then Prefix := CRLF + '+ ' else Prefix := '  - ';
						// mysql_fetch_field_direct
						Report.Lines.Add(Prefix + mysql_fetch_field_direct(Processes, Index).name + ': ' + Process[Index]);
					end;
					dec(Rows);
				end;
			finally
				// mysql_free_result
				mysql_free_result(Processes);
			end;
			// mysql_thread_id
			ThreadId := mysql_thread_id(Phantom);
			// mysql_kill
			if mysql_kill(Phantom, ThreadId) <> 0 then Fail;
			Report.Lines.Add('');
			Report.Lines.Add(Format('* Killed phantom process (Thread Id: %d).', [ThreadId]));
		finally
			//mysql_close
			mysql_close(Phantom);
		end;
	end;

	procedure DatabasesTablesAndFields;
	var
		Unique: string;
		DBName: string;
		TBName: string;
	const
		Spaces = '                                                                ';
		Dashes = '----------------------------------------------------------------';
		Indent = '  ';

		procedure ListCurrentDatabases;
		var
			Databases: PMYSQL_RES;
			Database: PMYSQL_ROW;
			DatabaseRows: my_ulonglong;
			Tables: PMYSQL_RES;
			Table: PMYSQL_ROW;
			TableRows: my_ulonglong;
		begin
			// mysql_list_dbs
			Databases := mysql_list_dbs(MySQL, nil);
			if Databases = nil then Fail;
			try
				// mysql_num_rows
				DatabaseRows := mysql_num_rows(Databases);
				Report.Lines.Add(Format('* Found %d existing databases on server:', [DatabaseRows]));
				while DatabaseRows > 0 do begin
					// mysql_fetch_row
					Database := mysql_fetch_row(Databases);
					// mysql_select_db
					if mysql_select_db(MySQL, Database[0]) <> 0 then Fail;
					// mysql_list_tables
					Tables := mysql_list_tables(MySQL, nil);
					if Tables = nil then Fail;
					try
						// mysql_num_rows
						TableRows := mysql_num_rows(Tables);
						Report.Lines.Add(CRLF + Format('  + %s (%d tables)', [Database[0], TableRows]));
						while TableRows > 0 do begin
							// mysql_fetch_row
							Table := mysql_fetch_row(Tables);
							Report.Lines.Add('    - ' + Table[0]);
							dec(TableRows);
						end;
					finally
						// mysql_free_result
						mysql_free_result(Tables);
					end;
					dec(DatabaseRows);
				end;
			finally
				// mysql_free_result
				mysql_free_result(Databases);
			end;
		end;

		procedure CreateTestDatabase;
		var
			Fields: PMYSQL_RES;
			FieldCount: longword;
			Field: PMYSQL_FIELD;
			Buffer, Offset: longword;
			I: integer;
			J: integer;
			Name: string;
			Escaped: array[0..32] of char;
			Value: word;
			Query: string;
		const
			FalseTrue: array[boolean] of string = ('false', 'true');
		begin
			// mysql_create_db
			if mysql_create_db(MySQL, pChar(DBName)) <> 0 then Fail;
			Report.Lines.Add('');
			Report.Lines.Add('* Created database "' + DBName + '".');
			// mysql_select_db
			if mysql_select_db(MySQL, pChar(DBName)) <> 0 then Fail;
			// mysql_query
			if mysql_query(MySQL, pChar('CREATE TABLE ' + TBName + ' (id SMALLINT (3) ZEROFILL NOT NULL AUTO_INCREMENT, string CHAR (16) NOT NULL, value TINYINT UNSIGNED DEFAULT 1 NULL, PRIMARY KEY (id), INDEX (string))')) <> 0 then Fail;
			// mysql_list_fields
			Fields := mysql_list_fields(MySQL, pChar(TBName), nil);
			if Fields = nil then Fail;
			try
				Offset := $ffffffff;
				// mysql_num_fields
				FieldCount := mysql_num_fields(Fields);
				Report.Lines.Add('');
				Report.Lines.Add(Format('* Created table "%s" with %d fields:', [TBName, FieldCount]));
				for I := 0 to FieldCount - 1 do begin
					// mysql_field_tell
					Buffer := mysql_field_tell(Fields);
					// mysql_fetch_field
					Field := mysql_fetch_field(Fields);
					// IS_PRI_KEY
					if IS_PRI_KEY(Field.flags) then Offset := Buffer;
					Report.Lines.Add(CRLF + '  + ' + Field.name);
					// IS_PRI_KEY
					Report.Lines.Add('    - IS_PRI_KEY = ' + FalseTrue[IS_PRI_KEY(Field.flags)]);
					// IS_NOT_NULL
					Report.Lines.Add('    - IS_NOT_NULL = ' + FalseTrue[IS_NOT_NULL(Field.flags)]);
					// IS_BLOB
					Report.Lines.Add('    - IS_BLOB = ' + FalseTrue[IS_BLOB(Field.flags)]);
					// IS_NUM
					Report.Lines.Add('    - IS_NUM = ' + FalseTrue[IS_NUM(Field._type)]);
				end;
				if Offset <> $ffffffff then begin
					// mysql_field_seek
					mysql_field_seek(Fields, Offset);
					// mysql_fetch_field
					Field := mysql_fetch_field(Fields);
					Report.Lines.Add('');
					Report.Lines.Add(Indent + 'Field "' + Field.name + '" is the primary index.');
				end;
			finally
				// mysql_free_result
				mysql_free_result(Fields);
			end;
			randomize;
			for I := 1 to 128 do begin
				Name := '';
				for J := 1 to 8 + random(9) do appendStr(Name, chr(ord('!') + random(ord('~') - ord('!') + 1)));
				// mysql_escape_string
				mysql_escape_string(Escaped, pChar(Name), length(Name));
				Value := random(256);
				// mysql_query
				if mysql_query(MySQL, pChar(Format('INSERT INTO %s (string, value) VALUES ("%s", %d)', [TBName, Escaped, Value]))) <> 0 then Fail;
			end;
			Report.Lines.Add('');
			// mysql_insert_id
			Report.Lines.Add(Format('* Populated table "%s" with %d rows of random data.', [TBName, mysql_insert_id(MySQL)]));
			Query := 'DELETE FROM ' + TBName + ' WHERE value < 32';
			// mysql_query
			if mysql_query(MySQL, pChar(Query)) <> 0 then Fail;
			Report.Lines.Add('');
			// mysql_affected_rows
			Report.Lines.Add(Format('* Deleted %d rows from table "%s" using SQL query', [mysql_affected_rows(MySQL), TBName]));
			Report.Lines.Add(Indent + '"' + Query + '".');
		end;

		procedure QueryTestTable1;
		var
			Query: string;
			Result: PMYSQL_RES;
			Line: string;
			Width: integer;
			Field: PMYSQL_FIELD;
			FieldCount: longword;
			Lengths: PMYSQL_LENGTHS;
			Row: PMYSQL_ROW;
			I: integer;
			Buffer: string;
		const
			Limit = 10;
		begin
			Query := Format('SELECT * FROM %s WHERE value >= 128 ORDER BY value LIMIT %d', [TBName, Limit]);
			// mysql_query
			if mysql_query(MySQL, pChar(Query)) <> 0 then Fail;
			// mysql_use_result
			Result := mysql_use_result(MySQL);
			if Result = nil then Fail;
			try
				Report.Lines.Add('');
				Report.Lines.Add(Format('* Selected %d rows (max.) from table "%s" using SQL query', [Limit, TBName]));
				Report.Lines.Add(Indent + '"' + Query + '":');
				Report.Lines.Add('');
				Line := '';
				Width := 0;
				// mysql_fetch_field
				Field := mysql_fetch_field(Result);
				while Field <> nil do begin
					if Line <> '' then begin
						appendStr(Line, ' ');
						inc(Width);
					end;
					appendStr(Line, copy(Field.name + Spaces, 1, Field.length));
					inc(Width, Field.length);
					// mysql_fetch_field
					Field := mysql_fetch_field(Result);
				end;
				Report.Lines.Add(Indent + Line);
				Report.Lines.Add(Indent + copy(Dashes, 1, Width));
				// mysql_num_fields
				FieldCount := mysql_num_fields(Result);
				// mysql_fetch_row
				Row := mysql_fetch_row(Result);
				while Row <> nil do begin
					Line := '';
					// mysql_fetch_lengths
					Lengths := mysql_fetch_lengths(Result);
					if Lengths = nil then Fail;
					for I := 0 to FieldCount - 1 do begin
						if Line <> '' then appendStr(Line, ' ');
						SetString(Buffer, Row[I], Lengths[I]);
						// mysql_fetch_field_direct
						appendStr(Line, copy(Buffer + Spaces, 1, mysql_fetch_field_direct(Result, I).length));
					end;
					Report.Lines.Add(Indent + Line);
					// mysql_fetch_row
					Row := mysql_fetch_row(Result);
				end;
				// mysql_eof
				if mysql_eof(Result) = 0 then Fail;
			finally
				// mysql_free_result
				mysql_free_result(Result);
			end;
		end;

		procedure AlterTestTable;
		var
			Query1: string;
			Query2: string;
			Info: pChar;
		begin
			Query1 := Format('ALTER TABLE %s MODIFY value TINYINT UNSIGNED NOT NULL', [TBName]);
			Query2 := Format('ALTER IGNORE TABLE %s ADD UNIQUE (value)', [TBName]);
			// mysql_query
			if mysql_query(MySQL, pChar(Query1)) <> 0 then Fail;
			// mysql_query
			if mysql_query(MySQL, pChar(Query2)) <> 0 then Fail;
			// mysql_info
			Info := mysql_info(MySQL);
			if Info = nil then Fail;
			Report.Lines.Add('');
			Report.Lines.Add(Format('* Altered table "%s" using SQL queries', [TBName]));
			Report.Lines.Add(Indent + '"' + Query1 + '" and');
			Report.Lines.Add(Indent + '"' + Query2 + '":');
			Report.Lines.Add('');
			Report.Lines.Add(Indent + Info);
		end;

		procedure QueryTestTable2;
		var
			Query: string;
			Result: PMYSQL_RES;
			Line: string;
			Width: integer;
			Fields: PMYSQL_FIELDS;
			FieldCount: longword;
			Row: PMYSQL_ROW;
			RowCount: my_ulonglong;
			I: integer;
			J: integer;
			Offset: MYSQL_ROW_OFFSET;
		begin
			Query := 'SELECT * FROM ' + TBName + ' WHERE length(string) = 16 ORDER BY id';
			// mysql_real_query
			if mysql_real_query(MySQL, pChar(Query), length(Query)) <> 0 then Fail;
			// mysql_store_result
			Result := mysql_store_result(MySQL);
			if Result = nil then Fail;
			try
				Report.Lines.Add('');
				// mysql_num_rows
				Report.Lines.Add(Format('* Selected %d rows from table "%s" using SQL query', [mysql_num_rows(Result), TBName]));
				Report.Lines.Add(Indent + '"' + Query + '":');
				Report.Lines.Add('');
				Line := '';
				Width := 0;
				// mysql_fetch_fields
				Fields := mysql_fetch_fields(Result);
				// mysql_field_count
				FieldCount := mysql_field_count(MySQL);
				for I := 0 to FieldCount - 1 do begin
					if Line <> '' then begin
						appendStr(Line, ' ');
						inc(Width);
					end;
					appendStr(Line, copy(Fields[I].name + Spaces, 1, Fields[I].length));
					inc(Width, Fields[I].length);
				end;
				Report.Lines.Add(Indent + Line);
				Report.Lines.Add(Indent + copy(Dashes, 1, Width));
				// mysql_num_rows
				RowCount := mysql_num_rows(Result);
				Offset := nil;
				for I := RowCount - 1 downto 0 do begin
					// mysql_data_seek
					mysql_data_seek(Result, I);
					// mysql_row_tell
					if I = (RowCount - 1) div 2 then Offset := mysql_row_tell(Result);
					// mysql_fetch_row
					Row := mysql_fetch_row(Result);
					Line := '';
					for J := 0 to FieldCount - 1 do begin
						if Line <> '' then appendStr(Line, ' ');
						appendStr(Line, copy(Row[J] + Spaces, 1, Fields[J].length));
					end;
					Report.Lines.Add(Indent + Line);
				end;
				if Offset <> nil then begin
					// mysql_row_seek
					mysql_row_seek(Result, Offset);
					// mysql_fetch_row
					Row := mysql_fetch_row(Result);
					Report.Lines.Add('');
					// mysql_fetch_field_direct
					Report.Lines.Add(Indent + Format('The %s of the row closest to the' + CRLF +
						Indent + 'middle of this selection is %s ...', [mysql_fetch_field_direct(Result, 0).name, Row[0]]));
				end;
			finally
				// mysql_free_result
				mysql_free_result(Result);
			end;
		end;

		procedure DropTestDatabase;
		begin
			// mysql_drop_db
			if mysql_drop_db(MySQL, pChar(DBName)) <> 0 then Fail;
			Report.Lines.Add('');
			Report.Lines.Add('* Dropped database "' + DBName + '".');
		end;

	begin
		Report.Lines.Add(CRLF);
		Report.Lines.Add('Databases, Tables and Fields');
		Report.Lines.Add('============================');
		ListCurrentDatabases;
		Unique := LowerCase(intToHex(GetTickCount, 8));
		DBName := 'db_' + Unique;
		TBName := 'tb_' + Unique;
		CreateTestDatabase;
		QueryTestTable1;
		AlterTestTable;
		QueryTestTable2;
		DropTestDatabase;
	end;

	procedure Miscellaneous;
	var
		ThreadId: longword;
	begin
		Report.Lines.Add(CRLF);
		Report.Lines.Add('Miscellaneous');
		Report.Lines.Add('=============');
		// mysql_reload
		if mysql_reload(MySQL) <> 0 then Fail;
		Report.Lines.Add('* Asked server to reload permission tables.');
		if MyDebg then begin
			// mysql_dump_debug_info
			if mysql_dump_debug_info(MySQL) <> 0 then Fail;
			Report.Lines.Add('* Asked server to write debug info to log.');
		end else begin
			Report.Lines.Add('* Skipped asking server to write debug info to log.');
		end;
		if MyShut then begin
			// mysql_shutdown
			if mysql_shutdown(MySQL) <> 0 then Fail;
			Report.Lines.Add('* Asked server to shut down.');
		end else begin
			Report.Lines.Add('* Skipped asking server to shut down.');
			// mysql_thread_id
			ThreadId := mysql_thread_id(MySQL);
			// mysql_kill
			if mysql_kill(MySQL, ThreadId) <> 0 then Fail;
			Report.Lines.Add(Format('* Killed main process (Thread Id: %d).', [ThreadId]));
		end;
	end;

begin
	SetForegroundWindow(Handle);
	Screen.Cursor := crHourGlass;
	if Dialog.ShowModal = mrOk then begin
		with Dialog do begin
			MyHost := EditHost.Text;
			MyPort := strToIntDef(EditPort.Text, MYSQL_PORT);
			MyUser := EditUser.Text;
			MyPass := EditPass.Text;
			MyTime := strToIntDef(EditTime.Text, 30);
			MyComp := integer(CheckComp.Checked) * CLIENT_COMPRESS;
			MyDebg := not CheckDebg.Checked;
			MyShut := not CheckShut.Checked;
		end;
		try
			Report.Lines.Add(CRLF);
			Report.Lines.Add(FormatDateTime('yyyy-mm-dd hh:mm:ss', Now) + ' - Starting Test Suite ...');
			// mysql_init
			MySQL := mysql_init(nil);
			if MySQL = nil then Fail('Couldn''t init PMYSQL object');
			try
				// mysql_options
				if mysql_options(MySQL, MYSQL_OPT_CONNECT_TIMEOUT, @MyTime) <> 0 then Fail;
				// mysql_real_connect
				if mysql_real_connect(MySQL, pChar(MyHost), pChar(MyUser), pChar(MyPass), nil, MyPort, nil, MyComp) = nil then Fail;
				// mysql_get_host_info
				Report.Lines.Add('');
				Report.Lines.Add('Connected to MySQL server at ' + mysql_get_host_info(MySQL));
				Versions;
				Statistics;
				Processes;
				DatabasesTablesAndFields;
				Miscellaneous;
			finally
				// mysql_close
				mysql_close(MySQL);
			end;
			Report.Lines.Add(CRLF);
			Report.Lines.Add(FormatDateTime('yyyy-mm-dd hh:mm:ss', Now) + ' - Test Suite completed succesfully!');
			if Save.Execute then Report.Lines.SaveToFile(Save.FileName);
		except
			Report.Lines.Add(Exception(ExceptObject).Message);
		end;
	end else Close;
	Screen.Cursor := crDefault;
end;

end.
