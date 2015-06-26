unit MPGTools;
{

MPEG AUDIO TOOLS
(c)1998 Copyright by Predrag Supurovic

This library gives you tools for manipulating MPEG AUDIO files
(*.mpa;*.mp2;*.mp3). It allows very easy reading and writing of MPEG
data (TAG and HEADER).

Supported formats are MPEG Versions 1, 2 and 2.5, Layer I, II and III.
MPEG TAGs are also supported (ID3v1.1).

Compiled and tested with Delphi 1 and Delphi 3. Received reports
that it sucessfully compiles with Delphi 4.

If you are interested in MPEG file structure take a look at
http://www.dv.co.yu/mp3list/mpeghdr.htm.


Copyright notice:

All rights reserved by the Author. This source code is freeware. You are
free to use or distribute it. However you are not allowed to distribute
changed source. You must give credits to author in your source and
executable code produced based on MPGTools, including specifying WEB
address http://www.dv.co.yu/mp3list/mpgtools.htm.

Send us basic info about your application which uses MPGTools (name,
http/ftp url, archive length, short description) because we may put
that info and link on MPGTools homepage.

Freeware licence does not apply to sysops of SETNet - they are required
to pay $15 for using or distributing this source by any mean.

You are wellcome to send comments and suggestions to the Author.
You are also wellcome to support Author by donations of literature,
tools, software or money but it is not reqired.

If you use this code please let us know.


Contact info:

mailto: mpgtools@dv.co.yu

Support is available only through email address writen above.
No other contact methods are allowed. Remember this *is*
freeware project, therefore I cannot dedicate too much time
and efforts to it. I will do my best to responce to any mail
regarding this subject.

Updated info, new versions, supporting documentation and demo
applications in source code are available at
http://www.dv.co.yu/mp3list/mpgtools.htm.


Author:
Predrag Supurovic
Dimitrija Tucovica 44/84
31000 Uzice
YUGOSLAVIA

Author's personal homepage: http://www.dv.co.yu/broker/


Beta test

Many thanks to Jean Nicolle, who voluntarily betatests this code
and comes with good and valuable ideas almost every day.


Versions:

  1.7. (5. October. 1998) (public)

  - Another MPEG recognizing bugfixes. I must notice that all
    bugfixes deal with trashed MPEG files (it means, files
    containing non MPEG data at the begining). I test unit on
    MPEG files I created and they are all correct, but it seems
    on the Internet you may find everything. Thus, you, users of
    this unit are very important for bugfixing. As much MPEGs you
    try with this code, sooner we will find all posiible bugs.

  - Jean Nicolle showed up as an excellent beta tester. Not just
    he is very good in detecting bugs, he also makes very
    valuable suggestions. Therefore, I am appointing him as the
    first official MPGTools betatester.

  - FileDetectionPrecision property added to both TMPEGAudio and
    TMPEGAudioList class. It limits how many bytes of file will
    be searched for MPEG frame headers. That means you now may
    not allow object to search whole file attempting to find out
    if it is MPEG audio. I do not reccomended to use this, but
    it's here. It may be useful.

  - Behaviour of TMPEGAudio.Textilize method changed. NOW IT DOES NOT
    affect contents of TMPEGAudio.Macro and TMPEGAudio.Text properties.
    I found out that it was not suitable approach.

    TMPEGAudio.Textilize method may be called very often for other
    reasons (i.e. sorting utility) which should not affect contents
    of these two properties. Everything else regarding TMPEGAudio.Macro
    and TMPEGAudio.Text stays the same: whenever you change
    TMPEGAudio.Macro or any of writeable properties contents of the
    TMPEGAudio.Text will be updated automatically.

  - Bug in TMPEGAudio.Textilize fixed: when I changed Textilize not to
    alter contents of Macro and Text properties, I left Textilize read
    contents of Macro instead of string passed as parameter.

  - TMPEGAudio.FReadData, TagTMPEGAudio.WriteTag and
    TMPEGAudio.RemoveTag methods are changed. Now they are functions
    and returned result is error code.

  - Added types: TListSortCompare and TListSortCompareFunc.
    Added properties: SortMethod, UserSortCompareFunc property and
    SortMacro. Added methods: InternalSortCompareFunc,
    DoUserSortCompareFunc and DoSort. Now, user may specify if
    he wants list not to be sorted, to be sorted internaly (sort key
    specified in SortMacro) or externaly, by user defined function.

  - Added property: TMPEGAudioList.SortDirection, and few
    methods changed to support it. Now, user may set sort direction
    regardless of SortMethod used and there is no need for user
    functions for ascending and descending order.

  - I've detected bug with TMPEGAudioList sorting, but cannot fix it yet.
    To reporoduce The Bug, run MPGLIST demo, load some files to the list,
    set sort method to Internal, and enter '%aaa%' in the edit box. Click
    on sort button several times. You will notice that it sorts items
    erratically. It seems problem is in QuickSort function (which I took
    from source of TList object). Point is that %aaa% is not existing macro.
    Therefore, Textilize function does not convert it but returns same
    string. That is normal. Thus, TMPEGAudioList.InternalSortCompareFunc
    always compares same string regardless if items are different or not.
    It will always return zero result of comparation. That is also ok,
    and it means that QuickSort will think list is already sorted.
    But, there is a problem. For some reason QuickSort behaves
    unpredictable in such situation. It works well when it has to
    sort already sorted list. I assume, that, algorithm presumes if
    all items are equal there is no need to take care if their order
    will be corupted. I have to find a way to check if list is already
    sorted properly, and break Quicksort before it makes mess. I must
    admit I am not familiar with Quick Sort algorithm.

  - Help wanted. I received report that when compiling unit with
    Delphi 4 it shows warning that TMPEGAudioList.Create constructor
    should be overriden. I do not receive such warning in Delphi 3
    (I do not have Delphi 4). When I tried to override it, Delphi
    reported method is static and cannot be overriden. If anyone can
    provide solution I would appreciate it.


  1.6 (8. Sept. 1998) (public)

  - I must apology to those who asked help about using this unit and I
    point them to "short example provided in documentation". I
    overseeked that I added that example after I published version 1.5
    and that it was not available until now.

  - TMPEGAudio now inherits TObject instead of TComponent.

  - Fixed bug not recognizing MP3 file properly reported by Jean
    Nicolle. It showed up that I had a bug but also that method used for
    validation was not good enough. Not just it was not able to
    recognize each MPEG file as such, but often recognized files which
    surely were not MPEG as MPEG. Now it checks for two frame headers
    in a row, which significantly reduces false recognitions. Any
    suggestions about improvements are welcome.

  - Added FirstValidFrameHeaderPosition property as result of previous
    bugfix.

  - Added Macro and Text property as replacement for Textilize method.
    Textilize method is still there and will not be removed. These two
    properties just may speed things up if you do not often change
    macros or MPEG data. This resulted with some small but numbered
    changes in property and method definitions, but nothing changed in
    syntax and functionality.

  - Few macro tag items changed and added to support new properties and
    structure changes.

  - TMPEGData.FileName field changed due to suggestion of Torben
    Weibert. Now it is string 255 chars long. Request was to make this
    field very long string, but I could not manage to do that without
    loosing compatibility with Delphi 1. I hope filepaths longer than
    255 characters are rare. If anyone needs it longer, and does not
    care about TMPEGData record length, he may simply change definition
    for this field. Other parts of class will manage long strings
    properly.

  - Dealing with files not containing TAG changed a bit. If MPEG file
    does not contain TAG then TMPEGAudio.Data.Title field will be filled
    with MPEG filename (without path). This is same behaviour as
    WinAmp's.

  - Data structure of TMPEGData changed to version 1.2.

    o Padding field added so we can now calculate frame size.

    o SampleRate field type changed to LongInt to make it more
      compatible with other languages and compiler versions. Real type
      was very bad choice. WARNING! Now this field contains integer
      value of sampling rate in Hz not in kHz like previous versions.

    o FrameLength added. It stores framesize in bytes.

    o Version field now contains index to MPEG Version, not exact
      version number. This is done to support MPEG Version 2.5 which now
      has index of 3. Apropriate constants definition provided.

  - Finally I found out how to make TMPEGData record size independent of
    compiler version. Problem was not just with real type. I founded
    that Integer type length also changes. In Delphi 1 it is 2 bytes,
    but in Delphi 3 it is 4 bytes long. Since I needed two byte values
    in few fields, i replaced Integer type with word and everything is
    now ok. I am suspicious about LongInt (currently it is 4 bytes
    long). Anyone with Delphi 4, let me know is it still 4 bytes long?
    Funniest bug is TDateTime type. I am used to it since Borland Pascal
    where it was 8 bytes long record. In Delphi they changed it to real.
    Yes I was aware of that, but... well, now I use LongInt instead.
    Note that TMPEGAudio.FileDateTime property still returns value as
    TDateTime. Conversion is done internaly. Remember that
    TMPEGAudio.FileDateTime and TMPEGAudio.Data.FileDateTime are not
    same type any more. If you need to read or write to
    TMPEGAudio.Data.FileDateTime directly, use FileDatetoDateTime() and
    DateTimetoFileDate() functions provided with Delphi.

  - MPEG_VERSION* constants added due to support MPEG Version 2.5 files.

  - MPEG_VERSIONS constant array added to describe MPEG Version

  - MPEG_SAMPLE_RATES adjusted to support MPEG Audio Version 2.5 files

  - MPEG_BIT_RATES adjusted to support MPEG Audio Version 2.5 files

  - Added support for reading MPEG Audio files of Version 2.5. I have
    not tested it since I do not have any MPEG file of this version.

  - TMPEGAudio class is polished. It may be assumed finished. I think
    there will be no major changes in it.

  - This unit version presents TMPEGAudioList class. It should free you
    of using TList and dealing with pointers and typecasting. It is
    descendent of TList class and uses TMPEGAudio as base data structure.
    It is not well documented yet, but I am sure you will understand it
    by looking at class definition. Do not use it. It is here just to
    show you the basic idea. I cannot guarantee it will not be changed.
    Feel free to share you ideas about it with me. If you notice bad
    coding practice I used, do not hestitate to say it.

  - TMPEGAudioList.AddFromMPEGFile method is adjusted to recognize all
    three TMPEGData versions. It will return values according to newest
    structure definition.

  - I have opened MPGTools support mail list. Anyone who wants
    membership may send me a mail. It is one way list for now. You will
    receive only news about updates I send. If you like, I can make all
    members receive messages other members sent to the list.

  - Together with this unit version I am publishing soruces of two
    simple applications TAG Editor and MPEG List to demonstrate how to
    use it.

  - Few typo's corrected. I am also sure I made few new typo's.


  1.5 (23. August 1998) (public)

  - The first public version released
}

interface

uses SysUtils, WinTypes, WinProcs, Classes, Messages, Controls;

const
  UnitVersion = '1.6.4';   { version of this unit }
  MaxStyles = 79;        { number of supported Genre codes.
                         If code is greater it will be assumed unknown }


  { MPEG version indexes }
  MPEG_VERSION_UNKNOWN = 0; { Unknown     }
  MPEG_VERSION_1 = 1;       { Version 1   }
  MPEG_VERSION_2 = 2;       { Version 2   }
  MPEG_VERSION_25 = 3;      { Version 2.5 }

  { Description of MPEG version index }
  MPEG_VERSIONS : array[0..3] of string = ('Unknown', '1.0', '2.0', '2.5');

  { Channel mode (number of channels) in MPEG file }
  MPEG_MD_STEREO = 0;            { Stereo }
  MPEG_MD_JOINT_STEREO = 1;      { Stereo }
  MPEG_MD_DUAL_CHANNEL = 2;      { Stereo }
  MPEG_MD_MONO = 3;              { Mono   }

  { Description of number of channels }
  MPEG_MODES : array[0..3] of string = ('Stereo', 'Joint-Stereo',
                                        'Dual-Channel', 'Single-Channel');

  { Description of layer value }
  MPEG_LAYERS : array[0..3] of string = ('Unknown', 'I', 'II', 'III');

  {
    Sampling rates table.
    You can read mpeg sampling frequency as
    MPEG_SAMPLE_RATES[mpeg_version_index][samplerate_index]
  }
  MPEG_SAMPLE_RATES : array[1..3] of array[0..3] of word =
     { Version 1   }
    ((44100, 48000, 32000, 0),
     { Version 2   }
     (22050, 24000, 16000, 0),
     { Version 2.5 }
     (11025, 12000, 8000, 0));

  {
    Predefined bitrate table.
    Right bitrate is MPEG_BIT_RATES[mpeg_version_index][layer][bitrate_index]
  }
  MPEG_BIT_RATES : array[1..3] of array[1..3] of array[0..15] of word =
       { Version 1, Layer I     }
     (((0,32,64,96,128,160,192,224,256,288,320,352,384,416,448,0),
       { Version 1, Layer II    }
       (0,32,48,56, 64, 80, 96,112,128,160,192,224,256,320,384,0),
       { Version 1, Layer III   }
       (0,32,40,48, 56, 64, 80, 96,112,128,160,192,224,256,320,0)),
       { Version 2, Layer I     }
      ((0,32,64,96,128,160,192,224,256,288,320,352,384,416,448,0),
       { Version 2, Layer II    }
       (0,32,48,56, 64, 80, 96,112,128,160,192,224,256,320,384,0),
       { Version 2, Layer III   }
       (0, 8,16,24, 32, 64, 80, 56, 64,128,160,112,128,256,320,0)),
       { Version 2.5, Layer I   }
      ((0,32,64,96,128,160,192,224,256,288,320,352,384,416,448,0),
       { Version 2.5, Layer II  }
       (0,32,48,56, 64, 80, 96,112,128,160,192,224,256,320,384,0),
       { Version 2.5, Layer III }
       (0, 8,16,24, 32, 64, 80, 56, 64,128,160,112,128,256,320,0)));

  { Types of MPEG AUDIO DATAFILE }
  MPEG_DF_CUSTOM = 0;
  MPEG_DF_CATALOGUE = 1;
  MPEG_DF_ORDER_FORM = 2;

  { Description of MPEG AUDIO DATAFILE type }
  MPEG_DATAFILE_TYPES : array[0..2] of string = ('Custom','Catalogue',
                                                 'Order form');

  { Sign for MPEG Audio Datafile. This is used in MPEG Audio Datafile
    header to identify file as such. First eight bytes (i.e #9'MP3DATA')
    are file id, and rest two bytes are version and subversion numbers.
    Do not change it. }
  MPEG_DATAFILE_SIGN : string[9] = 'MP3DATA'+#01+#02;

  { File types that unit can recognize and read }
  FT_UNKNOWN = 0;                { Unknown }
  FT_WINAMP_PLAYLIST = 1;        { WinAmp playlist (*.m3u) }
  FT_MPEG_DATAFILE = 2;          { MPEG Audio Datafile (*.m3d) }
  FT_MPEG_AUDIO = 3;             { MPEG Audio }

var
  { Descriptions of Genre codes. Unit fills this array on
  initialization. }
  MusicStyle : array[0..MaxStyles] of string;

type
  String3 = string[3];
  String4 = string[4];
  String30 = string[30];
  String20 = string[20];
  String79 = string[79];
  String255 = string[255];

  { MEGAUDIODATAFILE v1.1 header for Catalogue record definition. Same
    header counts for v1.2 header. Do not use this type definition
    directly. Use TMPEGDataCatalogue instead. }
  TMPEGDataCatalogue1v1 = packed record
    Title : string[30];              { Catalogue title }
    Publisher : string[30];          { Catalogue publisher name }
    City : String[30];               { Publisher's contact info }
    ZIP : String[10];
    Country : String[20];
    Address : String[30];
    Phone: String[15];
    Fax: string[15];
    Email: string[30];
    WWWURL: string[30];
  end;

  { Old header for Catalogue record used in MPEGAUDIODATAFILE v1.0
    definition.  Obsolete. Used internaly to make unit able to read old
    file version.  However, unit will never create old version file. }
   TMPEGDataCatalogue1v0 = record
    Title : string[30];
    Publisher : string[30];
    City : String[30];
    ZIP : String[10];
    Country : String[20];
    Address : String[30];
    Phone: String[15];
    Fax: string[15];
    Email: string[30];
    WWWURL: string[30];
  end;

  { Always use this type for header variable declaration. If structure
    changes in future, this type will point to the newest version. }
  TMPEGDataCatalogue = TMPEGDataCatalogue1v1;

  { MEGAUDIODATAFILE v1.1 header for Order form record definition. Same
    definition counts for v1.2 header. Do not use this type directly.
    Use TMPEGDataOrder instead.}
  TMPEGDataOrder1v1 = packed record
    CustomerID : string[15];
    Name : string[30];
    City : String[30];
    ZIP : String[10];
    Country : String[20];
    Address : String[30];
    Phone: String[15];
    Fax: string[15];
    Email: string[30];
  end;

  { Always use this type for header variable declaration. If structure
    changes in future, this type will point to the newest version. }
  TMPEGDataOrder = TMPEGDataOrder1v1;

  { Definition for structure of MPEG AUDIO DATA records. Do not use it
    directly. Use TMPEGDATA type instead. }
  TMPEGData1v2 = packed record
    Header : String3;        { Should contain "TAG" if header is correct }
    Title : String30;        { Song title  }
    Artist : String30;       { Artist name }
    Album : String30;        { Album  }
    Year : String4;          { Year }
    Comment : String30;      { Comment }
    Genre : Byte;            { Genre code }
    Track : byte;            { Track number on Album }
    Duration : word;         { Song duration }
    FileLength : LongInt;    { File length }
    Version : byte;          { MPEG audio version index (1 - Version 1,
                               2 - Version 2,  3 - Version 2.5,
                               0 - unknown }
    Layer : byte;            { Layer (1, 2, 3, 0 - unknown) }
    SampleRate : LongInt;    { Sampling rate in Hz}
    BitRate : LongInt;       { Bit Rate }
    BPM : word;              { bits per minute - for future use }
    Mode : byte;             { Number of channels (0 - Stereo,
                               1 - Joint-Stereo, 2 - Dual-channel,
                               3 - Single-Channel) }
    Copyright : Boolean;     { Copyrighted? }
    Original : Boolean;      { Original? }
    ErrorProtection : boolean; { Error protected? }
    Padding : Boolean;       { If frame is padded }
    FrameLength : Word;      { total frame size including CRC }
    CRC : word;              { 16 bit File CRC (without TAG).
                               Not implemented yet. }
    FileName : String255;    { MPEG audio file name }
    FileDateTime : LongInt;  { File last modification date and time in
                               DOS internal format }
    FileAttr : Word;         { File attributes }
    VolumeLabel : string20;  { Disk label }
    Selected : word;         { If this field's value is greater than
                               zero then file is selected. Value
                               determines order of selection. }
    Reserved : array[1..45] of byte; { for future use }
  end;

  { Definition for structure of old MPEG AUDIO DATA v1.1 records.
    Obsolete.  Used internaly to allow reading files of older MPEG AUDIO
    DATAFILE version. }
  TMPEGData1v1 = packed record
    Header : String3;
    Title : String30;
    Artist : String30;
    Album : String30;
    Year : String4;
    Comment : String30;
    Genre : Byte;
    Track : byte;
    Duration : word;
    FileLength : LongInt;
    Version : byte;
    Layer : byte;
    SampleRate : real;
    BitRate : LongInt;
    BPM : word;
    Mode : byte;
    Copyright : Boolean;
    Original : Boolean;
    ErrorProtection : boolean;
    CRC : word;
    FileName : String79;
    FileDateTime : TDateTime;
    FileAttr : Integer;
    VolumeLabel : string20;
    Selected : word;
    Reserved : array[1..48] of byte;
  end;

  { Old MPEG DATA record definition used in MPEGDATAFILE v1.0. Obsolete.
    Used internaly to allow reading of older MPEG AUDIO DATAFILE
    version. }
  TMPEGData1v0 = record
    Header : String[3];
    Title : String[30];
    Artist : String[30];
    Album : String[30];
    Year : String[4];
    Comment : String[30];
    Genre : Byte;
    Track : Byte;
    Duration : Word;
    FileLength : LongInt;
    Version : byte;
    Layer : byte;
    SampleRate : real;
    BitRate : LongInt;
    BPM : word;
    Mode : byte;
    Copyright : Boolean;
    Original : Boolean;
    ErrorProtection : boolean;
    CRC : word;
    FileName : string[79];
    ListName : string[79];
    FileDateTime : TDateTime;
    FileAttr : Integer;
    VolumeLabel : string[20];
    Reserved : array[1..50] of byte;
  end;

  { Current definition for MPEG AUDIO DATA structure. This type will
    point to newest record definition in case of future changes.

    MPEG AUDIO DATA is basic structure. It consists of data read from
    MPEG TAG and MPEG HEADER of MPEG AUDIO FILE. }
  PMPEGData = ^TMPEGData;
  TMPEGData = TMPEGData1v2;

  (*

    MPEG AUDIO CLASS definition.

    This object contains data about single MPEG AUDIO FILE and methods
    for reading, manipulating and writing them back to file. It is based
    on TObject class which means it is not supposed to be used as
    component. Create this object runtime.

    Here is an short example:

    use MPEGTool;
    var
      MPEGFile : TMPEGAudio;

    begin
      { create object }
      MPEGFile := TMPEGAudio.Create;
      { load data for mp3 song }
      MPEGFile.FileName := 'mysong.mp3';

      { read data }
      TitleEditBox.Text := MPEGFile.Title;
      ArtistTextBox.Text := MPEGFile.Artist;

      { change TAG data }
      MPEGFile.Title := TitleEditBox.Text;
      MPEGFile.Artist := ArtistEditBox.Text;

      { write changes to file }
      MPEGFile.WriteTag;

      { free }
      MPEGFile.Free;
    end;

    Heart of TMPEGAudio object is data field which is actual record
    structure of TMPEGData. It is declared published which means you
    have full read and write access to it. That is not reccomended.
    Prefer using published properties. Data field is public because you
    may need easier access to whole record while dealing with lists,
    especially if you need writing such records in a file, like MPEG
    AUDIO DATAFILE is.

    To easy for you access and dealing with lists there is a function
    DataPtr which returns pointer to object's Data field.

    Published properties are mostly based on Data record but with some
    exceptions. You will find some properties read only for simple
    reason that you actually may not change all data read from MPEG
    file. We will not describe all properties but those which need
    attention.

    IsValid returns true if MPEG file is recognized as such. This is
    done by checking some fields values. Should be reliable.

    FileName has special function. When reading its value you will
    actually get value of TMPEGAudio.Data.FileName field. But, when you
    try to set value of this property, it will set
    TMPEGAudio.Data.FileName field but also read data from specified
    filename into Data record. Use this to actually read MPEG file.

    Macro string may contain macros (you wil findout about macros
    below) in string form explained before. Use this to convert
    macros if you do not need it to be changed often. Each time you
    change contents of this property it will automatically update
    contents of Text property. This should be used if you need to
    occasionally get converted macro but not to change macros. Actual
    conversion will be done for the first time  you set macro string,
    and you may read it from Text property several times. This may
    speed up your application if you use it instead of calling
    Textilize method each time.

    Text property is updated whenever change occure in Macro property
    or other writable object properties, this field will be updated
    with converted contents of Macro property. Text property will be
    changed only when real change occures, and class takes care of
    that. You just have to read value when you need it.

    You also have some functions available.

    IsValidStr takes two strings as parameters, and returns one of them
    depending of Boolean value of IsValid property. Use it when you need
    to display 'Yes' or 'No' or something similar based on this
    property.

    Similar functions are CopyrightStr, OriginalStr and
    ErrorProtectionStr. They are based on Copyright, Original and
    ErrorProtection properties respectively.

    GenreStr returns string description of Genre property. It is more
    appropriate for displaying than Genre number code.

    DurationTime is based on Duration property and returns value of
    TDateTime type. Since Duration is measured in seconds, we provided
    DurationTime function to easy you displaying values in minutes and
    seconds. We did not make it return string value since time format
    may differ from application to application. You may use Delphi's
    FormatDateTime function to get string value from DurationTime.

    ModeStr returns string description of MPEG channel mode (Mode
    property). It returns one of four values ('Stereo'/'Joint
    Stereo'/'Dual Channel'/'Single Channel'). If you need just
    'Mono'/'Stereo' identification you are on your own. Hint: only
    'Single Channel' mode is Mono.

    WriteTag function writes data from object to TAG of MPEG file.

    RemoveTag removes tag information form MPEG file. You will notice
    that by '[no tag]' value in properties which belongs to TAG and
    Header property will have value 'BAD' (which does not mean that MPEG
    file is BAD, but just that TAG is missing. If you want to check if
    MPEG file is correct, use IsValid property)

    Textilize is most powerful function in this object. You are provided
    with complex macro structure you can use to convert MPEG data values
    to strings. All you have to do is to call Textilize function and
    give it a string paameter containing macros. It will return string
    value with macros converted to actual MPEG data. Yuo should also
    take a look of Macro and Text properties.

    Here are some macro examples:

    '%Author,T% %Title,T% %DurationForm,T%'
    '%Author%%Title%%DurationForm%'
    'Author: %A,T% * Title: %T,T% * Duration: %DF,T%'

    Use them in TAGEDitor demo application (Macro definition box) to see
    how it works.

    Here is an explanation about whole mechanism as we provided with
    MP3List application (you can get if from
    http://www.dv.co.yu/mp3list/) to see how this thing can be powerfull
    in real application. Note, TMPEGAudioList supports more macros
    because it deals with lists of mpeg files. TMPEGAudio object
    supports all macros that are possible to read from single mpeg audio
    file. Other macros are supported in TMPEGAudioList object which
    deals with lists of files. Here, we will give you list of all tag
    items but only those in AUDIO FILE DATA, and some of SPECIAL CODES
    are supported by this object. Take a look to source of GetMPEGValue
    function.

    MACROS

    Tag item is single information that can be read, counted or
    calculated from mpeg audio file or filelist. You can use it to
    define exact contents and look for style properties of template
    definitions. General syntax for single tag item is

    %<tagid>[,|: <alignment>][,|: <length>][,|: <padchar>]%

    Tag item definition must begin and end with a percent sign (%). If
    you want percent sign to be showed in output list put two percent
    signs with no characters or space characters between them (look for
    special codes further in this document). Tag item cannot contain
    other TagItem.

    <tagid> defines which information you want to be shown in list,
    <alignment> defines how you would like information to be aligned,
    <length> is number of characters information should be aligned in,
    and <padchar> is character which should be used to pad empty space
    if information is shorter than reserved number of characters.
    Delimiter for item definition elements is comma (,) sign.

    Only <tagid> is required in item definition. Alignment, length and
    padchar may be omitted and in that case, default values will be
    used. Defaults for alignment and length depend of each tagid used,
    but padchar always defaults to space character (ASCII 32).

    TAG IDENTIFICATION

    Tag descriptions (tagid) may be divided in three groups: (1)
    informations that can be read from mpeg audio file or Winamp file
    list, (2) calculated or counted informations and (3) special codes.
    You can use short or long tagid.

    AUDIO FILE DATA

    Tag   Tag                  Def Def
    Short Long                 Len Algn Description
    -----------------------------------------------------------------------
    FN    FileName              40   L   MP3 file name
    FP    FilePath              40   L   Path to mp3 file (without file name)
    FPR   FilePathRelative      40   L   Relative path to MPEG audio file
                                         (without file name).
    FD    FileDate              10   L   Date of last file change
    FT    FileTime               8   L   Time of last file change
    FL    FrameLength            4   R   Frame length (bytes)
    VL    VolumeLabel           11   L   Volume label
    T     Title                 30   L   Title
    A     Artist                30   L   Artist
    ALB   Album                 35   L   Album
    Y     Year                   4   L   Year

    CMNT  Comment               30   L   Comment
    G     Genre                 25   L   Genre description
    GNR   GenreNr                3   R   Genre code
    TR    Track                  3   R   Album track number
    D     Duration               4   R   Duration (seconds)
    DC    DurationComma          5   R   Duration, thousands comma
                                         delimited (seconds)
    DF    DurationForm           5   R   Duration (formated as MM:SS)
    L     Length                 9   R   File length in bytes
    LC    LengthComma           12   R   File length in bytes, thousands
                                         comma delimited
    LK    LengthKB               6   R   File length in kilobytes
    LKC   LengthKBComma          8   R   File length in kilobytes,
                                         thousands comma delimited
    LM    LengthMB               5   R   File length in megabytes
                                         (one decimal place)
    V     Version                3   L   MPEG Audio version. Valid values
                                         are 1.0, 2.0 and 2.5.
    LY    Layer                  3   L   MPEG Audio Layer Type Roman
                                         (I, II, II or Unknown)
    LYN   LayerNr                1   L   MPEG Audio Layer Type Numeric
                                         (1, 2, 3 or Unknown)
    SR    SampleRate             5   R   Sampling rate in Hz
    SRK   SampleRateKB           4   R   Sampling rate in kHz
    BR    BitRate                3   R   BitRate (kbps)
    EP    ErrorProt              3   L   Error protection ('Yes'/'No')
    EP*   ErrorProt*             1   L   Error Protection ('*'/' ')
    C     Copyright              3   L   Copyrighted ('Yes'/'No')
    C*    Copyright*             1   L   Copyrighted ('*'/' ')
    O     Original               3   L   Original ('Yes'/'No')
    O*    Original*              1   L   Original ('*'/' ')
    M     Mode                  12   L   Channel mode  ('Stereo'/
                                         'Joint-Stereo'/'Dual-Channel'/
                                         'Mono')
    S     Stereo                 6   L   Stereo mode ('Stereo'/'Mono')
    SLN   SelectedNr             5   R   Value of item selection
    SL    Selected               3   L   Is item selected ('Yes'/'No')
    SL*   Selected*              1   L   Is item selected ('*'/'*')
    VL    VolumeLabel           11   L   Volume label
    VD    Valid                  3   L   Is item valid ('Yes'/'No')
    VD*   Valid*                 1   L   Is item valid ('*'/' ')

    ---------------------------------------------------------------------

    COUNTED OR CALCULATED DATA

    Tag   Tag                  Def Def
    Short Long                 Len Algn Description
    -----------------------------------------------------------------------
    N     No                     4   R   Order No of file in list
    FC    FileCount              4   R   Total number of files in list
    FCC   FileCountComma         5   R   Total number of files in list,
                                         thousands comma separated
    GN    GroupNo                4   R   Order No of group
    GFN   GroupFileNo            4   R   Order No of file in group
    GFC   GroupFileCount         4   R   Total number of files in group
    GFCC  GroupFileCountComma    5   R   Total number of files in group
                                         thousands comma separated
    AC    ArtistCount            4   R   Total number of different artists
                                         in whole list
    GC    GroupCount             4   R   Total number of different groups
                                         in whole list
    GD    GroupDuration         16   R   Total duration in seconds for
                                         group
    GDC   GroupDurationComma    21   R   Total duration in seconds for
                                         group, thousands comma separated
    GDF   GroupDurationForm      8   R   Total duration for groupformated
                                         as HH:MM:SS
    GL    GroupLength           10   R   Total length in bytes for group
    GLC   GroupLengthComma      13   R   Total length in bytes for group,
                                         thousands comma separated
    GLK   GroupLengthKB          7   R   Total length in KB for group
    GLKC  GroupLengthKBComma     9   R   Total length in KB for group,
                                         thousands comma separated
    GLM   GroupLengthMB          5   R   Total length in MB for group
    DS    DurationSum           16   R   Total duration in seconds for
                                         whole list
    DSC   DurationSumComma      21   R   Total duration in seconds for
                                         whole list, thousands comma separated
    DSF   DurationSumForm        8   R   Total duration for whole list
                                         formated as HH:MM:SS
    LS    LengthSum             10   R   Total length in bytes for all files
                                         in list
    LSC   LengthSumComma        13   R   Total length in bytes for all files
                                         in list, thousands comma separated
    LKS   LengthKBSum            7   R   Total length in KB for all files in
                                         list
    LKSC  LengthKBSumComma       9   R   Total length in KB for all files in
                                         list, thousands comma separated
    LMS   LengthMBSum            5   R   Total length in MB for all files in
                                         list
    ---------------------------------------------------------------------

    SPECIAL CODES

    Tag   Tag                  Def Def
    Short Long                 Len Algn Description
    ---------------------------------------------------------------------
    CD    CurrentDate           10   R  Current system date
    CT    CurrentTime            8   R  Current system time
    OD    OutputDoc             40   L  File name of output document
    OP    OutputPath            40   L  Path to output document
                                        (without filename)
    TN    TemplateName          40   L  Template name
    PV    ProgramVersion         3   L  Application version number
    NL    NewLine                2   L  New line (CRLF)
    #     SoftNewLine            0   L  Used to mark soft line breaks. Not
                                        used for output file creation but
                                        internaly to alow breaking lines
                                        for readability.
    TB    Tab                    1   L  Tabulator
    nnn   nnn                    1   L  Character ASCII code (decimal)
          (empty or space)       1   L  Percent sign (%)
    ---------------------------------------------------------------------

    If tag element is not recognized as any of defined tags it will not
    be replaced with any data but used as text. That allows you to align
    text due to your needs (i.e if you need title to be centered tag
    item would be:

    %This is title,C,70%


    ALIGNMENT

    Alignment may be defined for each tag. If not specified, default
    value depends from tag to tag, and you may see it in table above.
    Valid values for <alignment> are:

       L - left, no default length
       R - right, default length depends on tag
       C - centered, default length depends on tag
       T - trimmed, no default length

    LENGTH

    Item length defines number of characters to align data in. If
    information consists if more characters than specified length, it
    will be trimmed to specified length. If length is not specified
    default data length will be used execept for left alignment where
    actual data length will be used. If length is specified as zero,
    default length will be used regardless alignment. For Windows 3.xx
    version <length> cannot be greater than 255 characters.

    PADDING

    Padding character is character which will be used to fill space if
    information is shorter than specified length. If this element is not
    specified always defaults to <space> (ASCII 32). Specify exact
    character, not it's ASCII code.

  *)

  PMPEGAudio = ^TMPEGAudio;
  TMPEGAudio = class (TObject)
    private
      Data : TMPEGData;
        { TMPEGData structure. Use it if you need direct access to whole
          record. Otherwise, use class properties to read and write
          specific fields }
      FFileDetectionPrecision : Integer;
      FFileDateTime : TDateTime;
        { File date time in TFileDateTime type. Contains converted
          value of data.FileDateTime }
      FFirstValidFrameHeaderPosition : LongInt;
      FMacro : string;
        { This field contains macro definition }
      FText : string;
        { this field contains converted macros }
      procedure FSetMacro (MacroStr : string);
        { this method sets FMacro field and recalculates FText }
      procedure FSetFileName (inStr : string);
      function FGetFileName : string;
      function FGetIsValid : Boolean;
      function FReadData : Integer;
      function FGetMPEGValue (ItemStr : string) : string;
      procedure FSetArtist (inString : string30);
      procedure FSetAlbum (inString : string30);
      procedure FSetYear (inString : string4);
      procedure FSetComment (inString : string30);
      procedure FSetVolumeLabel (inString : string20);
      procedure FSetGenre (inByte : byte);
      procedure FSetTrack (inByte : byte);
      procedure FSetSelected (inWord : word);

    public
      constructor Create; { create object }
      procedure ResetData; { resets Data field to zero values }
      property FileDetectionPrecision : Integer
        read FFileDetectionPrecision
        write FFileDetectionPrecision;
        { When attempting to recognize MPEG audio file, object will
          search through file trying to find two valid frame headers
          in a row. If file is correct, they will be found very fast,
          but if file is not MPEG then it will be searched up to it's
          end, and that may take a time. Setting this field to value
          greater than zero, you may specify number of bytes that
          should be searched. If object does not find proper headers
          in speified number of bytes, it will assume file invalid.
          If this property is zero, file will be searched from the
          first to the last byte. We do not reccomend you to use this,
          but if you need you may. }
      property IsValid: Boolean read FGetIsValid;
        { True if MPEG audio file is correct }
      function IsValidStr (const IsValidTrue, IsValidFalse : string) : string;
        { Returns input value according to Original field value. }
      property FirstValidFrameHeaderPosition : LongInt
               read FFirstValidFrameHeaderPosition;
        { Contains file position (in bytes) of the first valid frame
          header found. That means, data before this byte is not
          recognized as valid MPEG audio. It may be considered trashed
          or some other header data (WAV envelope, ID3v2 TAG or
          something like that).  If value is equal or greater than
          FileLength then valid header is not found. But in that case,
          IsValid should return False anyway. }
      property Header : String3 read Data.Header;
      property Title : String30 read Data.Title write Data.Title;
         { song Title }
      property Artist : String30 read Data.Artist write FSetArtist;
         { Artist name }
      property Album : String30 read Data.Album write FSetAlbum;
         { Album  }
      property Year : String4 read Data.Year write FSetYear;
         { Year }
      property Comment : String30 read Data.Comment write FSetComment;
         { Comment }
      property Genre : Byte read Data.Genre write FSetGenre;
         { Genre code }
      function GenreStr : string;
         { Genre description }
      Property Track : byte read Data.Track write FSetTrack;
         { Track number on Album }
      property Duration : word read Data.Duration;
         { Song duration in seconds }
      function DurationTime : TDateTime;
         { Song duration time }
      property FileLength : LongInt read Data.FileLength;
         { File length }
      property Version : byte read Data.Version;
         { MPEG audio version }
      property Layer : byte read Data.Layer;
         { Layer (1 or 2. 0 - unknown) }
      function LayerStr : string;
         { Layer description }
      property SampleRate : LongInt read Data.SampleRate;
         { Sampling rate }
      property BitRate : LongInt read Data.BitRate;
         { Bit Rate }
      property FrameLength : Word read Data.FrameLength;
        { Total length of MPEG frame including CRC }
      property BPM : word read Data.BPM;
        { Bits per minute - for future use }
      property Mode : byte read Data.Mode;
        { Number of channels (0 - Stereo, 1 - Joint-Stereo,
          2 - Dual-channel, 3 - Single-Channel) }
      function ModeStr : string;
        { Channel mode description }
      property Copyright : Boolean read Data.Copyright;
        { Copyrighted? }
      function CopyrightStr (const CopyrightTrue,
                                   CopyrightFalse : string) : string;
        { Returns input value according to Copyright field value. }
      property Original : Boolean read Data.Original;
        { Original? }
      function OriginalStr (const OriginalTrue,
                                  OriginalFalse : string) : string;
        { Returns input value according to Original field value. }
      property ErrorProtection : boolean read Data.ErrorProtection;
        { Error protected? }
      function ErrorProtectionStr (const ErrorProtectionTrue,
                                         ErrorProtectionFalse : string)
                                         : string;
        { Returns input value according to ErrorProtection field value. }
      property Padding : Boolean read Data.Padding;
        { If frame size padded }
      property CRC : word read Data.CRC;
        { 16 bit File CRC (without TAG) }
      property FileName : string read FGetFileName write FSetFileName;
        { MPEG audio file name. When set it automatically reads all
          other data from file }
        property FileDateTime : TDateTime read FFileDateTime;
        { File last modification date and time }
      property FileAttr : Word read Data.FileAttr;
        { File attributes }
      property VolumeLabel : string20
               read Data.VolumeLabel
               write FSetVolumeLabel;
        { Disk label }
      property Selected : word read Data.Selected write FSetSelected;
        { If this fields value is greater than zero then file is
          selected. Value determines order of selection. }
      function SelectedStr (const SelectedTrue,
                                  SelectedFalse : string) : string;
        { Returns input value according to Selected field value. }
      function DataPtr : PMPEGData;
        { Returns pointer to MPEG AUDIO DATA record }
      function WriteTag : Integer;
        { Write TAG to file. Returns -1 if file does not exists,
          zero if successful and IOResult code if not successful }
      function RemoveTag : Integer;
        { Remove TAG from file. Return result same as WriteTag }
      property Macro : string read FMacro write FSetMacro;
        { You can read defined macro string or set new one. Macro string
          may contain macros in string form explained before. Use this
          to convert macros if you do not need it to be changed often.
          Each time you change contents of this property it will
          automatically update contents of Text property. This should
          be used if you need to occasionally get converted macro but
          not to change macros. Actual conversion wil be done for the
          first time you set macro string, and you may read it from
          TMPEGAudio.Text property several times. This may speed up
          your application if you use it instead of calling
          TMPEGAudio.Textilize method each time. }
      property Text : string read FText;
         { Whenever change occure in TMPEGAudio.Macro property or other
           writable object properties, this field will be updated with
           converted macros from Macro property. Text property will be
           changed only when real change occures, and class takes care
           of that. You just have to read value when you need it. }
      function Textilize (MacroStr : string) : string;
        { Replace macros with string values based on MPEG data. This
          forces macro conversion on each call. Avoid using it. Set
          Macro property instead and read Text property whenever you
          need converted data. }
  end; { class TMPEGAUDIO }

  { User defined function of TShowProgressFunc type may be used by unit
    to show progress of reading files. TagData is value of current MPEG
    DATA record.  Function may read any info from it. ListName is name
    of list. Counter shows current count of processed files, and
    MaxCount is number of files that will be processed. Form that
    displays progess should have Cancel button. Funtion should return
    False if user canceled progressing.

    We suggest you not to use this function to actually display progress
    form, but to change values of already openned form.

    Since this function will be usually called from loop, which may have
    large number of iterations, unit will release some time to let
    Windows process system messages. If it does not work correctly (if
    you cannot click Cancel button for instance), it is advisable for
    you to put Application.ProcessMessages call in your function.
  }
  TShowProgressFunc = function (var TagData : TMPEGData;
                                var ListName : string;
                                Counter : Integer;
                                MaxCount : Integer) : Boolean;

  { User defined function of TShowProgressError type may be used by unit
    to show error while processing. TagData should point to MPEG record
    which processing failed. Form should be modal and have Cancel,
    Retry, Ignore buttons. Function should return Modal result of form
    closing.
  }
  TShowProgressErrorFunc = function (const TagData : TMPEGData) : Word;

  { User defined function of TShowExportProgressFunc will be used by
    unit to show export progress. It is similar to TShowProgrsFunc but
    with less input parameters.
  }
  TShowExportProgressFunc = function (const TagData : TMPEGData;
                                            Counter : Integer) : Boolean;


  { User defined function for comparing sorted items in list has input
    pointers to two compared items and returns 0 if items are equal,
    >0 if Item1 > Item2 or <0 if Item1 < Item2. Here are two types, one
    function, and the other object method. }
  TListSortCompare = function (Item1, Item2: Pointer): Integer of object;
  TListSortCompareFunc = function (Item1, Item2: Pointer): Integer;


  { TSortMethod type defines sorting method used for TMPEGAudioList.
    smNone - list isnot sorted
    smInternal - list is sorted by internal rules (Artist+Title);
    smUser - List is sorted by user funtction assigned to
             UserSortCompareFunc property }

  TSortMethod = (smNone,smInternal,smUser);


  TSortDirection = (srtAscending, srtDescending);

  (*

  DEFINITION OF TMPEGAUDIO LIST CLASS

  Next issue to dealing with MPEG files is dealing with large number of
  MPEG files. This class should provide you simplified method to colect
  data about MPEG files and access them through list object. It
  inherites TObject class and expands it with specific methods and
  properies.

  TMPEGAudioList is not component. You should manually define variable
  of this type and create object by calling TMPEGAudioList.Create
  method.

  Main advantage is that you are free of allocating/releasing memory for
  MPEG record data and type casting. It uses TMPEGAudio class as basic
  data strucutre, thus allowing you to use all its properties and
  methods.

  You can add MPEG data in several ways:

    o by adding data from existing TMPEGAudio object (TMPEGAudioList.Add
      method),

    o by specifying MPEG filename (TMPEGAudioList.AddFile method),

    o by specifying WinAmp playlist (TMPEGAudioList.AddFromWinAmpList)

    o by specifying MPEG Datafile (TMPEGAudioList.AddFromMPEGDatafile)

  You can define custom functions which will be called on each iteration
  when importing or exporting data from several files or in case of
  reading error (ShowProgressFunc, ShowProgressErrorFunc and
  ShowExportProgressFunc properties).

  Also you can save data from list to file in WinAmp playlist
  (TMPEGAudioList.ExportToWinAmpList method), or MPEG Datafile
  (TMPEGAudioList.ExportToMPEGDatafile method).

  You can acces single items (MPEGAudio objects) through
  TMPEGAudioList.Items property. Current number of items can be obtained
  through TMPEGAudioList.Count method.

  If you need to determine type of some file, use
  TMPEGAudioList.GetfileType method. It can recognize MPEG Audio files,
  WinAmp playlists and MPEG datafiles. It may be useful when you alow
  browsing for all three file types a the same time.

  This is not finished class. For now, only basic methods are done, but
  I plan to do more especialy methods for sorting, dealing with
  duplicates and macros, selections etc... Your ideas are welcome.

  *)

  TMPEGAudioList = class (TList)
    private
      MPEGFile : TMPEGAudio;
      FShowProgressFunc : TShowProgressFunc;
      FShowProgressErrorFunc : TShowProgressErrorFunc;
      FShowExportProgressFunc : TShowExportProgressFunc;
      FSortMethod : TSortMethod;
      FSortDirection : TSortDirection;
      FSortMacro : string;
      FUserSortCompareFunc : TListSortCompareFunc;
      FFileDetectionPrecision : Integer;
      function InternalSortCompareFunc (Item1, Item2: Pointer): Integer;
      function DoUserSortCompareFunc (Item1, Item2: Pointer): Integer;
      function FGetMPEGAudio(IndexNr : integer) : TMPEGAudio;
    public
      property ShowProgressFunc : TShowProgressFunc
               read FShowProgressFunc
               write FShowProgressFunc;
      property ShowProgressErrorFunc : TShowProgressErrorFunc
               read FShowProgressErrorFunc
               write FShowProgressErrorFunc;
      property ShowExportProgressFunc : TShowExportProgressFunc
               read FShowExportProgressFunc
               write FShowExportProgressFunc;
      constructor Create;
      function Add (NewItem : TMPEGData) : Integer;
        { Add new itm of TMPEGData type }
      function AddFile (NewFileName : string) : Integer;
        { Add inforamtions about single MPEG file }
      function AddFromWinAmpList (PlayListName : string) : Integer;
        { Add informations from MPEG files listed in WinAmp list file.
        Return 0 if everything OK, -1 if error, and mrCancel if user
        canceled. }
      function ExportToWinAmpList (outfilename : string;
                                   ToAppend,
                                   RelativePath,
                                   ExportValid : Boolean) : Integer;
        { Export data to WinAmp type playlist. If ToAppend is true,
          append to existing file. If RelativePath, write file paths
          realtive to playlist path, If ExportValid then export data
          only for valid files.  Return 0 if everything OK, -1 if error,
          and mrCancel if user canceled. }

      function AddFromMPEGDatafile (DataFileName : string;
                                    var AppID : String;
                                    var HeaderStructType : byte;
                                    var HeaderStructLength : word;
                                    var HeaderStructPtr : pointer) : Integer;
        { Add informations from MPEG Audio Datafile to list. Reads
          Catalogues and Order Forms. Can recognize and load older file
          versions. Returns negative number if error reading file,
          mrNone if ok, and mrCancel if user cancels }

      function ExportToMPEGDataFile (outfilename : string;
                                     ToAppend,
                                     RelativePath,
                                     ExportValid : Boolean;
                                     AppID : string;
                                     HeaderStructType : byte;
                                     HeaderStructLength : word;
                                     HeaderStructPtr : pointer) : Integer;
        { Export informations from list to MPEG Audio Datafile }

      procedure ClearList;
        { Clear contents of the list }
      function Count : Integer;
        { Return numberof items in the list }
      procedure Delete (Index : Integer);
        { remove Item from the list by index }
      destructor Destroy; override;{ virtual; }
        { Destroy object }
      destructor Free;
        { Free memory allocated by object }
      property FileDetectionPrecision : Integer
        read FFileDetectionPrecision
        write FFileDetectionPrecision;
        { When attempting to recognize MPEG audio file, object will
          search through file trying to find two valid frame headers
          in a row. If file is correct, they will be found very fast,
          but if file is not MPEG then it will be searched up to it's
          end, and that may take a time. Setting this field to value
          greater than zero, you may specify number of bytes that
          should be searched. If object does not find proper headers
          in speified number of bytes, it will assume file invalid.
          If this property is zero, file will be searched from the
          first to the last byte. We do not reccomend you to use this,
          but if you need you may. }
      function GetFileType (FileName : string) : Integer;
        { Find out type of FileName. Returns FT_UNKNOWN,
          FT_WINAMP_PLAYLIST, FT_MPEG_DATAFILE, FT_MPEG_AUDIO }
      procedure Insert (Index : Integer; NewItem : pointer);
        { Insert new item to the list. New itemmust be pointer
          to TMPEGAudio class type }
      property Items[IndexNr : integer] : TMPEGAudio read FGetMPEGAudio;
        { Indexed access to the Items of the list }
      property SortMethod : TSortMethod read FSortMethod write FSortMethod;
        { Method used for sorting. It may be:
           smNone     - do not sort even if sort method is called
           smUser     - sort by user function specified by
                        UserSortCompareFunc property
           smInternal - use Internal sort based on contents of
                        SortMacro property
        }
      property SortDirection : TSortDirection read FSortDirection write FSortDirection;
        { If true, sort in descending order }
      property UserSortCompareFunc : TListSortCompareFunc
               read FUserSortCompareFunc
               write FUserSortCompareFunc;
        { if SortMethod property is smUser, this property should point to
          user defined function of TListSortCompareFunc type which should
          be used to compare Items }
      property SortMacro : string read FSortMacro write FSortMacro;
        { string value used as sort macro. It is used when SortMethod
        property value is smInternal }
      procedure Sort (Compare: TListSortCompare);
        { method which actually sorts list. We do not recommend it's
        direct use. It's here just for compatibility purpose. Use
        SortMethod property }
      procedure DoSort;
        { methid which sorts list according to SortMethod settings }
      procedure Remove (ItemPtr : pointer);
        { Remove item from the list by pointer }
  end; { TMPEGAudioList class }



{ public functions }

Function SecondsToTime (TimeSec : LongInt) : TDateTime;
  { Convert number of seconds to TDateTime value }

function GetGenreStr (Genre : Integer) : string;
  { Returns string description of Genre code }


{ TMPEGAUDIOLIST supporting functions (public) }

Procedure ResetCatalogHeader (var CatalogHeader : TMPEGDataCatalogue);
  { Reset contents of variable CatalogHeader }

Procedure ResetOrderFormHeader (var OrderFormHeader : TMPEGDataOrder);
  { Reset contents of variable OrderFormHeader }


implementation

{ local types definition }

type
  { Original structure of tag in MPEG AUDIO file. For internal use.
    You should use TMPEGDATA structure.}
  TMPEGTag = packed record
    Header : Array[1..3] of char;      { If tag exists this must be 'TAG' }
    Title : Array[1..30] of char;      { Title data (PChar) }
    Artist : Array[1..30] of char;     { Artist data (PChar) }
    Album : Array[1..30] of char;      { Album data (PChar) }
    Year : Array[1..4] of char;        { Date data }
    Comment : Array[1..30] of char;    { Comment data (PChar) }
    Genre : Byte;                      { Genre data }
  end;

  { Type for delimiters used in some string manipulating functions }
  Delimiter = Set Of Char ;


{************************************************************
 public functions
************************************************************}

{----------------------------------------------}
Function SecondsToTime (timesec : LongInt) : TDateTime;
 { convert LongInt number of seconds to TDateTime }
  var
    tmpHour : word;
    tmpMin : word;
    tmpSec : word;
  begin
    tmpHour := timesec DIV (60*60);
    tmpMin := (timesec - (tmpHour * 60 * 60)) DIV 60;
    tmpSec := timesec - (tmpHour * 60 * 60) - (tmpMin * 60);
    SecondsToTime := EncodeTime (tmpHour, tmpMin, tmpSec,0);
  end;

{----------------------------------------------}
function GetGenreStr (Genre : Integer) : string;
begin
  If Genre <= MaxStyles then
    Result := MusicStyle[Genre]
  else
    Result := 'Unknown';
end;

{************************************************************
 private functions
************************************************************}

{----------------------------------------------}
Procedure winProcessMessages;
{ Allow Windows to process other system messages }
var
  ProcMsg  :  TMsg;
begin
  while PeekMessage(ProcMsg, 0, 0, 0, PM_REMOVE) do begin
    if (ProcMsg.Message = WM_QUIT) then Exit;
    TranslateMessage(ProcMsg);
    DispatchMessage(ProcMsg);
  end; { while }
end; { winProcessMessages }


{----------------------------------------------}
Function PosFirst (InStr, SubStr : String; StartPos : Integer) : Integer;
  { find firs position of SubStr in InStr begining from
    StartPos character. Return zero if SubStr not found. }
var
  Position : Integer;

Begin
  Delete (InStr,1,StartPos-1);
  Position := Pos (SubStr, InStr);
  If Position = 0 then Posfirst := 0 else PosFirst := StartPos + Position - 1;
End; { PosFirst }

{----------------------------------------------}
Function IIFStr (inb : boolean; truestr, falsestr : String) : string;
  { Return TrueStr or FalseStr regarding of value of inB }
  begin
    If Inb then
      IIFStr := TrueStr
    else
      IIFStr := FalseStr;
  end; { function IIFStr }

{----------------------------------------------}
Function IIFLong (inb : boolean; truev, falsev : LongInt) : longint;
  { Return TrueV or FalseV regardin of value of inB }
  begin
    If Inb then
      IIFLong := Truev
    else
      IIFLong := Falsev;
  end; { function IIFLong }

{----------------------------------------------}
Function TrimRight (InStr : string) : string;
  { Delete #32's and #0's from the end of InStr }
var
  i, StrLen : Byte;
begin
  StrLen := Length (instr);
  If StrLen > 0 then begin
    i := Pos (#0, InStr);
    If i > 0 then begin
      Delete (InStr, i, StrLen);
      StrLen := Length (InStr);
    end;
    i := StrLen;
    While (i > 0) and (instr [i] in [' ',#0]) do i := i - 1;
    Delete (instr, i + 1, StrLen);
  end; {if}
  TrimRight := instr;
end; { TrimRight }

{----------------------------------------------}
Function TrimLeft (instr : string) : string;
  { Delete #32's from the begining of InStr }
Var    i, StrLen : Byte;
Begin
  i := 1;
  StrLen := Length (instr);
  If StrLen > 0 then begin
    While (i <= StrLen) and (instr [i] = ' ') do Inc (i);
    Delete (instr, 1, i - 1);
  end; {if}
  TrimLeft := instr;
end; { TrimLeft }

{----------------------------------------------}
Function Trim (instr : string) : string;
  { Delete #32's from the begining of InStr and #32's and #0's
     from the end of InStr }
begin
  Trim := TrimLeft (TrimRight (instr) );
end;

{----------------------------------------------}
Function WordCount (InStr : string; Delimiters : Delimiter) : byte;
  { Count words in InStr. Words are delimited by Delimiters }
var
  i, drum, StrLen : Byte;
begin
  i := 1;
  drum := 0;
  StrLen := Length (instr);
  If (StrLen = 0) or ( (StrLen < 2) and (StrLen > 0) and
     (instr [1] in delimiters) ) then
  begin
    WordCount := 0;
    Exit;
  end; {if}
  While i < StrLen do begin
    If instr [i] in delimiters then Inc (drum);
    Inc (i);
  end; {while}
  WordCount := drum + 1;
end; { WordCount }

{----------------------------------------------}
Function WordGet (InStr : String; Wordnr : Integer;
                  Delimiters : Delimiter) : String;
  { Get word number WordNr from InStr. Words are delimited by Delimiters }
var
  i, drum, wordstart, wordend : Byte;
begin
  i := 1;
  drum := 0;
  wordstart := 1;
  wordend := Length (instr);

  If (wordnr < 1) or (WordCount (instr, Delimiters) < wordnr) then begin
    WordGet := '';
    Exit;
  end;

  While (drum < wordnr) and (i <= wordend) do begin
    If instr [i] in delimiters then begin
      Inc (drum);
      If drum = wordnr - 1 then wordstart := i + 1;
      If drum = wordnr then wordend := i - wordstart;
    end; {if}
    Inc (i);
  end; {while}
  WordGet := Copy (instr, wordstart, wordend);
end; { WordGet }

{----------------------------------------------}
Function Replicate (Fill :Char; Count : Integer) : String;
var
  I : Integer;
begin
  Result := '';
  for I := 1 to Count do Result := Result + Fill;
end;


{----------------------------------------------}
Function IsNumber (instr : String) : Boolean;
  { Check if string contains all numbers }
const
  cifre : set of char = ['0'..'9','.'];
var
  bTemp : Boolean;
  F : Integer;
begin
  bTemp := True;
  If Length (instr) > 0 then begin
    For F := 1 to Length (instr) do begin
      bTemp := bTemp and (InStr[F] in cifre);
      if not bTemp then break;
    end; { for }
  end else bTemp := False; { for }
  IsNumber := bTemp;
end; { isNumber }

{----------------------------------------------}
Function Left (InStr : String; OutLen : Integer) : String;
  { Return OutLen characters from the beginning of InStr.
    If InStr is shorter than OutLen, return whole InStr }
begin
  Left := Copy (instr, 1, outlen);
end; { Left }

{----------------------------------------------}
Function Right (InStr : String; OutLen : Integer) : String;
  { Return OutLen characters from the end of InStr.
    If InStr is shorter than OutLen, return whole InStr }
var
  StrLen : Integer;
begin
  StrLen := Length (instr);
  Right := Copy (instr, StrLen - outlen + 1, outlen);
end; { Right }

{----------------------------------------------}
Function PadLeft (InStr : String; OutLen : Integer; Fill : Char) : String;
var
  temp : String;
begin
  {$IFDEF VER80}
    FillChar (Temp, OutLen, Fill);
    Temp[0] := Chr (OutLen);
  {$ELSE}
    {SetLength (Temp, OutLen);}
    Temp := Replicate (Fill, OutLen);
  {$ENDIF}

  If Length (InStr) <= OutLen then
    Move (InStr [1], Temp [1], Length (InStr) )
  else
    Move (InStr [1], Temp [1], OutLen);
  PadLeft := Temp;
end; { PadLeft }

{----------------------------------------------}
Function PadRight (InStr : String; OutLen : Integer; Fill : Char) : String;
var
  temp : String;
  L : Integer;
begin
  {$IFDEF VER80}
     FillChar (Temp [1], OutLen, Fill);
     Temp[0] := Chr (OutLen);
  {$ELSE}
     { SetLength (Temp, OutLen); }
     Temp := Replicate (Fill, OutLen);
  {$ENDIF}
  L := Length (InStr);
  If L <= OutLen then
    Move (InStr [1], Temp [Succ (OutLen - L) ], L)
  else
    Move (InStr [1], Temp [1], OutLen);
  PadRight := Temp;
end; { PadRight }

{----------------------------------------------}
Function PadCenter (InStr : String; OutLen : Integer; Fill : Char) : String;
var
  temp : String;
  L : Integer;
begin
  If Length(InStr) > OutLen then InStr := Left(instr,OutLen);
  {$IFDEF VER80}
     FillChar (Temp [1], OutLen, Fill);
     Temp[0] := Chr (OutLen);
  {$ELSE}
     { SetLength (Temp, OutLen); }
     Temp := Replicate (Fill, OutLen);
  {$ENDIF}
  L := Length (InStr);
  If L <= OutLen then
    Move (InStr [1], Temp [ ( (OutLen - L) Div 2) + 1], L)
  else
    Temp := Copy (InStr, 1, L);
  PadCenter := temp;
end; { PadCenter }

{----------------------------------------------}
function GetVolumeLabel(Drive: Char): String;
 { Function returns volume label of a disk. Works in all Delphi versions }
var
  SearchString: String[7];
  {$IFDEF VER80}
  SR: TSearchRec;
  P: Byte;
  {$ELSE}
  Buffer : array[0..255] of char;
  a,b : DWORD;
  {$ENDIF}
begin
  {$IFDEF VER80}
  SearchString := Drive + ':\*.*';
  { find vol label }
  if FindFirst(SearchString, faVolumeID, SR) = 0 then begin
    P := Pos('.', SR.Name);
    Result := SR.Name;
    { if it has a dot... }
    if P > 0 then Delete (Result, P, 1);
  end else Result := '';
  {$ELSE}
  SearchString := Drive + ':\' + #0;
  If GetVolumeInformation(@SearchString[1],buffer,sizeof(buffer),nil,a,b,nil,0) then
    Result := buffer
  else Result := '';
  {$ENDIF}
end;

{----------------------------------------------}
function CalcFrameLength (SampleRate, BitRate : LongInt; Padding : Boolean) : Integer;
begin
  If SampleRate > 0 then
    Result := Trunc (144 * BitRate * 1000 / SampleRate + Integer (Padding))
  else Result := 0;
end;

{----------------------------------------------}
function FrameHeaderValid (Data : TMPEGData) : Boolean;
begin
    Result := (Data.FileLength > 5) and (Data.Version > 0) and
              (Data.Layer > 0) and (Data.FileDateTime <> 0) and
              (Data.BitRate > 0) and (Data.SampleRate > 0);
end;

{----------------------------------------------}
function DecodeHeader (MPEGHeader : LongInt; var MPEGData : TMpegData) : Boolean;
  { Decode MPEG Frame Header and store data to TMPEGData fields.
    Return True if header seems valid }
var
  BitrateIndex : byte;
  VersionIndex : byte;

begin
  MPEGData.Version := 0;
  MPEGData.Layer := 0;
  MPEGData.SampleRate := 0;
  MPEGData.Mode := 0;
  MPEGData.Copyright := False;
  MPEGData.Original := False;
  MPEGData.ErrorProtection := False;
  MPEGData.Padding := False;
  MPEGData.BitRate := 0;
  MPEGData.FrameLength := 0;

  If (MPEGHeader and $ffe00000) = $ffe00000 then begin
    VersionIndex := (MPEGHeader shr 19) and $3;
    case VersionIndex of
      0 : MPEGData.Version := MPEG_VERSION_25;      { Version 2.5 }
      1 : MPEGData.Version := MPEG_VERSION_UNKNOWN; { Unknown }
      2 : MPEGData.Version := MPEG_VERSION_2;       { Version 2 }
      3 : MPEGData.Version := MPEG_VERSION_1;       { Version 1 }
    end;
    { if Version is known, read other data }
    If MPEGData.Version <> MPEG_VERSION_UNKNOWN then begin
      MPEGData.Layer := 4 - ((MPEGHeader shr 17) and $3);
      If (MPEGData.Layer > 3) then MPEGData.Layer := 0;

      BitrateIndex := ((MPEGHeader shr 12) and $F);
      MPEGData.SampleRate := MPEG_SAMPLE_RATES[MPEGData.Version][((MPEGHeader shr 10) and $3)];
      MPEGData.ErrorProtection := ((MPEGHeader shr 16) and $1) = 1;
      MPEGData.Copyright := ((MPEGHeader shr 3) and $1) = 1;
      MPEGData.Original := ((MPEGHeader shr 2) and $1) = 1;
      MPEGData.Mode := ((MPEGHeader shr 6) and $3);
      MPEGData.Padding := ((MPEGHeader shr 9) and $1) = 1;
      MPEGData.BitRate := MPEG_BIT_RATES[MPEGData.Version][MPEGData.Layer][BitrateIndex];

      If MPEGData.BitRate = 0 then MPEGData.Duration := 0
      else MPEGData.Duration := (MPEGData.FileLength*8) div (longint(MPEGData.Bitrate)*1000);
      MPEGData.FRameLength := CalcFrameLength (MPEGData.SampleRate, MPEGData.BitRate, MPEGData.Padding);
    end;
    Result := FrameHeaderValid (MPEGData);
  end else Result := False;

end;



{ methods }

{************************************************************
TMPEGAUDIO methods
************************************************************}

{----------------------------------------------}
constructor TMPEGAUDIO.Create;
begin
  inherited Create;
  FMacro := '';
  FText := '';
  FFirstValidFrameHeaderPosition := 0;
  FFileDetectionPrecision := 0;
end;

{----------------------------------------------}
function TMPEGAUDIO.IsValidStr (const IsValidTrue, IsValidFalse : string) : string;
begin
  Result := IIFStr (IsValid, IsValidTrue, IsValidFalse);
end;

{----------------------------------------------}
function TMPEGAUDIO.DataPtr : PMpegData;
begin
  Result := @Data;
end;

{----------------------------------------------}
procedure TMPEGAUDIO.FSetFileName (inStr : string);
begin
  Data.FileName := inStr;
  FReadData;
end;

{----------------------------------------------}
function TMPEGAUDIO.FGetFileName : string;
begin
  Result := Data.FileName;
end;

{----------------------------------------------}
function TMPEGAUDIO.FGetIsValid : Boolean;
begin
  Result := FrameHeaderValid (Data);
end;


{----------------------------------------------}
procedure TMPEGAUDIO.ResetData;
{ Empty MPEG data }
const
  Notag = '[notag]';
begin
  with Data do begin
    Header := 'BAD';
    FillChar (Title, SizeOf (Title), #0);
    Title := NoTag;
    FillChar (Artist, SizeOf (Artist), #0);
    Artist := NoTag;
    FillChar (Album, SizeOf (Album), #0);
    Album := NoTag;
    Year := '    ';
    FillChar (Comment, SizeOf (Comment), #0);
    Comment := NoTag;
    Genre := 255;
    Track := 0;
    Duration := 0;
    FileLength := 0;
    Version := 0;
    Layer := 0;
    SampleRate := 0;
    Mode := 0;
    Copyright := False;
    Original := False;
    ErrorProtection := False;
    Padding := False;
    FrameLength := 0;
    BitRate := 0;
    BPM := 0;
    CRC := 0;
    FillChar (FileName, SizeOf (data.FileName), #0);
    FileDateTime := 0;
    FileAttr := 0;
    FillChar (VolumeLabel, SizeOf (VolumeLabel), #0);
    Selected := 0;
    FillChar (Reserved, SizeOf (data.Reserved), #0);
    FText := Textilize (FMacro);
  end; { with }
end; { function }


{----------------------------------------------}
function TMPEGAUDIO.FReadData : Integer;
var
  f : file;
  tag : TMPEGTag;
  tempStr : string;

  mp3hdrread : array[1..4] of byte;
  mp3hdr : LongInt ABSOLUTE mp3hdrread;
  tempbyte : byte;
  tempLongInt : LongInt;

begin
  Result := -1;
  tempStr := data.FileName;
  ResetData;
  Data.FileName := ExpandFileName (tempStr);

  If FileExists (Data.Filename) then begin
    AssignFile (f, Data.Filename);

    FFirstValidFrameHeaderPosition := 0;
    FileMode := 0;
    {$I-}
    Reset (f,1);
    {$I+}
    Result := IOResult;
    if (Result=0) and (FileSize(f) > 5) then begin
      Data.FileDateTime := FileAge (Data.fileName);
      FFileDateTime := FileDatetoDatetime (Data.FileDateTime);
      Data.FileAttr := FileGetAttr (Data.FileName);
      Data.VolumeLabel := GetVolumeLabel (Data.FileName[1]);
      Data.FileLength := FileSize (f);

      repeat
        { read MPEG heder from file }
        BlockRead (f, mp3hdrread,4);
        tempbyte := mp3hdrread[1];
        mp3hdrread[1] := mp3hdrread[4];
        mp3hdrread[4] := tempbyte;
        tempbyte := mp3hdrread[2];
        mp3hdrread[2] := mp3hdrread[3];
        mp3hdrread[3] := tempbyte;

        While (not DecodeHeader (mp3hdr, Data)) and (not Eof (f)) and
              ((FilePos(f) <= FFileDetectionPrecision)
              or (FFileDetectionPRecision = 0))
        do begin
          { if mpeg header is not at the begining of the file, search file
            to find proper frame sync. This block can be speed up by reading
            blocks of bytes instead reading single byte from file }
           mp3hdr := mp3hdr shl 8;
           BlockRead (f, tempbyte,1);
           mp3hdrread[1] := tempbyte;

          { On each 200 bytes read, release procesor to allow OS do something else too }
          If (FilePos (f) MOD 300) = 0 then winProcessMessages;
        end; { while }

        FFirstValidFrameHeaderPosition := FilePos (f)-4;
        tempLongInt := FileLength - FirstValidFrameHeaderPosition - FrameLength + (2 * Byte(ErrorProtection));

        If (not IsValid) or (TempLongInt <= 0) then begin
          ResetData;
          Data.FileName := ExpandFileName (tempStr);
          Data.FileDateTime := FileAge (Data.fileName);
          FFileDateTime := FileDatetoDatetime (Data.FileDateTime);
          Data.FileAttr := FileGetAttr (Data.FileName);
          Data.FileLength := FileSize (f);
          FFirstValidFrameHeaderPosition := Data.FileLength + 1;
        end else begin
          { Ok, one header is found, but that is not good proof that file realy
            is MPEG Audio. But, if we look for the next header which must be
            FrameLength bytes after first one, we may be very sure file is
            valid. }
          Seek (f, FirstValidFrameHeaderPosition + FrameLength);
          BlockRead (f, mp3hdrread,4);
          tempbyte := mp3hdrread[1];
          mp3hdrread[1] := mp3hdrread[4];
          mp3hdrread[4] := tempbyte;
          tempbyte := mp3hdrread[2];
          mp3hdrread[2] := mp3hdrread[3];
          mp3hdrread[3] := tempbyte;

          If not DecodeHeader (mp3hdr, Data) then begin
            { well, next header is not valid. this is not MPEG audio file }
            ResetData;
            Data.FileName := ExpandFileName (tempStr);
            Data.FileDateTime := FileAge (Data.fileName);
            FFileDateTime := FileDatetoDatetime (Data.FileDateTime);
            Data.FileAttr := FileGetAttr (Data.FileName);
            Data.FileLength := FileSize (f);
            { set file position back to the second byt of header that
              seemed valid tolet function read all bytes that were
              skipped inatempt tofind second header }
            Seek (f, FirstValidFrameHeaderPosition + 1);
          end else begin
            { BINGO!!! This realy is MPEG audio file so we may proceed }
            if Data.FileLength > 128 then begin
              Seek (f,Data.FileLength-128);
              BlockRead(f, tag, 128);
              if tag.header='TAG' then begin
                Data.Header := TrimRight (Tag.Header);
                Data.Title := TrimRight (Tag.Title);
                Data.Artist := TrimRight (Tag.Artist);
                Data.Album := TrimRight (Tag.Album);
                Data.Year := Tag.Year;
                Data.Comment := TrimRight (Tag.Comment);
                Data.Genre := Tag.Genre;
                Data.Track := Ord (Tag.Comment[30]);
              end else Data.Title := ExtractFileName (Data.FileName); { if }
            end; { if }
          end; { if }
        end; { if }
      until IsValid or Eof (f) or ((FilePos(f) > FFileDetectionPrecision) and (FFileDetectionPrecision > 0));
      Close(f);
      FText := Textilize (FMacro);
    end; { if }

  end else Data.Title := '[not found: ' + ExtractFileName (TempStr) + ']';
end; { FReadData }

{----------------------------------------------}
function TMPEGAUDIO.WriteTag : Integer;
var
  f : file;
  newtag : TMPEGTag;

begin
  Result := -1;
  If FileExists (filename) then begin
    FillChar (NewTag, SizeOf (NewTag), 0);
    NewTag.Header := 'TAG';
    Move (Data.Title[1], NewTag.Title, Length(Data.Title));
    Move (Data.Artist[1], NewTag.Artist, Length (Data.Artist));
    Move (Data.Album[1], NewTag.Album, Length (Data.Album));
    Move (Data.Year[1], NewTag.Year, Length (Data.Year));
    Move (Data.Comment[1], NewTag.Comment, Length (Data.Comment));
    NewTag.Genre := Data.Genre;
    NewTag.Comment[30] := Chr (Data.Track);

    RemoveTag;

    AssignFile (f, filename);


    FileMode := 2;
    {$I-}
    Reset (f,1);
    {$I+}
    Result := IOResult;
    if (Result = 0) then begin
       Seek (f,FileSize(F));
       BlockWrite(f, newtag, 128);
       Close(f);
    end;

    FReadData;
  end; { if }
end; { WriteTag }

{----------------------------------------------}
function TMPEGAUDIO.RemoveTag : Integer;
var
  f : file;
  tag : TMPEGTag;

begin
  Result := -1;
  If FileExists (filename) then begin
    AssignFile (f, filename);

    FileMode := 2;
    {$I-}
    Reset (f,1);
    {$I+}
    Result := IOResult;
    if (Result = 0) and (FileSize(F) > 128) then begin
       Seek (f,FileSize(F)-128);
       BlockRead(f, tag, 128);
       if tag.header='TAG' then begin
         Seek (f,FileSize(F)-128);
         Truncate (F);
       end;
       Close(f);
    end;

    FReadData;
  end; { if }
end; { RemoveTag }

{----------------------------------------------}
function TMPEGAUDIO.GenreStr : string;
begin
  If Genre <= MaxStyles then
    Result := MusicStyle[Genre]
  else
    Result := 'Unknown';
end;

{----------------------------------------------}
function TMPEGAUDIO.ModeStr : string;
begin
  Result := MPEG_MODES[Mode]
end;

{----------------------------------------------}
function TMPEGAUDIO.DurationTime : TDateTime;
begin
  Result := SecondsToTime (Duration)
end;

{----------------------------------------------}
function TMPEGAUDIO.LayerStr : string;
begin
  Result := MPEG_LAYERS[Layer]
end;

{----------------------------------------------}
function TMPEGAUDIO.CopyrightStr (const CopyrightTrue, CopyrightFalse : string) : string;
begin
  Result := IIFStr (Copyright, CopyrightTrue, CopyrightFalse);
end;

{----------------------------------------------}
function TMPEGAUDIO.OriginalStr (const OriginalTrue, OriginalFalse : string) : string;
begin
  Result := IIFStr (Original, OriginalTrue, OriginalFalse);
end;

{----------------------------------------------}
function TMPEGAUDIO.ErrorProtectionStr (const ErrorProtectionTrue, ErrorProtectionFalse : string) : string;
begin
  Result := IIFStr (ErrorProtection, ErrorProtectionTrue, ErrorProtectionFalse);
end;

{----------------------------------------------}
function TMPEGAUDIO.SelectedStr (const SelectedTrue, SelectedFalse : string) : string;
begin
  Result := IIFStr (Selected > 0, SelectedTrue, SelectedFalse);
end;

{----------------------------------------------}
function TMPEGAUDIO.FGetMPEGValue (ItemStr : string) : string;
  var
    ItemName : string;
    ItemAlignment : char;
    ItemLength : Integer;
    ItemPadChar : char;
    tempstr : string;
    DefaultLength : integer;
    DefaultAlignment : char;

  begin
    { skini znak '%' s pocetka i kraja stringa }
    ItemStr := Copy (ItemStr, 2, Length (ItemStr)-2);

    { procitaj ime polja }
    ItemName := UpperCase (Trim (WordGet (ItemStr, 1, [','])));

    { ako je Item prazan string, tj. bila su dva znaka % uzastopno treba
      ih zameniti jednim znakom & }
    If ItemName = '' then Result := '%'
    else begin
      DefaultAlignment := 'L';
      { ako je item broj, to znaci da treba staviti ascii znak s tim kodom }
      If IsNumber (ItemName) then begin
        ItemName := Chr (StrToIntDef (ItemName, 1));
        If ItemName = #0 then ItemName := #1;
        DefaultLength := 1;
      end else
      { ako je item NewLine, treba ubaciti kod za novi red }
      if (ItemName = 'NEWLINE') or (ItemName = 'NL') then begin
        ItemName := Chr (13) + Chr (10) + '';
        DefaultLength := 2;
      end else
      { ako je item #, treba ga ignorisati, jer je to kod za SoftNewLine }
      if (ItemName = 'SOFTNEWLINE') or (ItemName = '#') then begin
        ItemName := '';
        DefaultLength := 0;
      end else
      { ako je item TAB ubaciti tabulator }
      if (ItemName = 'TAB') or (ItemName = 'TB') then begin
        ItemName := #9;
        DefaultLength := 1;
      end else
      if (ItemName = 'FILENAME') or (ItemName = 'FN') then begin
        ItemName := ExtractFileName (FileName);
        DefaultLength := 40;
      end else
      if (ItemName = 'FILEPATH') or (ItemName = 'FP') then begin
        ItemName := ExtractFilePath (FileName);
        DefaultLength := 40;
      end else
      if (ItemName = 'VOLUMELABEL') or (ItemName = 'VL') then begin
        ItemName := ExtractFileName (VolumeLabel);
        DefaultLength := 11;
      end else
      if (ItemName = 'TITLE') or (ItemName = 'T') then begin
        ItemName := Trim (Title);
        DefaultLength := 30;
      end else
      if (ItemName = 'ARTIST') or (ItemName = 'A') then begin
        ItemName := Trim (Artist);
        DefaultLength := 30;
      end else
      if (ItemName = 'ALBUM') or (ItemName = 'ALB') then begin
        ItemName := Trim (Album);
        DefaultLength := 35;
      end else
      if (ItemName = 'YEAR') or (ItemName = 'Y') then begin
        ItemName := Trim (Year);
        DefaultLength := 4;
      end else
      if (ItemName = 'COMMENT') or (ItemName = 'CMNT') then begin
        ItemName := Trim (Comment);
        DefaultLength := 30;
      end else
      if (ItemName = 'GENRE') or (ItemName = 'G') then begin
        ItemName := GenreStr;
        DefaultLength := 25;
      end else
      if (ItemName = 'GENRENR') or (ItemName = 'GNR') then begin
        ItemName := IntToStr (Genre);
        DefaultLength := 3;
        DefaultAlignment := 'R';
      end else
      if (ItemName = 'TRACK') or (ItemName = 'TR') then begin
        ItemName := IntToStr (Track);
        DefaultLength := 3;
        DefaultAlignment := 'R';
      end else
      if (ItemName = 'DURATION') or (ItemName = 'D') then begin
        ItemName := IntToStr (Duration);
        DefaultLength := 4;
        DefaultAlignment := 'R';
      end else
      if (ItemName = 'DURATIONCOMMA') or (ItemName = 'DC') then begin
        ItemName := TrimLeft (Format ('%12.0n', [Duration/1]));
        DefaultLength := 5;
        DefaultAlignment := 'R';
      end else
      if (ItemName = 'DURATIONFORM') or (ItemName = 'DF') then begin
        ItemName := FormatDatetime ('nn:ss', SecondsToTime (Duration));
        DefaultLength := 5;
        DefaultAlignment := 'R';
      end else
      if (ItemName = 'LENGTH') or (ItemName = 'L') then begin
        ItemName := IntToStr (FileLength);
        DefaultLength := 9;
        DefaultAlignment := 'R';
      end else
      if (ItemName = 'FILEDATE') or (ItemName = 'FD') then begin
        ItemName := FormatDatetime ('dd.mm.yyyy', FileDateTime);
        DefaultLength := 10;
      end else
      if (ItemName = 'FILETIME') or (ItemName = 'FT') then begin
        ItemName := FormatDatetime ('hh:nn:ss', FileDateTime);
        DefaultLength := 8;
      end else
      if (ItemName = 'LENGTHCOMMA') or (ItemName = 'LC') then begin
        ItemName := TrimLeft (Format ('%14.0n', [FileLength/1]));
        DefaultLength := 12;
        DefaultAlignment := 'R';
      end else
      if (ItemName = 'LENGTHKB') or (ItemName = 'LK') then begin
        ItemName := IntToStr (FileLength DIV 1024);
        DefaultLength := 6;
        DefaultAlignment := 'R';
      end else
      if (ItemName = 'LENGTHKBCOMMA') or (ItemName = 'LKC') then begin
        ItemName := TrimLeft (Format ('%10.0n', [FileLength / 1024]));
        DefaultLength := 8;
        DefaultAlignment := 'R';
      end else
      if (ItemName = 'LENGTHMB') or (ItemName = 'LM') then begin
        ItemName := TrimLeft (Format ('%3.1f', [FileLength / (1024*1024)]));
        DefaultLength := 5;
        DefaultAlignment := 'R';
      end else
      if (ItemName = 'VERSION') or (ItemName = 'V') then begin
        ItemName := MPEG_VERSIONS [Version];
        DefaultLength := 3;
      end else
      if (ItemName = 'LAYER') or (ItemName = 'LY') then begin
        ItemName := LayerStr;
        DefaultLength := 3;
      end else
      if (ItemName = 'LAYERNR') or (ItemName = 'LYN') then begin
        ItemName := IntToStr (Layer);
        DefaultLength := 1;
      end else
      if (ItemName = 'SAMPLERATE') or (ItemName = 'SR') then begin
        ItemName := IntToStr (SampleRate);
        DefaultLength := 5;
        DefaultAlignment := 'R';
      end else
      if (ItemName = 'SAMPLERATEKB') or (ItemName = 'SRK') then begin
        ItemName := TrimLeft (Format ('%4.1f', [SampleRate/1000]));
        DefaultLength := 4;
        DefaultAlignment := 'R';
      end else
      if (ItemName = 'ERRORPROT') or (ItemName = 'EP') then begin
        ItemName := ErrorProtectionStr ('Yes','No');
        DefaultLength := 3;
      end else
      if (ItemName = 'ERRORPROT*') or (ItemName = 'EP*') then begin
        ItemName := ErrorProtectionStr ('*',' ');
        DefaultLength := 1;
      end else
      if (ItemName = 'COPYRIGHT') or (ItemName = 'C') then begin
        ItemName := CopyrightStr ('Yes','No');
        DefaultLength := 3;
      end else
      if (ItemName = 'COPYRIGHT*') or (ItemName = 'C*') then begin
        ItemName := CopyrightStr ('*',' ');
        DefaultLength := 1;
      end else
      if (ItemName = 'ORIGINAL') or (ItemName = 'O') then begin
        ItemName := OriginalStr ('Yes','No');
        DefaultLength := 3;
      end else
      if (ItemName = 'ORIGINAL*') or (ItemName = 'O*') then begin
        ItemName := OriginalStr ('*',' ');
        DefaultLength := 1;
      end else
      if (ItemName = 'MODE') or (ItemName = 'M') then begin
        ItemName := ModeStr;
        DefaultLength := 12;
      end else
      if (ItemName = 'STEREO') or (ItemName = 'S') then begin
        ItemName := IIFStr (Mode <> 3,'Stereo','Mono');
        DefaultLength := 6;
      end else
      if (ItemName = 'BITRATE') or (ItemName = 'BR') then begin
        ItemName := IntToStr (Bitrate);
        DefaultLength := 3;
        DefaultAlignment := 'R';
      end else
      if (ItemName = 'FRAMELENGTH') or (ItemName = 'FL') then begin
        ItemName := IntToStr (FrameLength);
        DefaultLength := 4;
        DefaultAlignment := 'R';
      end else
      if (ItemName = 'SELECTEDNR') or (ItemName = 'SLN') then begin
        ItemName := IntToStr (Selected);
        DefaultLength := 3;
        DefaultAlignment := 'R';
      end else
      if (ItemName = 'SELECTED') or (ItemName = 'SL') then begin
        ItemName := SelectedStr ('Yes','No');
        DefaultLength := 3;
      end else
      if (ItemName = 'SELECTED*') or (ItemName = 'SL*') then begin
        ItemName := SelectedStr ('*',' ');
        DefaultLength := 3;
      end else
      if (ItemName = 'VALID') or (ItemName = 'VD') then begin
        ItemName := IsValidStr ('Yes','No');
        DefaultLength := 3;
      end else
      if (ItemName = 'VALID*') or (ItemName = 'VD*') then begin
        ItemName := IsValidStr ('*',' ');
        DefaultLength := 3;
      end else begin
        ItemName := '%' + ItemStr + '%';
        ItemStr := '';
        DefaultLength := -1;
        DefaultAlignment := 'T';
      end;

      { procitaj duzinu polja }
      TempStr := Trim (WordGet (ItemStr, 3, [':',',']));
      ItemLength := StrToIntDef (TempStr,-1);

      { procitaj nacin poravnanja polja }
      TempStr := UpperCase (Trim (WordGet (ItemStr, 2, [':',','])))+' ';
      If TempStr[1] IN ['L','R','C','T'] then
        ItemAlignment := TempStr[1]
      else begin
        ItemAlignment := DefaultAlignment;
        ItemLength := 0;
      end;

      { procitaj znak za popunjavanje }
      TempStr := Trim (WordGet (ItemStr, 4, [',']))+' ';
      ItemPadChar := TempStr[1];

      { ako se stavlja polje stvarne duzine, onda se izbegava bilo kakvo formatirnje }
      If ItemLength < 0 then Result := ItemName
      else begin { u suprotnom mora se formatirati sadrzaj pre stavljanja u izlaznu datoteku }

        { ako je duzina polja 0 to znaci da se koristi default duzina polja }
        if ItemLength = 0 then ItemLength := DefaultLength;
        {$IFDEF VER80}
          if ItemLength > 155 then ItemLength := 255;
        {$ENDIF}

        Case ItemAlignment of
          { levo poravnanje }
          'L' : ItemName := PadLeft (ItemName, ItemLength, ItemPadChar);
          { desno poravnanje }
          'R' : ItemName := PadRight (ItemName, ItemLength, ItemPadChar);
          { centrirano }
          'C' :ItemName := PadCenter (ItemName, ItemLength, ItemPadChar);
          { trimovano }
          'T' :ItemName := ItemName;
        end; { case }
        Result := ItemName;
      end; { if }
    end; { if }
  end; { function GetMPEGValue }

{----------------------------------------------}
procedure TMPEGAUDIO.FSetMacro (MacroStr : string);
begin
  FMacro := (MacroStr);
  FText := Textilize (FMacro);
end;

{----------------------------------------------}
function TMPEGAUDIO.Textilize (MacroStr : string) : string;
var
  nextpart : integer;
  InStrLen : integer;
  ItemPos : Integer;
  ItemLast : integer;
  ItemStr : string;
  ItemOut : string;
  OutStr : string;
begin
  { FMacro := MacroStr; }
  outStr := '';
  nextpart := 1;
  InStrLen := Length (MacroStr);

  while nextpart <= InStrLen do begin
    itemPos := PosFirst (MacroStr, '%', nextpart);
    If (ItemPos - nextpart) > 0 then
      Outstr := OutStr + Copy (MacroStr,nextpart, ItemPos-NextPart);
    If ItemPos <> 0 then begin
      itemLast := PosFirst (MacroStr, '%', ItemPos+1);
      If ItemLast <> 0 then begin
        ItemStr := Copy (MacroStr, ItemPos+1, ItemLast-ItemPos-1);
        nextpart := ItemLast+1;
        ItemOut := FGetMPEGValue ('%'+ItemStr+'%');
        If Length (ItemOut) > 0 then OutStr := OutStr + ItemOut;
      end else begin
        OutStr := OutStr + '<<<ERROR!!! No end of item definition!>>>';
        nextPart := InStrLen+1;
      end; { if }
    end else begin
      OutStr := OutStr + Copy (MacroStr, nextpart, InStrLen);
      nextPart := InStrLen+1;
    end;
  end; { while }
  Result := outstr;
  { FText := Result; }
end;


{----------------------------------------------}
procedure TMPEGAUDIO.FSetArtist (inString : string30);
begin
  data.Artist := inString;
  FText := Textilize (FMacro);
end;

{----------------------------------------------}
procedure TMPEGAUDIO.FSetAlbum (inString : string30);
begin
  data.Album := inString;
  FText := Textilize (FMacro);
end;

{----------------------------------------------}
procedure TMPEGAUDIO.FSetYear (inString : string4);
begin
  data.Year := inString;
  FText := Textilize (FMacro);
end;

{----------------------------------------------}
procedure TMPEGAUDIO.FSetComment (inString : string30);
begin
  data.Comment := inString;
  FText := Textilize (FMacro);
end;

{----------------------------------------------}
procedure TMPEGAUDIO.FSetVolumeLabel (inString : string20);
begin
  data.VolumeLabel := inString;
  FText := Textilize (FMacro);
end;

{----------------------------------------------}
procedure TMPEGAUDIO.FSetGenre (inByte : byte);
begin
  data.Genre := inByte;
  FText := Textilize (FMacro);
end;

{----------------------------------------------}
procedure TMPEGAUDIO.FSetTrack (inByte : byte);
begin
  data.Track := inByte;
  FText := Textilize (FMacro);
end;

{----------------------------------------------}
procedure TMPEGAUDIO.FSetSelected (inWord : word);
begin
  data.Selected := inWord;
  FText := Textilize (FMacro);
end;


{************************************************************
TMPEGAUDIOLIST supporting functions (public)
************************************************************}

{----------------------------------------------}
Procedure ResetCatalogHeader (var CatalogHeader : TMPEGDataCatalogue);
  { reset contents of variable CatalogHeader }
  begin
    with CatalogHeader do begin
    FillChar (Title, SizeOf (Title), #0);
    FillChar (Publisher, SizeOf (Publisher), #0);
    FillChar (City, SizeOf (City), #0);
    FillChar (ZIP, SizeOf (ZIP), #0);
    FillChar (Country, SizeOf (Country), #0);
    FillChar (Address, SizeOf (Address), #0);
    FillChar (Phone, SizeOf (Phone), #0);
    FillChar (Fax, SizeOf (Fax), #0);
    FillChar (Email, SizeOf (Email), #0);
    FillChar (WWWURL, SizeOf (WWWURL), #0);
    end; { with }
  end; { function }


{----------------------------------------------}
Procedure ResetOrderFormHeader (var OrderFormHeader : TMPEGDataOrder);
  { reset contents of variable OrderFormHeader }
  begin
    with OrderFormHeader do begin
    FillChar (CustomerID, SizeOf (customerID), #0);
    FillChar (Name, SizeOf (Name), #0);
    FillChar (City, SizeOf (City), #0);
    FillChar (ZIP, SizeOf (ZIP), #0);
    FillChar (Country, SizeOf (Country), #0);
    FillChar (Address, SizeOf (Address), #0);
    FillChar (Phone, SizeOf (Phone), #0);
    FillChar (Fax, SizeOf (Fax), #0);
    FillChar (Email, SizeOf (Email), #0);
    end; { with }
  end; { function }



{************************************************************
TMPEGAUDIOLIST methods
************************************************************}

{----------------------------------------------}
constructor TMPEGAudioList.Create;
begin
  inherited Create;
  ShowProgressfunc := nil;
  ShowProgressErrorFunc := nil;
  ShowExportProgressFunc := nil;
  UserSortCompareFunc := nil;
  SortDirection := srtAscending;
end;

{----------------------------------------------}
function TMPEGAudioList.Count : Integer;
begin
  Result := inherited Count;
end;

{----------------------------------------------}
function TMPEGAudioList.Add (NewItem : TMPEGData) : Integer;
begin
  MPEGFile := TMPEGAudio.Create;
  MPEGFile.FileDetectionPrecision := FFileDetectionPrecision;
  MPEGFile.Data := NewItem;
  Result := inherited Add (MPEGFile);
end;

{----------------------------------------------}
procedure TMPEGAudioList.Insert (Index : Integer; NewItem : pointer);
begin
  MPEGFile := TMPEGAudio.Create;
  MPEGFile.FileDetectionPrecision := FFileDetectionPrecision;
  MPEGFile.Data := TMPEGData (NewItem^);
  inherited Insert (Index, MPEGFile);
end;

{----------------------------------------------}
function TMPEGAudioList.AddFile (NewFileName : string) : Integer;
begin
  MPEGFile := TMPEGAudio.Create;
  MPEGFile.FileDetectionPrecision := FFileDetectionPrecision;
  MPEGFile.FileName := NewFileName;
  Result := inherited Add (MPEGFile);
end;

{----------------------------------------------}
function TMPEGAudioList.AddFromWinAmpList (PlayListName : string) : Integer;
var
  i : Integer;
  WinAmpList : TStringList;
  Index : Integer;

begin
  { Load WinAmp playlist }
  WinAmpList := TStringList.Create;
  PlayListName := ExpandFileName (PlayListName);
  WinAmpList.LoadFromFile (PlayListName);

  Result := mrNone;

  for i := 0 to WinAmpList.Count-1 do begin
    WinAmpList.Strings[i] := ExpandFileName (WinAmpList.Strings[i]);

    repeat
      Index := AddFile (WinAmpList.Strings[i]);

      If (@FShowProgressFunc <> nil) then begin
        if not FShowProgressFunc (Items[Index].Data, PlayListName, i+1, WinAmpList.Count) then
         Result := mrCancel;
      end else
      if Not Items[Index].IsValid and (@FShowProgressErrorFunc <> nil) then
        Result := FShowProgressErrorFunc (Items[Index].Data);


    until Result <> mrRetry;
    If Result = mrCancel then Break;

    { On each 30 iterations, release procesor to allow OS do
      something else too }
    If (i MOD 30) = 0 then winProcessMessages;
  end; { for }
  WinAmpList.Free;
end;

{----------------------------------------------}
function TMPEGAudioList.ExportToWinAmpList (outfilename : string;
                                            ToAppend,
                                            RelativePath,
                                            ExportValid : Boolean) : integer;
var
  F : Integer;
  outfile : text;
  outstr : string;

begin
  Result := -1;
  If Count > 0 then begin
    OutFileName := ExpandFileName (OutFileName);
    Assign (OutFile, OutFileName);
    FileMode := 2;
    try
      If ToAppend and FileExists (OutfileName) then Append (OutFile)
      else Rewrite (outFile);

      Result := 0;
      For F := 0 to Count-1 do begin
        If F div 10 = 0 then winProcessMessages;
        outstr := items[f].Filename;
        If ExportValid and items[f].IsValid then begin
          If RelativePath and
             (UpperCase (Copy (OutStr, 1, Length(ExtractFilePath (OutfileName)))) = UpperCase (ExtractFilePath (OutFileName)))
          then OutStr := Copy (OutStr, Length(ExtractFilePath (OutFileName)) + 1, Length (OutStr));
          If (@FShowExportProgressFunc <> nil) and not FShowExportProgressFunc (items[F].Data, F+1) then begin
            Result := mrCancel;
            Break;
          end;
          WriteLn (OutFile, OutStr);
        end; { if }
      end; { for }
      Flush (OutFile);
      CloseFile (OutFile);

    except
      {MessageBeep (mb_IconExclamation);
      MessageDlg ('Error writing file: ' + OutFileName + #13#10,
                   mtWarning, [mbOk], 0); }
      Result := -1;
    end;
  end; { if }
end; { Function }


{----------------------------------------------}
function TMPEGAudioList.AddFromMPEGDatafile (DataFileName : string;
                                               var AppID : String;
                                               var HeaderStructType : byte;
                                               var HeaderStructLength : word;
                                               var HeaderStructPtr : pointer) : Integer;

type
  hdrarray = array[1..255] of byte;

var
  f : file;
  tempstr : string[9];
  MPEGData1v0 : TMPEGData1v0;
  MPEGData1v1 : TMPEGData1v1;
  MPEGFile : TMPEGAudio;
  Counter : Integer;
  tmpHeaderLength : byte;
  HeaderData : ^byte; {hdrArray;}
  AppIDData : string[255];
  AppIDDataLen : byte;
  fver : word;
  TotalNum : Integer;

begin
  Counter := 0;
  Result := mrNone;

  try
    AssignFile (f, DataFileName);
    FileMode := 0;
    {$I-}
    Reset (f,1);
    {$I+}
    BlockRead (f, tempstr, SizeOf (tempstr));

    if Copy (TempStr, 1, 7) = 'MP3DATA' then begin

      fver := Ord (tempstr[8])*256 + ord (tempstr[9]);

      BlockRead (f, AppIDDataLen, 1);

      BlockRead (f, AppIDData[1], AppIDDataLen);
      {$IFDEF VER80}
      appIDData[0] := chr (AppIDDataLen);
      {$ELSE}
      SetLength (AppIDData, AppIDDataLen);
      {$ENDIF}

      { AppID := Copy (AppIdData, 2, Ord (AppIdData[1])); }
      AppID := AppIdData;

      BlockRead (f, HeaderStructType, 1);

      { file headr is different in version 1.0 }
      If fver = $0100 then begin
        BlockRead (f, tmpHeaderLength, 1);
        HeaderStructLength := tmpHeaderLength;
      end else BlockRead (f, HeaderStructLength, 2);

      GetMem (HeaderData, HeaderStructLength);

      BlockRead (f, HeaderData^, HeaderStructLength);

      HeaderStructPtr := HeaderData;

      while not EOF (f) do begin
        Counter := Counter + 1;
        MPEGFile := TMpegAudio.Create;
        MPEGFile.FileDetectionPrecision := FFileDetectionPrecision;
        MPEGFile.ResetData;

        case fver of
          $0100 : begin
                    { if older structure type, convert to new structure }
                    BlockRead (f, MPEGData1v0, SizeOf (TMPEGData1v0));
                    MPEGFile.Data.Header := MPEGData1v0.Header;
                    MPEGFile.Data.Title := MPEGData1v0.Title;
                    MPEGFile.Data.Artist := MPEGData1v0.Artist;
                    MPEGFile.Data.Album := MPEGData1v0.Album;
                    MPEGFile.Data.Year := MPEGData1v0.Year;
                    MPEGFile.Data.Comment := MPEGData1v0.Comment;
                    MPEGFile.Data.Genre := MPEGData1v0.Genre;
                    MPEGFile.Data.Track := MPEGData1v0.Track;
                    MPEGFile.Data.Duration := MPEGData1v0.Duration;
                    MPEGFile.Data.FileLength := MPEGData1v0.FileLength;
                    MPEGFile.Data.Version := MPEGData1v0.Version;
                    MPEGFile.Data.Layer := MPEGData1v0.Layer;
                    MPEGFile.Data.SampleRate := Trunc (MPEGData1v0.SampleRate * 1000);
                    MPEGFile.Data.BitRate := MPEGData1v0.BitRate;
                    MPEGFile.Data.BPM := MPEGData1v0.BPM;
                    MPEGFile.Data.Mode := MPEGData1v0.Mode;
                    MPEGFile.Data.Copyright := MPEGData1v0.Copyright;
                    MPEGFile.Data.Original := MPEGData1v0.Original;
                    MPEGFile.Data.ErrorProtection := MPEGData1v0.ErrorProtection;
                    MPEGFile.Data.CRC := MPEGData1v0.CRC;
                    MPEGFile.Data.FileName := MPEGData1v0.FileName;
                    MPEGFile.Data.FileDateTime := DateTimeToFileDate (MPEGData1v0.FileDateTime);
                    MPEGFile.FFileDateTime := MPEGData1v0.FileDateTime;
                    MPEGFile.Data.FileAttr := MPEGData1v0.FileAttr;
                    MPEGFile.Data.VolumeLabel :=  MPEGData1v0.VolumeLabel;
                  end;
          $0101 : begin
                    { if older structure type, convert to new structure }
                    BlockRead (f, MPEGData1v1, SizeOf (TMPEGData1v1));
                    MPEGFile.Data.Header := MPEGData1v1.Header;
                    MPEGFile.Data.Title := MPEGData1v1.Title;
                    MPEGFile.Data.Artist := MPEGData1v1.Artist;
                    MPEGFile.Data.Album := MPEGData1v1.Album;
                    MPEGFile.Data.Year := MPEGData1v1.Year;
                    MPEGFile.Data.Comment := MPEGData1v1.Comment;
                    MPEGFile.Data.Genre := MPEGData1v1.Genre;
                    MPEGFile.Data.Track := MPEGData1v1.Track;
                    MPEGFile.Data.Duration := MPEGData1v1.Duration;
                    MPEGFile.Data.FileLength := MPEGData1v1.FileLength;
                    MPEGFile.Data.Version := MPEGData1v1.Version;
                    MPEGFile.Data.Layer := MPEGData1v0.Layer;
                    MPEGFile.Data.SampleRate := Trunc (MPEGData1v1.SampleRate * 1000);
                    MPEGFile.Data.BitRate := MPEGData1v1.BitRate;
                    MPEGFile.Data.BPM := MPEGData1v0.BPM;
                    MPEGFile.Data.Mode := MPEGData1v0.Mode;
                    MPEGFile.Data.Copyright := MPEGData1v1.Copyright;
                    MPEGFile.Data.Original := MPEGData1v1.Original;
                    MPEGFile.Data.ErrorProtection := MPEGData1v1.ErrorProtection;
                    MPEGFile.Data.CRC := MPEGData1v1.CRC;
                    MPEGFile.Data.FileName := MPEGData1v1.FileName;
                    MPEGFile.Data.FileDateTime := DateTimeToFileDate (MPEGData1v1.FileDateTime);
                    MPEGFile.FFileDateTime := MPEGData1v1.FileDateTime;
                    MPEGFile.Data.FileAttr := MPEGData1v1.FileAttr;
                    MPEGFile.Data.VolumeLabel :=  MPEGData1v1.VolumeLabel;
                  end;
          $0102 : BlockRead (f, MPEGFile.Data, SizeOf (TMPEGData))
          else Result := -1;

        end; { case }

        Add (MPEGFile.Data);
        If (@FShowProgressFunc <> nil) then begin
          TotalNum := FileSize (f) DIV SizeOf (TMPEGdata);
          if not FShowProgressFunc (MPEGFile.Data, DataFileName, Counter+1, TotalNum) then
          begin
            Result := mrCancel;
            Break;
          end; { if }
        end; { if }

        { On each 30 iterations, release procesor to allow OS do
          something else too }
        If (Counter MOD 30) = 0 then winProcessMessages;

      end; { while }
    end else Result := -1; { if }
    Close (f);
    { ucitano sve iz MP3DataFile }
  except
    {MessageBeep (mb_IconExclamation);
    MessageDlg ('Error reading file: ' + ListFileName,
                 mtWarning, [mbOk], 0);}
    Result := -1; {error reading file }
  end;
end;

{----------------------------------------------}
function TMPEGAudioList.ExportToMPEGDataFile (outfilename : string;
                            ToAppend, RelativePath,
                            ExportValid : Boolean;
                            AppID : string;
                            HeaderStructType : byte;
                            HeaderStructLength : word;
                            HeaderStructPtr : pointer) : Integer;


var
  F : Integer;
  outfile : file;
  OutStr : string;
  WriteResult : Integer;
  tempInt : Integer;
  StructPtr : ^byte;

begin
  Result := -1;
  { Force MPEGAUDIODATAFILE version to 1.2, sicne this function exports
    only to that file version. }
  MPEG_DATAFILE_SIGN[8] := #1;
  MPEG_DATAFILE_SIGN[9] := #2;

  { podesi tacnu duzinu za predefinisane tipove zapisa }
  If HeaderStructType = MPEG_DF_CATALOGUE then HeaderStructLength := SizeOf (TMPEGDataCatalogue)
  else if HeaderStructType = MPEG_DF_ORDER_FORM then HeaderStructLength := SizeOf (TMPEGDataOrder);

  If Count > 0 then begin
    OutFileName := ExpandFileName (OutFileName);

    try
      Assign (OutFile, OutFileName);
      FileMode := 2;
      If ToAppend and FileExists (OutFileName) then begin
        Reset (OutFile,1);
        Seek (OutFile, FileSize (OutFile));
      end else begin
        Rewrite (outFile,1);
        BlockWrite (OutFile, MPEG_DATAFILE_SIGN, SizeOf (MPEG_DATAFILE_SIGN), WriteResult);
        BlockWrite (OutFile, AppID, Length (AppID)+1, WriteResult);
        BlockWrite (OutFile, HeaderStructType, 1, WriteResult);
        BlockWrite (OutFile, HeaderStructLength, 2, WriteResult);
        StructPtr := HeaderStructPtr;
        BlockWrite (OutFile, StructPtr^, HeaderStructLength, WriteResult)
      end;

      For F := 0 to Count-1 do begin
        If F div 10 = 0 then winProcessMessages;
        FillChar (OutStr, SizeOf (outStr), #0);
        OutStr := Items[F].FileName;
        If ExportValid and Items[f].IsValid then begin
          If RelativePath and
             (UpperCase (Copy (OutStr, 1, Length(ExtractFilePath (OutfileName)))) =
              UpperCase (ExtractFilePath (OutFileName)))
          then OutStr := Copy (OutStr, Length(ExtractFilePath (OutFileName)) + 1, Length (OutStr));
          Items[F].FileName := OutStr;

          tempInt := Length (OutStr);

          { ovo mozda ne radi pod d3 }
          Items[F].FileName := PadLeft (Items[F].FileName, SizeOf (Items[F].Data.FileName)-1, #0);
          Items[F].FileName := Copy (Items[F].FileName, 1, tempInt);

          {tempInt := Length (TagPtr^.ListName);}
          { ovo mozda ne radi pod d3 }
          {TagPtr^.ListName := PadLeft (TagPtr^.ListName, SizeOf (TagPtr^.ListName)-1, #0);
          TagPtr^.ListName := Copy (TagPtr^.ListName, 1, tempInt); }

          If (@FShowExportProgressFunc <> nil) then
            If Not ShowExportProgressFunc (Items[F].Data, F+1) then begin
              Result := mrCancel;
              Break;
            end; { if }

          BlockWrite (OutFile, Items[F].Data, SizeOf (Items[F].Data), WriteResult);

          If WriteResult <> SizeOf (Items[F].Data) then begin
            { MessageBeep (mb_IconExclamation);
            MessageDlg ('Error writing file: ' + OutFileName + #13#10 +
                       'Disk is probably full.', mtWarning, [mbOk], 0); }
            Result := -1;
            Break;
          end;
        end; { if }
      end; { for }
      CloseFile (OutFile);
    except
      {MessageBeep (mb_IconExclamation);
      MessageDlg ('Error writing file: ' + OutFileName + #13#10,
                   mtWarning, [mbOk], 0);}
      Result := -1;
    end;
  end; { if }
end; { function }


{----------------------------------------------}
function TMPEGAudioList.FGetMPEGAudio(IndexNr : integer) : TMPEGAudio;
begin
  Result := TMPEGAudio (inherited Items[IndexNr]);
end;


{----------------------------------------------}
procedure TMPEGAudioList.ClearList;
var f : Integer;
begin
  for F := 0 to Count-1 do begin
    MPEGFile := inherited Items[F];
    MPEGFile.Free;
    MPEGFile := nil;
  end;
  inherited Clear;
end;

{----------------------------------------------}
procedure TMPEGAudioList.Delete (Index : Integer);
begin
  MPEGFile := inherited Items[Index];
  MPEGFile.Free;
  MPEGFile := nil;
  inherited Delete(Index);
end;

{----------------------------------------------}
procedure TMPEGAudioList.Remove (ItemPtr : pointer);
begin
  MPEGFile := ItemPtr;
  MPEGFile.Free;
  MPEGFile := nil;
  inherited Remove (ItemPtr);
end;

{----------------------------------------------}
function TMPEGAudioList.GetFileType (filename : string) : Integer;
var
  f : file;
  fsize : Longint;
  tempstr : string[10];
  mp3hdrread : array[1..4] of byte;
  mp3hdr : LongInt ABSOLUTE mp3hdrread;
  tempbyte : byte;
  Data : TMPEGData;
  FirstValidFrame : Word;
  tempLongInt : LongInt;

begin
  AssignFile (f, filename);

  FileMode := 0;

  {$I-}
  Reset (f,1);
  {$I+}

  Result := FT_UNKNOWN;

  fsize:= FileSize (f);
  If Fsize > SizeOf (TempStr) then begin
     BlockRead (f, tempstr, SizeOf (tempstr));
     If UpperCase (Copy (tempstr,1,7)) = 'MP3DATA' then
        Result := FT_MPEG_DATAFILE;
  end;
  If (Result = FT_UNKNOWN) and (fsize > 4) then begin
    Seek (f, 0);
    repeat
      { check for MPEG Audio }
      { read MPEG heder from file }
      BlockRead (f, mp3hdrread,4);
      tempbyte := mp3hdrread[1];
      mp3hdrread[1] := mp3hdrread[4];
      mp3hdrread[4] := tempbyte;
      tempbyte := mp3hdrread[2];
      mp3hdrread[2] := mp3hdrread[3];
      mp3hdrread[3] := tempbyte;

      Data.FileLength := FileSize (f);

      While (not DecodeHeader (mp3hdr, Data)) and (not Eof (f)) and
            ((FilePos(f) <= FFileDetectionPrecision)
            or (FFileDetectionPrecision = 0))
      do begin
         { if mpeg header is not at the begining of the file, search file
            to find proper frame sync. This block can be speed up by reading
            blocks of bytes instead reading single byte from file }
          mp3hdr := mp3hdr shl 8;
          BlockRead (f, tempbyte,1);
          mp3hdrread[1] := tempbyte;

          { On each 300 iterations, release procesor to allow OS do
            something else too }
          If (FilePos (f) MOD 300) = 0 then winProcessMessages;
      end; { while }

      FirstValidFrame := FilePos (f)-4;
      tempLongInt := Data.FileLength - FirstValidFrame - Data.FrameLength + (2 * Byte(Data.ErrorProtection));

      If FrameHeaderValid (Data) and (TempLongInt > 0) then begin
        { Ok, one header is found, but that is not good proof that file realy
          is MPEG Audio. But, if we look for the next header which must be
          FrameLength bytes after first one, we may be very sure file is
          valid. }
        Seek (f, FirstValidFrame + Data.FrameLength);
        BlockRead (f, mp3hdrread,4);
        tempbyte := mp3hdrread[1];
        mp3hdrread[1] := mp3hdrread[4];
        mp3hdrread[4] := tempbyte;
        tempbyte := mp3hdrread[2];
        mp3hdrread[2] := mp3hdrread[3];
        mp3hdrread[3] := tempbyte;

        If DecodeHeader (mp3hdr, Data) then
          Result := FT_MPEG_AUDIO
        else Seek (f, FirstValidFrame + 1);
      end;
    until DecodeHeader (mp3hdr, Data) or Eof (f) or ((FilePos(f) > FFileDetectionPrecision) and (FFileDetectionPRecision > 0));
  end;{ of MPEG Audio Check }

  If (Result = FT_UNKNOWN) and (UpperCase (ExtractFileExt (filename)) = '.M3U') then
    Result := FT_WINAMP_PLAYLIST;

  Close (f);
end; { function GetFileType }

{----------------------------------------------}
destructor TMPEGAudioList.Free;
var f : Integer;
begin
  for F := 0 to Count-1 do begin
    MPEGFile := inherited Items[F];
    MPEGFile.Free;
    MPEGFile := nil;
  end;
  Inherited Free;
end;

{----------------------------------------------}
destructor TMPEGAudioList.Destroy;
var f : Integer;
begin
  for F := 0 to Count-1 do begin
    MPEGFile := inherited Items[F];
    MPEGFile.Destroy;
    MPEGFile := nil;
  end;
  Inherited Destroy;
end;


procedure QuickSort(SortList: PPointerList; L, R: Integer;
                    var SortCompareFunc : TListSortCompare;
                    SortDirection : Integer);
var
  I, J: Integer;
  P, T: Pointer;
begin
  repeat
    I := L;
    J := R;
    P := SortList^[(L + R) shr 1];
    repeat
      while (SortDirection * SortCompareFunc(SortList^[I], P) < 0) do Inc(I);
      while (SortDirection * SortCompareFunc(SortList^[J], P) > 0) do Dec(J);
      if I <= J then
      begin
        T := SortList^[I];
        SortList^[I] := SortList^[J];
        SortList^[J] := T;
        Inc(I);
        Dec(J);
      end;
    until I > J;
    if L < J then QuickSort(SortList, L, J, SortCompareFunc, SortDirection);
    L := I;
  until I >= R;
end; { QuickSort }

{----------------------------------------------}
function TMPEGAudioList.InternalSortCompareFunc (Item1, Item2: Pointer): Integer;
  { Internal function for comparing sorted items in list has input
    pointers to two compared items and returns 0 if items are equal,
    1 if Item1 > Item2 or -1 if Item1 < Item 2. It uses FSortMacro
    to calculate actual string values that should be compared. }
var
  MPEG1, MPEG2 : TMPEGAudio;
  Macro1, Macro2 : string;
begin
  MPEG1 := Item1;
  MPEG2 := Item2;
  Macro1 := MPEG1.Textilize (FSortMacro);
  Macro2 := MPEG2.Textilize (FSortMacro);

  If Macro1 > Macro2 then Result := 1
  else If Macro1 < Macro2 then Result := -1
       else Result := 0;
end;

{----------------------------------------------}
function TMPEGAudioList.DoUserSortCompareFunc (Item1, Item2: Pointer): Integer;
{ this is envelope to UserSortCompareFunc to assure type compatibility }
begin
  Result := UserSortCompareFunc (Item1, Item2);
end;

{----------------------------------------------}
procedure TMPEGAudioList.Sort (Compare : TListSortCompare);
begin
 if (List <> nil) and (Count > 0) and (@Compare <> nil) then
   if SortDirection = srtAscending then
     QuickSort(List, 0, Count - 1, Compare, 1)
   else
    QuickSort(List, 0, Count - 1, Compare, -1);
end;

{----------------------------------------------}
procedure TMPEGAudioList.DoSort;
var
 CompFunc : TListSortCompare;
begin
  CompFunc := nil;
  If SortMethod <> smNone then begin
    If (SortMethod = smUser) and (@FUserSortCompareFunc <> nil) then
      CompFunc := DoUserSortCompareFunc
    else
      if (Pos('%', SortMacro) <> 0) then
        CompFunc := InternalSortCompareFunc;

   Sort(CompFunc);
  end; { if }
end;


initialization
begin
  { initializing MusicStyle array contents. Its done this way since it
    is much easier to mantain list }
  MusicStyle[0] := 'Blues';
  MusicStyle[1] := 'Classic Rock';
  MusicStyle[2] := 'Country';
  MusicStyle[3] := 'Dance';
  MusicStyle[4] := 'Disco';
  MusicStyle[5] := 'Funk';
  MusicStyle[6] := 'Grunge';
  MusicStyle[7] := 'Hip-Hop';
  MusicStyle[8] := 'Jazz';
  MusicStyle[9] := 'Metal';
  MusicStyle[10] := 'New Age';
  MusicStyle[11] := 'Oldies';
  MusicStyle[12] := 'Other';
  MusicStyle[13] := 'Pop';
  MusicStyle[14] := 'R&B';
  MusicStyle[15] := 'Rap';
  MusicStyle[16] := 'Reggae';
  MusicStyle[17] := 'Rock';
  MusicStyle[18] := 'Techno';
  MusicStyle[19] := 'Industrial';
  MusicStyle[20] := 'Alternative';
  MusicStyle[21] := 'Ska';
  MusicStyle[22] := 'Death Metal';
  MusicStyle[23] := 'Pranks';
  MusicStyle[24] := 'Soundtrack';
  MusicStyle[25] := 'Euro-Techno';
  MusicStyle[26] := 'Ambient';
  MusicStyle[27] := 'Trip-Hop';
  MusicStyle[28] := 'Vocal';
  MusicStyle[29] := 'Jazz+Funk';
  MusicStyle[30] := 'Fusion';
  MusicStyle[31] := 'Trance';
  MusicStyle[32] := 'Classical';
  MusicStyle[33] := 'Instrumental';
  MusicStyle[34] := 'Acid';
  MusicStyle[35] := 'House';
  MusicStyle[36] := 'Game';
  MusicStyle[37] := 'Sound Clip';
  MusicStyle[38] := 'Gospel';
  MusicStyle[39] := 'Noise';
  MusicStyle[40] := 'AlternRock';
  MusicStyle[41] := 'Bass';
  MusicStyle[42] := 'Soul';
  MusicStyle[43] := 'Punk';
  MusicStyle[44] := 'Space';
  MusicStyle[45] := 'Meditative';
  MusicStyle[46] := 'Instrumental Pop';
  MusicStyle[47] := 'Instrumental Rock';
  MusicStyle[48] := 'Ethnic';
  MusicStyle[49] := 'Gothic';
  MusicStyle[50] := 'Darkwave';
  MusicStyle[51] := 'Techno-Industrial';
  MusicStyle[52] := 'Electronic';
  MusicStyle[53] := 'Pop-Folk';
  MusicStyle[54] := 'Eurodance';
  MusicStyle[55] := 'Dream';
  MusicStyle[56] := 'Southern Rock';
  MusicStyle[57] := 'Comedy';
  MusicStyle[58] := 'Cult';
  MusicStyle[59] := 'Gangsta';
  MusicStyle[60] := 'Top 40';
  MusicStyle[61] := 'Christian Rap';
  MusicStyle[62] := 'Pop/Funk';
  MusicStyle[63] := 'Jungle';
  MusicStyle[64] := 'Native American';
  MusicStyle[65] := 'Cabaret';
  MusicStyle[66] := 'New Wave';
  MusicStyle[67] := 'Psychadelic';
  MusicStyle[68] := 'Rave';
  MusicStyle[69] := 'Showtunes';
  MusicStyle[70] := 'Trailer';
  MusicStyle[71] := 'Lo-Fi';
  MusicStyle[72] := 'Tribal';
  MusicStyle[73] := 'Acid Punk';
  MusicStyle[74] := 'Acid Jazz';
  MusicStyle[75] := 'Polka';
  MusicStyle[76] := 'Retro';
  MusicStyle[77] := 'Musical';
  MusicStyle[78] := 'Rock & Roll';
  MusicStyle[79] := 'Hard Rock';
end;


end.
