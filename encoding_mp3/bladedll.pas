unit bladedll;
(*
    Bladedll.h
    +++++++++++++++++++++++++++
    +   Blade's Encoder DLL   +
    +++++++++++++++++++++++++++
    ------------------------------------------------------
    - Version 1.00 (7 November 1998) - Jukka Poikolainen -
    ------------------------------------------------------
    Initial version
    ------------------------------------------------------
    - Version x.xx (x xxxxxxxx xxxx) - xxxxx xxxxxxxxxxx -
    ------------------------------------------------------

    Delphi Version (D3 and D4).
    Jack Kallestrup (jack.kallestrup@vip.cybercity.dk)
    thanks to Leif Lundberg for helping with the calling convension.
    Changes :
    Calling convention changed from stdcall to cdecl.
    Added TFormat record
*)

interface
uses windows;  //type definitions
const
  // encoding formats
  BE_CONFIG_MP3 = 0;
  BE_CONFIG_ACC = 1;

type
  // type definitions
  THBeStream = ULONG;
  PHBeStream = ^THBEStream;
  TBeErr      = ULONG;
  PSHORT      = ^SHORT;
  PBYTE       = ^Byte;

// error codes
const
  BE_ERR_SUCCESSFUL    		   =	$00000000;
  BE_ERR_INVALID_FORMAT		   =	$00000001;
  BE_ERR_INVALID_FORMAT_PARAMETERS =	$00000002;
  BE_ERR_NO_MORE_HANDLES	   =	$00000003;
  BE_ERR_INVALID_HANDLE		   =	400000004;

// other constants
  BE_MAX_HOMEPAGE		   =	256;

// format specific variables
  BE_MP3_MODE_STEREO	           =	0;
  BE_MP3_MODE_DUALCHANNEL          =	2;
  BE_MP3_MODE_MONO	           =	3;

type
  PMP3 = ^TMP3;
  TMP3 = packed record
    dwSampleRate : DWORD;  // 48000, 44100 and 32000 allowed
    byMode       : Byte;   // BE_MP3_MODE_STEREO, BE_MP3_MODE_DUALCHANNEL, BE_MP3_MODE_MONO
    wBitrate     : Word;   // 32, 40, 48, 56, 64, 80, 96, 112, 128, 160, 192, 224, 256 and 320 allowed
    bPrivate,
    bCRC,
    bCopyright,
    bOriginal    : Boolean;
  end;

  PAAC = ^TAAC;
  TAAC = packed record
    dwSampleRate : DWORD;
    byMode : Byte;
    wBitrate : Word;
    byEncodingMethod : Byte;
  end;

  PFormat = ^TFormat;
  TFormat = packed record
    case dwConfig : DWord of // BE_CONFIG_XXXXX
      BE_CONFIG_MP3 : (mp3 : TMp3);
      BE_CONFIG_ACC : (acc : TAac);
  end;

  PBEConfig = ^TBEConfig;
  TBEConfig = packed record
    Format   : TFormat; // Currently only BE_CONFIG_MP3 is supported
  end;

  PBEVersion = ^TBEVersion;
  TBEVersion = packed record
    // BladeEnc DLL Version number
    byDLLMajorVersion,
    byDLLMinorVersion,
    // BladeEnc Engine Version Number
    byMajorVersion,
    byMinorVersion,
    // DLL Release date
    byDay,
    byMonth : Byte;
    wYear : Word;
    // BladeEnc	Homepage URL
    zHomepage : Array[0..BE_MAX_HOMEPAGE] of char;
  end;

  function beInitStream(var pbeConfig : TBEConfig; var dwSamples : DWORD; var dwBufferSize : DWORD; var phbeStream : THBESTREAM) : TBeErr; cdecl; external 'BLADEENC.DLL';
  (*
    pbeConfig    = Type of mp3
    dwSamples    = Maximum number of samples to encode
    dwBufferSize = Maximum mp3 buffer size
    hbeStream    = BladeEnc-stream
  *)
  function beEncodeChunk(hbeStream : THBEStream; nSamples : DWORD; pSamples : PShort;  pOutput : PByte; var pdwOutput : DWORD) : TBeErr; cdecl; external 'BLADEENC.DLL';
  (*
    hbeStream    =
    nSamples     = Number of samples to encode
    pSamples	 = Pointer to buffer with Samples to encode
    pOutput	 = Pointer to buffer to recieve encoded samples
    pdwOutput	 = number of samples encoded
  *)
  function beDeinitStream(hbeStream : THBEStream;  pOutput : PByte; var pdwOutput : DWORD) : TBeErr; cdecl; external 'BLADEENC.DLL';
  (*
    hbeStream    =
    pOutput	 = Pointer to buffer holding encoded samples
    pdwOutput	 = Number of samples to write
  *)
  function beCloseStream(hbeStream : THBEStream) : TBeErr; cdecl; external 'BLADEENC.DLL';
  procedure beVersion(var pbeVersion : TBEVersion); cdecl; external 'BLADEENC.DLL';

implementation

end.
