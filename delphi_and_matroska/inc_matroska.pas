unit Inc_matroska;

interface

type
  TReferences = record
    iCount: integer;
    iRefs: array [0..3] of integer;
    end;
  TFrames = record
    iCount: integer;
    iSize: array [0..255] of integer;
    end;

  TRead_Struct = record
    pBuffer: Pointer;
    iSize: integer;
    references: TReferences;
    frames: TFrames;
    iTimecode: Int64;
    iDuration: Int64;
    end;

// usage:
//   input:
//     cbsize: size of structure
//     index: retrieve information about index-th segment, zero-based
//     max_buffer_len: size of buffer pBuffer is pointing to
//     charset: return strings in UTF8, UTF16 or ANSI (MTRSI_UTF8 etc)
//   output:
//      required_buffer_size: size of buffer required to retrieve all information
//      pTitles, pLanguages: Array of pointer pointing into pBuffer (!) to
//                   strings containing title and language of this chapter.
//                   These can be NULL if the buffer was far too small

  TCharArray = array[0..0] of PChar;
  PCharArray = ^TCharArray;
  PGetChapterInfo = ^TGetChapterInfo;
  TGetChapterInfo = record
    // input
    cbSize: integer;
    pIndex: Pointer;
    max_buffer_len: integer;
    charset: integer;

    // output
    pBuffer: Pointer;

    error: integer;
    is_edition: integer;
    is_enabled: integer;
    is_hidden: integer;
    is_ordered: integer;
    is_default: integer;
    has_segmentuid: integer;

    start_time: Int64;
    end_time: Int64;

    number_of_titles: integer;
    number_of_titles_returned: integer;
    title_txt: PCharArray;
    title_lng: PCharArray;

    number_of_subchapters: integer;
    required_buffer_size: integer;

    pSegmentUID: Pointer;
    end;

// usage:
//   input:
//     cbsize: size of structure
//     index: retrieve information about index-th segment, zero-based
//     max_buffer_len: size of buffer pBuffer is pointing to
//     charset: return strings in UTF8, UTF16 or ANSI (MTRSI_UTF8 etc)
//   output:
//      required_buffer_size: size of buffer required to retrieve all information
//      flags: GTISF_BITRATE is set when bitrate is valid
//      number_of_titles, number_of_titles_returned, title_txt, title_lng:
//           currently, only one title is supported for track titles. 

  PGetTrackInfo = ^TGetTrackInfo;
  TGetTrackInfo = record
    // input
    cbsize: Integer;
    index: Integer;
    max_buffer_len: Integer;
    charset: Integer;

    // output
    pBuffer: Pointer;

    flags: Integer;
    required_buffer_size: Integer;
    bitrate: double;

    track_number: Integer;
    track_uid: Int64;
    track_type: Integer;
    flag_enabled: Integer;
    flag_default: Integer;
    flag_forced: Integer;
    flag_lacing: Integer;

    min_cache: Integer;
    max_cache: Integer;
    default_duration: Int64;
    timecode_scale: double;

    number_of_titles: Integer;
    number_of_titles_returned: Integer;
    title_txt: PCharArray;
    title_lng: PCharArray;

    codec_id: PChar;
    codec_private: Pointer;
    codec_private_size: Integer;
    codec_name: PChar;

    attachment_link: Int64;
    track_overlay: Int64;

    pixel_width: Integer;
    pixel_height: Integer;
    pixel_crop_left: Integer;
    pixel_crop_top: Integer;
    pixel_crop_right: Integer;
    pixel_crop_bottom: Integer;
    display_width: Integer;
    display_height: Integer;
    display_unit: Integer;
    aspect_ratio_type: Integer;
    color_space: Integer;

    sampling_frequency: double;
    output_sampling_frequency: double;
    channels: integer;

    compression: Integer;
    compression_settings_length: integer;
    compression_settings: Pointer;
  end;


// usage:
//   input:
//     cbsize: size of structure
//     index: retrieve information about index-th segment, zero-based
//     max_buffer_len: size of buffer pBuffer is pointing to
//     charset: return strings in UTF8, UTF16 or ANSI (MTRSI_UTF8 etc)
//   output:
//      required_buffer_size: size of buffer required to retrieve all information
//      flags: indicates which of the pointers are valid (those for which
//             there are no flags are always valid
//      segment_uid: pointer to 16 byte uid of segment
//      segment_filename: pointer to segment filename
//      next/prev uid/filename: analogous to segment uid/filename
//      muxing_app/writing_app: Pointer to muxing app and writing app string
//      number_of_titles: number of entries in title_txt and title_lng arrays
//      title_txt/title_lng: array of pointers to segment titles and language
//                           ID strings. Usually, matroska files only have one
//                           segment title
//      number_of_chapters/tracks/attachments: should be obvious
//      timecode_scale/duration: timecode_scale * duration = duration in nanosec
//      date: date when the file was created or -1 if not indicated

  PGetSegmentInfo = ^TGetSegmentInfo;
  TGetSegmentInfo = record
    // input
    cbsize: integer;
    index: integer;
    max_buffer_len: integer;
    charset: integer;

    // input/output
    pBuffer: Pointer;

    // output
    required_buffer_size: Integer;

    flags: integer;
    segment_uid: PChar;
    segment_filename: PChar;

    next_uid: PChar;
    next_filename: PChar;

    prev_uid: PChar;
    prev_filename: PChar;
    segment_family: PChar;
    
    muxing_app: PChar;
    writing_app: PChar;

    number_of_titles: integer;
    number_of_titles_returned: integer;
    title_txt: PCharArray;
    title_lng: PCharArray;

    number_of_chapters: Integer;
    number_of_tracks: Integer;
    number_of_attachments: Integer;

    timecode_scale: Int64;
    duration: Int64;
    date: Int64;

  end;


// usage:
//   input:
//     cbSize must be set the size of the structure. The DLL will reject a bad size
//     index must be set to the j to retrieve the j-th attachment
//     index must be set to -1 to retriebe the attachment with UID uid
//     pBuffer must point to a buffer of sufficient size to retrieve the information
//     max_buffer_len must be set to the size of the buffer
//     charset must be MTRATTI_UTF8, MTRATTI_UTF16 or MTRATTI_ASCII
//   output:
//     uid will contain the UID of the attachment retrieved
//     pBuffer will contain all output data
//     required_buffer_size will contain the number of bytes that would
//       have been required to retrieve all data
//     pFilename, pDescription, pMimetype, pBinaryData will point into pBuffer
//     binary_data_size will contain the size of the attachment in bytes

  PGetAttachmentStruct = ^TGetAttachmentStruct;
  TGetAttachmentStruct = record
    // input
    cbSize: integer;
    index: integer;   // use -1 here to use uid
    max_buffer_len: integer;
    charset: integer;

    // input+output
    uid: Int64;

    // output
    pBuffer: Pointer;
    filename: PChar;
    description: PChar;
    mime_type: PChar;
    binary_data: PChar;
    binary_data_size: integer;
    required_buffer_size: integer;
  end;

  POpenFileStruct = ^TOpenFileStruct;
  TOpenFileStruct = record
    cbSize: integer;
    charset: integer;
    access: integer;
    filename: PChar;
  end;

function mtrOpenRead(Filename: String; var P: Pointer): integer;
  stdcall; external 'matroska.dll';
function mtrGetChapter(P: Pointer; C: PGetChapterInfo): integer;
  stdcall; external 'matroska.dll';
function mtrClose(var P: Pointer): integer; stdcall;
  external 'matroska.dll';
function mtrRead(P: Pointer; iTrack: integer; var pRead: TRead_Struct): integer;
  stdcall; external 'matroska.dll';
function mtrGetReadConfig(P: Pointer; iTrack,iState: integer): Int64;
  stdcall; external 'matroska.dll';
function mtrSetReadConfig(P: Pointer; iState, iIndex, iVal: integer): integer;
  stdcall; external 'matroska.dll';
function mtrGetDLLInfo(iInfo: integer; P: pChar): integer;
  stdcall; external 'matroska.dll';
function mtrGetAttachment(P: Pointer; A: Pointer): integer;
  stdcall; external 'matroska.dll';
function mtrGetSegmentInfo(P: Pointer; S: Pointer): integer;
  stdcall; external 'matroska.dll';
function mtrGetTrackInfo(P: Pointer; T: Pointer): integer;
  stdcall; external 'matroska.dll';
function mtrOpen(O: Pointer; var P: Pointer): integer;
  stdcall; external 'matroska.dll';


function mtrGetSegmentProperty(P: Pointer; iProperty: integer;
  pData: Pointer): Int64; stdcall; external 'matroska.dll';
function mtrGetTrackProperty(P: Pointer; iProperty, iTrack: integer;
  pData: Pointer): Int64; stdcall; external 'matroska.dll';

const
  GTISF_BITRATE = $01;

  MTR_OK = $01;
  MTR_OPEN_INVALIDFILE = -$01;

  MTRSP_UID: integer = $100;
  MTRSP_DURATION: integer = $101;
  MTRSP_MUXINGAPP: integer = $102;
  MTRSP_WRITINGAPP: integer = $103;
  MTRSP_TITLE: integer = $104;
  MTRSP_TIMECODESCALE: integer = $105;
  MTRSP_TRACKCOUNT: integer = $106;
  MTRSP_ATTACHMENTCOUNT: integer = $107;

  MTRTP_ASPECTRATIOTYPE: integer = $1;
  MTRTP_BITDEPTH: integer = $2;
  MTRTP_CHANNELCOUNT: integer = $3;
  MTRTP_CHANNEPOSITIONS: integer = $4;
  MTRTP_CODECID: integer = $5;
  MTRTP_CODECNAME: integer = $6;
  MTRTP_CODECPRIVATE: integer = $7;
  MTRTP_CODECPRIVATESIZE: integer = $8;
  MTRTP_COLORSPACE: integer = $9;
  MTRTP_DEFAULTDURATION: integer = $A;
  MTRTP_GAMMA: integer = $B;
  MTRTP_AVERAGEFRAMESIZE: integer = $C;
  MTRTP_LANGUAGE: integer = $D;
  MTRTP_MINCACHE: integer = $E;
  MTRTP_MAXCACHE: integer = $F;
  MTRTP_NEXTTIMECODE: integer = $10;
  MTRTP_RESOLUTION: integer = $11;
  MTRTP_SAMPLINGFREQUENCY: integer = $12;     // float
  MTRTP_NAME: integer = $13;
  MTRTP_NUMBER: integer = $14;
  MTRTP_TYPE: integer = $15;
  MTRTP_UID: integer = $16;
  MTRTP_BITRATE: integer = $17;               // float
  MTRTP_SIZE: integer = $18;
  MTRTPF_ENABLED: integer = $19;
  MTRTPF_LACED: integer = $1A;
  MTRTPF_DEFAULT: integer = $1B;
  MTRTPF_BITRATEINDICATED: integer = $1C;

// return values for reading
  MTR_RD_OK = $1;
  MTR_INVALIDPARAM = -$2;
  MTR_RD_ENDOFSEGMENT = $4;
  MTR_RD_SPARSEQUEUEEMPTY = $10;

  MTRRCFG_QUEUETRACK = $1;
  MTRRCFG_ACTIVESEGMENT = $2;
  MTRRCFG_SPARSE = $3;

// track types
  MTRST_VIDEO = $1;
  MTRST_AUDIO = $2;
  MTRST_SUBTITLES = $11;

// track types - new names
  MTR_TRACKTYPE_VIDEO = $1;
  MTR_TRACKTYPE_AUDIO = $2;
  MTR_TRACKTYPE_SUBTITLES = $11;



// DLL INFO
  MTRDLL_BUILDDATE = $120;
  MTRDLL_VERNBR    = $121;

// Chapters
  MTRCHI_ANSI      = $01;
  MTRCHI_UTF8      = $02;
  MTRCHI_UTF16     = $03;

// Attachements
  MTRATTI_ANSI      = $01;
  MTRATTI_UTF8      = $02;
  MTRATTI_UTF16     = $03;

// SegmentInfo
  MTRSI_ANSI      = $01;
  MTRSI_UTF8      = $02;
  MTRSI_UTF16     = $03;

// SegmentInfo
  MTROF_ANSI      = $01;
  MTROF_UTF8      = $02;
  MTROF_UTF16     = $03;

  MTR_OPEN_READ  = $17;
  
// SegmentInfo Flags
  GSISF_SEGMENTUID = $01;
  GSISF_NEXTUID    = $02;
  GSISF_PREVUID    = $04;
  GSISF_SEGMENTFAMILY=$08;
  GSISF_MUXINGAPP    =$10;
  GSISF_WRITINGAPP   =$20;
  GSISF_DATE         =$40;

implementation

end.
