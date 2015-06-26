UNIT LZ_Const;

INTERFACE

{ Load in the .RES file that has the same name as this .PAS file ... }
{$R *.RES}

CONST
  SChiefLZErrorBase    = 40000;

CONST
  SNoValidFileName     = SChiefLZErrorBase + 0;
  SInvalidArchive      = SChiefLZErrorBase + 1;
  SInitFailed          = SChiefLZErrorBase + 2;
  SInvalidParams       = SChiefLZErrorBase + 3;
  SSameFileName        = SChiefLZErrorBase + 4;
  SNoTempFileName      = SChiefLZErrorBase + 5;
  SWrongCompressedFile = SChiefLZErrorBase + 6;
  SCorruptArchive      = SChiefLZErrorBase + 7;
  SBadDirectory        = SChiefLZErrorBase + 8;

IMPLEMENTATION

END.

