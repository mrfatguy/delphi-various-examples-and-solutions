unit main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Buttons, ComCtrls, StdCtrls,shellapi, Menus,filectrl,
  imglist;




(*
 This is a simple sample that shows how to work with a Windows95 - like DriveAndFolder-
 Combobox and a FilelistView that looks better than the boring TFilelistbox.
 The app looks a bit like a folder in the Explorer, but it isn't a modal dialog.
 Therefore it may give you some ideas for a "modern" file/directory-choice in a corner
 of your forms (e.g. in a fileviewer).
 If you want to use it to create components, please do (and maybe send me the source) !!!

 Limitations:
 This sample cannot show the complete system's tree (with Recycle Bin, Control Panel...),
 it only shows the drives, folders and files.
 The performance is rather low on folders with many (more than 200) files in it.
 For a complete Sytem-Listview you have to use the Shlobj-Unit in Delphi 2.02 or
 the PD-Unit Shellobj. But for me, this units like C++ - code, and I have big problems to
 understand them.
 And perhaps you may look for the Components "TSystemTreeView" , "TSystemListView" and so
 on from Brad Stowers (see below).

 Disclaimer:
 This code is Freeware. It is on you what you will do with it, modify it, delete it
 (but only on your own PC), enhance it or sell it (haha).
 I give no guaranties about the functionality of this code or anything else.
 I will not be responsable on errors, lost of anything and so on; it is just free for
 everyone.

 And if there are any bug reports, suggestions or comments, please contact me at
     MirBir.St@T-Online.de


     Markus Stephany
     MirBir.St@T-Online.de
     http://home.t-online.de/home/MirBir.St/

     Rev 0.01 / 01-11-97
                          *)

  type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    files: TListView;
    ComboBox1: TComboBox;
    fstate: TStatusBar;
    SpeedButton4: TSpeedButton;
    menu: TPopupMenu;
    menuitem: TMenuItem;
    ThiscouldbeanExplorerlikemenu1: TMenuItem;
    Label1: TLabel;
    flabel: TLabel;
    ch: TCheckBox;
    Image1: TImage;
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure setfiles;
    procedure setdrives;
    procedure setcolumnforfiles;
    procedure setcolumnfordrives;
    procedure getinfo(fn:tfilename;var i:tshfileinfo);
    procedure SpeedButton4Click(Sender: TObject);
    procedure filesColumnClick(Sender: TObject; Column: TListColumn);
    procedure filesDblClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure filesKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure menuitemClick(Sender: TObject);
    procedure menuPopup(Sender: TObject);
    procedure ComboBox1update;
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox1DrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure filesClick(Sender: TObject);
    procedure chClick(Sender: TObject);
    procedure Image1Click(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form1: TForm1;
  smalls,larges : timagelist; // containers for the system's imagelist for shell-icons
  path          : tfilename;  // currently displayed path
  drives        : set of 0..25; // Flags for drives;


function getkb(c:integer):string;
function getsize(c,typ:integer):string;
function getmod(a:tfiletime):string;
procedure showproperties (a,b:string); // show a file's properties
function getcount(a:char;b:string):integer; // enumerate the a's in b
function numpos(a:char;b:string;c:integer):integer; // get the c'st position of a in b

implementation

{$R *.DFM}

function numpos(a:char;b:string;c:integer):integer; // get the c'st position of a in b
var it,az:integer;
begin
     result:=maxint;
     if length(b) > 0 then begin;
        az:=0;
        for it:=1 to length(b) do
            if b[it] = a then begin
               inc (az);
               if az = c then begin
                  result:=it;
                  exit;
               end;
            end;
     end;
end; // End numpos

function getcount(a:char;b:string):integer; // enumerate the a's in b
var it : integer;
begin
     result := 0;
     if length(b) > 0 then
        for it := 1 to length(b) do
            if b[it] = a then inc(result);
end; // End getpos

function SortProc(I1, I2: TListItem; Para: integer): integer; stdcall;
// Sorting ListItems depending subitem ( Index in Para )
var c1,c2,s1,s2:string;
begin
     c1:=ansiuppercase(i1.caption);
     c2:=ansiuppercase(i2.caption);
     if i1.subitems.count <= para then s1:='' else s1:=i1.subitems[para];
     if i2.subitems.count <= para then s2:='' else s2:=i2.subitems[para];
     if s2 > s1 then result:=-1
     else if s1 > s2 then result:= 1
     else if s1 = s2 then begin
        if c2 > c1 then result:=-1;
        if c1 > c2 then result:= 1;
     end;
end; // End sortproc

procedure showproperties (a,b:string); // showing a file's properties
var sr : tsearchrec;
begin
     if b = 'drive' then
        showmessage('This is a drive.'+#13#10+
        'Doubleclick this item to browse its root-directory.')
     else if b = 'dir' then
        showmessage('This is a directory.'+#13#10+
        'Doubleclick this item to browse .')
     else begin
       fillchar(sr,sizeof(tsearchrec),0);
       if findfirst(a,faanyfile,sr) <> 0 then
          showmessage ('Sorry, but the file doesn''t exist ?!')
       else
           showmessage ('This is the file called '+a+#13#10+
                        'Its size is '+inttostr(sr.size)+' Byte(s)');
       findclose(sr);
     end;
       // you can find many properties for the file in the members of the
       // sr - record and especially in the finddata-structure
       // Look at the Delphi-help for "TSearchRec" and "win32_find_data"
       // for more information

end; // End showproperties


function getkb(c:integer):string;
// This functions converts a integer number into a Kilo/Mega-String

begin
     result:='';
     if c < 0 then exit;
     if c < 1024 then
        result:=inttostr(c)+' Byte(s)'
     else if c < (1024*1024) then
        result:=floattostrf(c / 1024,ffgeneral,3,2)+' KByte'
     else
         result:=floattostrf(c / (1024*1024),ffgeneral,3,2)+' MByte';
end; // End getKB

function getsize(c,typ:integer):string;
// This function creates a string from the filesize like Explorer
begin
     if (c < 1024) and (c > 0) then c := 1024;
     result := inttostr(c div 1024)+' KB';
     if (typ and fadirectory) > 0 then result := '';// Folders have "no" Size
end;  // End getsize

function getmod(a:tfiletime):string;
// This function retrieves the last time, the given file was written to disk
var mtm : tsystemtime;
    at : tfiletime;
    ds,ts:shortstring;
begin
     // Time must get converted, else there is an error of one hour
     // Does anybody know what this function does ?
     // Maybe something like summertime/wintertime (or what you call it out of Germany) ?
     filetimetolocalfiletime(a,at);

     filetimetosystemtime(at,mtm);
     SetLength(ds, GetDateFormat(LOCALE_USER_DEFAULT, 0, @mtm, NIL,
                                               @ds[1], 255) - 1);
     SetLength(ts, GetTimeFormat(LOCALE_USER_DEFAULT, time_noseconds, @mtm, NIL,
                                               @ts[1], 255)  - 1);
     Result:=ds+'  '+ts;
end; // End getmod

procedure tform1.setcolumnforfiles;
// Set the listview's column-headers to display file-properties if vsreport
begin
     with files.columns do begin
          clear;
          with add do begin
               caption := 'Name';
               width := columnheaderwidth;
               alignment := taleftjustify;
          end;
          with add do begin
               caption := 'Size';
               width := columnheaderwidth;
               alignment := tarightjustify;
          end;
          with add do begin
               caption := 'Type';
               width := columnheaderwidth;
               alignment := taleftjustify;
          end;
          with add do begin
               caption := 'Modified';
               width := columnheaderwidth;
               alignment := taleftjustify;
          end;
     end;
END;  // End setcolumnforfiles

procedure tform1.setcolumnfordrives;
// Set the listview's column-headers to display drive-properties if vsreport
begin
     with files.columns do begin
          clear;
          with add do begin
               caption := 'Name';
               width := columnheaderwidth;
               alignment := taleftjustify;
          end;
          with add do begin
               caption := 'Type';
               width := columnheaderwidth;
               alignment := taleftjustify;
          end;
          with add do begin
               caption := 'Disksize';
               width := columnheaderwidth;
               alignment := tarightjustify;
          end;
          with add do begin
               caption := 'Free Space';
               width := columnheaderwidth;
               alignment := taleftjustify;
          end;
     end;
END; // End setcolumnfordrives

procedure tform1.setdrives; // shows the system's drives in the listview
var ct : byte;
    new : tlistitem;
    info : tshfileinfo;
    drv : string;
const drt : array [0..6] of string = (
      'Unknown',
      '=======',
      'Floppy Disk',
      'Local Drive',
      'Network Drive',
      'CD-Rom Drive',
      'RAM-Disk');
begin
     speedbutton1.enabled:=false;// You can't go above in the hierarchy
     files.items.beginupdate; // makes it faster
     files.items.clear;
     setcolumnfordrives;// in vsReport, you need other infos for drives than for files
     screen.cursor := crhourglass;
     for ct := 0 to 25 do
         // get all the drives;
         if ct in drives then begin
            new:=files.items.add;
            drv:=char(ct+ord('A'))+':\'; // Make a drive' root path from ct
            getinfo (drv,info); // get shell information about this drive
            new.caption:=info.szdisplayname;
            new.imageindex:=info.iicon;
            new.subitems.add(drt[getdrivetype(pchar(drv))]);// I am sorry, but i don't
                                                            //  know how to get the
                                                            // windows-drive-type-description
            new.subitems.add(getkb(disksize(ct+1)));
            new.subitems.add(getkb(diskfree(ct+1)));
            new.subitems.add('drive');//Determ. the item's type
            new.subitems.add(drv);// for the OnDblClick-Event (the folder's name "X:\")
         end;
     files.items.endupdate;
     screen.cursor:=crdefault;
     fstate.panels[0].text:=inttostr(files.items.count)+' Object(s)';
     fstate.panels[1].text:='';
     combobox1update;
end;  // End setdrives


procedure tform1.setfiles; // shows the files and folders in the listview
var ct  : integer;
    res : word;
    rec : tsearchrec;
    new : tlistitem;
    info : tshfileinfo;
    oldstyle : tviewstyle;
begin
     caption:='Sample Application for Win95 style filelistview ['+path+']';
     // Are we on Desktop ?
     if path = 'Drives' then begin  // If we need to display the drives
        setdrives;
     end
     else begin
          speedbutton1.enabled:=true;// If we are not displaying the drives, we can
                                     // go a step back in the root
          files.items.beginupdate;

          // i don't know why, but setting the viewstyle to vslist
          // speeds up the enumerating of contents

          oldstyle:=files.viewstyle;
          files.viewstyle:=vslist;

          files.items.clear;
          screen.cursor := crhourglass;
          if path[length(path)]<>'\'then path:=path+'\'; // add a slash when we need
          {Adding all Directories and files}
           fillchar(rec,sizeof(tsearchrec),0);
           ct:=0;
           res:=findfirst(path+'*.*',faanyfile-favolumeid,rec);// no volume id's
           while res = 0 do begin // if the result is <> 0, the no (more)  file was found
                // Skipping the directories '.' and '..'
                 if not (((rec.attr and fadirectory) > 0) and ((rec.name = '.') or (rec.name
                    = '..'))) then begin
                    // ch.checked : Show only folders
                    if (not ch.checked) or ((rec.attr and fadirectory) > 0) then begin
                       new:=files.items.add;
                       getinfo (path+rec.name,info); // get shell information about this file
                       new.caption:=info.szdisplayname; // the file's caption in Explorer
                       new.imageindex:=info.iicon; // the file's icon in Explorer
                       new.subitems.add(getsize(rec.size,rec.attr));
                       new.subitems.add(info.sztypename); // the File-type
                       new.subitems.add(getmod(rec.finddata.ftlastwritetime)); // the file's
                                                                // last modification-time
                       if (rec.attr and fadirectory)> 0 then
                          new.subitems.add('dir')    // this is a directory
                       else
                           new.subitems.add('file');  // this file is a file  :-)
                           // that was for making it easier to decide whether file or directory
                           {I know, this way isn't very nice, but it works}

                       new.subitems.add(path+rec.name); // full expanded filename
                       inc(ct,rec.size); // counting the filesizes
                    end;
                 end;
                 res:=findnext(rec);
           end;
           findclose(rec); // always close a findfirst/next under Windows 95 !!!!
           files.customsort(@sortproc,3);// sorts directories and files
           files.viewstyle:=oldstyle;
           files.items.endupdate;
           fstate.panels[0].text := inttostr(files.items.count)+' Object(s)';
           fstate.panels[1].text := getkb(ct);
           screen.cursor:=crdefault;
           combobox1update;  // sets the DriveAndFolderCombobox
     end;
end; // End setfiles

procedure Createimages; // Sets the system's imagelists for the listview
var
 SysIL: uint;
 SFI: TSHFileInfo;
begin
{ Credits to Brad Stowers bstowers@pobox.com or 72733,3374 on CompuServe.}
{ I ripped most of the shell-stuff of this app from his components. But because I'm quite
  worry about the C-design of shellapi and shlobj, i use only the shell-routines i really
  need for this program. Maybe a few other Delphi-programmers have also trouble with ^TIID...}


  { Create the image list.  We don't really "create" one.  We fool SHGetFileInfo into
    giving us the system's image list and use it's handle.  You'd think it would be
    easier to get the handle of the system image list....                              }

  Larges := TImageList.Create(form1);
  SysIL := SHGetFileInfo('', 0, SFI, SizeOf(SFI), SHGFI_SYSICONINDEX or SHGFI_LARGEICON);
  if SysIL <> 0 then begin
    Larges.Handle := SysIL;
    Larges.ShareImages := TRUE;  // DON'T FREE THE SYSTEM IMAGE LIST!!!!!  BAD IDEA (tm)!
  end;
  Smalls := TImageList.Create(form1);
  SysIL := SHGetFileInfo('', 0, SFI, SizeOf(SFI), SHGFI_SYSICONINDEX or SHGFI_SMALLICON);
  if SysIL <> 0 then begin
    Smalls.Handle := SysIL;
    Smalls.ShareImages := TRUE;  // DON'T FREE THE SYSTEM IMAGE LIST!!!!!  BAD IDEA (tm)!
  end;

  { Setting the imagelists for the ListView}

  form1.files.smallimages := smalls;
  form1.files.largeimages := larges;

end; // End createimages

procedure TForm1.getinfo(fn:tfilename;var i:tshfileinfo); // gets shell info about a file / folder
begin
     shgetfileinfo(pchar(fn),0,i,
     sizeof(tshfileinfo),
     SHGFI_SYSICONINDEX or SHGFI_ICON or shgfi_displayname or shgfi_typename or shgfi_smallicon)
end;  // End getinfo


 // Changing the listview's viewstyle
procedure TForm1.SpeedButton2Click(Sender: TObject);
begin
     files.viewstyle := vsicon;
end;
procedure TForm1.SpeedButton3Click(Sender: TObject);
begin
     files.viewstyle := vslist;
end;
procedure TForm1.SpeedButton4Click(Sender: TObject);
begin
     files.viewstyle:=vsreport;
end;
 // End of changing the viewstyle


procedure TForm1.FormCreate(Sender: TObject);
begin
     integer(drives):=getlogicaldrives;// What drives do we have on this PC
     createimages; // sets the imagelists for the list view
     path := extractfilepath(application.exename);
     setfiles; // Updates the listview;
     setcolumnforfiles; // and the combobox
end; // End formcreate

procedure TForm1.FormDestroy(Sender: TObject);
begin
     smalls.free; // free the imagelists
     larges.free;
end; // End formdestroy


procedure TForm1.filesColumnClick(Sender: TObject; Column: TListColumn);
begin
     // Here you may insert a call to a customsortproc for the listview to sort the items
     // depending on which column you have clicked:
     showmessage( 'This could start a sorting routine.');
end;  // End filecolumnclick

procedure TForm1.filesDblClick(Sender: TObject);
// a listitem has been doubleclicked. Now open the drive or folder or show the file's props
begin
     if files.selected = nil then exit;// No item was selected
     // directory,drive or file ?
     if files.selected.subitems[3] = 'dir' then begin
        path := files.selected.subitems[4];
        setfiles;
     end else
     if files.selected.subitems[3] = 'drive' then begin

        if not directoryexists(files.selected.subitems[4]) then
           showmessage('No Access to '+files.selected.caption+' .')
        else begin

             path := files.selected.subitems[4];
             setcolumnforfiles; // We have to change the columnheaders
             setfiles;
        end;
     end else
     // show properties for a file
     showproperties(files.selected.subitems[4],files.selected.subitems[3]);
end;  // End filesdblclick

procedure TForm1.SpeedButton1Click(Sender: TObject); // let's go a step back in the hierarchy
begin
     // going one step back in the root
     if path[length(path)-1] = ':' then begin
        path:='Drives';
        // Display the drives if we are in a root directory
        setfiles;
        files.setfocus;
        if files.items.count > 0 then files.selected := files.items[0];
     end else begin
         // Delete the part after the last "\"
         path:=copy(path,1,length(path)-1);
         while path[length(path)] <> '\' do
               path:=copy(path,1,length(path)-1);
         setfiles;
         files.setfocus;
         if files.items.count > 0 then files.selected := files.items[0];
     end;
end; // End speedbutton1click

procedure TForm1.filesKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     // if we press "Enter" on an item, we do the same as on doubleclicking that item
     if key = vk_return then filesdblclick(sender);
end; // End fileskeyup

procedure TForm1.menuitemClick(Sender: TObject);// the listview's popup menu
begin
     // filetype ("drive","dir" or "file") and fully expanded filename)
     showproperties(files.selected.subitems[4],files.selected.subitems[3]);

end; // End menuitemclick

procedure TForm1.menuPopup(Sender: TObject);
begin
     // Disable the properties, if no item is selected
     menuitem.enabled := (files.selected <> nil);
end; // End menupopup

procedure TForm1.ComboBox1update;// sets the driveandfolder - combobox
var ct : byte;
    isdrive : boolean;
    seldrv  : byte;
    ix      : integer;
    pastr   : string;
    ixt     : integer;
begin
     combobox1.items.beginupdate;
     combobox1.items.clear;
     ix:=-1;
     // Adding drives and folders to the combobox;
     isdrive := (path = 'Drives'); // are we on desktop ?
     seldrv := ord(upcase(path[1]))-ord('A'); // currently selected drive as byte
     combobox1.items.add('0:Drives'); // 0 meanes all drives, no tab in combobox1
     for ct := 0 to 25 do // For all drives "A" .. "Z"
         if ct in drives then begin // is this drive available in the system ?
            combobox1.items.add('1:'+char(ct+ord('A'))+':\'); // 1 means drive, second level (1 tab)
            // eventually add the folders, if we aren't on desktop or root-directory
            if (not isdrive) and ( ct = seldrv) then begin
               if path[length(path)-1] = ':' then // root path of a drive
                  ix:=combobox1.items.count-1
               else
                    // add the tree of folders
                    for ixt := 1 to getcount('\',path)-1 do
                        combobox1.items.add(inttostr(ixt+1)+':' // xx means tab xx
                        +copy(path,1,numpos('\',path,ixt+1)));

               ix:=combobox1.items.count-1;// set selection to current folder
            end;
            //set selection to the drives - item
            if isdrive then ix:=0;
         end;
     if ix > -1 then combobox1.items[ix]:='T'+combobox1.items[ix]; // currently opened folder
     combobox1.itemindex:=-1;
     combobox1.items.endupdate;
     combobox1.itemindex := ix;
end; // End combobox1update

procedure TForm1.ComboBox1Change(Sender: TObject); // choosing a drive/folder in the combobox
var sr : string;
begin
     // exit if dropped down, or we can go sleep
     if combobox1.droppeddown then exit;
     if combobox1.itemindex < 0 then exit; // what happened here ?
     sr:=combobox1.items[combobox1.itemindex];
     sr:=copy(sr,pos(':',sr)+1,maxint); // erase the tabnumber
     if (sr <> 'Drives') and (not directoryexists(sr)) then begin
        showmessage('No Access to '+sr+' .');
        combobox1update; // Redo the change and get back the current path in the combobox
        files.setfocus; 
     end else begin // ok, this folder / drive can be opened
          path:=sr;
          setfiles;
          files.setfocus;
          if files.items.count > 0 then files.selected := files.items[0];
     end;
end; // End Combobox1change

procedure TForm1.ComboBox1DrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
// Let us draw the items (drives and maybe folders) on the comboxes' canvas almost
// like Explorer does
var az,sr : string;
    icix  : integer;
    info  : tshfileinfo;
    tab : integer;
    mode : integer;
begin
     fillchar(info,sizeof(tshfileinfo),0);
     with combobox1,combobox1.canvas do begin

          // Get the kind of icon
          mode :=  shgfi_icon or shgfi_smallicon or shgfi_displayname;
          sr:=items[index];
          if sr[1] = 'T' then begin // current folder/drive
             sr:=copy(sr,2,maxint);
             mode := mode or shgfi_openicon;
          end;
          smalls.drawingstyle:=dstransparent; // Use the transparent color
          if odselected in state then smalls.drawingstyle:=dsselected;
          // If the focuscolor will be merged to this rect, use the selected icon

          // Clear the rect
          fillrect(rect);
          // get the icon and the text;
          if sr = '0:Drives' then  begin
             info.szdisplayname := 'Drives';
             info.iicon := 15;// This is the system's icon for "My Computer"
          end else
          shgetfileinfo(pchar(copy(sr,pos(':',sr)+1,maxint)),0,info,sizeof(tshfileinfo),
          mode);
          az:=info.szdisplayname; // Shell caption for the drive or folder
          // get the tabwidth
          tab := strtoint(copy(sr,1,pos(':',sr)-1))*8;

          // Now comes something that doesn't look like in Explorer.
          // There, in the nondrop region of the combobox the selected folder
          // is painted without using tabs.
          // If anybody knows how to fix this problem, please contact me

          // If the combobox isn't dropped down, don't use tabs
          if not droppeddown then tab := 0;

          // draw the text;
          textout(rect.left+20+tab,rect.top+2,az);
          // draw the icon
          smalls.draw(canvas,rect.left+2+tab,rect.top+2,info.iicon);
          smalls.drawingstyle := dsnormal;
     end;
end; // End Combobox1drawitem

procedure TForm1.filesClick(Sender: TObject); // this is just a dummy
begin
     if files.selected = nil then exit;
     flabel.caption := files.selected.subitems[4];// This is the fully expanded filename
end;  // End filesclick

procedure TForm1.chClick(Sender: TObject); // Change the viewing types of the listview
begin
     files.setfocus;
     setfiles;
end;  // End chclick;

procedure TForm1.Image1Click(Sender: TObject);
begin
     ShellExecute( Application.Handle, PChar( 'open' ),PChar('http://home.t-online.de/home/mirbir.st/')
     , PChar(''), nil, SW_NORMAL );


end;

end.
