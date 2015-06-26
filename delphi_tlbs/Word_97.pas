unit Word_97;

{ This file contains pascal declarations imported from a type library.
  This file will be written during each import or refresh of the type
  library editor.  Changes to this file will be discarded during the
  refresh process. }

{ Microsoft Word 8.0 Object Library }
{ Version 8.0 }

{ Conversion log:
  Warning: 'Object' is a reserved word. Parameter 'Object' in _Application.IsObjectValid changed to 'Object_'
  Warning: 'To' is a reserved word. Parameter 'To' in _Application.PrintOut changed to 'To_'
  Warning: 'Repeat' is a reserved word. _Application.Repeat changed to Repeat_
  Warning: 'Object' is a reserved word. Parameter 'Object' in _Application.OrganizerCopy changed to 'Object_'
  Warning: 'Object' is a reserved word. Parameter 'Object' in _Application.OrganizerDelete changed to 'Object_'
  Warning: 'Object' is a reserved word. Parameter 'Object' in _Application.OrganizerRename changed to 'Object_'
  Warning: 'String' is a reserved word. Parameter 'String' in _Application.CheckGrammar changed to 'String_'
  Warning: 'String' is a reserved word. Parameter 'String' in _Application.CleanString changed to 'String_'
  Warning: 'Object' is a reserved word. Parameter 'Object' in _Global.IsObjectValid changed to 'Object_'
  Warning: 'Repeat' is a reserved word. _Global.Repeat changed to Repeat_
  Warning: 'String' is a reserved word. Parameter 'String' in _Global.CleanString changed to 'String_'
  Warning: 'Type' is a reserved word. _Document.Type changed to Type_
  Warning: 'Type' is a reserved word. Parameter 'Type' in _Document.Compatibility changed to 'Type_'
  Warning: 'To' is a reserved word. Parameter 'To' in _Document.PrintOut changed to 'To_'
  Warning: 'End' is a reserved word. Parameter 'End' in _Document.Range changed to 'End_'
  Warning: 'GoTo' is a reserved word. _Document.GoTo changed to GoTo_
  Warning: 'Type' is a reserved word. Parameter 'Type' in _Document.Protect changed to 'Type_'
  Warning: 'Type' is a reserved word. Parameter 'Type' in _Document.EditionOptions changed to 'Type_'
  Warning: 'Type' is a reserved word. Template.Type changed to Type_
  Warning: 'End' is a reserved word. Bookmark.End changed to End_
  Warning: 'Type' is a reserved word. Window.Type changed to Type_
  Warning: 'To' is a reserved word. Parameter 'To' in Window.PrintOut changed to 'To_'
  Warning: 'End' is a reserved word. Range.End changed to End_
  Warning: 'Case' is a reserved word. Range.Case changed to Case_
  Warning: 'Type' is a reserved word. Parameter 'Type' in Range.Information changed to 'Type_'
  Warning: 'End' is a reserved word. Parameter 'End' in Range.SetRange changed to 'End_'
  Warning: 'Unit' is a reserved word. Parameter 'Unit' in Range.Next changed to 'Unit_'
  Warning: 'Unit' is a reserved word. Parameter 'Unit' in Range.Previous changed to 'Unit_'
  Warning: 'Unit' is a reserved word. Parameter 'Unit' in Range.StartOf changed to 'Unit_'
  Warning: 'Unit' is a reserved word. Parameter 'Unit' in Range.EndOf changed to 'Unit_'
  Warning: 'Unit' is a reserved word. Parameter 'Unit' in Range.Move changed to 'Unit_'
  Warning: 'Unit' is a reserved word. Parameter 'Unit' in Range.MoveStart changed to 'Unit_'
  Warning: 'Unit' is a reserved word. Parameter 'Unit' in Range.MoveEnd changed to 'Unit_'
  Warning: 'Type' is a reserved word. Parameter 'Type' in Range.InsertBreak changed to 'Type_'
  Warning: 'Unit' is a reserved word. Parameter 'Unit' in Range.Delete changed to 'Unit_'
  Warning: 'Unit' is a reserved word. Parameter 'Unit' in Range.Expand changed to 'Unit_'
  Warning: 'Label' is a reserved word. Parameter 'Label' in Range.InsertCaption changed to 'Label_'
  Warning: 'GoTo' is a reserved word. Range.GoTo changed to GoTo_
  Warning: 'To' is a reserved word. Parameter 'To' in Range.InsertDatabase changed to 'To_'
  Warning: 'Label' is a reserved word. OLEFormat.Label changed to Label_
  Warning: 'Object' is a reserved word. OLEFormat.Object changed to Object_
  Warning: 'Type' is a reserved word. LinkFormat.Type changed to Type_
  Warning: 'Type' is a reserved word. Parameter 'Type' in Fields.Add changed to 'Type_'
  Warning: 'Type' is a reserved word. Field.Type changed to Type_
  Warning: 'Type' is a reserved word. Parameter 'Type' in Styles.Add changed to 'Type_'
  Warning: 'Type' is a reserved word. Style.Type changed to Type_
  Warning: 'Type' is a reserved word. Parameter 'Type' in FormFields.Add changed to 'Type_'
  Warning: 'Type' is a reserved word. FormField.Type changed to Type_
  Warning: 'Type' is a reserved word. TextInput.Type changed to Type_
  Warning: 'Type' is a reserved word. Parameter 'Type' in TextInput.EditType changed to 'Type_'
  Warning: 'Type' is a reserved word. Parameter 'Type' in MailMerge.UseAddressBook changed to 'Type_'
  Warning: 'Type' is a reserved word. MailMergeField.Type changed to Type_
  Warning: 'Type' is a reserved word. MailMergeDataSource.Type changed to Type_
  Warning: 'Type' is a reserved word. Dialog.Type changed to Type_
  Warning: 'End' is a reserved word. Selection.End changed to End_
  Warning: 'Type' is a reserved word. Selection.Type changed to Type_
  Warning: 'Type' is a reserved word. Parameter 'Type' in Selection.Information changed to 'Type_'
  Warning: 'End' is a reserved word. Parameter 'End' in Selection.SetRange changed to 'End_'
  Warning: 'Unit' is a reserved word. Parameter 'Unit' in Selection.Next changed to 'Unit_'
  Warning: 'Unit' is a reserved word. Parameter 'Unit' in Selection.Previous changed to 'Unit_'
  Warning: 'Unit' is a reserved word. Parameter 'Unit' in Selection.StartOf changed to 'Unit_'
  Warning: 'Unit' is a reserved word. Parameter 'Unit' in Selection.EndOf changed to 'Unit_'
  Warning: 'Unit' is a reserved word. Parameter 'Unit' in Selection.Move changed to 'Unit_'
  Warning: 'Unit' is a reserved word. Parameter 'Unit' in Selection.MoveStart changed to 'Unit_'
  Warning: 'Unit' is a reserved word. Parameter 'Unit' in Selection.MoveEnd changed to 'Unit_'
  Warning: 'Type' is a reserved word. Parameter 'Type' in Selection.InsertBreak changed to 'Type_'
  Warning: 'Unit' is a reserved word. Parameter 'Unit' in Selection.Delete changed to 'Unit_'
  Warning: 'Unit' is a reserved word. Parameter 'Unit' in Selection.Expand changed to 'Unit_'
  Warning: 'Label' is a reserved word. Parameter 'Label' in Selection.InsertCaption changed to 'Label_'
  Warning: 'GoTo' is a reserved word. Selection.GoTo changed to GoTo_
  Warning: 'Unit' is a reserved word. Parameter 'Unit' in Selection.MoveLeft changed to 'Unit_'
  Warning: 'Unit' is a reserved word. Parameter 'Unit' in Selection.MoveRight changed to 'Unit_'
  Warning: 'Unit' is a reserved word. Parameter 'Unit' in Selection.MoveUp changed to 'Unit_'
  Warning: 'Unit' is a reserved word. Parameter 'Unit' in Selection.MoveDown changed to 'Unit_'
  Warning: 'Unit' is a reserved word. Parameter 'Unit' in Selection.HomeKey changed to 'Unit_'
  Warning: 'Unit' is a reserved word. Parameter 'Unit' in Selection.EndKey changed to 'Unit_'
  Warning: 'Type' is a reserved word. Parameter 'Type' in Indexes.Add changed to 'Type_'
  Warning: 'Type' is a reserved word. Index.Type changed to Type_
  Warning: 'Type' is a reserved word. Revision.Type changed to Type_
  Warning: 'Protected' is a reserved word. KeyBinding.Protected changed to Protected_
  Warning: 'Type' is a reserved word. Hyperlink.Type changed to Type_
  Warning: 'Type' is a reserved word. Parameter 'Type' in Shapes.AddCallout changed to 'Type_'
  Warning: 'Type' is a reserved word. Parameter 'Type' in Shapes.AddConnector changed to 'Type_'
  Warning: 'Type' is a reserved word. Parameter 'Type' in Shapes.AddShape changed to 'Type_'
  Warning: 'Type' is a reserved word. ShapeRange.Type changed to Type_
  Warning: 'Type' is a reserved word. Shape.Type changed to Type_
  Warning: 'Type' is a reserved word. View.Type changed to Type_
  Warning: 'Type' is a reserved word. InlineShape.Type changed to Type_
  Warning: 'Type' is a reserved word. Dictionary.Type changed to Type_
  Warning: 'Type' is a reserved word. ProofreadingErrors.Type changed to Type_
  Warning: 'Type' is a reserved word. WrapFormat.Type changed to Type_
  Warning: 'Type' is a reserved word. CalloutFormat.Type changed to Type_
  Warning: 'Type' is a reserved word. ColorFormat.Type changed to Type_
  Warning: 'Type' is a reserved word. ConnectorFormat.Type changed to Type_
  Warning: 'Type' is a reserved word. FillFormat.Type changed to Type_
  Warning: 'Type' is a reserved word. ShadowFormat.Type changed to Type_
  Warning: _Application.AddAddress parameter Value of type PSafeArray was written as OleVariant.
  Warning: _Application.AddAddress parameter TagID of type PSafeArray was written as OleVariant.
  Warning: _Application.AddAddress parameter Value of type PSafeArray was written as OleVariant.
 }

interface

uses Windows, ActiveX, Classes, Graphics, OleCtrls, StdVCL, Office_TLB, VBIDE_TLB;

const
  LIBID_Word: TGUID = '{00020905-0000-0000-C000-000000000046}';

const

{ WdMailSystem }

  wdNoMailSystem = 0;
  wdMAPI = 1;
  wdPowerTalk = 2;
  wdMAPIandPowerTalk = 3;

{ WdTemplateType }

  wdNormalTemplate = 0;
  wdGlobalTemplate = 1;
  wdAttachedTemplate = 2;

{ WdContinue }

  wdContinueDisabled = 0;
  wdResetList = 1;
  wdContinueList = 2;

{ WdIMEMode }

  wdIMEModeNoControl = 0;
  wdIMEModeOn = 1;
  wdIMEModeOff = 2;
  wdIMEModeHiragana = 4;
  wdIMEModeKatakana = 5;
  wdIMEModeKatakanaHalf = 6;
  wdIMEModeAlphaFull = 7;
  wdIMEModeAlpha = 8;
  wdIMEModeHangulFull = 9;
  wdIMEModeHangul = 10;

{ WdBaselineAlignment }

  wdBaselineAlignTop = 0;
  wdBaselineAlignCenter = 1;
  wdBaselineAlignBaseline = 2;
  wdBaselineAlignFarEast50 = 3;
  wdBaselineAlignAuto = 4;

{ WdIndexFilter }

  wdIndexFilterNone = 0;
  wdIndexFilterAiueo = 1;
  wdIndexFilterAkasatana = 2;
  wdIndexFilterChosung = 3;
  wdIndexFilterLow = 4;
  wdIndexFilterMedium = 5;
  wdIndexFilterFull = 6;

{ WdIndexSortBy }

  wdIndexSortByStroke = 0;
  wdIndexSortBySyllable = 1;

{ WdJustificationMode }

  wdJustificationModeExpand = 0;
  wdJustificationModeCompress = 1;
  wdJustificationModeCompressKana = 2;

{ WdFarEastLineBreakLevel }

  wdFarEastLineBreakLevelNormal = 0;
  wdFarEastLineBreakLevelStrict = 1;
  wdFarEastLineBreakLevelCustom = 2;

{ WdMultipleWordConversionsMode }

  wdHangulToHanja = 0;
  wdHanjaToHangul = 1;

{ WdColorIndex }

  wdAuto = 0;
  wdBlack = 1;
  wdBlue = 2;
  wdTurquoise = 3;
  wdBrightGreen = 4;
  wdPink = 5;
  wdRed = 6;
  wdYellow = 7;
  wdWhite = 8;
  wdDarkBlue = 9;
  wdTeal = 10;
  wdGreen = 11;
  wdViolet = 12;
  wdDarkRed = 13;
  wdDarkYellow = 14;
  wdGray50 = 15;
  wdGray25 = 16;
  wdByAuthor = -1;
  wdNoHighlight = 0;

{ WdTextureIndex }

  wdTextureNone = 0;
  wdTexture2Pt5Percent = 25;
  wdTexture5Percent = 50;
  wdTexture7Pt5Percent = 75;
  wdTexture10Percent = 100;
  wdTexture12Pt5Percent = 125;
  wdTexture15Percent = 150;
  wdTexture17Pt5Percent = 175;
  wdTexture20Percent = 200;
  wdTexture22Pt5Percent = 225;
  wdTexture25Percent = 250;
  wdTexture27Pt5Percent = 275;
  wdTexture30Percent = 300;
  wdTexture32Pt5Percent = 325;
  wdTexture35Percent = 350;
  wdTexture37Pt5Percent = 375;
  wdTexture40Percent = 400;
  wdTexture42Pt5Percent = 425;
  wdTexture45Percent = 450;
  wdTexture47Pt5Percent = 475;
  wdTexture50Percent = 500;
  wdTexture52Pt5Percent = 525;
  wdTexture55Percent = 550;
  wdTexture57Pt5Percent = 575;
  wdTexture60Percent = 600;
  wdTexture62Pt5Percent = 625;
  wdTexture65Percent = 650;
  wdTexture67Pt5Percent = 675;
  wdTexture70Percent = 700;
  wdTexture72Pt5Percent = 725;
  wdTexture75Percent = 750;
  wdTexture77Pt5Percent = 775;
  wdTexture80Percent = 800;
  wdTexture82Pt5Percent = 825;
  wdTexture85Percent = 850;
  wdTexture87Pt5Percent = 875;
  wdTexture90Percent = 900;
  wdTexture92Pt5Percent = 925;
  wdTexture95Percent = 950;
  wdTexture97Pt5Percent = 975;
  wdTextureSolid = 1000;
  wdTextureDarkHorizontal = -1;
  wdTextureDarkVertical = -2;
  wdTextureDarkDiagonalDown = -3;
  wdTextureDarkDiagonalUp = -4;
  wdTextureDarkCross = -5;
  wdTextureDarkDiagonalCross = -6;
  wdTextureHorizontal = -7;
  wdTextureVertical = -8;
  wdTextureDiagonalDown = -9;
  wdTextureDiagonalUp = -10;
  wdTextureCross = -11;
  wdTextureDiagonalCross = -12;

{ WdUnderline }

  wdUnderlineNone = 0;
  wdUnderlineSingle = 1;
  wdUnderlineWords = 2;
  wdUnderlineDouble = 3;
  wdUnderlineDotted = 4;
  wdUnderlineThick = 6;
  wdUnderlineDash = 7;
  wdUnderlineDotDash = 9;
  wdUnderlineDotDotDash = 10;
  wdUnderlineWavy = 11;

{ WdEmphasisMark }

  wdEmphasisMarkNone = 0;
  wdEmphasisMarkOverSolidCircle = 1;
  wdEmphasisMarkOverComma = 2;
  wdEmphasisMarkOverWhiteCircle = 3;
  wdEmphasisMarkUnderSolidCircle = 4;

{ WdInternationalIndex }

  wdListSeparator = 17;
  wdDecimalSeparator = 18;
  wdThousandsSeparator = 19;
  wdCurrencyCode = 20;
  wd24HourClock = 21;
  wdInternationalAM = 22;
  wdInternationalPM = 23;
  wdTimeSeparator = 24;
  wdDateSeparator = 25;
  wdProductLanguageID = 26;

{ WdAutoMacros }

  wdAutoExec = 0;
  wdAutoNew = 1;
  wdAutoOpen = 2;
  wdAutoClose = 3;
  wdAutoExit = 4;

{ WdCaptionPosition }

  wdCaptionPositionAbove = 0;
  wdCaptionPositionBelow = 1;

{ WdCountry }

  wdUS = 1;
  wdCanada = 2;
  wdLatinAmerica = 3;
  wdNetherlands = 31;
  wdFrance = 33;
  wdSpain = 34;
  wdItaly = 39;
  wdUK = 44;
  wdDenmark = 45;
  wdSweden = 46;
  wdNorway = 47;
  wdGermany = 49;
  wdPeru = 51;
  wdMexico = 52;
  wdArgentina = 54;
  wdBrazil = 55;
  wdChile = 56;
  wdVenezuela = 58;
  wdJapan = 81;
  wdTaiwan = 886;
  wdChina = 86;
  wdKorea = 82;
  wdFinland = 358;
  wdIceland = 354;

{ WdHeadingSeparator }

  wdHeadingSeparatorNone = 0;
  wdHeadingSeparatorBlankLine = 1;
  wdHeadingSeparatorLetter = 2;
  wdHeadingSeparatorLetterLow = 3;
  wdHeadingSeparatorLetterFull = 4;

{ WdSeparatorType }

  wdSeparatorHyphen = 0;
  wdSeparatorPeriod = 1;
  wdSeparatorColon = 2;
  wdSeparatorEmDash = 3;
  wdSeparatorEnDash = 4;

{ WdPageNumberAlignment }

  wdAlignPageNumberLeft = 0;
  wdAlignPageNumberCenter = 1;
  wdAlignPageNumberRight = 2;
  wdAlignPageNumberInside = 3;
  wdAlignPageNumberOutside = 4;

{ WdBorderType }

  wdBorderTop = -1;
  wdBorderLeft = -2;
  wdBorderBottom = -3;
  wdBorderRight = -4;
  wdBorderHorizontal = -5;
  wdBorderVertical = -6;

{ WdBorderTypeHID }

  wdBorderDiagonalDown = -7;
  wdBorderDiagonalUp = -8;

{ WdFramePosition }

  wdFrameTop = -999999;
  wdFrameLeft = -999998;
  wdFrameBottom = -999997;
  wdFrameRight = -999996;
  wdFrameCenter = -999995;
  wdFrameInside = -999994;
  wdFrameOutside = -999993;

{ WdAnimation }

  wdAnimationNone = 0;
  wdAnimationLasVegasLights = 1;
  wdAnimationBlinkingBackground = 2;
  wdAnimationSparkleText = 3;
  wdAnimationMarchingBlackAnts = 4;
  wdAnimationMarchingRedAnts = 5;
  wdAnimationShimmer = 6;

{ WdCharacterCase }

  wdNextCase = -1;
  wdLowerCase = 0;
  wdUpperCase = 1;
  wdTitleWord = 2;
  wdTitleSentence = 4;
  wdToggleCase = 5;

{ WdCharacterCaseHID }

  wdHalfWidth = 6;
  wdFullWidth = 7;
  wdKatakana = 8;
  wdHiragana = 9;

{ WdSummaryMode }

  wdSummaryModeHighlight = 0;
  wdSummaryModeHideAllButSummary = 1;
  wdSummaryModeInsert = 2;
  wdSummaryModeCreateNew = 3;

{ WdSummaryLength }

  wd10Sentences = -2;
  wd20Sentences = -3;
  wd100Words = -4;
  wd500Words = -5;
  wd10Percent = -6;
  wd25Percent = -7;
  wd50Percent = -8;
  wd75Percent = -9;

{ WdStyleType }

  wdStyleTypeParagraph = 1;
  wdStyleTypeCharacter = 2;

{ WdUnits }

  wdCharacter = 1;
  wdWord = 2;
  wdSentence = 3;
  wdParagraph = 4;
  wdLine = 5;
  wdStory = 6;
  wdScreen = 7;
  wdSection = 8;
  wdColumn = 9;
  wdRow = 10;
  wdWindow = 11;
  wdCell = 12;
  wdCharacterFormatting = 13;
  wdParagraphFormatting = 14;
  wdTable = 15;
  wdItem = 16;

{ WdGoToItem }

  wdGoToBookmark = -1;
  wdGoToSection = 0;
  wdGoToPage = 1;
  wdGoToTable = 2;
  wdGoToLine = 3;
  wdGoToFootnote = 4;
  wdGoToEndnote = 5;
  wdGoToComment = 6;
  wdGoToField = 7;
  wdGoToGraphic = 8;
  wdGoToObject = 9;
  wdGoToEquation = 10;
  wdGoToHeading = 11;
  wdGoToPercent = 12;
  wdGoToSpellingError = 13;
  wdGoToGrammaticalError = 14;
  wdGoToProofreadingError = 15;

{ WdGoToDirection }

  wdGoToFirst = 1;
  wdGoToLast = -1;
  wdGoToNext = 2;
  wdGoToRelative = 2;
  wdGoToPrevious = 3;
  wdGoToAbsolute = 1;

{ WdCollapseDirection }

  wdCollapseStart = 1;
  wdCollapseEnd = 0;

{ WdRowHeightRule }

  wdRowHeightAuto = 0;
  wdRowHeightAtLeast = 1;
  wdRowHeightExactly = 2;

{ WdFrameSizeRule }

  wdFrameAuto = 0;
  wdFrameAtLeast = 1;
  wdFrameExact = 2;

{ WdInsertCells }

  wdInsertCellsShiftRight = 0;
  wdInsertCellsShiftDown = 1;
  wdInsertCellsEntireRow = 2;
  wdInsertCellsEntireColumn = 3;

{ WdDeleteCells }

  wdDeleteCellsShiftLeft = 0;
  wdDeleteCellsShiftUp = 1;
  wdDeleteCellsEntireRow = 2;
  wdDeleteCellsEntireColumn = 3;

{ WdListApplyTo }

  wdListApplyToWholeList = 0;
  wdListApplyToThisPointForward = 1;
  wdListApplyToSelection = 2;

{ WdAlertLevel }

  wdAlertsNone = 0;
  wdAlertsMessageBox = -2;
  wdAlertsAll = -1;

{ WdCursorType }

  wdCursorWait = 0;
  wdCursorIBeam = 1;
  wdCursorNormal = 2;
  wdCursorNorthwestArrow = 3;

{ WdEnableCancelKey }

  wdCancelDisabled = 0;
  wdCancelInterrupt = 1;

{ WdRulerStyle }

  wdAdjustNone = 0;
  wdAdjustProportional = 1;
  wdAdjustFirstColumn = 2;
  wdAdjustSameWidth = 3;

{ WdParagraphAlignment }

  wdAlignParagraphLeft = 0;
  wdAlignParagraphCenter = 1;
  wdAlignParagraphRight = 2;
  wdAlignParagraphJustify = 3;

{ WdParagraphAlignmentHID }

  wdAlignParagraphDistribute = 4;

{ WdListLevelAlignment }

  wdListLevelAlignLeft = 0;
  wdListLevelAlignCenter = 1;
  wdListLevelAlignRight = 2;

{ WdRowAlignment }

  wdAlignRowLeft = 0;
  wdAlignRowCenter = 1;
  wdAlignRowRight = 2;

{ WdTabAlignment }

  wdAlignTabLeft = 0;
  wdAlignTabCenter = 1;
  wdAlignTabRight = 2;
  wdAlignTabDecimal = 3;
  wdAlignTabBar = 4;
  wdAlignTabList = 6;

{ WdVerticalAlignment }

  wdAlignVerticalTop = 0;
  wdAlignVerticalCenter = 1;
  wdAlignVerticalJustify = 2;
  wdAlignVerticalBottom = 3;

{ WdCellVerticalAlignment }

  wdCellAlignVerticalTop = 0;
  wdCellAlignVerticalCenter = 1;
  wdCellAlignVerticalBottom = 3;

{ WdTrailingCharacter }

  wdTrailingTab = 0;
  wdTrailingSpace = 1;
  wdTrailingNone = 2;

{ WdListGalleryType }

  wdBulletGallery = 1;
  wdNumberGallery = 2;
  wdOutlineNumberGallery = 3;

{ WdListNumberStyle }

  wdListNumberStyleArabic = 0;
  wdListNumberStyleUppercaseRoman = 1;
  wdListNumberStyleLowercaseRoman = 2;
  wdListNumberStyleUppercaseLetter = 3;
  wdListNumberStyleLowercaseLetter = 4;
  wdListNumberStyleOrdinal = 5;
  wdListNumberStyleCardinalText = 6;
  wdListNumberStyleOrdinalText = 7;
  wdListNumberStyleArabicLZ = 22;
  wdListNumberStyleBullet = 23;
  wdListNumberStyleLegal = 253;
  wdListNumberStyleLegalLZ = 254;
  wdListNumberStyleNone = 255;

{ WdListNumberStyleHID }

  wdListNumberStyleKanji = 10;
  wdListNumberStyleKanjiDigit = 11;
  wdListNumberStyleAiueoHalfWidth = 12;
  wdListNumberStyleIrohaHalfWidth = 13;
  wdListNumberStyleArabicFullWidth = 14;
  wdListNumberStyleKanjiTraditional = 16;
  wdListNumberStyleKanjiTraditional2 = 17;
  wdListNumberStyleNumberInCircle = 18;
  wdListNumberStyleAiueo = 20;
  wdListNumberStyleIroha = 21;
  wdListNumberStyleGanada = 24;
  wdListNumberStyleChosung = 25;
  wdListNumberStyleGBNum1 = 26;
  wdListNumberStyleGBNum2 = 27;
  wdListNumberStyleGBNum3 = 28;
  wdListNumberStyleGBNum4 = 29;
  wdListNumberStyleZodiac1 = 30;
  wdListNumberStyleZodiac2 = 31;
  wdListNumberStyleZodiac3 = 32;
  wdListNumberStyleTradChinNum1 = 33;
  wdListNumberStyleTradChinNum2 = 34;
  wdListNumberStyleTradChinNum3 = 35;
  wdListNumberStyleTradChinNum4 = 36;
  wdListNumberStyleSimpChinNum1 = 37;
  wdListNumberStyleSimpChinNum2 = 38;
  wdListNumberStyleSimpChinNum3 = 39;
  wdListNumberStyleSimpChinNum4 = 40;
  wdListNumberStyleHanjaRead = 41;
  wdListNumberStyleHanjaReadDigit = 42;
  wdListNumberStyleHangul = 43;
  wdListNumberStyleHanja = 44;

{ WdNoteNumberStyle }

  wdNoteNumberStyleArabic = 0;
  wdNoteNumberStyleUppercaseRoman = 1;
  wdNoteNumberStyleLowercaseRoman = 2;
  wdNoteNumberStyleUppercaseLetter = 3;
  wdNoteNumberStyleLowercaseLetter = 4;
  wdNoteNumberStyleSymbol = 9;

{ WdNoteNumberStyleHID }

  wdNoteNumberStyleArabicFullWidth = 14;
  wdNoteNumberStyleKanji = 10;
  wdNoteNumberStyleKanjiDigit = 11;
  wdNoteNumberStyleKanjiTraditional = 16;
  wdNoteNumberStyleNumberInCircle = 18;
  wdNoteNumberStyleHanjaRead = 41;
  wdNoteNumberStyleHanjaReadDigit = 42;
  wdNoteNumberStyleTradChinNum1 = 33;
  wdNoteNumberStyleTradChinNum2 = 34;
  wdNoteNumberStyleSimpChinNum1 = 37;
  wdNoteNumberStyleSimpChinNum2 = 38;

{ WdCaptionNumberStyle }

  wdCaptionNumberStyleArabic = 0;
  wdCaptionNumberStyleUppercaseRoman = 1;
  wdCaptionNumberStyleLowercaseRoman = 2;
  wdCaptionNumberStyleUppercaseLetter = 3;
  wdCaptionNumberStyleLowercaseLetter = 4;

{ WdCaptionNumberStyleHID }

  wdCaptionNumberStyleArabicFullWidth = 14;
  wdCaptionNumberStyleKanji = 10;
  wdCaptionNumberStyleKanjiDigit = 11;
  wdCaptionNumberStyleKanjiTraditional = 16;
  wdCaptionNumberStyleNumberInCircle = 18;
  wdCaptionNumberStyleGanada = 24;
  wdCaptionNumberStyleChosung = 25;
  wdCaptionNumberStyleZodiac1 = 30;
  wdCaptionNumberStyleZodiac2 = 31;
  wdCaptionNumberStyleHanjaRead = 41;
  wdCaptionNumberStyleHanjaReadDigit = 42;
  wdCaptionNumberStyleTradChinNum2 = 34;
  wdCaptionNumberStyleTradChinNum3 = 35;
  wdCaptionNumberStyleSimpChinNum2 = 38;
  wdCaptionNumberStyleSimpChinNum3 = 39;

{ WdPageNumberStyle }

  wdPageNumberStyleArabic = 0;
  wdPageNumberStyleUppercaseRoman = 1;
  wdPageNumberStyleLowercaseRoman = 2;
  wdPageNumberStyleUppercaseLetter = 3;
  wdPageNumberStyleLowercaseLetter = 4;

{ WdPageNumberStyleHID }

  wdPageNumberStyleArabicFullWidth = 14;
  wdPageNumberStyleKanji = 10;
  wdPageNumberStyleKanjiDigit = 11;
  wdPageNumberStyleKanjiTraditional = 16;
  wdPageNumberStyleNumberInCircle = 18;
  wdPageNumberStyleHanjaRead = 41;
  wdPageNumberStyleHanjaReadDigit = 42;
  wdPageNumberStyleTradChinNum1 = 33;
  wdPageNumberStyleTradChinNum2 = 34;
  wdPageNumberStyleSimpChinNum1 = 37;
  wdPageNumberStyleSimpChinNum2 = 38;

{ WdStatistic }

  wdStatisticWords = 0;
  wdStatisticLines = 1;
  wdStatisticPages = 2;
  wdStatisticCharacters = 3;
  wdStatisticParagraphs = 4;
  wdStatisticCharactersWithSpaces = 5;

{ WdStatisticHID }

  wdStatisticFarEastCharacters = 6;

{ WdBuiltInProperty }

  wdPropertyTitle = 1;
  wdPropertySubject = 2;
  wdPropertyAuthor = 3;
  wdPropertyKeywords = 4;
  wdPropertyComments = 5;
  wdPropertyTemplate = 6;
  wdPropertyLastAuthor = 7;
  wdPropertyRevision = 8;
  wdPropertyAppName = 9;
  wdPropertyTimeLastPrinted = 10;
  wdPropertyTimeCreated = 11;
  wdPropertyTimeLastSaved = 12;
  wdPropertyVBATotalEdit = 13;
  wdPropertyPages = 14;
  wdPropertyWords = 15;
  wdPropertyCharacters = 16;
  wdPropertySecurity = 17;
  wdPropertyCategory = 18;
  wdPropertyFormat = 19;
  wdPropertyManager = 20;
  wdPropertyCompany = 21;
  wdPropertyBytes = 22;
  wdPropertyLines = 23;
  wdPropertyParas = 24;
  wdPropertySlides = 25;
  wdPropertyNotes = 26;
  wdPropertyHiddenSlides = 27;
  wdPropertyMMClips = 28;
  wdPropertyHyperlinkBase = 29;
  wdPropertyCharsWSpaces = 30;

{ WdLineSpacing }

  wdLineSpaceSingle = 0;
  wdLineSpace1pt5 = 1;
  wdLineSpaceDouble = 2;
  wdLineSpaceAtLeast = 3;
  wdLineSpaceExactly = 4;
  wdLineSpaceMultiple = 5;

{ WdNumberType }

  wdNumberParagraph = 1;
  wdNumberListNum = 2;
  wdNumberAllNumbers = 3;

{ WdListType }

  wdListNoNumbering = 0;
  wdListListNumOnly = 1;
  wdListBullet = 2;
  wdListSimpleNumbering = 3;
  wdListOutlineNumbering = 4;
  wdListMixedNumbering = 5;

{ WdStoryType }

  wdMainTextStory = 1;
  wdFootnotesStory = 2;
  wdEndnotesStory = 3;
  wdCommentsStory = 4;
  wdTextFrameStory = 5;
  wdEvenPagesHeaderStory = 6;
  wdPrimaryHeaderStory = 7;
  wdEvenPagesFooterStory = 8;
  wdPrimaryFooterStory = 9;
  wdFirstPageHeaderStory = 10;
  wdFirstPageFooterStory = 11;

{ WdSaveFormat }

  wdFormatDocument = 0;
  wdFormatTemplate = 1;
  wdFormatText = 2;
  wdFormatTextLineBreaks = 3;
  wdFormatDOSText = 4;
  wdFormatDOSTextLineBreaks = 5;
  wdFormatRTF = 6;
  wdFormatUnicodeText = 7;

{ WdOpenFormat }

  wdOpenFormatAuto = 0;
  wdOpenFormatDocument = 1;
  wdOpenFormatTemplate = 2;
  wdOpenFormatRTF = 3;
  wdOpenFormatText = 4;
  wdOpenFormatUnicodeText = 5;

{ WdHeaderFooterIndex }

  wdHeaderFooterPrimary = 1;
  wdHeaderFooterFirstPage = 2;
  wdHeaderFooterEvenPages = 3;

{ WdTocFormat }

  wdTOCTemplate = 0;
  wdTOCClassic = 1;
  wdTOCDistinctive = 2;
  wdTOCFancy = 3;
  wdTOCModern = 4;
  wdTOCFormal = 5;
  wdTOCSimple = 6;

{ WdTofFormat }

  wdTOFTemplate = 0;
  wdTOFClassic = 1;
  wdTOFDistinctive = 2;
  wdTOFCentered = 3;
  wdTOFFormal = 4;
  wdTOFSimple = 5;

{ WdToaFormat }

  wdTOATemplate = 0;
  wdTOAClassic = 1;
  wdTOADistinctive = 2;
  wdTOAFormal = 3;
  wdTOASimple = 4;

{ WdLineStyle }

  wdLineStyleNone = 0;
  wdLineStyleSingle = 1;
  wdLineStyleDot = 2;
  wdLineStyleDashSmallGap = 3;
  wdLineStyleDashLargeGap = 4;
  wdLineStyleDashDot = 5;
  wdLineStyleDashDotDot = 6;
  wdLineStyleDouble = 7;
  wdLineStyleTriple = 8;
  wdLineStyleThinThickSmallGap = 9;
  wdLineStyleThickThinSmallGap = 10;
  wdLineStyleThinThickThinSmallGap = 11;
  wdLineStyleThinThickMedGap = 12;
  wdLineStyleThickThinMedGap = 13;
  wdLineStyleThinThickThinMedGap = 14;
  wdLineStyleThinThickLargeGap = 15;
  wdLineStyleThickThinLargeGap = 16;
  wdLineStyleThinThickThinLargeGap = 17;
  wdLineStyleSingleWavy = 18;
  wdLineStyleDoubleWavy = 19;
  wdLineStyleDashDotStroked = 20;
  wdLineStyleEmboss3D = 21;
  wdLineStyleEngrave3D = 22;

{ WdLineWidth }

  wdLineWidth025pt = 2;
  wdLineWidth050pt = 4;
  wdLineWidth075pt = 6;
  wdLineWidth100pt = 8;
  wdLineWidth150pt = 12;
  wdLineWidth225pt = 18;
  wdLineWidth300pt = 24;
  wdLineWidth450pt = 36;
  wdLineWidth600pt = 48;

{ WdBreakType }

  wdSectionBreakNextPage = 2;
  wdSectionBreakContinuous = 3;
  wdSectionBreakEvenPage = 4;
  wdSectionBreakOddPage = 5;
  wdLineBreak = 6;
  wdPageBreak = 7;
  wdColumnBreak = 8;

{ WdTabLeader }

  wdTabLeaderSpaces = 0;
  wdTabLeaderDots = 1;
  wdTabLeaderDashes = 2;
  wdTabLeaderLines = 3;

{ WdTabLeaderHID }

  wdTabLeaderHeavy = 4;
  wdTabLeaderMiddleDot = 5;

{ WdMeasurementUnits }

  wdInches = 0;
  wdCentimeters = 1;
  wdPoints = 3;
  wdPicas = 4;

{ WdMeasurementUnitsHID }

  wdMillimeters = 2;

{ WdDropPosition }

  wdDropNone = 0;
  wdDropNormal = 1;
  wdDropMargin = 2;

{ WdNumberingRule }

  wdRestartContinuous = 0;
  wdRestartSection = 1;
  wdRestartPage = 2;

{ WdFootnoteLocation }

  wdBottomOfPage = 0;
  wdBeneathText = 1;

{ WdEndnoteLocation }

  wdEndOfSection = 0;
  wdEndOfDocument = 1;

{ WdSortSeparator }

  wdSortSeparateByTabs = 0;
  wdSortSeparateByCommas = 1;
  wdSortSeparateByDefaultTableSeparator = 2;

{ WdTableFieldSeparator }

  wdSeparateByParagraphs = 0;
  wdSeparateByTabs = 1;
  wdSeparateByCommas = 2;
  wdSeparateByDefaultListSeparator = 3;

{ WdSortFieldType }

  wdSortFieldAlphanumeric = 0;
  wdSortFieldNumeric = 1;
  wdSortFieldDate = 2;

{ WdSortFieldTypeHID }

  wdSortFieldSyllable = 3;
  wdSortFieldJapanJIS = 4;
  wdSortFieldStroke = 5;
  wdSortFieldKoreaKS = 6;

{ WdSortOrder }

  wdSortOrderAscending = 0;
  wdSortOrderDescending = 1;

{ WdTableFormat }

  wdTableFormatNone = 0;
  wdTableFormatSimple1 = 1;
  wdTableFormatSimple2 = 2;
  wdTableFormatSimple3 = 3;
  wdTableFormatClassic1 = 4;
  wdTableFormatClassic2 = 5;
  wdTableFormatClassic3 = 6;
  wdTableFormatClassic4 = 7;
  wdTableFormatColorful1 = 8;
  wdTableFormatColorful2 = 9;
  wdTableFormatColorful3 = 10;
  wdTableFormatColumns1 = 11;
  wdTableFormatColumns2 = 12;
  wdTableFormatColumns3 = 13;
  wdTableFormatColumns4 = 14;
  wdTableFormatColumns5 = 15;
  wdTableFormatGrid1 = 16;
  wdTableFormatGrid2 = 17;
  wdTableFormatGrid3 = 18;
  wdTableFormatGrid4 = 19;
  wdTableFormatGrid5 = 20;
  wdTableFormatGrid6 = 21;
  wdTableFormatGrid7 = 22;
  wdTableFormatGrid8 = 23;
  wdTableFormatList1 = 24;
  wdTableFormatList2 = 25;
  wdTableFormatList3 = 26;
  wdTableFormatList4 = 27;
  wdTableFormatList5 = 28;
  wdTableFormatList6 = 29;
  wdTableFormatList7 = 30;
  wdTableFormatList8 = 31;
  wdTableFormat3DEffects1 = 32;
  wdTableFormat3DEffects2 = 33;
  wdTableFormat3DEffects3 = 34;
  wdTableFormatContemporary = 35;
  wdTableFormatElegant = 36;
  wdTableFormatProfessional = 37;
  wdTableFormatSubtle1 = 38;
  wdTableFormatSubtle2 = 39;

{ WdTableFormatApply }

  wdTableFormatApplyBorders = 1;
  wdTableFormatApplyShading = 2;
  wdTableFormatApplyFont = 4;
  wdTableFormatApplyColor = 8;
  wdTableFormatApplyAutoFit = 16;
  wdTableFormatApplyHeadingRows = 32;
  wdTableFormatApplyLastRow = 64;
  wdTableFormatApplyFirstColumn = 128;
  wdTableFormatApplyLastColumn = 256;

{ WdLanguageID }

  wdLanguageNone = 0;
  wdNoProofing = 1024;
  wdDanish = 1030;
  wdGerman = 1031;
  wdSwissGerman = 2055;
  wdEnglishAUS = 3081;
  wdEnglishUK = 2057;
  wdEnglishUS = 1033;
  wdEnglishCanadian = 4105;
  wdEnglishNewZealand = 5129;
  wdEnglishSouthAfrica = 7177;
  wdSpanish = 1034;
  wdFrench = 1036;
  wdFrenchCanadian = 3084;
  wdItalian = 1040;
  wdDutch = 1043;
  wdNorwegianBokmol = 1044;
  wdNorwegianNynorsk = 2068;
  wdBrazilianPortuguese = 1046;
  wdPortuguese = 2070;
  wdFinnish = 1035;
  wdSwedish = 1053;
  wdCatalan = 1027;
  wdGreek = 1032;
  wdTurkish = 1055;
  wdRussian = 1049;
  wdCzech = 1029;
  wdHungarian = 1038;
  wdPolish = 1045;
  wdSlovenian = 1060;
  wdBasque = 1069;
  wdMalaysian = 1086;
  wdJapanese = 1041;
  wdKorean = 1042;
  wdSimplifiedChinese = 2052;
  wdTraditionalChinese = 1028;
  wdSwissFrench = 4108;
  wdSesotho = 1072;
  wdTsonga = 1073;
  wdTswana = 1074;
  wdVenda = 1075;
  wdXhosa = 1076;
  wdZulu = 1077;
  wdAfrikaans = 1078;
  wdArabic = 1025;
  wdHebrew = 1037;
  wdSlovak = 1051;
  wdFarsi = 1065;
  wdRomanian = 1048;
  wdCroatian = 1050;
  wdUkrainian = 1058;
  wdByelorussian = 1059;
  wdEstonian = 1061;
  wdLatvian = 1062;
  wdMacedonian = 1071;
  wdSerbianLatin = 2074;
  wdSerbianCyrillic = 3098;
  wdIcelandic = 1039;
  wdBelgianFrench = 2060;
  wdBelgianDutch = 2067;
  wdBulgarian = 1026;
  wdMexicanSpanish = 2058;
  wdSpanishModernSort = 3082;
  wdSwissItalian = 2064;

{ WdFieldType }

  wdFieldEmpty = -1;
  wdFieldRef = 3;
  wdFieldIndexEntry = 4;
  wdFieldFootnoteRef = 5;
  wdFieldSet = 6;
  wdFieldIf = 7;
  wdFieldIndex = 8;
  wdFieldTOCEntry = 9;
  wdFieldStyleRef = 10;
  wdFieldRefDoc = 11;
  wdFieldSequence = 12;
  wdFieldTOC = 13;
  wdFieldInfo = 14;
  wdFieldTitle = 15;
  wdFieldSubject = 16;
  wdFieldAuthor = 17;
  wdFieldKeyWord = 18;
  wdFieldComments = 19;
  wdFieldLastSavedBy = 20;
  wdFieldCreateDate = 21;
  wdFieldSaveDate = 22;
  wdFieldPrintDate = 23;
  wdFieldRevisionNum = 24;
  wdFieldEditTime = 25;
  wdFieldNumPages = 26;
  wdFieldNumWords = 27;
  wdFieldNumChars = 28;
  wdFieldFileName = 29;
  wdFieldTemplate = 30;
  wdFieldDate = 31;
  wdFieldTime = 32;
  wdFieldPage = 33;
  wdFieldExpression = 34;
  wdFieldQuote = 35;
  wdFieldInclude = 36;
  wdFieldPageRef = 37;
  wdFieldAsk = 38;
  wdFieldFillIn = 39;
  wdFieldData = 40;
  wdFieldNext = 41;
  wdFieldNextIf = 42;
  wdFieldSkipIf = 43;
  wdFieldMergeRec = 44;
  wdFieldDDE = 45;
  wdFieldDDEAuto = 46;
  wdFieldGlossary = 47;
  wdFieldPrint = 48;
  wdFieldFormula = 49;
  wdFieldGoToButton = 50;
  wdFieldMacroButton = 51;
  wdFieldAutoNumOutline = 52;
  wdFieldAutoNumLegal = 53;
  wdFieldAutoNum = 54;
  wdFieldImport = 55;
  wdFieldLink = 56;
  wdFieldSymbol = 57;
  wdFieldEmbed = 58;
  wdFieldMergeField = 59;
  wdFieldUserName = 60;
  wdFieldUserInitials = 61;
  wdFieldUserAddress = 62;
  wdFieldBarCode = 63;
  wdFieldDocVariable = 64;
  wdFieldSection = 65;
  wdFieldSectionPages = 66;
  wdFieldIncludePicture = 67;
  wdFieldIncludeText = 68;
  wdFieldFileSize = 69;
  wdFieldFormTextInput = 70;
  wdFieldFormCheckBox = 71;
  wdFieldNoteRef = 72;
  wdFieldTOA = 73;
  wdFieldTOAEntry = 74;
  wdFieldMergeSeq = 75;
  wdFieldPrivate = 77;
  wdFieldDatabase = 78;
  wdFieldAutoText = 79;
  wdFieldCompare = 80;
  wdFieldAddin = 81;
  wdFieldSubscriber = 82;
  wdFieldFormDropDown = 83;
  wdFieldAdvance = 84;
  wdFieldDocProperty = 85;
  wdFieldOCX = 87;
  wdFieldHyperlink = 88;
  wdFieldAutoTextList = 89;
  wdFieldListNum = 90;
  wdFieldHTMLActiveX = 91;

{ WdBuiltinStyle }

  wdStyleNormal = -1;
  wdStyleEnvelopeAddress = -37;
  wdStyleEnvelopeReturn = -38;
  wdStyleBodyText = -67;
  wdStyleHeading1 = -2;
  wdStyleHeading2 = -3;
  wdStyleHeading3 = -4;
  wdStyleHeading4 = -5;
  wdStyleHeading5 = -6;
  wdStyleHeading6 = -7;
  wdStyleHeading7 = -8;
  wdStyleHeading8 = -9;
  wdStyleHeading9 = -10;
  wdStyleIndex1 = -11;
  wdStyleIndex2 = -12;
  wdStyleIndex3 = -13;
  wdStyleIndex4 = -14;
  wdStyleIndex5 = -15;
  wdStyleIndex6 = -16;
  wdStyleIndex7 = -17;
  wdStyleIndex8 = -18;
  wdStyleIndex9 = -19;
  wdStyleTOC1 = -20;
  wdStyleTOC2 = -21;
  wdStyleTOC3 = -22;
  wdStyleTOC4 = -23;
  wdStyleTOC5 = -24;
  wdStyleTOC6 = -25;
  wdStyleTOC7 = -26;
  wdStyleTOC8 = -27;
  wdStyleTOC9 = -28;
  wdStyleNormalIndent = -29;
  wdStyleFootnoteText = -30;
  wdStyleCommentText = -31;
  wdStyleHeader = -32;
  wdStyleFooter = -33;
  wdStyleIndexHeading = -34;
  wdStyleCaption = -35;
  wdStyleTableOfFigures = -36;
  wdStyleFootnoteReference = -39;
  wdStyleCommentReference = -40;
  wdStyleLineNumber = -41;
  wdStylePageNumber = -42;
  wdStyleEndnoteReference = -43;
  wdStyleEndnoteText = -44;
  wdStyleTableOfAuthorities = -45;
  wdStyleMacroText = -46;
  wdStyleTOAHeading = -47;
  wdStyleList = -48;
  wdStyleListBullet = -49;
  wdStyleListNumber = -50;
  wdStyleList2 = -51;
  wdStyleList3 = -52;
  wdStyleList4 = -53;
  wdStyleList5 = -54;
  wdStyleListBullet2 = -55;
  wdStyleListBullet3 = -56;
  wdStyleListBullet4 = -57;
  wdStyleListBullet5 = -58;
  wdStyleListNumber2 = -59;
  wdStyleListNumber3 = -60;
  wdStyleListNumber4 = -61;
  wdStyleListNumber5 = -62;
  wdStyleTitle = -63;
  wdStyleClosing = -64;
  wdStyleSignature = -65;
  wdStyleDefaultParagraphFont = -66;
  wdStyleBodyTextIndent = -68;
  wdStyleListContinue = -69;
  wdStyleListContinue2 = -70;
  wdStyleListContinue3 = -71;
  wdStyleListContinue4 = -72;
  wdStyleListContinue5 = -73;
  wdStyleMessageHeader = -74;
  wdStyleSubtitle = -75;
  wdStyleSalutation = -76;
  wdStyleDate = -77;
  wdStyleBodyTextFirstIndent = -78;
  wdStyleBodyTextFirstIndent2 = -79;
  wdStyleNoteHeading = -80;
  wdStyleBodyText2 = -81;
  wdStyleBodyText3 = -82;
  wdStyleBodyTextIndent2 = -83;
  wdStyleBodyTextIndent3 = -84;
  wdStyleBlockQuotation = -85;
  wdStyleHyperlink = -86;
  wdStyleHyperlinkFollowed = -87;
  wdStyleStrong = -88;
  wdStyleEmphasis = -89;
  wdStyleNavPane = -90;
  wdStylePlainText = -91;

{ WdWordDialogTab }

  wdDialogToolsOptionsTabView = 204;
  wdDialogToolsOptionsTabGeneral = 203;
  wdDialogToolsOptionsTabEdit = 224;
  wdDialogToolsOptionsTabPrint = 208;
  wdDialogToolsOptionsTabSave = 209;
  wdDialogToolsOptionsTabProofread = 211;
  wdDialogToolsOptionsTabTrackChanges = 386;
  wdDialogToolsOptionsTabUserInfo = 213;
  wdDialogToolsOptionsTabCompatibility = 525;
  wdDialogToolsOptionsTabFileLocations = 225;
  wdDialogFilePageSetupTabMargins = 150000;
  wdDialogFilePageSetupTabPaperSize = 150001;
  wdDialogFilePageSetupTabPaperSource = 150002;
  wdDialogFilePageSetupTabLayout = 150003;
  wdDialogInsertSymbolTabSymbols = 200000;
  wdDialogInsertSymbolTabSpecialCharacters = 200001;
  wdDialogNoteOptionsTabAllFootnotes = 300000;
  wdDialogNoteOptionsTabAllEndnotes = 300001;
  wdDialogInsertIndexAndTablesTabIndex = 400000;
  wdDialogInsertIndexAndTablesTabTableOfContents = 400001;
  wdDialogInsertIndexAndTablesTabTableOfFigures = 400002;
  wdDialogInsertIndexAndTablesTabTableOfAuthorities = 400003;
  wdDialogOrganizerTabStyles = 500000;
  wdDialogOrganizerTabAutoText = 500001;
  wdDialogOrganizerTabCommandBars = 500002;
  wdDialogOrganizerTabMacros = 500003;
  wdDialogFormatFontTabFont = 600000;
  wdDialogFormatFontTabCharacterSpacing = 600001;
  wdDialogFormatFontTabAnimation = 600002;
  wdDialogFormatBordersAndShadingTabBorders = 700000;
  wdDialogFormatBordersAndShadingTabPageBorder = 700001;
  wdDialogFormatBordersAndShadingTabShading = 700002;
  wdDialogToolsEnvelopesAndLabelsTabEnvelopes = 800000;
  wdDialogToolsEnvelopesAndLabelsTabLabels = 800001;
  wdDialogFormatParagraphTabIndentsAndSpacing = 1000000;
  wdDialogFormatParagraphTabTextFlow = 1000001;
  wdDialogFormatDrawingObjectTabColorsAndLines = 1200000;
  wdDialogFormatDrawingObjectTabSize = 1200001;
  wdDialogFormatDrawingObjectTabPosition = 1200002;
  wdDialogFormatDrawingObjectTabWrapping = 1200003;
  wdDialogFormatDrawingObjectTabPicture = 1200004;
  wdDialogFormatDrawingObjectTabTextbox = 1200005;
  wdDialogToolsAutoCorrectExceptionsTabFirstLetter = 1400000;
  wdDialogToolsAutoCorrectExceptionsTabInitialCaps = 1400001;
  wdDialogFormatBulletsAndNumberingTabBulleted = 1500000;
  wdDialogFormatBulletsAndNumberingTabNumbered = 1500001;
  wdDialogFormatBulletsAndNumberingTabOutlineNumbered = 1500002;
  wdDialogLetterWizardTabLetterFormat = 1600000;
  wdDialogLetterWizardTabRecipientInfo = 1600001;
  wdDialogLetterWizardTabOtherElements = 1600002;
  wdDialogLetterWizardTabSenderInfo = 1600003;
  wdDialogToolsAutoManagerTabAutoCorrect = 1700000;
  wdDialogToolsAutoManagerTabAutoFormatAsYouType = 1700001;
  wdDialogToolsAutoManagerTabAutoText = 1700002;
  wdDialogToolsAutoManagerTabAutoFormat = 1700003;

{ WdWordDialogTabHID }

  wdDialogToolsOptionsTabTypography = 739;
  wdDialogToolsOptionsTabFuzzy = 790;
  wdDialogToolsOptionsTabHangulHanjaConversion = 786;
  wdDialogFilePageSetupTabCharsLines = 150004;
  wdDialogFormatParagraphTabTeisai = 1000002;
  wdDialogToolsAutoCorrectExceptionsTabHangulAndAlphabet = 1400002;

{ WdWordDialog }

  wdDialogHelpAbout = 9;
  wdDialogHelpWordPerfectHelp = 10;
  wdDialogHelpWordPerfectHelpOptions = 511;
  wdDialogFormatChangeCase = 322;
  wdDialogToolsWordCount = 228;
  wdDialogDocumentStatistics = 78;
  wdDialogFileNew = 79;
  wdDialogFileOpen = 80;
  wdDialogMailMergeOpenDataSource = 81;
  wdDialogMailMergeOpenHeaderSource = 82;
  wdDialogMailMergeUseAddressBook = 779;
  wdDialogFileSaveAs = 84;
  wdDialogFileSummaryInfo = 86;
  wdDialogToolsTemplates = 87;
  wdDialogOrganizer = 222;
  wdDialogFilePrint = 88;
  wdDialogMailMerge = 676;
  wdDialogMailMergeCheck = 677;
  wdDialogMailMergeQueryOptions = 681;
  wdDialogMailMergeFindRecord = 569;
  wdDialogMailMergeInsertIf = 4049;
  wdDialogMailMergeInsertNextIf = 4053;
  wdDialogMailMergeInsertSkipIf = 4055;
  wdDialogMailMergeInsertFillIn = 4048;
  wdDialogMailMergeInsertAsk = 4047;
  wdDialogMailMergeInsertSet = 4054;
  wdDialogMailMergeHelper = 680;
  wdDialogLetterWizard = 821;
  wdDialogFilePrintSetup = 97;
  wdDialogFileFind = 99;
  wdDialogMailMergeCreateDataSource = 642;
  wdDialogMailMergeCreateHeaderSource = 643;
  wdDialogEditPasteSpecial = 111;
  wdDialogEditFind = 112;
  wdDialogEditReplace = 117;
  wdDialogEditGoToOld = 811;
  wdDialogEditGoTo = 896;
  wdDialogCreateAutoText = 872;
  wdDialogEditAutoText = 985;
  wdDialogEditLinks = 124;
  wdDialogEditObject = 125;
  wdDialogConvertObject = 392;
  wdDialogTableToText = 128;
  wdDialogTextToTable = 127;
  wdDialogTableInsertTable = 129;
  wdDialogTableInsertCells = 130;
  wdDialogTableInsertRow = 131;
  wdDialogTableDeleteCells = 133;
  wdDialogTableSplitCells = 137;
  wdDialogTableFormula = 348;
  wdDialogTableAutoFormat = 563;
  wdDialogTableFormatCell = 612;
  wdDialogViewZoom = 577;
  wdDialogNewToolbar = 586;
  wdDialogInsertBreak = 159;
  wdDialogInsertFootnote = 370;
  wdDialogInsertSymbol = 162;
  wdDialogInsertPicture = 163;
  wdDialogInsertFile = 164;
  wdDialogInsertDateTime = 165;
  wdDialogInsertField = 166;
  wdDialogInsertDatabase = 341;
  wdDialogInsertMergeField = 167;
  wdDialogInsertBookmark = 168;
  wdDialogMarkIndexEntry = 169;
  wdDialogMarkCitation = 463;
  wdDialogEditTOACategory = 625;
  wdDialogInsertIndexAndTables = 473;
  wdDialogInsertIndex = 170;
  wdDialogInsertTableOfContents = 171;
  wdDialogMarkTableOfContentsEntry = 442;
  wdDialogInsertTableOfFigures = 472;
  wdDialogInsertTableOfAuthorities = 471;
  wdDialogInsertObject = 172;
  wdDialogFormatCallout = 610;
  wdDialogDrawSnapToGrid = 633;
  wdDialogDrawAlign = 634;
  wdDialogToolsEnvelopesAndLabels = 607;
  wdDialogToolsCreateEnvelope = 173;
  wdDialogToolsCreateLabels = 489;
  wdDialogToolsProtectDocument = 503;
  wdDialogToolsProtectSection = 578;
  wdDialogToolsUnprotectDocument = 521;
  wdDialogFormatFont = 174;
  wdDialogFormatParagraph = 175;
  wdDialogFormatSectionLayout = 176;
  wdDialogFormatColumns = 177;
  wdDialogFileDocumentLayout = 178;
  wdDialogFileMacPageSetup = 685;
  wdDialogFilePrintOneCopy = 445;
  wdDialogFileMacPageSetupGX = 444;
  wdDialogFileMacCustomPageSetupGX = 737;
  wdDialogFilePageSetup = 178;
  wdDialogFormatTabs = 179;
  wdDialogFormatStyle = 180;
  wdDialogFormatStyleGallery = 505;
  wdDialogFormatDefineStyleFont = 181;
  wdDialogFormatDefineStylePara = 182;
  wdDialogFormatDefineStyleTabs = 183;
  wdDialogFormatDefineStyleFrame = 184;
  wdDialogFormatDefineStyleBorders = 185;
  wdDialogFormatDefineStyleLang = 186;
  wdDialogFormatPicture = 187;
  wdDialogToolsLanguage = 188;
  wdDialogFormatBordersAndShading = 189;
  wdDialogFormatDrawingObject = 960;
  wdDialogFormatFrame = 190;
  wdDialogFormatDropCap = 488;
  wdDialogFormatBulletsAndNumbering = 824;
  wdDialogToolsHyphenation = 195;
  wdDialogToolsBulletsNumbers = 196;
  wdDialogToolsHighlightChanges = 197;
  wdDialogToolsAcceptRejectChanges = 506;
  wdDialogToolsMergeDocuments = 435;
  wdDialogToolsCompareDocuments = 198;
  wdDialogTableSort = 199;
  wdDialogToolsCustomizeMenuBar = 615;
  wdDialogToolsCustomize = 152;
  wdDialogToolsCustomizeKeyboard = 432;
  wdDialogToolsCustomizeMenus = 433;
  wdDialogListCommands = 723;
  wdDialogToolsOptions = 974;
  wdDialogToolsOptionsGeneral = 203;
  wdDialogToolsAdvancedSettings = 206;
  wdDialogToolsOptionsCompatibility = 525;
  wdDialogToolsOptionsPrint = 208;
  wdDialogToolsOptionsSave = 209;
  wdDialogToolsOptionsSpellingAndGrammar = 211;
  wdDialogToolsSpellingAndGrammar = 828;
  wdDialogToolsThesaurus = 194;
  wdDialogToolsOptionsUserInfo = 213;
  wdDialogToolsOptionsAutoFormat = 959;
  wdDialogToolsOptionsTrackChanges = 386;
  wdDialogToolsOptionsEdit = 224;
  wdDialogToolsMacro = 215;
  wdDialogInsertPageNumbers = 294;
  wdDialogFormatPageNumber = 298;
  wdDialogNoteOptions = 373;
  wdDialogCopyFile = 300;
  wdDialogFormatAddrFonts = 103;
  wdDialogFormatRetAddrFonts = 221;
  wdDialogToolsOptionsFileLocations = 225;
  wdDialogToolsCreateDirectory = 833;
  wdDialogUpdateTOC = 331;
  wdDialogInsertFormField = 483;
  wdDialogFormFieldOptions = 353;
  wdDialogInsertCaption = 357;
  wdDialogInsertAutoCaption = 359;
  wdDialogInsertAddCaption = 402;
  wdDialogInsertCaptionNumbering = 358;
  wdDialogInsertCrossReference = 367;
  wdDialogToolsManageFields = 631;
  wdDialogToolsAutoManager = 915;
  wdDialogToolsAutoCorrect = 378;
  wdDialogToolsAutoCorrectExceptions = 762;
  wdDialogConnect = 420;
  wdDialogToolsOptionsView = 204;
  wdDialogInsertSubdocument = 583;
  wdDialogFileRoutingSlip = 624;
  wdDialogFontSubstitution = 581;
  wdDialogEditCreatePublisher = 732;
  wdDialogEditSubscribeTo = 733;
  wdDialogEditPublishOptions = 735;
  wdDialogEditSubscribeOptions = 736;
  wdDialogControlRun = 235;
  wdDialogFileVersions = 945;
  wdDialogToolsAutoSummarize = 874;
  wdDialogFileSaveVersion = 1007;
  wdDialogWindowActivate = 220;
  wdDialogToolsMacroRecord = 214;
  wdDialogToolsRevisions = 197;

{ WdWordDialogHID }

  wdDialogToolsOptionsFuzzy = 790;
  wdDialogToolsOptionsTypography = 739;
  wdDialogToolsOptionsAutoFormatAsYouType = 778;

{ WdFieldKind }

  wdFieldKindNone = 0;
  wdFieldKindHot = 1;
  wdFieldKindWarm = 2;
  wdFieldKindCold = 3;

{ WdTextFormFieldType }

  wdRegularText = 0;
  wdNumberText = 1;
  wdDateText = 2;
  wdCurrentDateText = 3;
  wdCurrentTimeText = 4;
  wdCalculationText = 5;

{ WdChevronConvertRule }

  wdNeverConvert = 0;
  wdAlwaysConvert = 1;
  wdAskToNotConvert = 2;
  wdAskToConvert = 3;

{ WdMailMergeMainDocType }

  wdNotAMergeDocument = -1;
  wdFormLetters = 0;
  wdMailingLabels = 1;
  wdEnvelopes = 2;
  wdCatalog = 3;

{ WdMailMergeState }

  wdNormalDocument = 0;
  wdMainDocumentOnly = 1;
  wdMainAndDataSource = 2;
  wdMainAndHeader = 3;
  wdMainAndSourceAndHeader = 4;
  wdDataSource = 5;

{ WdMailMergeDestination }

  wdSendToNewDocument = 0;
  wdSendToPrinter = 1;
  wdSendToEmail = 2;
  wdSendToFax = 3;

{ WdMailMergeActiveRecord }

  wdNoActiveRecord = -1;
  wdNextRecord = -2;
  wdPreviousRecord = -3;
  wdFirstRecord = -4;
  wdLastRecord = -5;

{ WdMailMergeDefaultRecord }

  wdDefaultFirstRecord = 1;
  wdDefaultLastRecord = -16;

{ WdMailMergeDataSource }

  wdNoMergeInfo = -1;
  wdMergeInfoFromWord = 0;
  wdMergeInfoFromAccessDDE = 1;
  wdMergeInfoFromExcelDDE = 2;
  wdMergeInfoFromMSQueryDDE = 3;
  wdMergeInfoFromODBC = 4;

{ WdMailMergeComparison }

  wdMergeIfEqual = 0;
  wdMergeIfNotEqual = 1;
  wdMergeIfLessThan = 2;
  wdMergeIfGreaterThan = 3;
  wdMergeIfLessThanOrEqual = 4;
  wdMergeIfGreaterThanOrEqual = 5;
  wdMergeIfIsBlank = 6;
  wdMergeIfIsNotBlank = 7;

{ WdBookmarkSortBy }

  wdSortByName = 0;
  wdSortByLocation = 1;

{ WdWindowState }

  wdWindowStateNormal = 0;
  wdWindowStateMaximize = 1;
  wdWindowStateMinimize = 2;

{ WdPictureLinkType }

  wdLinkNone = 0;
  wdLinkDataInDoc = 1;
  wdLinkDataOnDisk = 2;

{ WdLinkType }

  wdLinkTypeOLE = 0;
  wdLinkTypePicture = 1;
  wdLinkTypeText = 2;
  wdLinkTypeReference = 3;
  wdLinkTypeInclude = 4;
  wdLinkTypeImport = 5;
  wdLinkTypeDDE = 6;
  wdLinkTypeDDEAuto = 7;

{ WdWindowType }

  wdWindowDocument = 0;
  wdWindowTemplate = 1;

{ WdViewType }

  wdNormalView = 1;
  wdOutlineView = 2;
  wdPageView = 3;
  wdPrintPreview = 4;
  wdMasterView = 5;
  wdOnlineView = 6;

{ WdSeekView }

  wdSeekMainDocument = 0;
  wdSeekPrimaryHeader = 1;
  wdSeekFirstPageHeader = 2;
  wdSeekEvenPagesHeader = 3;
  wdSeekPrimaryFooter = 4;
  wdSeekFirstPageFooter = 5;
  wdSeekEvenPagesFooter = 6;
  wdSeekFootnotes = 7;
  wdSeekEndnotes = 8;
  wdSeekCurrentPageHeader = 9;
  wdSeekCurrentPageFooter = 10;

{ WdSpecialPane }

  wdPaneNone = 0;
  wdPanePrimaryHeader = 1;
  wdPaneFirstPageHeader = 2;
  wdPaneEvenPagesHeader = 3;
  wdPanePrimaryFooter = 4;
  wdPaneFirstPageFooter = 5;
  wdPaneEvenPagesFooter = 6;
  wdPaneFootnotes = 7;
  wdPaneEndnotes = 8;
  wdPaneFootnoteContinuationNotice = 9;
  wdPaneFootnoteContinuationSeparator = 10;
  wdPaneFootnoteSeparator = 11;
  wdPaneEndnoteContinuationNotice = 12;
  wdPaneEndnoteContinuationSeparator = 13;
  wdPaneEndnoteSeparator = 14;
  wdPaneComments = 15;
  wdPaneCurrentPageHeader = 16;
  wdPaneCurrentPageFooter = 17;

{ WdPageFit }

  wdPageFitNone = 0;
  wdPageFitFullPage = 1;
  wdPageFitBestFit = 2;

{ WdBrowseTarget }

  wdBrowsePage = 1;
  wdBrowseSection = 2;
  wdBrowseComment = 3;
  wdBrowseFootnote = 4;
  wdBrowseEndnote = 5;
  wdBrowseField = 6;
  wdBrowseTable = 7;
  wdBrowseGraphic = 8;
  wdBrowseHeading = 9;
  wdBrowseEdit = 10;
  wdBrowseFind = 11;
  wdBrowseGoTo = 12;

{ WdPaperTray }

  wdPrinterDefaultBin = 0;
  wdPrinterUpperBin = 1;
  wdPrinterOnlyBin = 1;
  wdPrinterLowerBin = 2;
  wdPrinterMiddleBin = 3;
  wdPrinterManualFeed = 4;
  wdPrinterEnvelopeFeed = 5;
  wdPrinterManualEnvelopeFeed = 6;
  wdPrinterAutomaticSheetFeed = 7;
  wdPrinterTractorFeed = 8;
  wdPrinterSmallFormatBin = 9;
  wdPrinterLargeFormatBin = 10;
  wdPrinterLargeCapacityBin = 11;
  wdPrinterPaperCassette = 14;
  wdPrinterFormSource = 15;

{ WdOrientation }

  wdOrientPortrait = 0;
  wdOrientLandscape = 1;

{ WdSelectionType }

  wdNoSelection = 0;
  wdSelectionIP = 1;
  wdSelectionNormal = 2;
  wdSelectionFrame = 3;
  wdSelectionColumn = 4;
  wdSelectionRow = 5;
  wdSelectionBlock = 6;
  wdSelectionInlineShape = 7;
  wdSelectionShape = 8;

{ WdCaptionLabelID }

  wdCaptionFigure = -1;
  wdCaptionTable = -2;
  wdCaptionEquation = -3;

{ WdReferenceType }

  wdRefTypeNumberedItem = 0;
  wdRefTypeHeading = 1;
  wdRefTypeBookmark = 2;
  wdRefTypeFootnote = 3;
  wdRefTypeEndnote = 4;

{ WdReferenceKind }

  wdContentText = -1;
  wdNumberRelativeContext = -2;
  wdNumberNoContext = -3;
  wdNumberFullContext = -4;
  wdEntireCaption = 2;
  wdOnlyLabelAndNumber = 3;
  wdOnlyCaptionText = 4;
  wdFootnoteNumber = 5;
  wdEndnoteNumber = 6;
  wdPageNumber = 7;
  wdPosition = 15;
  wdFootnoteNumberFormatted = 16;
  wdEndnoteNumberFormatted = 17;

{ WdIndexFormat }

  wdIndexTemplate = 0;
  wdIndexClassic = 1;
  wdIndexFancy = 2;
  wdIndexModern = 3;
  wdIndexBulleted = 4;
  wdIndexFormal = 5;
  wdIndexSimple = 6;

{ WdIndexType }

  wdIndexIndent = 0;
  wdIndexRunin = 1;

{ WdRevisionsWrap }

  wdWrapNever = 0;
  wdWrapAlways = 1;
  wdWrapAsk = 2;

{ WdRevisionType }

  wdNoRevision = 0;
  wdRevisionInsert = 1;
  wdRevisionDelete = 2;
  wdRevisionProperty = 3;
  wdRevisionParagraphNumber = 4;
  wdRevisionDisplayField = 5;
  wdRevisionReconcile = 6;
  wdRevisionConflict = 7;
  wdRevisionStyle = 8;
  wdRevisionReplace = 9;

{ WdRoutingSlipDelivery }

  wdOneAfterAnother = 0;
  wdAllAtOnce = 1;

{ WdRoutingSlipStatus }

  wdNotYetRouted = 0;
  wdRouteInProgress = 1;
  wdRouteComplete = 2;

{ WdSectionStart }

  wdSectionContinuous = 0;
  wdSectionNewColumn = 1;
  wdSectionNewPage = 2;
  wdSectionEvenPage = 3;
  wdSectionOddPage = 4;

{ WdSaveOptions }

  wdDoNotSaveChanges = 0;
  wdSaveChanges = -1;
  wdPromptToSaveChanges = -2;

{ WdDocumentKind }

  wdDocumentNotSpecified = 0;
  wdDocumentLetter = 1;
  wdDocumentEmail = 2;

{ WdDocumentType }

  wdTypeDocument = 0;
  wdTypeTemplate = 1;

{ WdOriginalFormat }

  wdWordDocument = 0;
  wdOriginalDocumentFormat = 1;
  wdPromptUser = 2;

{ WdRelocate }

  wdRelocateUp = 0;
  wdRelocateDown = 1;

{ WdInsertedTextMark }

  wdInsertedTextMarkNone = 0;
  wdInsertedTextMarkBold = 1;
  wdInsertedTextMarkItalic = 2;
  wdInsertedTextMarkUnderline = 3;
  wdInsertedTextMarkDoubleUnderline = 4;

{ WdRevisedLinesMark }

  wdRevisedLinesMarkNone = 0;
  wdRevisedLinesMarkLeftBorder = 1;
  wdRevisedLinesMarkRightBorder = 2;
  wdRevisedLinesMarkOutsideBorder = 3;

{ WdDeletedTextMark }

  wdDeletedTextMarkHidden = 0;
  wdDeletedTextMarkStrikeThrough = 1;
  wdDeletedTextMarkCaret = 2;
  wdDeletedTextMarkPound = 3;

{ WdRevisedPropertiesMark }

  wdRevisedPropertiesMarkNone = 0;
  wdRevisedPropertiesMarkBold = 1;
  wdRevisedPropertiesMarkItalic = 2;
  wdRevisedPropertiesMarkUnderline = 3;
  wdRevisedPropertiesMarkDoubleUnderline = 4;

{ WdFieldShading }

  wdFieldShadingNever = 0;
  wdFieldShadingAlways = 1;
  wdFieldShadingWhenSelected = 2;

{ WdDefaultFilePath }

  wdDocumentsPath = 0;
  wdPicturesPath = 1;
  wdUserTemplatesPath = 2;
  wdWorkgroupTemplatesPath = 3;
  wdUserOptionsPath = 4;
  wdAutoRecoverPath = 5;
  wdToolsPath = 6;
  wdTutorialPath = 7;
  wdStartupPath = 8;
  wdProgramPath = 9;
  wdGraphicsFiltersPath = 10;
  wdTextConvertersPath = 11;
  wdProofingToolsPath = 12;
  wdTempFilePath = 13;
  wdCurrentFolderPath = 14;
  wdStyleGalleryPath = 15;
  wdBorderArtPath = 19;

{ WdCompatibility }

  wdNoTabHangIndent = 1;
  wdNoSpaceRaiseLower = 2;
  wdPrintColBlack = 3;
  wdWrapTrailSpaces = 4;
  wdNoColumnBalance = 5;
  wdConvMailMergeEsc = 6;
  wdSuppressSpBfAfterPgBrk = 7;
  wdSuppressTopSpacing = 8;
  wdOrigWordTableRules = 9;
  wdTransparentMetafiles = 10;
  wdShowBreaksInFrames = 11;
  wdSwapBordersFacingPages = 12;
  wdLeaveBackslashAlone = 13;
  wdExpandShiftReturn = 14;
  wdDontULTrailSpace = 15;
  wdDontBalanceSingleByteDoubleByteWidth = 16;
  wdSuppressTopSpacingMac5 = 17;
  wdSpacingInWholePoints = 18;
  wdPrintBodyTextBeforeHeader = 19;
  wdNoLeading = 20;
  wdNoSpaceForUL = 21;
  wdMWSmallCaps = 22;
  wdNoExtraLineSpacing = 23;
  wdTruncateFontHeight = 24;
  wdSubFontBySize = 25;
  wdUsePrinterMetrics = 26;
  wdWW6BorderRules = 27;
  wdExactOnTop = 28;
  wdSuppressBottomSpacing = 29;
  wdWPSpaceWidth = 30;
  wdWPJustification = 31;
  wdLineWrapLikeWord6 = 32;

{ WdPaperSize }

  wdPaper10x14 = 0;
  wdPaper11x17 = 1;
  wdPaperLetter = 2;
  wdPaperLetterSmall = 3;
  wdPaperLegal = 4;
  wdPaperExecutive = 5;
  wdPaperA3 = 6;
  wdPaperA4 = 7;
  wdPaperA4Small = 8;
  wdPaperA5 = 9;
  wdPaperB4 = 10;
  wdPaperB5 = 11;
  wdPaperCSheet = 12;
  wdPaperDSheet = 13;
  wdPaperESheet = 14;
  wdPaperFanfoldLegalGerman = 15;
  wdPaperFanfoldStdGerman = 16;
  wdPaperFanfoldUS = 17;
  wdPaperFolio = 18;
  wdPaperLedger = 19;
  wdPaperNote = 20;
  wdPaperQuarto = 21;
  wdPaperStatement = 22;
  wdPaperTabloid = 23;
  wdPaperEnvelope9 = 24;
  wdPaperEnvelope10 = 25;
  wdPaperEnvelope11 = 26;
  wdPaperEnvelope12 = 27;
  wdPaperEnvelope14 = 28;
  wdPaperEnvelopeB4 = 29;
  wdPaperEnvelopeB5 = 30;
  wdPaperEnvelopeB6 = 31;
  wdPaperEnvelopeC3 = 32;
  wdPaperEnvelopeC4 = 33;
  wdPaperEnvelopeC5 = 34;
  wdPaperEnvelopeC6 = 35;
  wdPaperEnvelopeC65 = 36;
  wdPaperEnvelopeDL = 37;
  wdPaperEnvelopeItaly = 38;
  wdPaperEnvelopeMonarch = 39;
  wdPaperEnvelopePersonal = 40;
  wdPaperCustom = 41;

{ WdCustomLabelPageSize }

  wdCustomLabelLetter = 0;
  wdCustomLabelLetterLS = 1;
  wdCustomLabelA4 = 2;
  wdCustomLabelA4LS = 3;
  wdCustomLabelA5 = 4;
  wdCustomLabelA5LS = 5;
  wdCustomLabelB5 = 6;
  wdCustomLabelMini = 7;
  wdCustomLabelFanfold = 8;

{ WdProtectionType }

  wdNoProtection = -1;
  wdAllowOnlyRevisions = 0;
  wdAllowOnlyComments = 1;
  wdAllowOnlyFormFields = 2;

{ WdPartOfSpeech }

  wdAdjective = 0;
  wdNoun = 1;
  wdAdverb = 2;
  wdVerb = 3;

{ WdSubscriberFormats }

  wdSubscriberBestFormat = 0;
  wdSubscriberRTF = 1;
  wdSubscriberText = 2;
  wdSubscriberPict = 4;

{ WdEditionType }

  wdPublisher = 0;
  wdSubscriber = 1;

{ WdEditionOption }

  wdCancelPublisher = 0;
  wdSendPublisher = 1;
  wdSelectPublisher = 2;
  wdAutomaticUpdate = 3;
  wdManualUpdate = 4;
  wdChangeAttributes = 5;
  wdUpdateSubscriber = 6;
  wdOpenSource = 7;

{ WdRelativeHorizontalPosition }

  wdRelativeHorizontalPositionMargin = 0;
  wdRelativeHorizontalPositionPage = 1;
  wdRelativeHorizontalPositionColumn = 2;

{ WdRelativeVerticalPosition }

  wdRelativeVerticalPositionMargin = 0;
  wdRelativeVerticalPositionPage = 1;
  wdRelativeVerticalPositionParagraph = 2;

{ WdHelpType }

  wdHelp = 0;
  wdHelpAbout = 1;
  wdHelpActiveWindow = 2;
  wdHelpContents = 3;
  wdHelpExamplesAndDemos = 4;
  wdHelpIndex = 5;
  wdHelpKeyboard = 6;
  wdHelpPSSHelp = 7;
  wdHelpQuickPreview = 8;
  wdHelpSearch = 9;
  wdHelpUsingHelp = 10;

{ WdHelpTypeHID }

  wdHelpIchitaro = 11;
  wdHelpPE2 = 12;

{ WdKeyCategory }

  wdKeyCategoryNil = -1;
  wdKeyCategoryDisable = 0;
  wdKeyCategoryCommand = 1;
  wdKeyCategoryMacro = 2;
  wdKeyCategoryFont = 3;
  wdKeyCategoryAutoText = 4;
  wdKeyCategoryStyle = 5;
  wdKeyCategorySymbol = 6;
  wdKeyCategoryPrefix = 7;

{ WdKey }

  wdNoKey = 255;
  wdKeyShift = 256;
  wdKeyControl = 512;
  wdKeyCommand = 512;
  wdKeyAlt = 1024;
  wdKeyOption = 1024;
  wdKeyA = 65;
  wdKeyB = 66;
  wdKeyC = 67;
  wdKeyD = 68;
  wdKeyE = 69;
  wdKeyF = 70;
  wdKeyG = 71;
  wdKeyH = 72;
  wdKeyI = 73;
  wdKeyJ = 74;
  wdKeyK = 75;
  wdKeyL = 76;
  wdKeyM = 77;
  wdKeyN = 78;
  wdKeyO = 79;
  wdKeyP = 80;
  wdKeyQ = 81;
  wdKeyR = 82;
  wdKeyS = 83;
  wdKeyT = 84;
  wdKeyU = 85;
  wdKeyV = 86;
  wdKeyW = 87;
  wdKeyX = 88;
  wdKeyY = 89;
  wdKeyZ = 90;
  wdKey0 = 48;
  wdKey1 = 49;
  wdKey2 = 50;
  wdKey3 = 51;
  wdKey4 = 52;
  wdKey5 = 53;
  wdKey6 = 54;
  wdKey7 = 55;
  wdKey8 = 56;
  wdKey9 = 57;
  wdKeyBackspace = 8;
  wdKeyTab = 9;
  wdKeyNumeric5Special = 12;
  wdKeyReturn = 13;
  wdKeyPause = 19;
  wdKeyEsc = 27;
  wdKeySpacebar = 32;
  wdKeyPageUp = 33;
  wdKeyPageDown = 34;
  wdKeyEnd = 35;
  wdKeyHome = 36;
  wdKeyInsert = 45;
  wdKeyDelete = 46;
  wdKeyNumeric0 = 96;
  wdKeyNumeric1 = 97;
  wdKeyNumeric2 = 98;
  wdKeyNumeric3 = 99;
  wdKeyNumeric4 = 100;
  wdKeyNumeric5 = 101;
  wdKeyNumeric6 = 102;
  wdKeyNumeric7 = 103;
  wdKeyNumeric8 = 104;
  wdKeyNumeric9 = 105;
  wdKeyNumericMultiply = 106;
  wdKeyNumericAdd = 107;
  wdKeyNumericSubtract = 109;
  wdKeyNumericDecimal = 110;
  wdKeyNumericDivide = 111;
  wdKeyF1 = 112;
  wdKeyF2 = 113;
  wdKeyF3 = 114;
  wdKeyF4 = 115;
  wdKeyF5 = 116;
  wdKeyF6 = 117;
  wdKeyF7 = 118;
  wdKeyF8 = 119;
  wdKeyF9 = 120;
  wdKeyF10 = 121;
  wdKeyF11 = 122;
  wdKeyF12 = 123;
  wdKeyF13 = 124;
  wdKeyF14 = 125;
  wdKeyF15 = 126;
  wdKeyF16 = 127;
  wdKeyScrollLock = 145;
  wdKeySemiColon = 186;
  wdKeyEquals = 187;
  wdKeyComma = 188;
  wdKeyHyphen = 189;
  wdKeyPeriod = 190;
  wdKeySlash = 191;
  wdKeyBackSingleQuote = 192;
  wdKeyOpenSquareBrace = 219;
  wdKeyBackSlash = 220;
  wdKeyCloseSquareBrace = 221;
  wdKeySingleQuote = 222;

{ WdOLEType }

  wdOLELink = 0;
  wdOLEEmbed = 1;
  wdOLEControl = 2;

{ WdOLEVerb }

  wdOLEVerbPrimary = 0;
  wdOLEVerbShow = -1;
  wdOLEVerbOpen = -2;
  wdOLEVerbHide = -3;
  wdOLEVerbUIActivate = -4;
  wdOLEVerbInPlaceActivate = -5;
  wdOLEVerbDiscardUndoState = -6;

{ WdOLEPlacement }

  wdInLine = 0;
  wdFloatOverText = 1;

{ WdEnvelopeOrientation }

  wdLeftPortrait = 0;
  wdCenterPortrait = 1;
  wdRightPortrait = 2;
  wdLeftLandscape = 3;
  wdCenterLandscape = 4;
  wdRightLandscape = 5;
  wdLeftClockwise = 6;
  wdCenterClockwise = 7;
  wdRightClockwise = 8;

{ WdLetterStyle }

  wdFullBlock = 0;
  wdModifiedBlock = 1;
  wdSemiBlock = 2;

{ WdLetterheadLocation }

  wdLetterTop = 0;
  wdLetterBottom = 1;
  wdLetterLeft = 2;
  wdLetterRight = 3;

{ WdSalutationType }

  wdSalutationInformal = 0;
  wdSalutationFormal = 1;
  wdSalutationBusiness = 2;
  wdSalutationOther = 3;

{ WdSalutationGender }

  wdGenderFemale = 0;
  wdGenderMale = 1;
  wdGenderNeutral = 2;
  wdGenderUnknown = 3;

{ WdMovementType }

  wdMove = 0;
  wdExtend = 1;

{ WdConstants }

  wdUndefined = 9999999;
  wdToggle = 9999998;
  wdForward = 1073741823;
  wdBackward = -1073741823;
  wdAutoPosition = 0;
  wdFirst = 1;
  wdCreatorCode = 1297307460;

{ WdPasteDataType }

  wdPasteOLEObject = 0;
  wdPasteRTF = 1;
  wdPasteText = 2;
  wdPasteMetafilePicture = 3;
  wdPasteBitmap = 4;
  wdPasteDeviceIndependentBitmap = 5;
  wdPasteHyperlink = 7;
  wdPasteShape = 8;
  wdPasteEnhancedMetafile = 9;

{ WdPrintOutItem }

  wdPrintDocumentContent = 0;
  wdPrintProperties = 1;
  wdPrintComments = 2;
  wdPrintStyles = 3;
  wdPrintAutoTextEntries = 4;
  wdPrintKeyAssignments = 5;
  wdPrintEnvelope = 6;

{ WdPrintOutPages }

  wdPrintAllPages = 0;
  wdPrintOddPagesOnly = 1;
  wdPrintEvenPagesOnly = 2;

{ WdPrintOutRange }

  wdPrintAllDocument = 0;
  wdPrintSelection = 1;
  wdPrintCurrentPage = 2;
  wdPrintFromTo = 3;
  wdPrintRangeOfPages = 4;

{ WdDictionaryType }

  wdSpelling = 0;
  wdGrammar = 1;
  wdThesaurus = 2;
  wdHyphenation = 3;
  wdSpellingComplete = 4;
  wdSpellingCustom = 5;
  wdSpellingLegal = 6;
  wdSpellingMedical = 7;

{ WdDictionaryTypeHID }

  wdHangulHanjaConversion = 8;
  wdHangulHanjaConversionCustom = 9;

{ WdSpellingWordType }

  wdSpellword = 0;
  wdWildcard = 1;
  wdAnagram = 2;

{ WdSpellingErrorType }

  wdSpellingCorrect = 0;
  wdSpellingNotInDictionary = 1;
  wdSpellingCapitalization = 2;

{ WdProofreadingErrorType }

  wdSpellingError = 0;
  wdGrammaticalError = 1;

{ WdInlineShapeType }

  wdInlineShapeEmbeddedOLEObject = 1;
  wdInlineShapeLinkedOLEObject = 2;
  wdInlineShapePicture = 3;
  wdInlineShapeLinkedPicture = 4;
  wdInlineShapeOLEControlObject = 5;

{ WdArrangeStyle }

  wdTiled = 0;
  wdIcons = 1;

{ WdSelectionFlags }

  wdSelStartActive = 1;
  wdSelAtEOL = 2;
  wdSelOvertype = 4;
  wdSelActive = 8;
  wdSelReplace = 16;

{ WdAutoVersions }

  wdAutoVersionOff = 0;
  wdAutoVersionOnClose = 1;

{ WdOrganizerObject }

  wdOrganizerObjectStyles = 0;
  wdOrganizerObjectAutoText = 1;
  wdOrganizerObjectCommandBars = 2;
  wdOrganizerObjectProjectItems = 3;

{ WdFindMatch }

  wdMatchParagraphMark = 65551;
  wdMatchTabCharacter = 9;
  wdMatchCommentMark = 5;
  wdMatchAnyCharacter = 65599;
  wdMatchAnyDigit = 65567;
  wdMatchAnyLetter = 65583;
  wdMatchCaretCharacter = 11;
  wdMatchColumnBreak = 14;
  wdMatchEmDash = 8212;
  wdMatchEnDash = 8211;
  wdMatchEndnoteMark = 65555;
  wdMatchField = 19;
  wdMatchFootnoteMark = 65554;
  wdMatchGraphic = 1;
  wdMatchManualLineBreak = 65551;
  wdMatchManualPageBreak = 65564;
  wdMatchNonbreakingHyphen = 30;
  wdMatchNonbreakingSpace = 160;
  wdMatchOptionalHyphen = 31;
  wdMatchSectionBreak = 65580;
  wdMatchWhiteSpace = 65655;

{ WdFindWrap }

  wdFindStop = 0;
  wdFindContinue = 1;
  wdFindAsk = 2;

{ WdInformation }

  wdActiveEndAdjustedPageNumber = 1;
  wdActiveEndSectionNumber = 2;
  wdActiveEndPageNumber = 3;
  wdNumberOfPagesInDocument = 4;
  wdHorizontalPositionRelativeToPage = 5;
  wdVerticalPositionRelativeToPage = 6;
  wdHorizontalPositionRelativeToTextBoundary = 7;
  wdVerticalPositionRelativeToTextBoundary = 8;
  wdFirstCharacterColumnNumber = 9;
  wdFirstCharacterLineNumber = 10;
  wdFrameIsSelected = 11;
  wdWithInTable = 12;
  wdStartOfRangeRowNumber = 13;
  wdEndOfRangeRowNumber = 14;
  wdMaximumNumberOfRows = 15;
  wdStartOfRangeColumnNumber = 16;
  wdEndOfRangeColumnNumber = 17;
  wdMaximumNumberOfColumns = 18;
  wdZoomPercentage = 19;
  wdSelectionMode = 20;
  wdCapsLock = 21;
  wdNumLock = 22;
  wdOverType = 23;
  wdRevisionMarking = 24;
  wdInFootnoteEndnotePane = 25;
  wdInCommentPane = 26;
  wdInHeaderFooter = 28;
  wdAtEndOfRowMarker = 31;
  wdReferenceOfType = 32;
  wdHeaderFooterType = 33;
  wdInMasterDocument = 34;
  wdInFootnote = 35;
  wdInEndnote = 36;
  wdInWordMail = 37;
  wdInClipboard = 38;

{ WdWrapType }

  wdWrapSquare = 0;
  wdWrapTight = 1;
  wdWrapThrough = 2;
  wdWrapNone = 3;
  wdWrapTopBottom = 4;

{ WdWrapSideType }

  wdWrapBoth = 0;
  wdWrapLeft = 1;
  wdWrapRight = 2;
  wdWrapLargest = 3;

{ WdOutlineLevel }

  wdOutlineLevel1 = 1;
  wdOutlineLevel2 = 2;
  wdOutlineLevel3 = 3;
  wdOutlineLevel4 = 4;
  wdOutlineLevel5 = 5;
  wdOutlineLevel6 = 6;
  wdOutlineLevel7 = 7;
  wdOutlineLevel8 = 8;
  wdOutlineLevel9 = 9;
  wdOutlineLevelBodyText = 10;

{ WdTextOrientation }

  wdTextOrientationHorizontal = 0;
  wdTextOrientationUpward = 2;
  wdTextOrientationDownward = 3;

{ WdTextOrientationHID }

  wdTextOrientationVerticalFarEast = 1;
  wdTextOrientationHorizontalRotatedFarEast = 4;

{ WdPageBorderArt }

  wdArtApples = 1;
  wdArtMapleMuffins = 2;
  wdArtCakeSlice = 3;
  wdArtCandyCorn = 4;
  wdArtIceCreamCones = 5;
  wdArtChampagneBottle = 6;
  wdArtPartyGlass = 7;
  wdArtChristmasTree = 8;
  wdArtTrees = 9;
  wdArtPalmsColor = 10;
  wdArtBalloons3Colors = 11;
  wdArtBalloonsHotAir = 12;
  wdArtPartyFavor = 13;
  wdArtConfettiStreamers = 14;
  wdArtHearts = 15;
  wdArtHeartBalloon = 16;
  wdArtStars3D = 17;
  wdArtStarsShadowed = 18;
  wdArtStars = 19;
  wdArtSun = 20;
  wdArtEarth2 = 21;
  wdArtEarth1 = 22;
  wdArtPeopleHats = 23;
  wdArtSombrero = 24;
  wdArtPencils = 25;
  wdArtPackages = 26;
  wdArtClocks = 27;
  wdArtFirecrackers = 28;
  wdArtRings = 29;
  wdArtMapPins = 30;
  wdArtConfetti = 31;
  wdArtCreaturesButterfly = 32;
  wdArtCreaturesLadyBug = 33;
  wdArtCreaturesFish = 34;
  wdArtBirdsFlight = 35;
  wdArtScaredCat = 36;
  wdArtBats = 37;
  wdArtFlowersRoses = 38;
  wdArtFlowersRedRose = 39;
  wdArtPoinsettias = 40;
  wdArtHolly = 41;
  wdArtFlowersTiny = 42;
  wdArtFlowersPansy = 43;
  wdArtFlowersModern2 = 44;
  wdArtFlowersModern1 = 45;
  wdArtWhiteFlowers = 46;
  wdArtVine = 47;
  wdArtFlowersDaisies = 48;
  wdArtFlowersBlockPrint = 49;
  wdArtDecoArchColor = 50;
  wdArtFans = 51;
  wdArtFilm = 52;
  wdArtLightning1 = 53;
  wdArtCompass = 54;
  wdArtDoubleD = 55;
  wdArtClassicalWave = 56;
  wdArtShadowedSquares = 57;
  wdArtTwistedLines1 = 58;
  wdArtWaveline = 59;
  wdArtQuadrants = 60;
  wdArtCheckedBarColor = 61;
  wdArtSwirligig = 62;
  wdArtPushPinNote1 = 63;
  wdArtPushPinNote2 = 64;
  wdArtPumpkin1 = 65;
  wdArtEggsBlack = 66;
  wdArtCup = 67;
  wdArtHeartGray = 68;
  wdArtGingerbreadMan = 69;
  wdArtBabyPacifier = 70;
  wdArtBabyRattle = 71;
  wdArtCabins = 72;
  wdArtHouseFunky = 73;
  wdArtStarsBlack = 74;
  wdArtSnowflakes = 75;
  wdArtSnowflakeFancy = 76;
  wdArtSkyrocket = 77;
  wdArtSeattle = 78;
  wdArtMusicNotes = 79;
  wdArtPalmsBlack = 80;
  wdArtMapleLeaf = 81;
  wdArtPaperClips = 82;
  wdArtShorebirdTracks = 83;
  wdArtPeople = 84;
  wdArtPeopleWaving = 85;
  wdArtEclipsingSquares2 = 86;
  wdArtHypnotic = 87;
  wdArtDiamondsGray = 88;
  wdArtDecoArch = 89;
  wdArtDecoBlocks = 90;
  wdArtCirclesLines = 91;
  wdArtPapyrus = 92;
  wdArtWoodwork = 93;
  wdArtWeavingBraid = 94;
  wdArtWeavingRibbon = 95;
  wdArtWeavingAngles = 96;
  wdArtArchedScallops = 97;
  wdArtSafari = 98;
  wdArtCelticKnotwork = 99;
  wdArtCrazyMaze = 100;
  wdArtEclipsingSquares1 = 101;
  wdArtBirds = 102;
  wdArtFlowersTeacup = 103;
  wdArtNorthwest = 104;
  wdArtSouthwest = 105;
  wdArtTribal6 = 106;
  wdArtTribal4 = 107;
  wdArtTribal3 = 108;
  wdArtTribal2 = 109;
  wdArtTribal5 = 110;
  wdArtXIllusions = 111;
  wdArtZanyTriangles = 112;
  wdArtPyramids = 113;
  wdArtPyramidsAbove = 114;
  wdArtConfettiGrays = 115;
  wdArtConfettiOutline = 116;
  wdArtConfettiWhite = 117;
  wdArtMosaic = 118;
  wdArtLightning2 = 119;
  wdArtHeebieJeebies = 120;
  wdArtLightBulb = 121;
  wdArtGradient = 122;
  wdArtTriangleParty = 123;
  wdArtTwistedLines2 = 124;
  wdArtMoons = 125;
  wdArtOvals = 126;
  wdArtDoubleDiamonds = 127;
  wdArtChainLink = 128;
  wdArtTriangles = 129;
  wdArtTribal1 = 130;
  wdArtMarqueeToothed = 131;
  wdArtSharksTeeth = 132;
  wdArtSawtooth = 133;
  wdArtSawtoothGray = 134;
  wdArtPostageStamp = 135;
  wdArtWeavingStrips = 136;
  wdArtZigZag = 137;
  wdArtCrossStitch = 138;
  wdArtGems = 139;
  wdArtCirclesRectangles = 140;
  wdArtCornerTriangles = 141;
  wdArtCreaturesInsects = 142;
  wdArtZigZagStitch = 143;
  wdArtCheckered = 144;
  wdArtCheckedBarBlack = 145;
  wdArtMarquee = 146;
  wdArtBasicWhiteDots = 147;
  wdArtBasicWideMidline = 148;
  wdArtBasicWideOutline = 149;
  wdArtBasicWideInline = 150;
  wdArtBasicThinLines = 151;
  wdArtBasicWhiteDashes = 152;
  wdArtBasicWhiteSquares = 153;
  wdArtBasicBlackSquares = 154;
  wdArtBasicBlackDashes = 155;
  wdArtBasicBlackDots = 156;
  wdArtStarsTop = 157;
  wdArtCertificateBanner = 158;
  wdArtHandmade1 = 159;
  wdArtHandmade2 = 160;
  wdArtTornPaper = 161;
  wdArtTornPaperBlack = 162;
  wdArtCouponCutoutDashes = 163;
  wdArtCouponCutoutDots = 164;

{ WdBorderDistanceFrom }

  wdBorderDistanceFromText = 0;
  wdBorderDistanceFromPageEdge = 1;

{ WdReplace }

  wdReplaceNone = 0;
  wdReplaceOne = 1;
  wdReplaceAll = 2;

{ WdFontBias }

  wdFontBiasDontCare = 255;
  wdFontBiasDefault = 0;
  wdFontBiasFareast = 1;

const

{ Component class GUIDs }
  Class_Global: TGUID = '{000209F0-0000-0000-C000-000000000046}';
  Class_Application: TGUID = '{000209FF-0000-0000-C000-000000000046}';
  Class_Document: TGUID = '{00020906-0000-0000-C000-000000000046}';
  Class_Font: TGUID = '{000209F5-0000-0000-C000-000000000046}';
  Class_ParagraphFormat: TGUID = '{000209F4-0000-0000-C000-000000000046}';
  Class_OLEControl: TGUID = '{000209F2-0000-0000-C000-000000000046}';
  Class_LetterContent: TGUID = '{000209F1-0000-0000-C000-000000000046}';

type

{ Forward declarations: Interfaces }
  _Application = interface;
  _ApplicationDisp = dispinterface;
  _Global = interface;
  _GlobalDisp = dispinterface;
  FontNames = interface;
  FontNamesDisp = dispinterface;
  Languages = interface;
  LanguagesDisp = dispinterface;
  Language = interface;
  LanguageDisp = dispinterface;
  Documents = interface;
  DocumentsDisp = dispinterface;
  _Document = interface;
  _DocumentDisp = dispinterface;
  Template = interface;
  TemplateDisp = dispinterface;
  Templates = interface;
  TemplatesDisp = dispinterface;
  RoutingSlip = interface;
  RoutingSlipDisp = dispinterface;
  Bookmark = interface;
  BookmarkDisp = dispinterface;
  Bookmarks = interface;
  BookmarksDisp = dispinterface;
  Variable = interface;
  VariableDisp = dispinterface;
  Variables = interface;
  VariablesDisp = dispinterface;
  RecentFile = interface;
  RecentFileDisp = dispinterface;
  RecentFiles = interface;
  RecentFilesDisp = dispinterface;
  Window = interface;
  WindowDisp = dispinterface;
  Windows = interface;
  WindowsDisp = dispinterface;
  Pane = interface;
  PaneDisp = dispinterface;
  Panes = interface;
  PanesDisp = dispinterface;
  Range = interface;
  RangeDisp = dispinterface;
  ListFormat = interface;
  ListFormatDisp = dispinterface;
  Find = interface;
  FindDisp = dispinterface;
  Replacement = interface;
  ReplacementDisp = dispinterface;
  Characters = interface;
  CharactersDisp = dispinterface;
  Words = interface;
  WordsDisp = dispinterface;
  Sentences = interface;
  SentencesDisp = dispinterface;
  Sections = interface;
  SectionsDisp = dispinterface;
  Section = interface;
  SectionDisp = dispinterface;
  Paragraphs = interface;
  ParagraphsDisp = dispinterface;
  Paragraph = interface;
  ParagraphDisp = dispinterface;
  DropCap = interface;
  DropCapDisp = dispinterface;
  TabStops = interface;
  TabStopsDisp = dispinterface;
  TabStop = interface;
  TabStopDisp = dispinterface;
  _ParagraphFormat = interface;
  _ParagraphFormatDisp = dispinterface;
  _Font = interface;
  _FontDisp = dispinterface;
  Table = interface;
  TableDisp = dispinterface;
  Row = interface;
  RowDisp = dispinterface;
  Column = interface;
  ColumnDisp = dispinterface;
  Cell = interface;
  CellDisp = dispinterface;
  Tables = interface;
  TablesDisp = dispinterface;
  Rows = interface;
  RowsDisp = dispinterface;
  Columns = interface;
  ColumnsDisp = dispinterface;
  Cells = interface;
  CellsDisp = dispinterface;
  AutoCorrect = interface;
  AutoCorrectDisp = dispinterface;
  AutoCorrectEntries = interface;
  AutoCorrectEntriesDisp = dispinterface;
  AutoCorrectEntry = interface;
  AutoCorrectEntryDisp = dispinterface;
  FirstLetterExceptions = interface;
  FirstLetterExceptionsDisp = dispinterface;
  FirstLetterException = interface;
  FirstLetterExceptionDisp = dispinterface;
  TwoInitialCapsExceptions = interface;
  TwoInitialCapsExceptionsDisp = dispinterface;
  TwoInitialCapsException = interface;
  TwoInitialCapsExceptionDisp = dispinterface;
  Footnotes = interface;
  FootnotesDisp = dispinterface;
  Endnotes = interface;
  EndnotesDisp = dispinterface;
  Comments = interface;
  CommentsDisp = dispinterface;
  Footnote = interface;
  FootnoteDisp = dispinterface;
  Endnote = interface;
  EndnoteDisp = dispinterface;
  Comment = interface;
  CommentDisp = dispinterface;
  Borders = interface;
  BordersDisp = dispinterface;
  Border = interface;
  BorderDisp = dispinterface;
  Shading = interface;
  ShadingDisp = dispinterface;
  TextRetrievalMode = interface;
  TextRetrievalModeDisp = dispinterface;
  AutoTextEntries = interface;
  AutoTextEntriesDisp = dispinterface;
  AutoTextEntry = interface;
  AutoTextEntryDisp = dispinterface;
  System = interface;
  SystemDisp = dispinterface;
  OLEFormat = interface;
  OLEFormatDisp = dispinterface;
  LinkFormat = interface;
  LinkFormatDisp = dispinterface;
  _OLEControl = interface;
  _OLEControlDisp = dispinterface;
  Fields = interface;
  FieldsDisp = dispinterface;
  Field = interface;
  FieldDisp = dispinterface;
  Browser = interface;
  BrowserDisp = dispinterface;
  Styles = interface;
  StylesDisp = dispinterface;
  Style = interface;
  StyleDisp = dispinterface;
  Frames = interface;
  FramesDisp = dispinterface;
  Frame = interface;
  FrameDisp = dispinterface;
  FormFields = interface;
  FormFieldsDisp = dispinterface;
  FormField = interface;
  FormFieldDisp = dispinterface;
  TextInput = interface;
  TextInputDisp = dispinterface;
  CheckBox = interface;
  CheckBoxDisp = dispinterface;
  DropDown = interface;
  DropDownDisp = dispinterface;
  ListEntries = interface;
  ListEntriesDisp = dispinterface;
  ListEntry = interface;
  ListEntryDisp = dispinterface;
  TablesOfFigures = interface;
  TablesOfFiguresDisp = dispinterface;
  TableOfFigures = interface;
  TableOfFiguresDisp = dispinterface;
  MailMerge = interface;
  MailMergeDisp = dispinterface;
  MailMergeFields = interface;
  MailMergeFieldsDisp = dispinterface;
  MailMergeField = interface;
  MailMergeFieldDisp = dispinterface;
  MailMergeDataSource = interface;
  MailMergeDataSourceDisp = dispinterface;
  MailMergeFieldNames = interface;
  MailMergeFieldNamesDisp = dispinterface;
  MailMergeFieldName = interface;
  MailMergeFieldNameDisp = dispinterface;
  MailMergeDataFields = interface;
  MailMergeDataFieldsDisp = dispinterface;
  MailMergeDataField = interface;
  MailMergeDataFieldDisp = dispinterface;
  Envelope = interface;
  EnvelopeDisp = dispinterface;
  MailingLabel = interface;
  MailingLabelDisp = dispinterface;
  CustomLabels = interface;
  CustomLabelsDisp = dispinterface;
  CustomLabel = interface;
  CustomLabelDisp = dispinterface;
  TablesOfContents = interface;
  TablesOfContentsDisp = dispinterface;
  TableOfContents = interface;
  TableOfContentsDisp = dispinterface;
  TablesOfAuthorities = interface;
  TablesOfAuthoritiesDisp = dispinterface;
  TableOfAuthorities = interface;
  TableOfAuthoritiesDisp = dispinterface;
  Dialogs = interface;
  DialogsDisp = dispinterface;
  Dialog = interface;
  DialogDisp = dispinterface;
  PageSetup = interface;
  PageSetupDisp = dispinterface;
  LineNumbering = interface;
  LineNumberingDisp = dispinterface;
  TextColumns = interface;
  TextColumnsDisp = dispinterface;
  TextColumn = interface;
  TextColumnDisp = dispinterface;
  Selection = interface;
  SelectionDisp = dispinterface;
  TablesOfAuthoritiesCategories = interface;
  TablesOfAuthoritiesCategoriesDisp = dispinterface;
  TableOfAuthoritiesCategory = interface;
  TableOfAuthoritiesCategoryDisp = dispinterface;
  CaptionLabels = interface;
  CaptionLabelsDisp = dispinterface;
  CaptionLabel = interface;
  CaptionLabelDisp = dispinterface;
  AutoCaptions = interface;
  AutoCaptionsDisp = dispinterface;
  AutoCaption = interface;
  AutoCaptionDisp = dispinterface;
  Indexes = interface;
  IndexesDisp = dispinterface;
  Index = interface;
  IndexDisp = dispinterface;
  AddIn = interface;
  AddInDisp = dispinterface;
  AddIns = interface;
  AddInsDisp = dispinterface;
  Revisions = interface;
  RevisionsDisp = dispinterface;
  Revision = interface;
  RevisionDisp = dispinterface;
  Task = interface;
  TaskDisp = dispinterface;
  Tasks = interface;
  TasksDisp = dispinterface;
  HeadersFooters = interface;
  HeadersFootersDisp = dispinterface;
  HeaderFooter = interface;
  HeaderFooterDisp = dispinterface;
  PageNumbers = interface;
  PageNumbersDisp = dispinterface;
  PageNumber = interface;
  PageNumberDisp = dispinterface;
  Subdocuments = interface;
  SubdocumentsDisp = dispinterface;
  Subdocument = interface;
  SubdocumentDisp = dispinterface;
  HeadingStyles = interface;
  HeadingStylesDisp = dispinterface;
  HeadingStyle = interface;
  HeadingStyleDisp = dispinterface;
  StoryRanges = interface;
  StoryRangesDisp = dispinterface;
  ListLevel = interface;
  ListLevelDisp = dispinterface;
  ListLevels = interface;
  ListLevelsDisp = dispinterface;
  ListTemplate = interface;
  ListTemplateDisp = dispinterface;
  ListTemplates = interface;
  ListTemplatesDisp = dispinterface;
  ListParagraphs = interface;
  ListParagraphsDisp = dispinterface;
  List = interface;
  ListDisp = dispinterface;
  Lists = interface;
  ListsDisp = dispinterface;
  ListGallery = interface;
  ListGalleryDisp = dispinterface;
  ListGalleries = interface;
  ListGalleriesDisp = dispinterface;
  KeyBindings = interface;
  KeyBindingsDisp = dispinterface;
  KeysBoundTo = interface;
  KeysBoundToDisp = dispinterface;
  KeyBinding = interface;
  KeyBindingDisp = dispinterface;
  FileConverter = interface;
  FileConverterDisp = dispinterface;
  FileConverters = interface;
  FileConvertersDisp = dispinterface;
  SynonymInfo = interface;
  SynonymInfoDisp = dispinterface;
  Hyperlinks = interface;
  HyperlinksDisp = dispinterface;
  Hyperlink = interface;
  HyperlinkDisp = dispinterface;
  Shapes = interface;
  ShapesDisp = dispinterface;
  ShapeRange = interface;
  ShapeRangeDisp = dispinterface;
  GroupShapes = interface;
  GroupShapesDisp = dispinterface;
  Shape = interface;
  ShapeDisp = dispinterface;
  TextFrame = interface;
  TextFrameDisp = dispinterface;
  _LetterContent = interface;
  _LetterContentDisp = dispinterface;
  View = interface;
  ViewDisp = dispinterface;
  Zoom = interface;
  ZoomDisp = dispinterface;
  Zooms = interface;
  ZoomsDisp = dispinterface;
  InlineShape = interface;
  InlineShapeDisp = dispinterface;
  InlineShapes = interface;
  InlineShapesDisp = dispinterface;
  SpellingSuggestions = interface;
  SpellingSuggestionsDisp = dispinterface;
  SpellingSuggestion = interface;
  SpellingSuggestionDisp = dispinterface;
  Dictionaries = interface;
  DictionariesDisp = dispinterface;
  HangulHanjaConversionDictionaries = interface;
  HangulHanjaConversionDictionariesDisp = dispinterface;
  Dictionary = interface;
  DictionaryDisp = dispinterface;
  ReadabilityStatistics = interface;
  ReadabilityStatisticsDisp = dispinterface;
  ReadabilityStatistic = interface;
  ReadabilityStatisticDisp = dispinterface;
  Versions = interface;
  VersionsDisp = dispinterface;
  Version = interface;
  VersionDisp = dispinterface;
  Options = interface;
  OptionsDisp = dispinterface;
  MailMessage = interface;
  MailMessageDisp = dispinterface;
  ProofreadingErrors = interface;
  ProofreadingErrorsDisp = dispinterface;
  Mailer = interface;
  MailerDisp = dispinterface;
  WrapFormat = interface;
  WrapFormatDisp = dispinterface;
  HangulAndAlphabetExceptions = interface;
  HangulAndAlphabetExceptionsDisp = dispinterface;
  HangulAndAlphabetException = interface;
  HangulAndAlphabetExceptionDisp = dispinterface;
  Adjustments = interface;
  AdjustmentsDisp = dispinterface;
  CalloutFormat = interface;
  CalloutFormatDisp = dispinterface;
  ColorFormat = interface;
  ColorFormatDisp = dispinterface;
  ConnectorFormat = interface;
  ConnectorFormatDisp = dispinterface;
  FillFormat = interface;
  FillFormatDisp = dispinterface;
  FreeformBuilder = interface;
  FreeformBuilderDisp = dispinterface;
  LineFormat = interface;
  LineFormatDisp = dispinterface;
  PictureFormat = interface;
  PictureFormatDisp = dispinterface;
  ShadowFormat = interface;
  ShadowFormatDisp = dispinterface;
  ShapeNode = interface;
  ShapeNodeDisp = dispinterface;
  ShapeNodes = interface;
  ShapeNodesDisp = dispinterface;
  TextEffectFormat = interface;
  TextEffectFormatDisp = dispinterface;
  ThreeDFormat = interface;
  ThreeDFormatDisp = dispinterface;
  ApplicationEvents = dispinterface;
  DocumentEvents = dispinterface;
  OCXEvents = dispinterface;

{ Forward declarations: CoClasses }
  Global = _Global;
  Application = _Application;
  Document = _Document;
  Font = _Font;
  ParagraphFormat = _ParagraphFormat;
  OLEControl = _OLEControl;
  LetterContent = _LetterContent;

{ Forward declarations: Enums }
  WdMailSystem = TOleEnum;
  WdTemplateType = TOleEnum;
  WdContinue = TOleEnum;
  WdIMEMode = TOleEnum;
  WdBaselineAlignment = TOleEnum;
  WdIndexFilter = TOleEnum;
  WdIndexSortBy = TOleEnum;
  WdJustificationMode = TOleEnum;
  WdFarEastLineBreakLevel = TOleEnum;
  WdMultipleWordConversionsMode = TOleEnum;
  WdColorIndex = TOleEnum;
  WdTextureIndex = TOleEnum;
  WdUnderline = TOleEnum;
  WdEmphasisMark = TOleEnum;
  WdInternationalIndex = TOleEnum;
  WdAutoMacros = TOleEnum;
  WdCaptionPosition = TOleEnum;
  WdCountry = TOleEnum;
  WdHeadingSeparator = TOleEnum;
  WdSeparatorType = TOleEnum;
  WdPageNumberAlignment = TOleEnum;
  WdBorderType = TOleEnum;
  WdBorderTypeHID = TOleEnum;
  WdFramePosition = TOleEnum;
  WdAnimation = TOleEnum;
  WdCharacterCase = TOleEnum;
  WdCharacterCaseHID = TOleEnum;
  WdSummaryMode = TOleEnum;
  WdSummaryLength = TOleEnum;
  WdStyleType = TOleEnum;
  WdUnits = TOleEnum;
  WdGoToItem = TOleEnum;
  WdGoToDirection = TOleEnum;
  WdCollapseDirection = TOleEnum;
  WdRowHeightRule = TOleEnum;
  WdFrameSizeRule = TOleEnum;
  WdInsertCells = TOleEnum;
  WdDeleteCells = TOleEnum;
  WdListApplyTo = TOleEnum;
  WdAlertLevel = TOleEnum;
  WdCursorType = TOleEnum;
  WdEnableCancelKey = TOleEnum;
  WdRulerStyle = TOleEnum;
  WdParagraphAlignment = TOleEnum;
  WdParagraphAlignmentHID = TOleEnum;
  WdListLevelAlignment = TOleEnum;
  WdRowAlignment = TOleEnum;
  WdTabAlignment = TOleEnum;
  WdVerticalAlignment = TOleEnum;
  WdCellVerticalAlignment = TOleEnum;
  WdTrailingCharacter = TOleEnum;
  WdListGalleryType = TOleEnum;
  WdListNumberStyle = TOleEnum;
  WdListNumberStyleHID = TOleEnum;
  WdNoteNumberStyle = TOleEnum;
  WdNoteNumberStyleHID = TOleEnum;
  WdCaptionNumberStyle = TOleEnum;
  WdCaptionNumberStyleHID = TOleEnum;
  WdPageNumberStyle = TOleEnum;
  WdPageNumberStyleHID = TOleEnum;
  WdStatistic = TOleEnum;
  WdStatisticHID = TOleEnum;
  WdBuiltInProperty = TOleEnum;
  WdLineSpacing = TOleEnum;
  WdNumberType = TOleEnum;
  WdListType = TOleEnum;
  WdStoryType = TOleEnum;
  WdSaveFormat = TOleEnum;
  WdOpenFormat = TOleEnum;
  WdHeaderFooterIndex = TOleEnum;
  WdTocFormat = TOleEnum;
  WdTofFormat = TOleEnum;
  WdToaFormat = TOleEnum;
  WdLineStyle = TOleEnum;
  WdLineWidth = TOleEnum;
  WdBreakType = TOleEnum;
  WdTabLeader = TOleEnum;
  WdTabLeaderHID = TOleEnum;
  WdMeasurementUnits = TOleEnum;
  WdMeasurementUnitsHID = TOleEnum;
  WdDropPosition = TOleEnum;
  WdNumberingRule = TOleEnum;
  WdFootnoteLocation = TOleEnum;
  WdEndnoteLocation = TOleEnum;
  WdSortSeparator = TOleEnum;
  WdTableFieldSeparator = TOleEnum;
  WdSortFieldType = TOleEnum;
  WdSortFieldTypeHID = TOleEnum;
  WdSortOrder = TOleEnum;
  WdTableFormat = TOleEnum;
  WdTableFormatApply = TOleEnum;
  WdLanguageID = TOleEnum;
  WdFieldType = TOleEnum;
  WdBuiltinStyle = TOleEnum;
  WdWordDialogTab = TOleEnum;
  WdWordDialogTabHID = TOleEnum;
  WdWordDialog = TOleEnum;
  WdWordDialogHID = TOleEnum;
  WdFieldKind = TOleEnum;
  WdTextFormFieldType = TOleEnum;
  WdChevronConvertRule = TOleEnum;
  WdMailMergeMainDocType = TOleEnum;
  WdMailMergeState = TOleEnum;
  WdMailMergeDestination = TOleEnum;
  WdMailMergeActiveRecord = TOleEnum;
  WdMailMergeDefaultRecord = TOleEnum;
  WdMailMergeDataSource = TOleEnum;
  WdMailMergeComparison = TOleEnum;
  WdBookmarkSortBy = TOleEnum;
  WdWindowState = TOleEnum;
  WdPictureLinkType = TOleEnum;
  WdLinkType = TOleEnum;
  WdWindowType = TOleEnum;
  WdViewType = TOleEnum;
  WdSeekView = TOleEnum;
  WdSpecialPane = TOleEnum;
  WdPageFit = TOleEnum;
  WdBrowseTarget = TOleEnum;
  WdPaperTray = TOleEnum;
  WdOrientation = TOleEnum;
  WdSelectionType = TOleEnum;
  WdCaptionLabelID = TOleEnum;
  WdReferenceType = TOleEnum;
  WdReferenceKind = TOleEnum;
  WdIndexFormat = TOleEnum;
  WdIndexType = TOleEnum;
  WdRevisionsWrap = TOleEnum;
  WdRevisionType = TOleEnum;
  WdRoutingSlipDelivery = TOleEnum;
  WdRoutingSlipStatus = TOleEnum;
  WdSectionStart = TOleEnum;
  WdSaveOptions = TOleEnum;
  WdDocumentKind = TOleEnum;
  WdDocumentType = TOleEnum;
  WdOriginalFormat = TOleEnum;
  WdRelocate = TOleEnum;
  WdInsertedTextMark = TOleEnum;
  WdRevisedLinesMark = TOleEnum;
  WdDeletedTextMark = TOleEnum;
  WdRevisedPropertiesMark = TOleEnum;
  WdFieldShading = TOleEnum;
  WdDefaultFilePath = TOleEnum;
  WdCompatibility = TOleEnum;
  WdPaperSize = TOleEnum;
  WdCustomLabelPageSize = TOleEnum;
  WdProtectionType = TOleEnum;
  WdPartOfSpeech = TOleEnum;
  WdSubscriberFormats = TOleEnum;
  WdEditionType = TOleEnum;
  WdEditionOption = TOleEnum;
  WdRelativeHorizontalPosition = TOleEnum;
  WdRelativeVerticalPosition = TOleEnum;
  WdHelpType = TOleEnum;
  WdHelpTypeHID = TOleEnum;
  WdKeyCategory = TOleEnum;
  WdKey = TOleEnum;
  WdOLEType = TOleEnum;
  WdOLEVerb = TOleEnum;
  WdOLEPlacement = TOleEnum;
  WdEnvelopeOrientation = TOleEnum;
  WdLetterStyle = TOleEnum;
  WdLetterheadLocation = TOleEnum;
  WdSalutationType = TOleEnum;
  WdSalutationGender = TOleEnum;
  WdMovementType = TOleEnum;
  WdConstants = TOleEnum;
  WdPasteDataType = TOleEnum;
  WdPrintOutItem = TOleEnum;
  WdPrintOutPages = TOleEnum;
  WdPrintOutRange = TOleEnum;
  WdDictionaryType = TOleEnum;
  WdDictionaryTypeHID = TOleEnum;
  WdSpellingWordType = TOleEnum;
  WdSpellingErrorType = TOleEnum;
  WdProofreadingErrorType = TOleEnum;
  WdInlineShapeType = TOleEnum;
  WdArrangeStyle = TOleEnum;
  WdSelectionFlags = TOleEnum;
  WdAutoVersions = TOleEnum;
  WdOrganizerObject = TOleEnum;
  WdFindMatch = TOleEnum;
  WdFindWrap = TOleEnum;
  WdInformation = TOleEnum;
  WdWrapType = TOleEnum;
  WdWrapSideType = TOleEnum;
  WdOutlineLevel = TOleEnum;
  WdTextOrientation = TOleEnum;
  WdTextOrientationHID = TOleEnum;
  WdPageBorderArt = TOleEnum;
  WdBorderDistanceFrom = TOleEnum;
  WdReplace = TOleEnum;
  WdFontBias = TOleEnum;

  _Application = interface(IDispatch)
    ['{00020970-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Name: WideString; safecall;
    function Get_Documents: Documents; safecall;
    function Get_Windows: Windows; safecall;
    function Get_ActiveDocument: Document; safecall;
    function Get_ActiveWindow: Window; safecall;
    function Get_Selection: Selection; safecall;
    function Get_WordBasic: IDispatch; safecall;
    function Get_RecentFiles: RecentFiles; safecall;
    function Get_NormalTemplate: Template; safecall;
    function Get_System: System; safecall;
    function Get_AutoCorrect: AutoCorrect; safecall;
    function Get_FontNames: FontNames; safecall;
    function Get_LandscapeFontNames: FontNames; safecall;
    function Get_PortraitFontNames: FontNames; safecall;
    function Get_Languages: Languages; safecall;
    function Get_Assistant: Assistant; safecall;
    function Get_Browser: Browser; safecall;
    function Get_FileConverters: FileConverters; safecall;
    function Get_MailingLabel: MailingLabel; safecall;
    function Get_Dialogs: Dialogs; safecall;
    function Get_CaptionLabels: CaptionLabels; safecall;
    function Get_AutoCaptions: AutoCaptions; safecall;
    function Get_AddIns: AddIns; safecall;
    function Get_Visible: WordBool; safecall;
    procedure Set_Visible(Value: WordBool); safecall;
    function Get_Version: WideString; safecall;
    function Get_ScreenUpdating: WordBool; safecall;
    procedure Set_ScreenUpdating(Value: WordBool); safecall;
    function Get_PrintPreview: WordBool; safecall;
    procedure Set_PrintPreview(Value: WordBool); safecall;
    function Get_Tasks: Tasks; safecall;
    function Get_DisplayStatusBar: WordBool; safecall;
    procedure Set_DisplayStatusBar(Value: WordBool); safecall;
    function Get_SpecialMode: WordBool; safecall;
    function Get_UsableWidth: Integer; safecall;
    function Get_UsableHeight: Integer; safecall;
    function Get_MathCoprocessorAvailable: WordBool; safecall;
    function Get_MouseAvailable: WordBool; safecall;
    function Get_International(Index: WdInternationalIndex): OleVariant; safecall;
    function Get_Build: WideString; safecall;
    function Get_CapsLock: WordBool; safecall;
    function Get_NumLock: WordBool; safecall;
    function Get_UserName: WideString; safecall;
    procedure Set_UserName(const Value: WideString); safecall;
    function Get_UserInitials: WideString; safecall;
    procedure Set_UserInitials(const Value: WideString); safecall;
    function Get_UserAddress: WideString; safecall;
    procedure Set_UserAddress(const Value: WideString); safecall;
    function Get_MacroContainer: IDispatch; safecall;
    function Get_DisplayRecentFiles: WordBool; safecall;
    procedure Set_DisplayRecentFiles(Value: WordBool); safecall;
    function Get_CommandBars: CommandBars; safecall;
    function Get_SynonymInfo(const Word: WideString; var LanguageID: OleVariant): SynonymInfo; safecall;
    function Get_VBE: VBE; safecall;
    function Get_DefaultSaveFormat: WideString; safecall;
    procedure Set_DefaultSaveFormat(const Value: WideString); safecall;
    function Get_ListGalleries: ListGalleries; safecall;
    function Get_ActivePrinter: WideString; safecall;
    procedure Set_ActivePrinter(const Value: WideString); safecall;
    function Get_Templates: Templates; safecall;
    function Get_CustomizationContext: IDispatch; safecall;
    procedure Set_CustomizationContext(Value: IDispatch); safecall;
    function Get_KeyBindings: KeyBindings; safecall;
    function Get_KeysBoundTo(KeyCategory: WdKeyCategory; const Command: WideString; var CommandParameter: OleVariant): KeysBoundTo; safecall;
    function Get_FindKey(KeyCode: Integer; var KeyCode2: OleVariant): KeyBinding; safecall;
    function Get_Caption: WideString; safecall;
    procedure Set_Caption(const Value: WideString); safecall;
    function Get_Path: WideString; safecall;
    function Get_DisplayScrollBars: WordBool; safecall;
    procedure Set_DisplayScrollBars(Value: WordBool); safecall;
    function Get_StartupPath: WideString; safecall;
    procedure Set_StartupPath(const Value: WideString); safecall;
    function Get_BackgroundSavingStatus: Integer; safecall;
    function Get_BackgroundPrintingStatus: Integer; safecall;
    function Get_Left: Integer; safecall;
    procedure Set_Left(Value: Integer); safecall;
    function Get_Top: Integer; safecall;
    procedure Set_Top(Value: Integer); safecall;
    function Get_Width: Integer; safecall;
    procedure Set_Width(Value: Integer); safecall;
    function Get_Height: Integer; safecall;
    procedure Set_Height(Value: Integer); safecall;
    function Get_WindowState: WdWindowState; safecall;
    procedure Set_WindowState(Value: WdWindowState); safecall;
    function Get_DisplayAutoCompleteTips: WordBool; safecall;
    procedure Set_DisplayAutoCompleteTips(Value: WordBool); safecall;
    function Get_Options: Options; safecall;
    function Get_DisplayAlerts: WdAlertLevel; safecall;
    procedure Set_DisplayAlerts(Value: WdAlertLevel); safecall;
    function Get_CustomDictionaries: Dictionaries; safecall;
    function Get_PathSeparator: WideString; safecall;
    procedure Set_StatusBar(const Value: WideString); safecall;
    function Get_MAPIAvailable: WordBool; safecall;
    function Get_DisplayScreenTips: WordBool; safecall;
    procedure Set_DisplayScreenTips(Value: WordBool); safecall;
    function Get_EnableCancelKey: WdEnableCancelKey; safecall;
    procedure Set_EnableCancelKey(Value: WdEnableCancelKey); safecall;
    function Get_UserControl: WordBool; safecall;
    function Get_FileSearch: FileSearch; safecall;
    function Get_MailSystem: WdMailSystem; safecall;
    function Get_DefaultTableSeparator: WideString; safecall;
    procedure Set_DefaultTableSeparator(const Value: WideString); safecall;
    function Get_ShowVisualBasicEditor: WordBool; safecall;
    procedure Set_ShowVisualBasicEditor(Value: WordBool); safecall;
    function Get_BrowseExtraFileTypes: WideString; safecall;
    procedure Set_BrowseExtraFileTypes(const Value: WideString); safecall;
    function Get_IsObjectValid(Object_: IDispatch): WordBool; safecall;
    function Get_HangulHanjaDictionaries: HangulHanjaConversionDictionaries; safecall;
    function Get_MailMessage: MailMessage; safecall;
    function Get_FocusInMailHeader: WordBool; safecall;
    procedure Quit(var SaveChanges, OriginalFormat, RouteDocument: OleVariant); safecall;
    procedure ScreenRefresh; safecall;
    procedure PrintOut(var Background, Append, Range, OutputFileName, From, To_, Item, Copies, Pages, PageType, PrintToFile, Collate, FileName, ActivePrinterMacGX, ManualDuplexPrint: OleVariant); safecall;
    procedure LookupNameProperties(const Name: WideString); safecall;
    procedure SubstituteFont(const UnavailableFont, SubstituteFont: WideString); safecall;
    function Repeat_(var Times: OleVariant): WordBool; safecall;
    procedure DDEExecute(Channel: Integer; const Command: WideString); safecall;
    function DDEInitiate(const App, Topic: WideString): Integer; safecall;
    procedure DDEPoke(Channel: Integer; const Item, Data: WideString); safecall;
    function DDERequest(Channel: Integer; const Item: WideString): WideString; safecall;
    procedure DDETerminate(Channel: Integer); safecall;
    procedure DDETerminateAll; safecall;
    function BuildKeyCode(Arg1: WdKey; var Arg2, Arg3, Arg4: OleVariant): Integer; safecall;
    function KeyString(KeyCode: Integer; var KeyCode2: OleVariant): WideString; safecall;
    procedure OrganizerCopy(const Source, Destination, Name: WideString; Object_: WdOrganizerObject); safecall;
    procedure OrganizerDelete(const Source, Name: WideString; Object_: WdOrganizerObject); safecall;
    procedure OrganizerRename(const Source, Name, NewName: WideString; Object_: WdOrganizerObject); safecall;
    procedure AddAddress(var TagID, Value: PSafeArray); safecall;
    function GetAddress(var Name, AddressProperties, UseAutoText, DisplaySelectDialog, SelectDialog, CheckNamesDialog, RecentAddressesChoice, UpdateRecentAddresses: OleVariant): WideString; safecall;
    function CheckGrammar(const String_: WideString): WordBool; safecall;
    function CheckSpelling(const Word: WideString; var CustomDictionary, IgnoreUppercase, MainDictionary, CustomDictionary2, CustomDictionary3, CustomDictionary4, CustomDictionary5, CustomDictionary6, CustomDictionary7, CustomDictionary8, CustomDictionary9, CustomDictionary10: OleVariant): WordBool; safecall;
    procedure ResetIgnoreAll; safecall;
    function GetSpellingSuggestions(const Word: WideString; var CustomDictionary, IgnoreUppercase, MainDictionary, SuggestionMode, CustomDictionary2, CustomDictionary3, CustomDictionary4, CustomDictionary5, CustomDictionary6, CustomDictionary7, CustomDictionary8, CustomDictionary9, CustomDictionary10: OleVariant): SpellingSuggestions; safecall;
    procedure GoBack; safecall;
    procedure Help(var HelpType: OleVariant); safecall;
    procedure AutomaticChange; safecall;
    procedure ShowMe; safecall;
    procedure HelpTool; safecall;
    function NewWindow: Window; safecall;
    procedure ListCommands(ListAllCommands: WordBool); safecall;
    procedure ShowClipboard; safecall;
    procedure OnTime(var When: OleVariant; const Name: WideString; var Tolerance: OleVariant); safecall;
    procedure NextLetter; safecall;
    function MountVolume(const Zone, Server, Volume: WideString; var User, UserPassword, VolumePassword: OleVariant): Smallint; safecall;
    function CleanString(const String_: WideString): WideString; safecall;
    procedure SendFax; safecall;
    procedure ChangeFileOpenDirectory(const Path: WideString); safecall;
    procedure Run(const MacroName: WideString); safecall;
    procedure GoForward; safecall;
    procedure Move(Left, Top: Integer); safecall;
    procedure Resize(Width, Height: Integer); safecall;
    function InchesToPoints(Inches: Single): Single; safecall;
    function CentimetersToPoints(Centimeters: Single): Single; safecall;
    function MillimetersToPoints(Millimeters: Single): Single; safecall;
    function PicasToPoints(Picas: Single): Single; safecall;
    function LinesToPoints(Lines: Single): Single; safecall;
    function PointsToInches(Points: Single): Single; safecall;
    function PointsToCentimeters(Points: Single): Single; safecall;
    function PointsToMillimeters(Points: Single): Single; safecall;
    function PointsToPicas(Points: Single): Single; safecall;
    function PointsToLines(Points: Single): Single; safecall;
    procedure Activate; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property Name: WideString read Get_Name;
    property Documents: Documents read Get_Documents;
    property Windows: Windows read Get_Windows;
    property ActiveDocument: Document read Get_ActiveDocument;
    property ActiveWindow: Window read Get_ActiveWindow;
    property Selection: Selection read Get_Selection;
    property WordBasic: IDispatch read Get_WordBasic;
    property RecentFiles: RecentFiles read Get_RecentFiles;
    property NormalTemplate: Template read Get_NormalTemplate;
    property System: System read Get_System;
    property AutoCorrect: AutoCorrect read Get_AutoCorrect;
    property FontNames: FontNames read Get_FontNames;
    property LandscapeFontNames: FontNames read Get_LandscapeFontNames;
    property PortraitFontNames: FontNames read Get_PortraitFontNames;
    property Languages: Languages read Get_Languages;
    property Assistant: Assistant read Get_Assistant;
    property Browser: Browser read Get_Browser;
    property FileConverters: FileConverters read Get_FileConverters;
    property MailingLabel: MailingLabel read Get_MailingLabel;
    property Dialogs: Dialogs read Get_Dialogs;
    property CaptionLabels: CaptionLabels read Get_CaptionLabels;
    property AutoCaptions: AutoCaptions read Get_AutoCaptions;
    property AddIns: AddIns read Get_AddIns;
    property Visible: WordBool read Get_Visible write Set_Visible;
    property Version: WideString read Get_Version;
    property ScreenUpdating: WordBool read Get_ScreenUpdating write Set_ScreenUpdating;
    property PrintPreview: WordBool read Get_PrintPreview write Set_PrintPreview;
    property Tasks: Tasks read Get_Tasks;
    property DisplayStatusBar: WordBool read Get_DisplayStatusBar write Set_DisplayStatusBar;
    property SpecialMode: WordBool read Get_SpecialMode;
    property UsableWidth: Integer read Get_UsableWidth;
    property UsableHeight: Integer read Get_UsableHeight;
    property MathCoprocessorAvailable: WordBool read Get_MathCoprocessorAvailable;
    property MouseAvailable: WordBool read Get_MouseAvailable;
    property International[Index: WdInternationalIndex]: OleVariant read Get_International;
    property Build: WideString read Get_Build;
    property CapsLock: WordBool read Get_CapsLock;
    property NumLock: WordBool read Get_NumLock;
    property UserName: WideString read Get_UserName write Set_UserName;
    property UserInitials: WideString read Get_UserInitials write Set_UserInitials;
    property UserAddress: WideString read Get_UserAddress write Set_UserAddress;
    property MacroContainer: IDispatch read Get_MacroContainer;
    property DisplayRecentFiles: WordBool read Get_DisplayRecentFiles write Set_DisplayRecentFiles;
    property CommandBars: CommandBars read Get_CommandBars;
    property SynonymInfo[const Word: WideString; var LanguageID: OleVariant]: SynonymInfo read Get_SynonymInfo;
    property VBE: VBE read Get_VBE;
    property DefaultSaveFormat: WideString read Get_DefaultSaveFormat write Set_DefaultSaveFormat;
    property ListGalleries: ListGalleries read Get_ListGalleries;
    property ActivePrinter: WideString read Get_ActivePrinter write Set_ActivePrinter;
    property Templates: Templates read Get_Templates;
    property CustomizationContext: IDispatch read Get_CustomizationContext write Set_CustomizationContext;
    property KeyBindings: KeyBindings read Get_KeyBindings;
    property KeysBoundTo[KeyCategory: WdKeyCategory; const Command: WideString; var CommandParameter: OleVariant]: KeysBoundTo read Get_KeysBoundTo;
    property FindKey[KeyCode: Integer; var KeyCode2: OleVariant]: KeyBinding read Get_FindKey;
    property Caption: WideString read Get_Caption write Set_Caption;
    property Path: WideString read Get_Path;
    property DisplayScrollBars: WordBool read Get_DisplayScrollBars write Set_DisplayScrollBars;
    property StartupPath: WideString read Get_StartupPath write Set_StartupPath;
    property BackgroundSavingStatus: Integer read Get_BackgroundSavingStatus;
    property BackgroundPrintingStatus: Integer read Get_BackgroundPrintingStatus;
    property Left: Integer read Get_Left write Set_Left;
    property Top: Integer read Get_Top write Set_Top;
    property Width: Integer read Get_Width write Set_Width;
    property Height: Integer read Get_Height write Set_Height;
    property WindowState: WdWindowState read Get_WindowState write Set_WindowState;
    property DisplayAutoCompleteTips: WordBool read Get_DisplayAutoCompleteTips write Set_DisplayAutoCompleteTips;
    property Options: Options read Get_Options;
    property DisplayAlerts: WdAlertLevel read Get_DisplayAlerts write Set_DisplayAlerts;
    property CustomDictionaries: Dictionaries read Get_CustomDictionaries;
    property PathSeparator: WideString read Get_PathSeparator;
    property StatusBar: WideString write Set_StatusBar;
    property MAPIAvailable: WordBool read Get_MAPIAvailable;
    property DisplayScreenTips: WordBool read Get_DisplayScreenTips write Set_DisplayScreenTips;
    property EnableCancelKey: WdEnableCancelKey read Get_EnableCancelKey write Set_EnableCancelKey;
    property UserControl: WordBool read Get_UserControl;
    property FileSearch: FileSearch read Get_FileSearch;
    property MailSystem: WdMailSystem read Get_MailSystem;
    property DefaultTableSeparator: WideString read Get_DefaultTableSeparator write Set_DefaultTableSeparator;
    property ShowVisualBasicEditor: WordBool read Get_ShowVisualBasicEditor write Set_ShowVisualBasicEditor;
    property BrowseExtraFileTypes: WideString read Get_BrowseExtraFileTypes write Set_BrowseExtraFileTypes;
    property IsObjectValid[Object_: IDispatch]: WordBool read Get_IsObjectValid;
    property HangulHanjaDictionaries: HangulHanjaConversionDictionaries read Get_HangulHanjaDictionaries;
    property MailMessage: MailMessage read Get_MailMessage;
    property FocusInMailHeader: WordBool read Get_FocusInMailHeader;
  end;

{ DispInterface declaration for Dual Interface _Application }

  _ApplicationDisp = dispinterface
    ['{00020970-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property Name: WideString readonly dispid 0;
    property Documents: Documents readonly dispid 6;
    property Windows: Windows readonly dispid 2;
    property ActiveDocument: Document readonly dispid 3;
    property ActiveWindow: Window readonly dispid 4;
    property Selection: Selection readonly dispid 5;
    property WordBasic: IDispatch readonly dispid 1;
    property RecentFiles: RecentFiles readonly dispid 7;
    property NormalTemplate: Template readonly dispid 8;
    property System: System readonly dispid 9;
    property AutoCorrect: AutoCorrect readonly dispid 10;
    property FontNames: FontNames readonly dispid 11;
    property LandscapeFontNames: FontNames readonly dispid 12;
    property PortraitFontNames: FontNames readonly dispid 13;
    property Languages: Languages readonly dispid 14;
    property Assistant: Assistant readonly dispid 15;
    property Browser: Browser readonly dispid 16;
    property FileConverters: FileConverters readonly dispid 17;
    property MailingLabel: MailingLabel readonly dispid 18;
    property Dialogs: Dialogs readonly dispid 19;
    property CaptionLabels: CaptionLabels readonly dispid 20;
    property AutoCaptions: AutoCaptions readonly dispid 21;
    property AddIns: AddIns readonly dispid 22;
    property Visible: WordBool dispid 23;
    property Version: WideString readonly dispid 24;
    property ScreenUpdating: WordBool dispid 26;
    property PrintPreview: WordBool dispid 27;
    property Tasks: Tasks readonly dispid 28;
    property DisplayStatusBar: WordBool dispid 29;
    property SpecialMode: WordBool readonly dispid 30;
    property UsableWidth: Integer readonly dispid 33;
    property UsableHeight: Integer readonly dispid 34;
    property MathCoprocessorAvailable: WordBool readonly dispid 36;
    property MouseAvailable: WordBool readonly dispid 37;
    property International[Index: WdInternationalIndex]: OleVariant readonly dispid 46;
    property Build: WideString readonly dispid 47;
    property CapsLock: WordBool readonly dispid 48;
    property NumLock: WordBool readonly dispid 49;
    property UserName: WideString dispid 52;
    property UserInitials: WideString dispid 53;
    property UserAddress: WideString dispid 54;
    property MacroContainer: IDispatch readonly dispid 55;
    property DisplayRecentFiles: WordBool dispid 56;
    property CommandBars: CommandBars readonly dispid 57;
    property SynonymInfo[const Word: WideString; var LanguageID: OleVariant]: SynonymInfo readonly dispid 59;
    property VBE: VBE readonly dispid 61;
    property DefaultSaveFormat: WideString dispid 64;
    property ListGalleries: ListGalleries readonly dispid 65;
    property ActivePrinter: WideString dispid 66;
    property Templates: Templates readonly dispid 67;
    property CustomizationContext: IDispatch dispid 68;
    property KeyBindings: KeyBindings readonly dispid 69;
    property KeysBoundTo[KeyCategory: WdKeyCategory; const Command: WideString; var CommandParameter: OleVariant]: KeysBoundTo readonly dispid 70;
    property FindKey[KeyCode: Integer; var KeyCode2: OleVariant]: KeyBinding readonly dispid 71;
    property Caption: WideString dispid 80;
    property Path: WideString readonly dispid 81;
    property DisplayScrollBars: WordBool dispid 82;
    property StartupPath: WideString dispid 83;
    property BackgroundSavingStatus: Integer readonly dispid 85;
    property BackgroundPrintingStatus: Integer readonly dispid 86;
    property Left: Integer dispid 87;
    property Top: Integer dispid 88;
    property Width: Integer dispid 89;
    property Height: Integer dispid 90;
    property WindowState: WdWindowState dispid 91;
    property DisplayAutoCompleteTips: WordBool dispid 92;
    property Options: Options readonly dispid 93;
    property DisplayAlerts: WdAlertLevel dispid 94;
    property CustomDictionaries: Dictionaries readonly dispid 95;
    property PathSeparator: WideString readonly dispid 96;
    property StatusBar: WideString writeonly dispid 97;
    property MAPIAvailable: WordBool readonly dispid 98;
    property DisplayScreenTips: WordBool dispid 99;
    property EnableCancelKey: WdEnableCancelKey dispid 100;
    property UserControl: WordBool readonly dispid 101;
    property FileSearch: FileSearch readonly dispid 103;
    property MailSystem: WdMailSystem readonly dispid 104;
    property DefaultTableSeparator: WideString dispid 105;
    property ShowVisualBasicEditor: WordBool dispid 106;
    property BrowseExtraFileTypes: WideString dispid 108;
    property IsObjectValid[Object_: IDispatch]: WordBool readonly dispid 109;
    property HangulHanjaDictionaries: HangulHanjaConversionDictionaries readonly dispid 110;
    property MailMessage: MailMessage readonly dispid 348;
    property FocusInMailHeader: WordBool readonly dispid 386;
    procedure Quit(var SaveChanges, OriginalFormat, RouteDocument: OleVariant); dispid 1105;
    procedure ScreenRefresh; dispid 301;
    procedure PrintOut(var Background, Append, Range, OutputFileName, From, To_, Item, Copies, Pages, PageType, PrintToFile, Collate, FileName, ActivePrinterMacGX, ManualDuplexPrint: OleVariant); dispid 302;
    procedure LookupNameProperties(const Name: WideString); dispid 303;
    procedure SubstituteFont(const UnavailableFont, SubstituteFont: WideString); dispid 304;
    function Repeat_(var Times: OleVariant): WordBool; dispid 305;
    procedure DDEExecute(Channel: Integer; const Command: WideString); dispid 310;
    function DDEInitiate(const App, Topic: WideString): Integer; dispid 311;
    procedure DDEPoke(Channel: Integer; const Item, Data: WideString); dispid 312;
    function DDERequest(Channel: Integer; const Item: WideString): WideString; dispid 313;
    procedure DDETerminate(Channel: Integer); dispid 314;
    procedure DDETerminateAll; dispid 315;
    function BuildKeyCode(Arg1: WdKey; var Arg2, Arg3, Arg4: OleVariant): Integer; dispid 316;
    function KeyString(KeyCode: Integer; var KeyCode2: OleVariant): WideString; dispid 317;
    procedure OrganizerCopy(const Source, Destination, Name: WideString; Object_: WdOrganizerObject); dispid 318;
    procedure OrganizerDelete(const Source, Name: WideString; Object_: WdOrganizerObject); dispid 319;
    procedure OrganizerRename(const Source, Name, NewName: WideString; Object_: WdOrganizerObject); dispid 320;
    procedure AddAddress(var TagID, Value: OleVariant); dispid 321;
    function GetAddress(var Name, AddressProperties, UseAutoText, DisplaySelectDialog, SelectDialog, CheckNamesDialog, RecentAddressesChoice, UpdateRecentAddresses: OleVariant): WideString; dispid 322;
    function CheckGrammar(const String_: WideString): WordBool; dispid 323;
    function CheckSpelling(const Word: WideString; var CustomDictionary, IgnoreUppercase, MainDictionary, CustomDictionary2, CustomDictionary3, CustomDictionary4, CustomDictionary5, CustomDictionary6, CustomDictionary7, CustomDictionary8, CustomDictionary9, CustomDictionary10: OleVariant): WordBool; dispid 324;
    procedure ResetIgnoreAll; dispid 326;
    function GetSpellingSuggestions(const Word: WideString; var CustomDictionary, IgnoreUppercase, MainDictionary, SuggestionMode, CustomDictionary2, CustomDictionary3, CustomDictionary4, CustomDictionary5, CustomDictionary6, CustomDictionary7, CustomDictionary8, CustomDictionary9, CustomDictionary10: OleVariant): SpellingSuggestions; dispid 327;
    procedure GoBack; dispid 328;
    procedure Help(var HelpType: OleVariant); dispid 329;
    procedure AutomaticChange; dispid 330;
    procedure ShowMe; dispid 331;
    procedure HelpTool; dispid 332;
    function NewWindow: Window; dispid 345;
    procedure ListCommands(ListAllCommands: WordBool); dispid 346;
    procedure ShowClipboard; dispid 349;
    procedure OnTime(var When: OleVariant; const Name: WideString; var Tolerance: OleVariant); dispid 350;
    procedure NextLetter; dispid 351;
    function MountVolume(const Zone, Server, Volume: WideString; var User, UserPassword, VolumePassword: OleVariant): Smallint; dispid 353;
    function CleanString(const String_: WideString): WideString; dispid 354;
    procedure SendFax; dispid 356;
    procedure ChangeFileOpenDirectory(const Path: WideString); dispid 357;
    procedure Run(const MacroName: WideString); dispid 358;
    procedure GoForward; dispid 359;
    procedure Move(Left, Top: Integer); dispid 360;
    procedure Resize(Width, Height: Integer); dispid 361;
    function InchesToPoints(Inches: Single): Single; dispid 370;
    function CentimetersToPoints(Centimeters: Single): Single; dispid 371;
    function MillimetersToPoints(Millimeters: Single): Single; dispid 372;
    function PicasToPoints(Picas: Single): Single; dispid 373;
    function LinesToPoints(Lines: Single): Single; dispid 374;
    function PointsToInches(Points: Single): Single; dispid 380;
    function PointsToCentimeters(Points: Single): Single; dispid 381;
    function PointsToMillimeters(Points: Single): Single; dispid 382;
    function PointsToPicas(Points: Single): Single; dispid 383;
    function PointsToLines(Points: Single): Single; dispid 384;
    procedure Activate; dispid 385;
  end;

  _Global = interface(IDispatch)
    ['{000209B9-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Name: WideString; safecall;
    function Get_Documents: Documents; safecall;
    function Get_Windows: Windows; safecall;
    function Get_ActiveDocument: Document; safecall;
    function Get_ActiveWindow: Window; safecall;
    function Get_Selection: Selection; safecall;
    function Get_WordBasic: IDispatch; safecall;
    function Get_PrintPreview: WordBool; safecall;
    procedure Set_PrintPreview(Value: WordBool); safecall;
    function Get_RecentFiles: RecentFiles; safecall;
    function Get_NormalTemplate: Template; safecall;
    function Get_System: System; safecall;
    function Get_AutoCorrect: AutoCorrect; safecall;
    function Get_FontNames: FontNames; safecall;
    function Get_LandscapeFontNames: FontNames; safecall;
    function Get_PortraitFontNames: FontNames; safecall;
    function Get_Languages: Languages; safecall;
    function Get_Assistant: Assistant; safecall;
    function Get_FileConverters: FileConverters; safecall;
    function Get_Dialogs: Dialogs; safecall;
    function Get_CaptionLabels: CaptionLabels; safecall;
    function Get_AutoCaptions: AutoCaptions; safecall;
    function Get_AddIns: AddIns; safecall;
    function Get_Tasks: Tasks; safecall;
    function Get_MacroContainer: IDispatch; safecall;
    function Get_CommandBars: CommandBars; safecall;
    function Get_SynonymInfo(const Word: WideString; var LanguageID: OleVariant): SynonymInfo; safecall;
    function Get_VBE: VBE; safecall;
    function Get_ListGalleries: ListGalleries; safecall;
    function Get_ActivePrinter: WideString; safecall;
    procedure Set_ActivePrinter(const Value: WideString); safecall;
    function Get_Templates: Templates; safecall;
    function Get_CustomizationContext: IDispatch; safecall;
    procedure Set_CustomizationContext(Value: IDispatch); safecall;
    function Get_KeyBindings: KeyBindings; safecall;
    function Get_KeysBoundTo(KeyCategory: WdKeyCategory; const Command: WideString; var CommandParameter: OleVariant): KeysBoundTo; safecall;
    function Get_FindKey(KeyCode: Integer; var KeyCode2: OleVariant): KeyBinding; safecall;
    function Get_Options: Options; safecall;
    function Get_CustomDictionaries: Dictionaries; safecall;
    procedure Set_StatusBar(const Value: WideString); safecall;
    function Get_ShowVisualBasicEditor: WordBool; safecall;
    procedure Set_ShowVisualBasicEditor(Value: WordBool); safecall;
    function Get_IsObjectValid(Object_: IDispatch): WordBool; safecall;
    function Get_HangulHanjaDictionaries: HangulHanjaConversionDictionaries; safecall;
    function Repeat_(var Times: OleVariant): WordBool; safecall;
    procedure DDEExecute(Channel: Integer; const Command: WideString); safecall;
    function DDEInitiate(const App, Topic: WideString): Integer; safecall;
    procedure DDEPoke(Channel: Integer; const Item, Data: WideString); safecall;
    function DDERequest(Channel: Integer; const Item: WideString): WideString; safecall;
    procedure DDETerminate(Channel: Integer); safecall;
    procedure DDETerminateAll; safecall;
    function BuildKeyCode(Arg1: WdKey; var Arg2, Arg3, Arg4: OleVariant): Integer; safecall;
    function KeyString(KeyCode: Integer; var KeyCode2: OleVariant): WideString; safecall;
    function CheckSpelling(const Word: WideString; var CustomDictionary, IgnoreUppercase, MainDictionary, CustomDictionary2, CustomDictionary3, CustomDictionary4, CustomDictionary5, CustomDictionary6, CustomDictionary7, CustomDictionary8, CustomDictionary9, CustomDictionary10: OleVariant): WordBool; safecall;
    function GetSpellingSuggestions(const Word: WideString; var CustomDictionary, IgnoreUppercase, MainDictionary, SuggestionMode, CustomDictionary2, CustomDictionary3, CustomDictionary4, CustomDictionary5, CustomDictionary6, CustomDictionary7, CustomDictionary8, CustomDictionary9, CustomDictionary10: OleVariant): SpellingSuggestions; safecall;
    procedure Help(var HelpType: OleVariant); safecall;
    function NewWindow: Window; safecall;
    function CleanString(const String_: WideString): WideString; safecall;
    procedure ChangeFileOpenDirectory(const Path: WideString); safecall;
    function InchesToPoints(Inches: Single): Single; safecall;
    function CentimetersToPoints(Centimeters: Single): Single; safecall;
    function MillimetersToPoints(Millimeters: Single): Single; safecall;
    function PicasToPoints(Picas: Single): Single; safecall;
    function LinesToPoints(Lines: Single): Single; safecall;
    function PointsToInches(Points: Single): Single; safecall;
    function PointsToCentimeters(Points: Single): Single; safecall;
    function PointsToMillimeters(Points: Single): Single; safecall;
    function PointsToPicas(Points: Single): Single; safecall;
    function PointsToLines(Points: Single): Single; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property Name: WideString read Get_Name;
    property Documents: Documents read Get_Documents;
    property Windows: Windows read Get_Windows;
    property ActiveDocument: Document read Get_ActiveDocument;
    property ActiveWindow: Window read Get_ActiveWindow;
    property Selection: Selection read Get_Selection;
    property WordBasic: IDispatch read Get_WordBasic;
    property PrintPreview: WordBool read Get_PrintPreview write Set_PrintPreview;
    property RecentFiles: RecentFiles read Get_RecentFiles;
    property NormalTemplate: Template read Get_NormalTemplate;
    property System: System read Get_System;
    property AutoCorrect: AutoCorrect read Get_AutoCorrect;
    property FontNames: FontNames read Get_FontNames;
    property LandscapeFontNames: FontNames read Get_LandscapeFontNames;
    property PortraitFontNames: FontNames read Get_PortraitFontNames;
    property Languages: Languages read Get_Languages;
    property Assistant: Assistant read Get_Assistant;
    property FileConverters: FileConverters read Get_FileConverters;
    property Dialogs: Dialogs read Get_Dialogs;
    property CaptionLabels: CaptionLabels read Get_CaptionLabels;
    property AutoCaptions: AutoCaptions read Get_AutoCaptions;
    property AddIns: AddIns read Get_AddIns;
    property Tasks: Tasks read Get_Tasks;
    property MacroContainer: IDispatch read Get_MacroContainer;
    property CommandBars: CommandBars read Get_CommandBars;
    property SynonymInfo[const Word: WideString; var LanguageID: OleVariant]: SynonymInfo read Get_SynonymInfo;
    property VBE: VBE read Get_VBE;
    property ListGalleries: ListGalleries read Get_ListGalleries;
    property ActivePrinter: WideString read Get_ActivePrinter write Set_ActivePrinter;
    property Templates: Templates read Get_Templates;
    property CustomizationContext: IDispatch read Get_CustomizationContext write Set_CustomizationContext;
    property KeyBindings: KeyBindings read Get_KeyBindings;
    property KeysBoundTo[KeyCategory: WdKeyCategory; const Command: WideString; var CommandParameter: OleVariant]: KeysBoundTo read Get_KeysBoundTo;
    property FindKey[KeyCode: Integer; var KeyCode2: OleVariant]: KeyBinding read Get_FindKey;
    property Options: Options read Get_Options;
    property CustomDictionaries: Dictionaries read Get_CustomDictionaries;
    property StatusBar: WideString write Set_StatusBar;
    property ShowVisualBasicEditor: WordBool read Get_ShowVisualBasicEditor write Set_ShowVisualBasicEditor;
    property IsObjectValid[Object_: IDispatch]: WordBool read Get_IsObjectValid;
    property HangulHanjaDictionaries: HangulHanjaConversionDictionaries read Get_HangulHanjaDictionaries;
  end;

{ DispInterface declaration for Dual Interface _Global }

  _GlobalDisp = dispinterface
    ['{000209B9-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property Name: WideString readonly dispid 0;
    property Documents: Documents readonly dispid 1;
    property Windows: Windows readonly dispid 2;
    property ActiveDocument: Document readonly dispid 3;
    property ActiveWindow: Window readonly dispid 4;
    property Selection: Selection readonly dispid 5;
    property WordBasic: IDispatch readonly dispid 6;
    property PrintPreview: WordBool dispid 27;
    property RecentFiles: RecentFiles readonly dispid 7;
    property NormalTemplate: Template readonly dispid 8;
    property System: System readonly dispid 9;
    property AutoCorrect: AutoCorrect readonly dispid 10;
    property FontNames: FontNames readonly dispid 11;
    property LandscapeFontNames: FontNames readonly dispid 12;
    property PortraitFontNames: FontNames readonly dispid 13;
    property Languages: Languages readonly dispid 14;
    property Assistant: Assistant readonly dispid 15;
    property FileConverters: FileConverters readonly dispid 17;
    property Dialogs: Dialogs readonly dispid 19;
    property CaptionLabels: CaptionLabels readonly dispid 20;
    property AutoCaptions: AutoCaptions readonly dispid 21;
    property AddIns: AddIns readonly dispid 22;
    property Tasks: Tasks readonly dispid 28;
    property MacroContainer: IDispatch readonly dispid 55;
    property CommandBars: CommandBars readonly dispid 57;
    property SynonymInfo[const Word: WideString; var LanguageID: OleVariant]: SynonymInfo readonly dispid 59;
    property VBE: VBE readonly dispid 61;
    property ListGalleries: ListGalleries readonly dispid 65;
    property ActivePrinter: WideString dispid 66;
    property Templates: Templates readonly dispid 67;
    property CustomizationContext: IDispatch dispid 68;
    property KeyBindings: KeyBindings readonly dispid 69;
    property KeysBoundTo[KeyCategory: WdKeyCategory; const Command: WideString; var CommandParameter: OleVariant]: KeysBoundTo readonly dispid 70;
    property FindKey[KeyCode: Integer; var KeyCode2: OleVariant]: KeyBinding readonly dispid 71;
    property Options: Options readonly dispid 93;
    property CustomDictionaries: Dictionaries readonly dispid 95;
    property StatusBar: WideString writeonly dispid 97;
    property ShowVisualBasicEditor: WordBool dispid 104;
    property IsObjectValid[Object_: IDispatch]: WordBool readonly dispid 109;
    property HangulHanjaDictionaries: HangulHanjaConversionDictionaries readonly dispid 110;
    function Repeat_(var Times: OleVariant): WordBool; dispid 305;
    procedure DDEExecute(Channel: Integer; const Command: WideString); dispid 310;
    function DDEInitiate(const App, Topic: WideString): Integer; dispid 311;
    procedure DDEPoke(Channel: Integer; const Item, Data: WideString); dispid 312;
    function DDERequest(Channel: Integer; const Item: WideString): WideString; dispid 313;
    procedure DDETerminate(Channel: Integer); dispid 314;
    procedure DDETerminateAll; dispid 315;
    function BuildKeyCode(Arg1: WdKey; var Arg2, Arg3, Arg4: OleVariant): Integer; dispid 316;
    function KeyString(KeyCode: Integer; var KeyCode2: OleVariant): WideString; dispid 317;
    function CheckSpelling(const Word: WideString; var CustomDictionary, IgnoreUppercase, MainDictionary, CustomDictionary2, CustomDictionary3, CustomDictionary4, CustomDictionary5, CustomDictionary6, CustomDictionary7, CustomDictionary8, CustomDictionary9, CustomDictionary10: OleVariant): WordBool; dispid 324;
    function GetSpellingSuggestions(const Word: WideString; var CustomDictionary, IgnoreUppercase, MainDictionary, SuggestionMode, CustomDictionary2, CustomDictionary3, CustomDictionary4, CustomDictionary5, CustomDictionary6, CustomDictionary7, CustomDictionary8, CustomDictionary9, CustomDictionary10: OleVariant): SpellingSuggestions; dispid 327;
    procedure Help(var HelpType: OleVariant); dispid 329;
    function NewWindow: Window; dispid 345;
    function CleanString(const String_: WideString): WideString; dispid 354;
    procedure ChangeFileOpenDirectory(const Path: WideString); dispid 355;
    function InchesToPoints(Inches: Single): Single; dispid 370;
    function CentimetersToPoints(Centimeters: Single): Single; dispid 371;
    function MillimetersToPoints(Millimeters: Single): Single; dispid 372;
    function PicasToPoints(Picas: Single): Single; dispid 373;
    function LinesToPoints(Lines: Single): Single; dispid 374;
    function PointsToInches(Points: Single): Single; dispid 380;
    function PointsToCentimeters(Points: Single): Single; dispid 381;
    function PointsToMillimeters(Points: Single): Single; dispid 382;
    function PointsToPicas(Points: Single): Single; dispid 383;
    function PointsToLines(Points: Single): Single; dispid 384;
  end;

  FontNames = interface(IDispatch)
    ['{0002096F-0000-0000-C000-000000000046}']
    function Get__NewEnum: IUnknown; safecall;
    function Get_Count: Integer; safecall;
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Item(Index: Integer): WideString; safecall;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Count: Integer read Get_Count;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
  end;

{ DispInterface declaration for Dual Interface FontNames }

  FontNamesDisp = dispinterface
    ['{0002096F-0000-0000-C000-000000000046}']
    property _NewEnum: IUnknown readonly dispid -4;
    property Count: Integer readonly dispid 2;
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    function Item(Index: Integer): WideString; dispid 0;
  end;

  Languages = interface(IDispatch)
    ['{0002096E-0000-0000-C000-000000000046}']
    function Get__NewEnum: IUnknown; safecall;
    function Get_Count: Integer; safecall;
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Item(var Index: OleVariant): Language; safecall;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Count: Integer read Get_Count;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
  end;

{ DispInterface declaration for Dual Interface Languages }

  LanguagesDisp = dispinterface
    ['{0002096E-0000-0000-C000-000000000046}']
    property _NewEnum: IUnknown readonly dispid -4;
    property Count: Integer readonly dispid 2;
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    function Item(var Index: OleVariant): Language; dispid 0;
  end;

  Language = interface(IDispatch)
    ['{0002096D-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_ID: WdLanguageID; safecall;
    function Get_NameLocal: WideString; safecall;
    function Get_Name: WideString; safecall;
    function Get_ActiveGrammarDictionary: Dictionary; safecall;
    function Get_ActiveHyphenationDictionary: Dictionary; safecall;
    function Get_ActiveSpellingDictionary: Dictionary; safecall;
    function Get_ActiveThesaurusDictionary: Dictionary; safecall;
    function Get_DefaultWritingStyle: WideString; safecall;
    procedure Set_DefaultWritingStyle(const Value: WideString); safecall;
    function Get_WritingStyleList: OleVariant; safecall;
    function Get_SpellingDictionaryType: WdDictionaryType; safecall;
    procedure Set_SpellingDictionaryType(Value: WdDictionaryType); safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property ID: WdLanguageID read Get_ID;
    property NameLocal: WideString read Get_NameLocal;
    property Name: WideString read Get_Name;
    property ActiveGrammarDictionary: Dictionary read Get_ActiveGrammarDictionary;
    property ActiveHyphenationDictionary: Dictionary read Get_ActiveHyphenationDictionary;
    property ActiveSpellingDictionary: Dictionary read Get_ActiveSpellingDictionary;
    property ActiveThesaurusDictionary: Dictionary read Get_ActiveThesaurusDictionary;
    property DefaultWritingStyle: WideString read Get_DefaultWritingStyle write Set_DefaultWritingStyle;
    property WritingStyleList: OleVariant read Get_WritingStyleList;
    property SpellingDictionaryType: WdDictionaryType read Get_SpellingDictionaryType write Set_SpellingDictionaryType;
  end;

{ DispInterface declaration for Dual Interface Language }

  LanguageDisp = dispinterface
    ['{0002096D-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property ID: WdLanguageID readonly dispid 10;
    property NameLocal: WideString readonly dispid 0;
    property Name: WideString readonly dispid 12;
    property ActiveGrammarDictionary: Dictionary readonly dispid 13;
    property ActiveHyphenationDictionary: Dictionary readonly dispid 14;
    property ActiveSpellingDictionary: Dictionary readonly dispid 15;
    property ActiveThesaurusDictionary: Dictionary readonly dispid 16;
    property DefaultWritingStyle: WideString dispid 17;
    property WritingStyleList: OleVariant readonly dispid 18;
    property SpellingDictionaryType: WdDictionaryType dispid 19;
  end;

  Documents = interface(IDispatch)
    ['{0002096C-0000-0000-C000-000000000046}']
    function Get__NewEnum: IUnknown; safecall;
    function Get_Count: Integer; safecall;
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Item(var Index: OleVariant): Document; safecall;
    procedure Close(var SaveChanges, OriginalFormat, RouteDocument: OleVariant); safecall;
    function Add(var Template, NewTemplate: OleVariant): Document; safecall;
    function Open(var FileName, ConfirmConversions, ReadOnly, AddToRecentFiles, PasswordDocument, PasswordTemplate, Revert, WritePasswordDocument, WritePasswordTemplate, Format: OleVariant): Document; safecall;
    procedure Save(var NoPrompt, OriginalFormat: OleVariant); safecall;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Count: Integer read Get_Count;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
  end;

{ DispInterface declaration for Dual Interface Documents }

  DocumentsDisp = dispinterface
    ['{0002096C-0000-0000-C000-000000000046}']
    property _NewEnum: IUnknown readonly dispid -4;
    property Count: Integer readonly dispid 2;
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    function Item(var Index: OleVariant): Document; dispid 0;
    procedure Close(var SaveChanges, OriginalFormat, RouteDocument: OleVariant); dispid 1105;
    function Add(var Template, NewTemplate: OleVariant): Document; dispid 11;
    function Open(var FileName, ConfirmConversions, ReadOnly, AddToRecentFiles, PasswordDocument, PasswordTemplate, Revert, WritePasswordDocument, WritePasswordTemplate, Format: OleVariant): Document; dispid 12;
    procedure Save(var NoPrompt, OriginalFormat: OleVariant); dispid 13;
  end;

  _Document = interface(IDispatch)
    ['{0002096B-0000-0000-C000-000000000046}']
    function Get_Name: WideString; safecall;
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_BuiltInDocumentProperties: IDispatch; safecall;
    function Get_CustomDocumentProperties: IDispatch; safecall;
    function Get_Path: WideString; safecall;
    function Get_Bookmarks: Bookmarks; safecall;
    function Get_Tables: Tables; safecall;
    function Get_Footnotes: Footnotes; safecall;
    function Get_Endnotes: Endnotes; safecall;
    function Get_Comments: Comments; safecall;
    function Get_Type_: WdDocumentType; safecall;
    function Get_AutoHyphenation: WordBool; safecall;
    procedure Set_AutoHyphenation(Value: WordBool); safecall;
    function Get_HyphenateCaps: WordBool; safecall;
    procedure Set_HyphenateCaps(Value: WordBool); safecall;
    function Get_HyphenationZone: Integer; safecall;
    procedure Set_HyphenationZone(Value: Integer); safecall;
    function Get_ConsecutiveHyphensLimit: Integer; safecall;
    procedure Set_ConsecutiveHyphensLimit(Value: Integer); safecall;
    function Get_Sections: Sections; safecall;
    function Get_Paragraphs: Paragraphs; safecall;
    function Get_Words: Words; safecall;
    function Get_Sentences: Sentences; safecall;
    function Get_Characters: Characters; safecall;
    function Get_Fields: Fields; safecall;
    function Get_FormFields: FormFields; safecall;
    function Get_Styles: Styles; safecall;
    function Get_Frames: Frames; safecall;
    function Get_TablesOfFigures: TablesOfFigures; safecall;
    function Get_Variables: Variables; safecall;
    function Get_MailMerge: MailMerge; safecall;
    function Get_Envelope: Envelope; safecall;
    function Get_FullName: WideString; safecall;
    function Get_Revisions: Revisions; safecall;
    function Get_TablesOfContents: TablesOfContents; safecall;
    function Get_TablesOfAuthorities: TablesOfAuthorities; safecall;
    function Get_PageSetup: PageSetup; safecall;
    procedure Set_PageSetup(const Value: PageSetup); safecall;
    function Get_Windows: Windows; safecall;
    function Get_HasRoutingSlip: WordBool; safecall;
    procedure Set_HasRoutingSlip(Value: WordBool); safecall;
    function Get_RoutingSlip: RoutingSlip; safecall;
    function Get_Routed: WordBool; safecall;
    function Get_TablesOfAuthoritiesCategories: TablesOfAuthoritiesCategories; safecall;
    function Get_Indexes: Indexes; safecall;
    function Get_Saved: WordBool; safecall;
    procedure Set_Saved(Value: WordBool); safecall;
    function Get_Content: Range; safecall;
    function Get_ActiveWindow: Window; safecall;
    function Get_Kind: WdDocumentKind; safecall;
    procedure Set_Kind(Value: WdDocumentKind); safecall;
    function Get_ReadOnly: WordBool; safecall;
    function Get_Subdocuments: Subdocuments; safecall;
    function Get_IsMasterDocument: WordBool; safecall;
    function Get_DefaultTabStop: Single; safecall;
    procedure Set_DefaultTabStop(Value: Single); safecall;
    function Get_EmbedTrueTypeFonts: WordBool; safecall;
    procedure Set_EmbedTrueTypeFonts(Value: WordBool); safecall;
    function Get_SaveFormsData: WordBool; safecall;
    procedure Set_SaveFormsData(Value: WordBool); safecall;
    function Get_ReadOnlyRecommended: WordBool; safecall;
    procedure Set_ReadOnlyRecommended(Value: WordBool); safecall;
    function Get_SaveSubsetFonts: WordBool; safecall;
    procedure Set_SaveSubsetFonts(Value: WordBool); safecall;
    function Get_Compatibility(Type_: WdCompatibility): WordBool; safecall;
    procedure Set_Compatibility(Type_: WdCompatibility; Value: WordBool); safecall;
    function Get_StoryRanges: StoryRanges; safecall;
    function Get_CommandBars: CommandBars; safecall;
    function Get_IsSubdocument: WordBool; safecall;
    function Get_SaveFormat: Integer; safecall;
    function Get_ProtectionType: WdProtectionType; safecall;
    function Get_Hyperlinks: Hyperlinks; safecall;
    function Get_Shapes: Shapes; safecall;
    function Get_ListTemplates: ListTemplates; safecall;
    function Get_Lists: Lists; safecall;
    function Get_UpdateStylesOnOpen: WordBool; safecall;
    procedure Set_UpdateStylesOnOpen(Value: WordBool); safecall;
    function Get_AttachedTemplate: OleVariant; safecall;
    procedure Set_AttachedTemplate(Value: OleVariant); safecall;
    function Get_InlineShapes: InlineShapes; safecall;
    function Get_Background: Shape; safecall;
    procedure Set_Background(const Value: Shape); safecall;
    function Get_GrammarChecked: WordBool; safecall;
    procedure Set_GrammarChecked(Value: WordBool); safecall;
    function Get_SpellingChecked: WordBool; safecall;
    procedure Set_SpellingChecked(Value: WordBool); safecall;
    function Get_ShowGrammaticalErrors: WordBool; safecall;
    procedure Set_ShowGrammaticalErrors(Value: WordBool); safecall;
    function Get_ShowSpellingErrors: WordBool; safecall;
    procedure Set_ShowSpellingErrors(Value: WordBool); safecall;
    function Get_Versions: Versions; safecall;
    function Get_ShowSummary: WordBool; safecall;
    procedure Set_ShowSummary(Value: WordBool); safecall;
    function Get_SummaryViewMode: WdSummaryMode; safecall;
    procedure Set_SummaryViewMode(Value: WdSummaryMode); safecall;
    function Get_SummaryLength: Integer; safecall;
    procedure Set_SummaryLength(Value: Integer); safecall;
    function Get_PrintFractionalWidths: WordBool; safecall;
    procedure Set_PrintFractionalWidths(Value: WordBool); safecall;
    function Get_PrintPostScriptOverText: WordBool; safecall;
    procedure Set_PrintPostScriptOverText(Value: WordBool); safecall;
    function Get_Container: IDispatch; safecall;
    function Get_PrintFormsData: WordBool; safecall;
    procedure Set_PrintFormsData(Value: WordBool); safecall;
    function Get_ListParagraphs: ListParagraphs; safecall;
    procedure Set_Password(const Value: WideString); safecall;
    procedure Set_WritePassword(const Value: WideString); safecall;
    function Get_HasPassword: WordBool; safecall;
    function Get_WriteReserved: WordBool; safecall;
    function Get_ActiveWritingStyle(var LanguageID: OleVariant): WideString; safecall;
    procedure Set_ActiveWritingStyle(var LanguageID: OleVariant; const Value: WideString); safecall;
    function Get_UserControl: WordBool; safecall;
    procedure Set_UserControl(Value: WordBool); safecall;
    function Get_HasMailer: WordBool; safecall;
    procedure Set_HasMailer(Value: WordBool); safecall;
    function Get_Mailer: Mailer; safecall;
    function Get_ReadabilityStatistics: ReadabilityStatistics; safecall;
    function Get_GrammaticalErrors: ProofreadingErrors; safecall;
    function Get_SpellingErrors: ProofreadingErrors; safecall;
    function Get_VBProject: VBProject; safecall;
    function Get_FormsDesign: WordBool; safecall;
    function Get__CodeName: WideString; safecall;
    procedure Set__CodeName(const Value: WideString); safecall;
    function Get_CodeName: WideString; safecall;
    function Get_SnapToGrid: WordBool; safecall;
    procedure Set_SnapToGrid(Value: WordBool); safecall;
    function Get_SnapToShapes: WordBool; safecall;
    procedure Set_SnapToShapes(Value: WordBool); safecall;
    function Get_GridDistanceHorizontal: Single; safecall;
    procedure Set_GridDistanceHorizontal(Value: Single); safecall;
    function Get_GridDistanceVertical: Single; safecall;
    procedure Set_GridDistanceVertical(Value: Single); safecall;
    function Get_GridOriginHorizontal: Single; safecall;
    procedure Set_GridOriginHorizontal(Value: Single); safecall;
    function Get_GridOriginVertical: Single; safecall;
    procedure Set_GridOriginVertical(Value: Single); safecall;
    function Get_GridSpaceBetweenHorizontalLines: Integer; safecall;
    procedure Set_GridSpaceBetweenHorizontalLines(Value: Integer); safecall;
    function Get_GridSpaceBetweenVerticalLines: Integer; safecall;
    procedure Set_GridSpaceBetweenVerticalLines(Value: Integer); safecall;
    function Get_GridOriginFromMargin: WordBool; safecall;
    procedure Set_GridOriginFromMargin(Value: WordBool); safecall;
    function Get_KerningByAlgorithm: WordBool; safecall;
    procedure Set_KerningByAlgorithm(Value: WordBool); safecall;
    function Get_JustificationMode: WdJustificationMode; safecall;
    procedure Set_JustificationMode(Value: WdJustificationMode); safecall;
    function Get_FarEastLineBreakLevel: WdFarEastLineBreakLevel; safecall;
    procedure Set_FarEastLineBreakLevel(Value: WdFarEastLineBreakLevel); safecall;
    function Get_NoLineBreakBefore: WideString; safecall;
    procedure Set_NoLineBreakBefore(const Value: WideString); safecall;
    function Get_NoLineBreakAfter: WideString; safecall;
    procedure Set_NoLineBreakAfter(const Value: WideString); safecall;
    function Get_TrackRevisions: WordBool; safecall;
    procedure Set_TrackRevisions(Value: WordBool); safecall;
    function Get_PrintRevisions: WordBool; safecall;
    procedure Set_PrintRevisions(Value: WordBool); safecall;
    function Get_ShowRevisions: WordBool; safecall;
    procedure Set_ShowRevisions(Value: WordBool); safecall;
    procedure Close(var SaveChanges, OriginalFormat, RouteDocument: OleVariant); safecall;
    procedure SaveAs(var FileName, FileFormat, LockComments, Password, AddToRecentFiles, WritePassword, ReadOnlyRecommended, EmbedTrueTypeFonts, SaveNativePictureFormat, SaveFormsData, SaveAsAOCELetter: OleVariant); safecall;
    procedure Repaginate; safecall;
    procedure FitToPages; safecall;
    procedure ManualHyphenation; safecall;
    procedure Select; safecall;
    procedure DataForm; safecall;
    procedure Route; safecall;
    procedure Save; safecall;
    procedure PrintOut(var Background, Append, Range, OutputFileName, From, To_, Item, Copies, Pages, PageType, PrintToFile, Collate, ActivePrinterMacGX, ManualDuplexPrint: OleVariant); safecall;
    procedure SendMail; safecall;
    function Range(var Start, End_: OleVariant): Range; safecall;
    procedure RunAutoMacro(Which: WdAutoMacros); safecall;
    procedure Activate; safecall;
    procedure PrintPreview; safecall;
    function GoTo_(var What, Which, Count, Name: OleVariant): Range; safecall;
    function Undo(var Times: OleVariant): WordBool; safecall;
    function Redo(var Times: OleVariant): WordBool; safecall;
    function ComputeStatistics(Statistic: WdStatistic; var IncludeFootnotesAndEndnotes: OleVariant): Integer; safecall;
    procedure MakeCompatibilityDefault; safecall;
    procedure Protect(Type_: WdProtectionType; var NoReset, Password: OleVariant); safecall;
    procedure Unprotect(var Password: OleVariant); safecall;
    procedure EditionOptions(Type_: WdEditionType; Option: WdEditionOption; const Name: WideString; var Format: OleVariant); safecall;
    procedure RunLetterWizard(var LetterContent, WizardMode: OleVariant); safecall;
    function GetLetterContent: LetterContent; safecall;
    procedure SetLetterContent(var LetterContent: OleVariant); safecall;
    procedure CopyStylesFromTemplate(const Template: WideString); safecall;
    procedure UpdateStyles; safecall;
    procedure CheckGrammar; safecall;
    procedure CheckSpelling(var CustomDictionary, IgnoreUppercase, AlwaysSuggest, CustomDictionary2, CustomDictionary3, CustomDictionary4, CustomDictionary5, CustomDictionary6, CustomDictionary7, CustomDictionary8, CustomDictionary9, CustomDictionary10: OleVariant); safecall;
    procedure FollowHyperlink(var Address, SubAddress, NewWindow, AddHistory, ExtraInfo, Method, HeaderInfo: OleVariant); safecall;
    procedure AddToFavorites; safecall;
    procedure Reload; safecall;
    function AutoSummarize(var Length, Mode, UpdateProperties: OleVariant): Range; safecall;
    procedure RemoveNumbers(var NumberType: OleVariant); safecall;
    procedure ConvertNumbersToText(var NumberType: OleVariant); safecall;
    function CountNumberedItems(var NumberType, Level: OleVariant): Integer; safecall;
    procedure Post; safecall;
    procedure ToggleFormsDesign; safecall;
    procedure Compare(const Name: WideString); safecall;
    procedure UpdateSummaryProperties; safecall;
    function GetCrossReferenceItems(var ReferenceType: OleVariant): OleVariant; safecall;
    procedure AutoFormat; safecall;
    procedure ViewCode; safecall;
    procedure ViewPropertyBrowser; safecall;
    procedure ForwardMailer; safecall;
    procedure Reply; safecall;
    procedure ReplyAll; safecall;
    procedure SendMailer(var FileFormat, Priority: OleVariant); safecall;
    procedure UndoClear; safecall;
    procedure PresentIt; safecall;
    procedure SendFax(const Address: WideString; var Subject: OleVariant); safecall;
    procedure Merge(const FileName: WideString); safecall;
    procedure ClosePrintPreview; safecall;
    procedure CheckConsistency; safecall;
    function CreateLetterContent(const DateFormat: WideString; IncludeHeaderFooter: WordBool; const PageDesign: WideString; LetterStyle: WdLetterStyle; Letterhead: WordBool; LetterheadLocation: WdLetterheadLocation; LetterheadSize: Single; const RecipientName, RecipientAddress, Salutation: WideString; SalutationType: WdSalutationType; const RecipientReference, MailingInstructions, AttentionLine, Subject, CCList, ReturnAddress, SenderName, Closing, SenderCompany, SenderJobTitle, SenderInitials: WideString; EnclosureNumber: Integer; var InfoBlock, RecipientCode, RecipientGender, ReturnAddressShortForm, SenderCity, SenderCode, SenderGender, SenderReference: OleVariant): LetterContent; safecall;
    procedure AcceptAllRevisions; safecall;
    procedure RejectAllRevisions; safecall;
    property Name: WideString read Get_Name;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property BuiltInDocumentProperties: IDispatch read Get_BuiltInDocumentProperties;
    property CustomDocumentProperties: IDispatch read Get_CustomDocumentProperties;
    property Path: WideString read Get_Path;
    property Bookmarks: Bookmarks read Get_Bookmarks;
    property Tables: Tables read Get_Tables;
    property Footnotes: Footnotes read Get_Footnotes;
    property Endnotes: Endnotes read Get_Endnotes;
    property Comments: Comments read Get_Comments;
    property Type_: WdDocumentType read Get_Type_;
    property AutoHyphenation: WordBool read Get_AutoHyphenation write Set_AutoHyphenation;
    property HyphenateCaps: WordBool read Get_HyphenateCaps write Set_HyphenateCaps;
    property HyphenationZone: Integer read Get_HyphenationZone write Set_HyphenationZone;
    property ConsecutiveHyphensLimit: Integer read Get_ConsecutiveHyphensLimit write Set_ConsecutiveHyphensLimit;
    property Sections: Sections read Get_Sections;
    property Paragraphs: Paragraphs read Get_Paragraphs;
    property Words: Words read Get_Words;
    property Sentences: Sentences read Get_Sentences;
    property Characters: Characters read Get_Characters;
    property Fields: Fields read Get_Fields;
    property FormFields: FormFields read Get_FormFields;
    property Styles: Styles read Get_Styles;
    property Frames: Frames read Get_Frames;
    property TablesOfFigures: TablesOfFigures read Get_TablesOfFigures;
    property Variables: Variables read Get_Variables;
    property MailMerge: MailMerge read Get_MailMerge;
    property Envelope: Envelope read Get_Envelope;
    property FullName: WideString read Get_FullName;
    property Revisions: Revisions read Get_Revisions;
    property TablesOfContents: TablesOfContents read Get_TablesOfContents;
    property TablesOfAuthorities: TablesOfAuthorities read Get_TablesOfAuthorities;
    property PageSetup: PageSetup read Get_PageSetup write Set_PageSetup;
    property Windows: Windows read Get_Windows;
    property HasRoutingSlip: WordBool read Get_HasRoutingSlip write Set_HasRoutingSlip;
    property RoutingSlip: RoutingSlip read Get_RoutingSlip;
    property Routed: WordBool read Get_Routed;
    property TablesOfAuthoritiesCategories: TablesOfAuthoritiesCategories read Get_TablesOfAuthoritiesCategories;
    property Indexes: Indexes read Get_Indexes;
    property Saved: WordBool read Get_Saved write Set_Saved;
    property Content: Range read Get_Content;
    property ActiveWindow: Window read Get_ActiveWindow;
    property Kind: WdDocumentKind read Get_Kind write Set_Kind;
    property ReadOnly: WordBool read Get_ReadOnly;
    property Subdocuments: Subdocuments read Get_Subdocuments;
    property IsMasterDocument: WordBool read Get_IsMasterDocument;
    property DefaultTabStop: Single read Get_DefaultTabStop write Set_DefaultTabStop;
    property EmbedTrueTypeFonts: WordBool read Get_EmbedTrueTypeFonts write Set_EmbedTrueTypeFonts;
    property SaveFormsData: WordBool read Get_SaveFormsData write Set_SaveFormsData;
    property ReadOnlyRecommended: WordBool read Get_ReadOnlyRecommended write Set_ReadOnlyRecommended;
    property SaveSubsetFonts: WordBool read Get_SaveSubsetFonts write Set_SaveSubsetFonts;
    property Compatibility[Type_: WdCompatibility]: WordBool read Get_Compatibility write Set_Compatibility;
    property StoryRanges: StoryRanges read Get_StoryRanges;
    property CommandBars: CommandBars read Get_CommandBars;
    property IsSubdocument: WordBool read Get_IsSubdocument;
    property SaveFormat: Integer read Get_SaveFormat;
    property ProtectionType: WdProtectionType read Get_ProtectionType;
    property Hyperlinks: Hyperlinks read Get_Hyperlinks;
    property Shapes: Shapes read Get_Shapes;
    property ListTemplates: ListTemplates read Get_ListTemplates;
    property Lists: Lists read Get_Lists;
    property UpdateStylesOnOpen: WordBool read Get_UpdateStylesOnOpen write Set_UpdateStylesOnOpen;
    property AttachedTemplate: OleVariant read Get_AttachedTemplate write Set_AttachedTemplate;
    property InlineShapes: InlineShapes read Get_InlineShapes;
    property Background: Shape read Get_Background write Set_Background;
    property GrammarChecked: WordBool read Get_GrammarChecked write Set_GrammarChecked;
    property SpellingChecked: WordBool read Get_SpellingChecked write Set_SpellingChecked;
    property ShowGrammaticalErrors: WordBool read Get_ShowGrammaticalErrors write Set_ShowGrammaticalErrors;
    property ShowSpellingErrors: WordBool read Get_ShowSpellingErrors write Set_ShowSpellingErrors;
    property Versions: Versions read Get_Versions;
    property ShowSummary: WordBool read Get_ShowSummary write Set_ShowSummary;
    property SummaryViewMode: WdSummaryMode read Get_SummaryViewMode write Set_SummaryViewMode;
    property SummaryLength: Integer read Get_SummaryLength write Set_SummaryLength;
    property PrintFractionalWidths: WordBool read Get_PrintFractionalWidths write Set_PrintFractionalWidths;
    property PrintPostScriptOverText: WordBool read Get_PrintPostScriptOverText write Set_PrintPostScriptOverText;
    property Container: IDispatch read Get_Container;
    property PrintFormsData: WordBool read Get_PrintFormsData write Set_PrintFormsData;
    property ListParagraphs: ListParagraphs read Get_ListParagraphs;
    property Password: WideString write Set_Password;
    property WritePassword: WideString write Set_WritePassword;
    property HasPassword: WordBool read Get_HasPassword;
    property WriteReserved: WordBool read Get_WriteReserved;
    property ActiveWritingStyle[var LanguageID: OleVariant]: WideString read Get_ActiveWritingStyle write Set_ActiveWritingStyle;
    property UserControl: WordBool read Get_UserControl write Set_UserControl;
    property HasMailer: WordBool read Get_HasMailer write Set_HasMailer;
    property Mailer: Mailer read Get_Mailer;
    property ReadabilityStatistics: ReadabilityStatistics read Get_ReadabilityStatistics;
    property GrammaticalErrors: ProofreadingErrors read Get_GrammaticalErrors;
    property SpellingErrors: ProofreadingErrors read Get_SpellingErrors;
    property VBProject: VBProject read Get_VBProject;
    property FormsDesign: WordBool read Get_FormsDesign;
    property _CodeName: WideString read Get__CodeName write Set__CodeName;
    property CodeName: WideString read Get_CodeName;
    property SnapToGrid: WordBool read Get_SnapToGrid write Set_SnapToGrid;
    property SnapToShapes: WordBool read Get_SnapToShapes write Set_SnapToShapes;
    property GridDistanceHorizontal: Single read Get_GridDistanceHorizontal write Set_GridDistanceHorizontal;
    property GridDistanceVertical: Single read Get_GridDistanceVertical write Set_GridDistanceVertical;
    property GridOriginHorizontal: Single read Get_GridOriginHorizontal write Set_GridOriginHorizontal;
    property GridOriginVertical: Single read Get_GridOriginVertical write Set_GridOriginVertical;
    property GridSpaceBetweenHorizontalLines: Integer read Get_GridSpaceBetweenHorizontalLines write Set_GridSpaceBetweenHorizontalLines;
    property GridSpaceBetweenVerticalLines: Integer read Get_GridSpaceBetweenVerticalLines write Set_GridSpaceBetweenVerticalLines;
    property GridOriginFromMargin: WordBool read Get_GridOriginFromMargin write Set_GridOriginFromMargin;
    property KerningByAlgorithm: WordBool read Get_KerningByAlgorithm write Set_KerningByAlgorithm;
    property JustificationMode: WdJustificationMode read Get_JustificationMode write Set_JustificationMode;
    property FarEastLineBreakLevel: WdFarEastLineBreakLevel read Get_FarEastLineBreakLevel write Set_FarEastLineBreakLevel;
    property NoLineBreakBefore: WideString read Get_NoLineBreakBefore write Set_NoLineBreakBefore;
    property NoLineBreakAfter: WideString read Get_NoLineBreakAfter write Set_NoLineBreakAfter;
    property TrackRevisions: WordBool read Get_TrackRevisions write Set_TrackRevisions;
    property PrintRevisions: WordBool read Get_PrintRevisions write Set_PrintRevisions;
    property ShowRevisions: WordBool read Get_ShowRevisions write Set_ShowRevisions;
  end;

{ DispInterface declaration for Dual Interface _Document }

  _DocumentDisp = dispinterface
    ['{0002096B-0000-0000-C000-000000000046}']
    property Name: WideString readonly dispid 0;
    property Application: Application readonly dispid 1;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property BuiltInDocumentProperties: IDispatch readonly dispid 1000;
    property CustomDocumentProperties: IDispatch readonly dispid 2;
    property Path: WideString readonly dispid 3;
    property Bookmarks: Bookmarks readonly dispid 4;
    property Tables: Tables readonly dispid 6;
    property Footnotes: Footnotes readonly dispid 7;
    property Endnotes: Endnotes readonly dispid 8;
    property Comments: Comments readonly dispid 9;
    property Type_: WdDocumentType readonly dispid 10;
    property AutoHyphenation: WordBool dispid 11;
    property HyphenateCaps: WordBool dispid 12;
    property HyphenationZone: Integer dispid 13;
    property ConsecutiveHyphensLimit: Integer dispid 14;
    property Sections: Sections readonly dispid 15;
    property Paragraphs: Paragraphs readonly dispid 16;
    property Words: Words readonly dispid 17;
    property Sentences: Sentences readonly dispid 18;
    property Characters: Characters readonly dispid 19;
    property Fields: Fields readonly dispid 20;
    property FormFields: FormFields readonly dispid 21;
    property Styles: Styles readonly dispid 22;
    property Frames: Frames readonly dispid 23;
    property TablesOfFigures: TablesOfFigures readonly dispid 25;
    property Variables: Variables readonly dispid 26;
    property MailMerge: MailMerge readonly dispid 27;
    property Envelope: Envelope readonly dispid 28;
    property FullName: WideString readonly dispid 29;
    property Revisions: Revisions readonly dispid 30;
    property TablesOfContents: TablesOfContents readonly dispid 31;
    property TablesOfAuthorities: TablesOfAuthorities readonly dispid 32;
    property PageSetup: PageSetup dispid 1101;
    property Windows: Windows readonly dispid 34;
    property HasRoutingSlip: WordBool dispid 35;
    property RoutingSlip: RoutingSlip readonly dispid 36;
    property Routed: WordBool readonly dispid 37;
    property TablesOfAuthoritiesCategories: TablesOfAuthoritiesCategories readonly dispid 38;
    property Indexes: Indexes readonly dispid 39;
    property Saved: WordBool dispid 40;
    property Content: Range readonly dispid 41;
    property ActiveWindow: Window readonly dispid 42;
    property Kind: WdDocumentKind dispid 43;
    property ReadOnly: WordBool readonly dispid 44;
    property Subdocuments: Subdocuments readonly dispid 45;
    property IsMasterDocument: WordBool readonly dispid 46;
    property DefaultTabStop: Single dispid 48;
    property EmbedTrueTypeFonts: WordBool dispid 50;
    property SaveFormsData: WordBool dispid 51;
    property ReadOnlyRecommended: WordBool dispid 52;
    property SaveSubsetFonts: WordBool dispid 53;
    property Compatibility[Type_: WdCompatibility]: WordBool dispid 55;
    property StoryRanges: StoryRanges readonly dispid 56;
    property CommandBars: CommandBars readonly dispid 57;
    property IsSubdocument: WordBool readonly dispid 58;
    property SaveFormat: Integer readonly dispid 59;
    property ProtectionType: WdProtectionType readonly dispid 60;
    property Hyperlinks: Hyperlinks readonly dispid 61;
    property Shapes: Shapes readonly dispid 62;
    property ListTemplates: ListTemplates readonly dispid 63;
    property Lists: Lists readonly dispid 64;
    property UpdateStylesOnOpen: WordBool dispid 66;
    property AttachedTemplate: OleVariant dispid 67;
    property InlineShapes: InlineShapes readonly dispid 68;
    property Background: Shape dispid 69;
    property GrammarChecked: WordBool dispid 70;
    property SpellingChecked: WordBool dispid 71;
    property ShowGrammaticalErrors: WordBool dispid 72;
    property ShowSpellingErrors: WordBool dispid 73;
    property Versions: Versions readonly dispid 75;
    property ShowSummary: WordBool dispid 76;
    property SummaryViewMode: WdSummaryMode dispid 77;
    property SummaryLength: Integer dispid 78;
    property PrintFractionalWidths: WordBool dispid 79;
    property PrintPostScriptOverText: WordBool dispid 80;
    property Container: IDispatch readonly dispid 82;
    property PrintFormsData: WordBool dispid 83;
    property ListParagraphs: ListParagraphs readonly dispid 84;
    property Password: WideString writeonly dispid 85;
    property WritePassword: WideString writeonly dispid 86;
    property HasPassword: WordBool readonly dispid 87;
    property WriteReserved: WordBool readonly dispid 88;
    property ActiveWritingStyle[var LanguageID: OleVariant]: WideString dispid 90;
    property UserControl: WordBool dispid 92;
    property HasMailer: WordBool dispid 93;
    property Mailer: Mailer readonly dispid 94;
    property ReadabilityStatistics: ReadabilityStatistics readonly dispid 96;
    property GrammaticalErrors: ProofreadingErrors readonly dispid 97;
    property SpellingErrors: ProofreadingErrors readonly dispid 98;
    property VBProject: VBProject readonly dispid 99;
    property FormsDesign: WordBool readonly dispid 100;
    property _CodeName: WideString dispid -2147418112;
    property CodeName: WideString readonly dispid 262;
    property SnapToGrid: WordBool dispid 300;
    property SnapToShapes: WordBool dispid 301;
    property GridDistanceHorizontal: Single dispid 302;
    property GridDistanceVertical: Single dispid 303;
    property GridOriginHorizontal: Single dispid 304;
    property GridOriginVertical: Single dispid 305;
    property GridSpaceBetweenHorizontalLines: Integer dispid 306;
    property GridSpaceBetweenVerticalLines: Integer dispid 307;
    property GridOriginFromMargin: WordBool dispid 308;
    property KerningByAlgorithm: WordBool dispid 309;
    property JustificationMode: WdJustificationMode dispid 310;
    property FarEastLineBreakLevel: WdFarEastLineBreakLevel dispid 311;
    property NoLineBreakBefore: WideString dispid 312;
    property NoLineBreakAfter: WideString dispid 313;
    property TrackRevisions: WordBool dispid 314;
    property PrintRevisions: WordBool dispid 315;
    property ShowRevisions: WordBool dispid 316;
    procedure Close(var SaveChanges, OriginalFormat, RouteDocument: OleVariant); dispid 1105;
    procedure SaveAs(var FileName, FileFormat, LockComments, Password, AddToRecentFiles, WritePassword, ReadOnlyRecommended, EmbedTrueTypeFonts, SaveNativePictureFormat, SaveFormsData, SaveAsAOCELetter: OleVariant); dispid 102;
    procedure Repaginate; dispid 103;
    procedure FitToPages; dispid 104;
    procedure ManualHyphenation; dispid 105;
    procedure Select; dispid 65535;
    procedure DataForm; dispid 106;
    procedure Route; dispid 107;
    procedure Save; dispid 108;
    procedure PrintOut(var Background, Append, Range, OutputFileName, From, To_, Item, Copies, Pages, PageType, PrintToFile, Collate, ActivePrinterMacGX, ManualDuplexPrint: OleVariant); dispid 109;
    procedure SendMail; dispid 110;
    function Range(var Start, End_: OleVariant): Range; dispid 2000;
    procedure RunAutoMacro(Which: WdAutoMacros); dispid 112;
    procedure Activate; dispid 113;
    procedure PrintPreview; dispid 114;
    function GoTo_(var What, Which, Count, Name: OleVariant): Range; dispid 115;
    function Undo(var Times: OleVariant): WordBool; dispid 116;
    function Redo(var Times: OleVariant): WordBool; dispid 117;
    function ComputeStatistics(Statistic: WdStatistic; var IncludeFootnotesAndEndnotes: OleVariant): Integer; dispid 118;
    procedure MakeCompatibilityDefault; dispid 119;
    procedure Protect(Type_: WdProtectionType; var NoReset, Password: OleVariant); dispid 120;
    procedure Unprotect(var Password: OleVariant); dispid 121;
    procedure EditionOptions(Type_: WdEditionType; Option: WdEditionOption; const Name: WideString; var Format: OleVariant); dispid 122;
    procedure RunLetterWizard(var LetterContent, WizardMode: OleVariant); dispid 123;
    function GetLetterContent: LetterContent; dispid 124;
    procedure SetLetterContent(var LetterContent: OleVariant); dispid 125;
    procedure CopyStylesFromTemplate(const Template: WideString); dispid 126;
    procedure UpdateStyles; dispid 127;
    procedure CheckGrammar; dispid 131;
    procedure CheckSpelling(var CustomDictionary, IgnoreUppercase, AlwaysSuggest, CustomDictionary2, CustomDictionary3, CustomDictionary4, CustomDictionary5, CustomDictionary6, CustomDictionary7, CustomDictionary8, CustomDictionary9, CustomDictionary10: OleVariant); dispid 132;
    procedure FollowHyperlink(var Address, SubAddress, NewWindow, AddHistory, ExtraInfo, Method, HeaderInfo: OleVariant); dispid 135;
    procedure AddToFavorites; dispid 136;
    procedure Reload; dispid 137;
    function AutoSummarize(var Length, Mode, UpdateProperties: OleVariant): Range; dispid 138;
    procedure RemoveNumbers(var NumberType: OleVariant); dispid 140;
    procedure ConvertNumbersToText(var NumberType: OleVariant); dispid 141;
    function CountNumberedItems(var NumberType, Level: OleVariant): Integer; dispid 142;
    procedure Post; dispid 143;
    procedure ToggleFormsDesign; dispid 144;
    procedure Compare(const Name: WideString); dispid 145;
    procedure UpdateSummaryProperties; dispid 146;
    function GetCrossReferenceItems(var ReferenceType: OleVariant): OleVariant; dispid 147;
    procedure AutoFormat; dispid 148;
    procedure ViewCode; dispid 149;
    procedure ViewPropertyBrowser; dispid 150;
    procedure ForwardMailer; dispid 250;
    procedure Reply; dispid 251;
    procedure ReplyAll; dispid 252;
    procedure SendMailer(var FileFormat, Priority: OleVariant); dispid 253;
    procedure UndoClear; dispid 254;
    procedure PresentIt; dispid 255;
    procedure SendFax(const Address: WideString; var Subject: OleVariant); dispid 256;
    procedure Merge(const FileName: WideString); dispid 257;
    procedure ClosePrintPreview; dispid 258;
    procedure CheckConsistency; dispid 259;
    function CreateLetterContent(const DateFormat: WideString; IncludeHeaderFooter: WordBool; const PageDesign: WideString; LetterStyle: WdLetterStyle; Letterhead: WordBool; LetterheadLocation: WdLetterheadLocation; LetterheadSize: Single; const RecipientName, RecipientAddress, Salutation: WideString; SalutationType: WdSalutationType; const RecipientReference, MailingInstructions, AttentionLine, Subject, CCList, ReturnAddress, SenderName, Closing, SenderCompany, SenderJobTitle, SenderInitials: WideString; EnclosureNumber: Integer; var InfoBlock, RecipientCode, RecipientGender, ReturnAddressShortForm, SenderCity, SenderCode, SenderGender, SenderReference: OleVariant): LetterContent; dispid 260;
    procedure AcceptAllRevisions; dispid 317;
    procedure RejectAllRevisions; dispid 318;
  end;

  Template = interface(IDispatch)
    ['{0002096A-0000-0000-C000-000000000046}']
    function Get_Name: WideString; safecall;
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Path: WideString; safecall;
    function Get_AutoTextEntries: AutoTextEntries; safecall;
    function Get_LanguageID: WdLanguageID; safecall;
    procedure Set_LanguageID(Value: WdLanguageID); safecall;
    function Get_Saved: WordBool; safecall;
    procedure Set_Saved(Value: WordBool); safecall;
    function Get_Type_: WdTemplateType; safecall;
    function Get_FullName: WideString; safecall;
    function Get_BuiltInDocumentProperties: IDispatch; safecall;
    function Get_CustomDocumentProperties: IDispatch; safecall;
    function Get_ListTemplates: ListTemplates; safecall;
    function Get_LanguageIDFarEast: WdLanguageID; safecall;
    procedure Set_LanguageIDFarEast(Value: WdLanguageID); safecall;
    function Get_VBProject: VBProject; safecall;
    function Get_KerningByAlgorithm: WordBool; safecall;
    procedure Set_KerningByAlgorithm(Value: WordBool); safecall;
    function Get_JustificationMode: WdJustificationMode; safecall;
    procedure Set_JustificationMode(Value: WdJustificationMode); safecall;
    function Get_FarEastLineBreakLevel: WdFarEastLineBreakLevel; safecall;
    procedure Set_FarEastLineBreakLevel(Value: WdFarEastLineBreakLevel); safecall;
    function Get_NoLineBreakBefore: WideString; safecall;
    procedure Set_NoLineBreakBefore(const Value: WideString); safecall;
    function Get_NoLineBreakAfter: WideString; safecall;
    procedure Set_NoLineBreakAfter(const Value: WideString); safecall;
    function OpenAsDocument: Document; safecall;
    procedure Save; safecall;
    property Name: WideString read Get_Name;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property Path: WideString read Get_Path;
    property AutoTextEntries: AutoTextEntries read Get_AutoTextEntries;
    property LanguageID: WdLanguageID read Get_LanguageID write Set_LanguageID;
    property Saved: WordBool read Get_Saved write Set_Saved;
    property Type_: WdTemplateType read Get_Type_;
    property FullName: WideString read Get_FullName;
    property BuiltInDocumentProperties: IDispatch read Get_BuiltInDocumentProperties;
    property CustomDocumentProperties: IDispatch read Get_CustomDocumentProperties;
    property ListTemplates: ListTemplates read Get_ListTemplates;
    property LanguageIDFarEast: WdLanguageID read Get_LanguageIDFarEast write Set_LanguageIDFarEast;
    property VBProject: VBProject read Get_VBProject;
    property KerningByAlgorithm: WordBool read Get_KerningByAlgorithm write Set_KerningByAlgorithm;
    property JustificationMode: WdJustificationMode read Get_JustificationMode write Set_JustificationMode;
    property FarEastLineBreakLevel: WdFarEastLineBreakLevel read Get_FarEastLineBreakLevel write Set_FarEastLineBreakLevel;
    property NoLineBreakBefore: WideString read Get_NoLineBreakBefore write Set_NoLineBreakBefore;
    property NoLineBreakAfter: WideString read Get_NoLineBreakAfter write Set_NoLineBreakAfter;
  end;

{ DispInterface declaration for Dual Interface Template }

  TemplateDisp = dispinterface
    ['{0002096A-0000-0000-C000-000000000046}']
    property Name: WideString readonly dispid 0;
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property Path: WideString readonly dispid 1;
    property AutoTextEntries: AutoTextEntries readonly dispid 2;
    property LanguageID: WdLanguageID dispid 4;
    property Saved: WordBool dispid 5;
    property Type_: WdTemplateType readonly dispid 6;
    property FullName: WideString readonly dispid 7;
    property BuiltInDocumentProperties: IDispatch readonly dispid 8;
    property CustomDocumentProperties: IDispatch readonly dispid 9;
    property ListTemplates: ListTemplates readonly dispid 10;
    property LanguageIDFarEast: WdLanguageID dispid 11;
    property VBProject: VBProject readonly dispid 99;
    property KerningByAlgorithm: WordBool dispid 12;
    property JustificationMode: WdJustificationMode dispid 13;
    property FarEastLineBreakLevel: WdFarEastLineBreakLevel dispid 14;
    property NoLineBreakBefore: WideString dispid 15;
    property NoLineBreakAfter: WideString dispid 16;
    function OpenAsDocument: Document; dispid 100;
    procedure Save; dispid 101;
  end;

  Templates = interface(IDispatch)
    ['{000209A2-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Count: Integer; safecall;
    function Get__NewEnum: IUnknown; safecall;
    function Item(var Index: OleVariant): Template; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property Count: Integer read Get_Count;
    property _NewEnum: IUnknown read Get__NewEnum;
  end;

{ DispInterface declaration for Dual Interface Templates }

  TemplatesDisp = dispinterface
    ['{000209A2-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property Count: Integer readonly dispid 1;
    property _NewEnum: IUnknown readonly dispid -4;
    function Item(var Index: OleVariant): Template; dispid 0;
  end;

  RoutingSlip = interface(IDispatch)
    ['{00020969-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Subject: WideString; safecall;
    procedure Set_Subject(const Value: WideString); safecall;
    function Get_Message: WideString; safecall;
    procedure Set_Message(const Value: WideString); safecall;
    function Get_Delivery: WdRoutingSlipDelivery; safecall;
    procedure Set_Delivery(Value: WdRoutingSlipDelivery); safecall;
    function Get_TrackStatus: WordBool; safecall;
    procedure Set_TrackStatus(Value: WordBool); safecall;
    function Get_Protect: WdProtectionType; safecall;
    procedure Set_Protect(Value: WdProtectionType); safecall;
    function Get_ReturnWhenDone: WordBool; safecall;
    procedure Set_ReturnWhenDone(Value: WordBool); safecall;
    function Get_Status: WdRoutingSlipStatus; safecall;
    function Get_Recipients(var Index: OleVariant): OleVariant; safecall;
    procedure Reset; safecall;
    procedure AddRecipient(const Recipient: WideString); safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property Subject: WideString read Get_Subject write Set_Subject;
    property Message: WideString read Get_Message write Set_Message;
    property Delivery: WdRoutingSlipDelivery read Get_Delivery write Set_Delivery;
    property TrackStatus: WordBool read Get_TrackStatus write Set_TrackStatus;
    property Protect: WdProtectionType read Get_Protect write Set_Protect;
    property ReturnWhenDone: WordBool read Get_ReturnWhenDone write Set_ReturnWhenDone;
    property Status: WdRoutingSlipStatus read Get_Status;
    property Recipients[var Index: OleVariant]: OleVariant read Get_Recipients;
  end;

{ DispInterface declaration for Dual Interface RoutingSlip }

  RoutingSlipDisp = dispinterface
    ['{00020969-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property Subject: WideString dispid 1;
    property Message: WideString dispid 2;
    property Delivery: WdRoutingSlipDelivery dispid 3;
    property TrackStatus: WordBool dispid 4;
    property Protect: WdProtectionType dispid 5;
    property ReturnWhenDone: WordBool dispid 6;
    property Status: WdRoutingSlipStatus readonly dispid 7;
    property Recipients[var Index: OleVariant]: OleVariant readonly dispid 9;
    procedure Reset; dispid 101;
    procedure AddRecipient(const Recipient: WideString); dispid 102;
  end;

  Bookmark = interface(IDispatch)
    ['{00020968-0000-0000-C000-000000000046}']
    function Get_Name: WideString; safecall;
    function Get_Range: Range; safecall;
    function Get_Empty: WordBool; safecall;
    function Get_Start: Integer; safecall;
    procedure Set_Start(Value: Integer); safecall;
    function Get_End_: Integer; safecall;
    procedure Set_End_(Value: Integer); safecall;
    function Get_Column: WordBool; safecall;
    function Get_StoryType: WdStoryType; safecall;
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    procedure Select; safecall;
    procedure Delete; safecall;
    function Copy(const Name: WideString): Bookmark; safecall;
    property Name: WideString read Get_Name;
    property Range: Range read Get_Range;
    property Empty: WordBool read Get_Empty;
    property Start: Integer read Get_Start write Set_Start;
    property End_: Integer read Get_End_ write Set_End_;
    property Column: WordBool read Get_Column;
    property StoryType: WdStoryType read Get_StoryType;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
  end;

{ DispInterface declaration for Dual Interface Bookmark }

  BookmarkDisp = dispinterface
    ['{00020968-0000-0000-C000-000000000046}']
    property Name: WideString readonly dispid 0;
    property Range: Range readonly dispid 1;
    property Empty: WordBool readonly dispid 2;
    property Start: Integer dispid 3;
    property End_: Integer dispid 4;
    property Column: WordBool readonly dispid 5;
    property StoryType: WdStoryType readonly dispid 6;
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    procedure Select; dispid 65535;
    procedure Delete; dispid 11;
    function Copy(const Name: WideString): Bookmark; dispid 12;
  end;

  Bookmarks = interface(IDispatch)
    ['{00020967-0000-0000-C000-000000000046}']
    function Get__NewEnum: IUnknown; safecall;
    function Get_Count: Integer; safecall;
    function Get_DefaultSorting: WdBookmarkSortBy; safecall;
    procedure Set_DefaultSorting(Value: WdBookmarkSortBy); safecall;
    function Get_ShowHidden: WordBool; safecall;
    procedure Set_ShowHidden(Value: WordBool); safecall;
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Item(var Index: OleVariant): Bookmark; safecall;
    function Add(const Name: WideString; var Range: OleVariant): Bookmark; safecall;
    function Exists(const Name: WideString): WordBool; safecall;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Count: Integer read Get_Count;
    property DefaultSorting: WdBookmarkSortBy read Get_DefaultSorting write Set_DefaultSorting;
    property ShowHidden: WordBool read Get_ShowHidden write Set_ShowHidden;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
  end;

{ DispInterface declaration for Dual Interface Bookmarks }

  BookmarksDisp = dispinterface
    ['{00020967-0000-0000-C000-000000000046}']
    property _NewEnum: IUnknown readonly dispid -4;
    property Count: Integer readonly dispid 2;
    property DefaultSorting: WdBookmarkSortBy dispid 3;
    property ShowHidden: WordBool dispid 4;
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    function Item(var Index: OleVariant): Bookmark; dispid 0;
    function Add(const Name: WideString; var Range: OleVariant): Bookmark; dispid 5;
    function Exists(const Name: WideString): WordBool; dispid 6;
  end;

  Variable = interface(IDispatch)
    ['{00020966-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Name: WideString; safecall;
    function Get_Value: WideString; safecall;
    procedure Set_Value(const Value: WideString); safecall;
    function Get_Index: Integer; safecall;
    procedure Delete; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property Name: WideString read Get_Name;
    property Value: WideString read Get_Value write Set_Value;
    property Index: Integer read Get_Index;
  end;

{ DispInterface declaration for Dual Interface Variable }

  VariableDisp = dispinterface
    ['{00020966-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property Name: WideString readonly dispid 1;
    property Value: WideString dispid 0;
    property Index: Integer readonly dispid 2;
    procedure Delete; dispid 11;
  end;

  Variables = interface(IDispatch)
    ['{00020965-0000-0000-C000-000000000046}']
    function Get__NewEnum: IUnknown; safecall;
    function Get_Count: Integer; safecall;
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Item(var Index: OleVariant): Variable; safecall;
    function Add(const Name: WideString; var Value: OleVariant): Variable; safecall;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Count: Integer read Get_Count;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
  end;

{ DispInterface declaration for Dual Interface Variables }

  VariablesDisp = dispinterface
    ['{00020965-0000-0000-C000-000000000046}']
    property _NewEnum: IUnknown readonly dispid -4;
    property Count: Integer readonly dispid 2;
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    function Item(var Index: OleVariant): Variable; dispid 0;
    function Add(const Name: WideString; var Value: OleVariant): Variable; dispid 7;
  end;

  RecentFile = interface(IDispatch)
    ['{00020964-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Name: WideString; safecall;
    function Get_Index: Integer; safecall;
    function Get_ReadOnly: WordBool; safecall;
    procedure Set_ReadOnly(Value: WordBool); safecall;
    function Get_Path: WideString; safecall;
    function Open: Document; safecall;
    procedure Delete; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property Name: WideString read Get_Name;
    property Index: Integer read Get_Index;
    property ReadOnly: WordBool read Get_ReadOnly write Set_ReadOnly;
    property Path: WideString read Get_Path;
  end;

{ DispInterface declaration for Dual Interface RecentFile }

  RecentFileDisp = dispinterface
    ['{00020964-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property Name: WideString readonly dispid 0;
    property Index: Integer readonly dispid 1;
    property ReadOnly: WordBool dispid 2;
    property Path: WideString readonly dispid 3;
    function Open: Document; dispid 4;
    procedure Delete; dispid 5;
  end;

  RecentFiles = interface(IDispatch)
    ['{00020963-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get__NewEnum: IUnknown; safecall;
    function Get_Count: Integer; safecall;
    function Get_Maximum: Integer; safecall;
    procedure Set_Maximum(Value: Integer); safecall;
    function Item(Index: Integer): RecentFile; safecall;
    function Add(var Document, ReadOnly: OleVariant): RecentFile; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Count: Integer read Get_Count;
    property Maximum: Integer read Get_Maximum write Set_Maximum;
  end;

{ DispInterface declaration for Dual Interface RecentFiles }

  RecentFilesDisp = dispinterface
    ['{00020963-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property _NewEnum: IUnknown readonly dispid -4;
    property Count: Integer readonly dispid 1;
    property Maximum: Integer dispid 2;
    function Item(Index: Integer): RecentFile; dispid 0;
    function Add(var Document, ReadOnly: OleVariant): RecentFile; dispid 3;
  end;

  Window = interface(IDispatch)
    ['{00020962-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_ActivePane: Pane; safecall;
    function Get_Document: Document; safecall;
    function Get_Panes: Panes; safecall;
    function Get_Selection: Selection; safecall;
    function Get_Left: Integer; safecall;
    procedure Set_Left(Value: Integer); safecall;
    function Get_Top: Integer; safecall;
    procedure Set_Top(Value: Integer); safecall;
    function Get_Width: Integer; safecall;
    procedure Set_Width(Value: Integer); safecall;
    function Get_Height: Integer; safecall;
    procedure Set_Height(Value: Integer); safecall;
    function Get_Split: WordBool; safecall;
    procedure Set_Split(Value: WordBool); safecall;
    function Get_SplitVertical: Integer; safecall;
    procedure Set_SplitVertical(Value: Integer); safecall;
    function Get_Caption: WideString; safecall;
    procedure Set_Caption(const Value: WideString); safecall;
    function Get_WindowState: WdWindowState; safecall;
    procedure Set_WindowState(Value: WdWindowState); safecall;
    function Get_DisplayRulers: WordBool; safecall;
    procedure Set_DisplayRulers(Value: WordBool); safecall;
    function Get_DisplayVerticalRuler: WordBool; safecall;
    procedure Set_DisplayVerticalRuler(Value: WordBool); safecall;
    function Get_View: View; safecall;
    function Get_Type_: WdWindowType; safecall;
    function Get_Next: Window; safecall;
    function Get_Previous: Window; safecall;
    function Get_WindowNumber: Integer; safecall;
    function Get_DisplayVerticalScrollBar: WordBool; safecall;
    procedure Set_DisplayVerticalScrollBar(Value: WordBool); safecall;
    function Get_DisplayHorizontalScrollBar: WordBool; safecall;
    procedure Set_DisplayHorizontalScrollBar(Value: WordBool); safecall;
    function Get_StyleAreaWidth: Single; safecall;
    procedure Set_StyleAreaWidth(Value: Single); safecall;
    function Get_DisplayScreenTips: WordBool; safecall;
    procedure Set_DisplayScreenTips(Value: WordBool); safecall;
    function Get_HorizontalPercentScrolled: Integer; safecall;
    procedure Set_HorizontalPercentScrolled(Value: Integer); safecall;
    function Get_VerticalPercentScrolled: Integer; safecall;
    procedure Set_VerticalPercentScrolled(Value: Integer); safecall;
    function Get_DocumentMap: WordBool; safecall;
    procedure Set_DocumentMap(Value: WordBool); safecall;
    function Get_Active: WordBool; safecall;
    function Get_DocumentMapPercentWidth: Integer; safecall;
    procedure Set_DocumentMapPercentWidth(Value: Integer); safecall;
    function Get_Index: Integer; safecall;
    function Get_IMEMode: WdIMEMode; safecall;
    procedure Set_IMEMode(Value: WdIMEMode); safecall;
    procedure Activate; safecall;
    procedure Close(var SaveChanges, RouteDocument: OleVariant); safecall;
    procedure LargeScroll(var Down, Up, ToRight, ToLeft: OleVariant); safecall;
    procedure SmallScroll(var Down, Up, ToRight, ToLeft: OleVariant); safecall;
    function NewWindow: Window; safecall;
    procedure PrintOut(var Background, Append, Range, OutputFileName, From, To_, Item, Copies, Pages, PageType, PrintToFile, Collate, ActivePrinterMacGX, ManualDuplexPrint: OleVariant); safecall;
    procedure PageScroll(var Down, Up: OleVariant); safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property ActivePane: Pane read Get_ActivePane;
    property Document: Document read Get_Document;
    property Panes: Panes read Get_Panes;
    property Selection: Selection read Get_Selection;
    property Left: Integer read Get_Left write Set_Left;
    property Top: Integer read Get_Top write Set_Top;
    property Width: Integer read Get_Width write Set_Width;
    property Height: Integer read Get_Height write Set_Height;
    property Split: WordBool read Get_Split write Set_Split;
    property SplitVertical: Integer read Get_SplitVertical write Set_SplitVertical;
    property Caption: WideString read Get_Caption write Set_Caption;
    property WindowState: WdWindowState read Get_WindowState write Set_WindowState;
    property DisplayRulers: WordBool read Get_DisplayRulers write Set_DisplayRulers;
    property DisplayVerticalRuler: WordBool read Get_DisplayVerticalRuler write Set_DisplayVerticalRuler;
    property View: View read Get_View;
    property Type_: WdWindowType read Get_Type_;
    property Next: Window read Get_Next;
    property Previous: Window read Get_Previous;
    property WindowNumber: Integer read Get_WindowNumber;
    property DisplayVerticalScrollBar: WordBool read Get_DisplayVerticalScrollBar write Set_DisplayVerticalScrollBar;
    property DisplayHorizontalScrollBar: WordBool read Get_DisplayHorizontalScrollBar write Set_DisplayHorizontalScrollBar;
    property StyleAreaWidth: Single read Get_StyleAreaWidth write Set_StyleAreaWidth;
    property DisplayScreenTips: WordBool read Get_DisplayScreenTips write Set_DisplayScreenTips;
    property HorizontalPercentScrolled: Integer read Get_HorizontalPercentScrolled write Set_HorizontalPercentScrolled;
    property VerticalPercentScrolled: Integer read Get_VerticalPercentScrolled write Set_VerticalPercentScrolled;
    property DocumentMap: WordBool read Get_DocumentMap write Set_DocumentMap;
    property Active: WordBool read Get_Active;
    property DocumentMapPercentWidth: Integer read Get_DocumentMapPercentWidth write Set_DocumentMapPercentWidth;
    property Index: Integer read Get_Index;
    property IMEMode: WdIMEMode read Get_IMEMode write Set_IMEMode;
  end;

{ DispInterface declaration for Dual Interface Window }

  WindowDisp = dispinterface
    ['{00020962-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property ActivePane: Pane readonly dispid 1;
    property Document: Document readonly dispid 2;
    property Panes: Panes readonly dispid 3;
    property Selection: Selection readonly dispid 4;
    property Left: Integer dispid 5;
    property Top: Integer dispid 6;
    property Width: Integer dispid 7;
    property Height: Integer dispid 8;
    property Split: WordBool dispid 9;
    property SplitVertical: Integer dispid 10;
    property Caption: WideString dispid 0;
    property WindowState: WdWindowState dispid 11;
    property DisplayRulers: WordBool dispid 12;
    property DisplayVerticalRuler: WordBool dispid 13;
    property View: View readonly dispid 14;
    property Type_: WdWindowType readonly dispid 15;
    property Next: Window readonly dispid 16;
    property Previous: Window readonly dispid 17;
    property WindowNumber: Integer readonly dispid 18;
    property DisplayVerticalScrollBar: WordBool dispid 19;
    property DisplayHorizontalScrollBar: WordBool dispid 20;
    property StyleAreaWidth: Single dispid 21;
    property DisplayScreenTips: WordBool dispid 22;
    property HorizontalPercentScrolled: Integer dispid 23;
    property VerticalPercentScrolled: Integer dispid 24;
    property DocumentMap: WordBool dispid 25;
    property Active: WordBool readonly dispid 26;
    property DocumentMapPercentWidth: Integer dispid 27;
    property Index: Integer readonly dispid 28;
    property IMEMode: WdIMEMode dispid 30;
    procedure Activate; dispid 100;
    procedure Close(var SaveChanges, RouteDocument: OleVariant); dispid 102;
    procedure LargeScroll(var Down, Up, ToRight, ToLeft: OleVariant); dispid 103;
    procedure SmallScroll(var Down, Up, ToRight, ToLeft: OleVariant); dispid 104;
    function NewWindow: Window; dispid 105;
    procedure PrintOut(var Background, Append, Range, OutputFileName, From, To_, Item, Copies, Pages, PageType, PrintToFile, Collate, ActivePrinterMacGX, ManualDuplexPrint: OleVariant); dispid 107;
    procedure PageScroll(var Down, Up: OleVariant); dispid 108;
  end;

  Windows = interface(IDispatch)
    ['{00020961-0000-0000-C000-000000000046}']
    function Get__NewEnum: IUnknown; safecall;
    function Get_Count: Integer; safecall;
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Item(var Index: OleVariant): Window; safecall;
    function Add(var Window: OleVariant): Window; safecall;
    procedure Arrange(var ArrangeStyle: OleVariant); safecall;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Count: Integer read Get_Count;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
  end;

{ DispInterface declaration for Dual Interface Windows }

  WindowsDisp = dispinterface
    ['{00020961-0000-0000-C000-000000000046}']
    property _NewEnum: IUnknown readonly dispid -4;
    property Count: Integer readonly dispid 2;
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    function Item(var Index: OleVariant): Window; dispid 0;
    function Add(var Window: OleVariant): Window; dispid 10;
    procedure Arrange(var ArrangeStyle: OleVariant); dispid 11;
  end;

  Pane = interface(IDispatch)
    ['{00020960-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Document: Document; safecall;
    function Get_Selection: Selection; safecall;
    function Get_DisplayRulers: WordBool; safecall;
    procedure Set_DisplayRulers(Value: WordBool); safecall;
    function Get_DisplayVerticalRuler: WordBool; safecall;
    procedure Set_DisplayVerticalRuler(Value: WordBool); safecall;
    function Get_Zooms: Zooms; safecall;
    function Get_Index: Integer; safecall;
    function Get_View: View; safecall;
    function Get_Next: Pane; safecall;
    function Get_Previous: Pane; safecall;
    function Get_HorizontalPercentScrolled: Integer; safecall;
    procedure Set_HorizontalPercentScrolled(Value: Integer); safecall;
    function Get_VerticalPercentScrolled: Integer; safecall;
    procedure Set_VerticalPercentScrolled(Value: Integer); safecall;
    function Get_MinimumFontSize: Integer; safecall;
    procedure Set_MinimumFontSize(Value: Integer); safecall;
    function Get_BrowseToWindow: WordBool; safecall;
    procedure Set_BrowseToWindow(Value: WordBool); safecall;
    function Get_BrowseWidth: Integer; safecall;
    procedure Activate; safecall;
    procedure Close; safecall;
    procedure LargeScroll(var Down, Up, ToRight, ToLeft: OleVariant); safecall;
    procedure SmallScroll(var Down, Up, ToRight, ToLeft: OleVariant); safecall;
    procedure AutoScroll(Velocity: Integer); safecall;
    procedure PageScroll(var Down, Up: OleVariant); safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property Document: Document read Get_Document;
    property Selection: Selection read Get_Selection;
    property DisplayRulers: WordBool read Get_DisplayRulers write Set_DisplayRulers;
    property DisplayVerticalRuler: WordBool read Get_DisplayVerticalRuler write Set_DisplayVerticalRuler;
    property Zooms: Zooms read Get_Zooms;
    property Index: Integer read Get_Index;
    property View: View read Get_View;
    property Next: Pane read Get_Next;
    property Previous: Pane read Get_Previous;
    property HorizontalPercentScrolled: Integer read Get_HorizontalPercentScrolled write Set_HorizontalPercentScrolled;
    property VerticalPercentScrolled: Integer read Get_VerticalPercentScrolled write Set_VerticalPercentScrolled;
    property MinimumFontSize: Integer read Get_MinimumFontSize write Set_MinimumFontSize;
    property BrowseToWindow: WordBool read Get_BrowseToWindow write Set_BrowseToWindow;
    property BrowseWidth: Integer read Get_BrowseWidth;
  end;

{ DispInterface declaration for Dual Interface Pane }

  PaneDisp = dispinterface
    ['{00020960-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property Document: Document readonly dispid 1;
    property Selection: Selection readonly dispid 3;
    property DisplayRulers: WordBool dispid 4;
    property DisplayVerticalRuler: WordBool dispid 5;
    property Zooms: Zooms readonly dispid 7;
    property Index: Integer readonly dispid 9;
    property View: View readonly dispid 10;
    property Next: Pane readonly dispid 11;
    property Previous: Pane readonly dispid 12;
    property HorizontalPercentScrolled: Integer dispid 13;
    property VerticalPercentScrolled: Integer dispid 14;
    property MinimumFontSize: Integer dispid 15;
    property BrowseToWindow: WordBool dispid 16;
    property BrowseWidth: Integer readonly dispid 17;
    procedure Activate; dispid 100;
    procedure Close; dispid 101;
    procedure LargeScroll(var Down, Up, ToRight, ToLeft: OleVariant); dispid 102;
    procedure SmallScroll(var Down, Up, ToRight, ToLeft: OleVariant); dispid 103;
    procedure AutoScroll(Velocity: Integer); dispid 104;
    procedure PageScroll(var Down, Up: OleVariant); dispid 105;
  end;

  Panes = interface(IDispatch)
    ['{0002095F-0000-0000-C000-000000000046}']
    function Get__NewEnum: IUnknown; safecall;
    function Get_Count: Integer; safecall;
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Item(Index: Integer): Pane; safecall;
    function Add(var SplitVertical: OleVariant): Pane; safecall;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Count: Integer read Get_Count;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
  end;

{ DispInterface declaration for Dual Interface Panes }

  PanesDisp = dispinterface
    ['{0002095F-0000-0000-C000-000000000046}']
    property _NewEnum: IUnknown readonly dispid -4;
    property Count: Integer readonly dispid 2;
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    function Item(Index: Integer): Pane; dispid 0;
    function Add(var SplitVertical: OleVariant): Pane; dispid 3;
  end;

  Range = interface(IDispatch)
    ['{0002095E-0000-0000-C000-000000000046}']
    function Get_Text: WideString; safecall;
    procedure Set_Text(const Value: WideString); safecall;
    function Get_FormattedText: Range; safecall;
    procedure Set_FormattedText(const Value: Range); safecall;
    function Get_Start: Integer; safecall;
    procedure Set_Start(Value: Integer); safecall;
    function Get_End_: Integer; safecall;
    procedure Set_End_(Value: Integer); safecall;
    function Get_Font: Font; safecall;
    procedure Set_Font(const Value: Font); safecall;
    function Get_Duplicate: Range; safecall;
    function Get_StoryType: WdStoryType; safecall;
    function Get_Tables: Tables; safecall;
    function Get_Words: Words; safecall;
    function Get_Sentences: Sentences; safecall;
    function Get_Characters: Characters; safecall;
    function Get_Footnotes: Footnotes; safecall;
    function Get_Endnotes: Endnotes; safecall;
    function Get_Comments: Comments; safecall;
    function Get_Cells: Cells; safecall;
    function Get_Sections: Sections; safecall;
    function Get_Paragraphs: Paragraphs; safecall;
    function Get_Borders: Borders; safecall;
    procedure Set_Borders(const Value: Borders); safecall;
    function Get_Shading: Shading; safecall;
    function Get_TextRetrievalMode: TextRetrievalMode; safecall;
    procedure Set_TextRetrievalMode(const Value: TextRetrievalMode); safecall;
    function Get_Fields: Fields; safecall;
    function Get_FormFields: FormFields; safecall;
    function Get_Frames: Frames; safecall;
    function Get_ParagraphFormat: ParagraphFormat; safecall;
    procedure Set_ParagraphFormat(const Value: ParagraphFormat); safecall;
    function Get_ListFormat: ListFormat; safecall;
    function Get_Bookmarks: Bookmarks; safecall;
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Bold: Integer; safecall;
    procedure Set_Bold(Value: Integer); safecall;
    function Get_Italic: Integer; safecall;
    procedure Set_Italic(Value: Integer); safecall;
    function Get_Underline: WdUnderline; safecall;
    procedure Set_Underline(Value: WdUnderline); safecall;
    function Get_EmphasisMark: WdEmphasisMark; safecall;
    procedure Set_EmphasisMark(Value: WdEmphasisMark); safecall;
    function Get_DisableCharacterSpaceGrid: WordBool; safecall;
    procedure Set_DisableCharacterSpaceGrid(Value: WordBool); safecall;
    function Get_Revisions: Revisions; safecall;
    function Get_Style: OleVariant; safecall;
    procedure Set_Style(Value: OleVariant); safecall;
    function Get_StoryLength: Integer; safecall;
    function Get_LanguageID: WdLanguageID; safecall;
    procedure Set_LanguageID(Value: WdLanguageID); safecall;
    function Get_SynonymInfo: SynonymInfo; safecall;
    function Get_Hyperlinks: Hyperlinks; safecall;
    function Get_ListParagraphs: ListParagraphs; safecall;
    function Get_Subdocuments: Subdocuments; safecall;
    function Get_GrammarChecked: WordBool; safecall;
    procedure Set_GrammarChecked(Value: WordBool); safecall;
    function Get_SpellingChecked: WordBool; safecall;
    procedure Set_SpellingChecked(Value: WordBool); safecall;
    function Get_HighlightColorIndex: WdColorIndex; safecall;
    procedure Set_HighlightColorIndex(Value: WdColorIndex); safecall;
    function Get_Columns: Columns; safecall;
    function Get_Rows: Rows; safecall;
    function Get_CanEdit: Integer; safecall;
    function Get_CanPaste: Integer; safecall;
    function Get_IsEndOfRowMark: WordBool; safecall;
    function Get_BookmarkID: Integer; safecall;
    function Get_PreviousBookmarkID: Integer; safecall;
    function Get_Find: Find; safecall;
    function Get_PageSetup: PageSetup; safecall;
    procedure Set_PageSetup(const Value: PageSetup); safecall;
    function Get_ShapeRange: ShapeRange; safecall;
    function Get_Case_: WdCharacterCase; safecall;
    procedure Set_Case_(Value: WdCharacterCase); safecall;
    function Get_Information(Type_: WdInformation): OleVariant; safecall;
    function Get_ReadabilityStatistics: ReadabilityStatistics; safecall;
    function Get_GrammaticalErrors: ProofreadingErrors; safecall;
    function Get_SpellingErrors: ProofreadingErrors; safecall;
    function Get_Orientation: WdTextOrientation; safecall;
    procedure Set_Orientation(Value: WdTextOrientation); safecall;
    function Get_InlineShapes: InlineShapes; safecall;
    function Get_NextStoryRange: Range; safecall;
    function Get_LanguageIDFarEast: WdLanguageID; safecall;
    procedure Set_LanguageIDFarEast(Value: WdLanguageID); safecall;
    function Get_LanguageIDOther: WdLanguageID; safecall;
    procedure Set_LanguageIDOther(Value: WdLanguageID); safecall;
    procedure Select; safecall;
    procedure SetRange(Start, End_: Integer); safecall;
    procedure Collapse(var Direction: OleVariant); safecall;
    procedure InsertBefore(const Text: WideString); safecall;
    procedure InsertAfter(const Text: WideString); safecall;
    function Next(var Unit_, Count: OleVariant): Range; safecall;
    function Previous(var Unit_, Count: OleVariant): Range; safecall;
    function StartOf(var Unit_, Extend: OleVariant): Integer; safecall;
    function EndOf(var Unit_, Extend: OleVariant): Integer; safecall;
    function Move(var Unit_, Count: OleVariant): Integer; safecall;
    function MoveStart(var Unit_, Count: OleVariant): Integer; safecall;
    function MoveEnd(var Unit_, Count: OleVariant): Integer; safecall;
    function MoveWhile(var Cset, Count: OleVariant): Integer; safecall;
    function MoveStartWhile(var Cset, Count: OleVariant): Integer; safecall;
    function MoveEndWhile(var Cset, Count: OleVariant): Integer; safecall;
    function MoveUntil(var Cset, Count: OleVariant): Integer; safecall;
    function MoveStartUntil(var Cset, Count: OleVariant): Integer; safecall;
    function MoveEndUntil(var Cset, Count: OleVariant): Integer; safecall;
    procedure Cut; safecall;
    procedure Copy; safecall;
    procedure Paste; safecall;
    procedure InsertBreak(var Type_: OleVariant); safecall;
    procedure InsertFile(const FileName: WideString; var Range, ConfirmConversions, Link, Attachment: OleVariant); safecall;
    function InStory(const Range: Range): WordBool; safecall;
    function InRange(const Range: Range): WordBool; safecall;
    function Delete(var Unit_, Count: OleVariant): Integer; safecall;
    procedure WholeStory; safecall;
    function Expand(var Unit_: OleVariant): Integer; safecall;
    procedure InsertParagraph; safecall;
    procedure InsertParagraphAfter; safecall;
    function ConvertToTable(var Separator, NumRows, NumColumns, InitialColumnWidth, Format, ApplyBorders, ApplyShading, ApplyFont, ApplyColor, ApplyHeadingRows, ApplyLastRow, ApplyFirstColumn, ApplyLastColumn, AutoFit: OleVariant): Table; safecall;
    procedure InsertDateTime(var DateTimeFormat, InsertAsField, InsertAsFullWidth: OleVariant); safecall;
    procedure InsertSymbol(CharacterNumber: Integer; var Font, Unicode, Bias: OleVariant); safecall;
    procedure InsertCrossReference(var ReferenceType: OleVariant; ReferenceKind: WdReferenceKind; var ReferenceItem, InsertAsHyperlink, IncludePosition: OleVariant); safecall;
    procedure InsertCaption(var Label_, Title, TitleAutoText, Position: OleVariant); safecall;
    procedure CopyAsPicture; safecall;
    procedure Sort(var ExcludeHeader, FieldNumber, SortFieldType, SortOrder, FieldNumber2, SortFieldType2, SortOrder2, FieldNumber3, SortFieldType3, SortOrder3, SortColumn, Separator, CaseSensitive, LanguageID: OleVariant); safecall;
    procedure SortAscending; safecall;
    procedure SortDescending; safecall;
    function IsEqual(const Range: Range): WordBool; safecall;
    function Calculate: Single; safecall;
    function GoTo_(var What, Which, Count, Name: OleVariant): Range; safecall;
    function GoToNext(What: WdGoToItem): Range; safecall;
    function GoToPrevious(What: WdGoToItem): Range; safecall;
    procedure PasteSpecial(var IconIndex, Link, Placement, DisplayAsIcon, DataType, IconFileName, IconLabel: OleVariant); safecall;
    procedure LookupNameProperties; safecall;
    function ComputeStatistics(Statistic: WdStatistic): Integer; safecall;
    procedure Relocate(Direction: Integer); safecall;
    procedure CheckSynonyms; safecall;
    procedure SubscribeTo(const Edition: WideString; var Format: OleVariant); safecall;
    procedure CreatePublisher(var Edition, ContainsPICT, ContainsRTF, ContainsText: OleVariant); safecall;
    procedure InsertAutoText; safecall;
    procedure InsertDatabase(var Format, Style, LinkToSource, Connection, SQLStatement, SQLStatement1, PasswordDocument, PasswordTemplate, WritePasswordDocument, WritePasswordTemplate, DataSource, From, To_, IncludeFields: OleVariant); safecall;
    procedure AutoFormat; safecall;
    procedure CheckGrammar; safecall;
    procedure CheckSpelling(var CustomDictionary, IgnoreUppercase, AlwaysSuggest, CustomDictionary2, CustomDictionary3, CustomDictionary4, CustomDictionary5, CustomDictionary6, CustomDictionary7, CustomDictionary8, CustomDictionary9, CustomDictionary10: OleVariant); safecall;
    function GetSpellingSuggestions(var CustomDictionary, IgnoreUppercase, MainDictionary, SuggestionMode, CustomDictionary2, CustomDictionary3, CustomDictionary4, CustomDictionary5, CustomDictionary6, CustomDictionary7, CustomDictionary8, CustomDictionary9, CustomDictionary10: OleVariant): SpellingSuggestions; safecall;
    procedure InsertParagraphBefore; safecall;
    procedure NextSubdocument; safecall;
    procedure PreviousSubdocument; safecall;
    procedure ConvertHangulAndHanja(var ConversionsMode, FastConversion, CheckHangulEnding, EnableRecentOrdering, CustomDictionary: OleVariant); safecall;
    property Text: WideString read Get_Text write Set_Text;
    property FormattedText: Range read Get_FormattedText write Set_FormattedText;
    property Start: Integer read Get_Start write Set_Start;
    property End_: Integer read Get_End_ write Set_End_;
    property Font: Font read Get_Font write Set_Font;
    property Duplicate: Range read Get_Duplicate;
    property StoryType: WdStoryType read Get_StoryType;
    property Tables: Tables read Get_Tables;
    property Words: Words read Get_Words;
    property Sentences: Sentences read Get_Sentences;
    property Characters: Characters read Get_Characters;
    property Footnotes: Footnotes read Get_Footnotes;
    property Endnotes: Endnotes read Get_Endnotes;
    property Comments: Comments read Get_Comments;
    property Cells: Cells read Get_Cells;
    property Sections: Sections read Get_Sections;
    property Paragraphs: Paragraphs read Get_Paragraphs;
    property Borders: Borders read Get_Borders write Set_Borders;
    property Shading: Shading read Get_Shading;
    property TextRetrievalMode: TextRetrievalMode read Get_TextRetrievalMode write Set_TextRetrievalMode;
    property Fields: Fields read Get_Fields;
    property FormFields: FormFields read Get_FormFields;
    property Frames: Frames read Get_Frames;
    property ParagraphFormat: ParagraphFormat read Get_ParagraphFormat write Set_ParagraphFormat;
    property ListFormat: ListFormat read Get_ListFormat;
    property Bookmarks: Bookmarks read Get_Bookmarks;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property Bold: Integer read Get_Bold write Set_Bold;
    property Italic: Integer read Get_Italic write Set_Italic;
    property Underline: WdUnderline read Get_Underline write Set_Underline;
    property EmphasisMark: WdEmphasisMark read Get_EmphasisMark write Set_EmphasisMark;
    property DisableCharacterSpaceGrid: WordBool read Get_DisableCharacterSpaceGrid write Set_DisableCharacterSpaceGrid;
    property Revisions: Revisions read Get_Revisions;
    property Style: OleVariant read Get_Style write Set_Style;
    property StoryLength: Integer read Get_StoryLength;
    property LanguageID: WdLanguageID read Get_LanguageID write Set_LanguageID;
    property SynonymInfo: SynonymInfo read Get_SynonymInfo;
    property Hyperlinks: Hyperlinks read Get_Hyperlinks;
    property ListParagraphs: ListParagraphs read Get_ListParagraphs;
    property Subdocuments: Subdocuments read Get_Subdocuments;
    property GrammarChecked: WordBool read Get_GrammarChecked write Set_GrammarChecked;
    property SpellingChecked: WordBool read Get_SpellingChecked write Set_SpellingChecked;
    property HighlightColorIndex: WdColorIndex read Get_HighlightColorIndex write Set_HighlightColorIndex;
    property Columns: Columns read Get_Columns;
    property Rows: Rows read Get_Rows;
    property CanEdit: Integer read Get_CanEdit;
    property CanPaste: Integer read Get_CanPaste;
    property IsEndOfRowMark: WordBool read Get_IsEndOfRowMark;
    property BookmarkID: Integer read Get_BookmarkID;
    property PreviousBookmarkID: Integer read Get_PreviousBookmarkID;
    property Find: Find read Get_Find;
    property PageSetup: PageSetup read Get_PageSetup write Set_PageSetup;
    property ShapeRange: ShapeRange read Get_ShapeRange;
    property Case_: WdCharacterCase read Get_Case_ write Set_Case_;
    property Information[Type_: WdInformation]: OleVariant read Get_Information;
    property ReadabilityStatistics: ReadabilityStatistics read Get_ReadabilityStatistics;
    property GrammaticalErrors: ProofreadingErrors read Get_GrammaticalErrors;
    property SpellingErrors: ProofreadingErrors read Get_SpellingErrors;
    property Orientation: WdTextOrientation read Get_Orientation write Set_Orientation;
    property InlineShapes: InlineShapes read Get_InlineShapes;
    property NextStoryRange: Range read Get_NextStoryRange;
    property LanguageIDFarEast: WdLanguageID read Get_LanguageIDFarEast write Set_LanguageIDFarEast;
    property LanguageIDOther: WdLanguageID read Get_LanguageIDOther write Set_LanguageIDOther;
  end;

{ DispInterface declaration for Dual Interface Range }

  RangeDisp = dispinterface
    ['{0002095E-0000-0000-C000-000000000046}']
    property Text: WideString dispid 0;
    property FormattedText: Range dispid 2;
    property Start: Integer dispid 3;
    property End_: Integer dispid 4;
    property Font: Font dispid 5;
    property Duplicate: Range readonly dispid 6;
    property StoryType: WdStoryType readonly dispid 7;
    property Tables: Tables readonly dispid 50;
    property Words: Words readonly dispid 51;
    property Sentences: Sentences readonly dispid 52;
    property Characters: Characters readonly dispid 53;
    property Footnotes: Footnotes readonly dispid 54;
    property Endnotes: Endnotes readonly dispid 55;
    property Comments: Comments readonly dispid 56;
    property Cells: Cells readonly dispid 57;
    property Sections: Sections readonly dispid 58;
    property Paragraphs: Paragraphs readonly dispid 59;
    property Borders: Borders dispid 1100;
    property Shading: Shading readonly dispid 61;
    property TextRetrievalMode: TextRetrievalMode dispid 62;
    property Fields: Fields readonly dispid 64;
    property FormFields: FormFields readonly dispid 65;
    property Frames: Frames readonly dispid 66;
    property ParagraphFormat: ParagraphFormat dispid 1102;
    property ListFormat: ListFormat readonly dispid 68;
    property Bookmarks: Bookmarks readonly dispid 75;
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property Bold: Integer dispid 130;
    property Italic: Integer dispid 131;
    property Underline: WdUnderline dispid 139;
    property EmphasisMark: WdEmphasisMark dispid 140;
    property DisableCharacterSpaceGrid: WordBool dispid 141;
    property Revisions: Revisions readonly dispid 150;
    property Style: OleVariant dispid 151;
    property StoryLength: Integer readonly dispid 152;
    property LanguageID: WdLanguageID dispid 153;
    property SynonymInfo: SynonymInfo readonly dispid 155;
    property Hyperlinks: Hyperlinks readonly dispid 156;
    property ListParagraphs: ListParagraphs readonly dispid 157;
    property Subdocuments: Subdocuments readonly dispid 159;
    property GrammarChecked: WordBool dispid 260;
    property SpellingChecked: WordBool dispid 261;
    property HighlightColorIndex: WdColorIndex dispid 301;
    property Columns: Columns readonly dispid 302;
    property Rows: Rows readonly dispid 303;
    property CanEdit: Integer readonly dispid 304;
    property CanPaste: Integer readonly dispid 305;
    property IsEndOfRowMark: WordBool readonly dispid 307;
    property BookmarkID: Integer readonly dispid 308;
    property PreviousBookmarkID: Integer readonly dispid 309;
    property Find: Find readonly dispid 262;
    property PageSetup: PageSetup dispid 1101;
    property ShapeRange: ShapeRange readonly dispid 311;
    property Case_: WdCharacterCase dispid 312;
    property Information[Type_: WdInformation]: OleVariant readonly dispid 313;
    property ReadabilityStatistics: ReadabilityStatistics readonly dispid 314;
    property GrammaticalErrors: ProofreadingErrors readonly dispid 315;
    property SpellingErrors: ProofreadingErrors readonly dispid 316;
    property Orientation: WdTextOrientation dispid 317;
    property InlineShapes: InlineShapes readonly dispid 319;
    property NextStoryRange: Range readonly dispid 320;
    property LanguageIDFarEast: WdLanguageID dispid 321;
    property LanguageIDOther: WdLanguageID dispid 322;
    procedure Select; dispid 65535;
    procedure SetRange(Start, End_: Integer); dispid 100;
    procedure Collapse(var Direction: OleVariant); dispid 101;
    procedure InsertBefore(const Text: WideString); dispid 102;
    procedure InsertAfter(const Text: WideString); dispid 104;
    function Next(var Unit_, Count: OleVariant): Range; dispid 105;
    function Previous(var Unit_, Count: OleVariant): Range; dispid 106;
    function StartOf(var Unit_, Extend: OleVariant): Integer; dispid 107;
    function EndOf(var Unit_, Extend: OleVariant): Integer; dispid 108;
    function Move(var Unit_, Count: OleVariant): Integer; dispid 109;
    function MoveStart(var Unit_, Count: OleVariant): Integer; dispid 110;
    function MoveEnd(var Unit_, Count: OleVariant): Integer; dispid 111;
    function MoveWhile(var Cset, Count: OleVariant): Integer; dispid 112;
    function MoveStartWhile(var Cset, Count: OleVariant): Integer; dispid 113;
    function MoveEndWhile(var Cset, Count: OleVariant): Integer; dispid 114;
    function MoveUntil(var Cset, Count: OleVariant): Integer; dispid 115;
    function MoveStartUntil(var Cset, Count: OleVariant): Integer; dispid 116;
    function MoveEndUntil(var Cset, Count: OleVariant): Integer; dispid 117;
    procedure Cut; dispid 119;
    procedure Copy; dispid 120;
    procedure Paste; dispid 121;
    procedure InsertBreak(var Type_: OleVariant); dispid 122;
    procedure InsertFile(const FileName: WideString; var Range, ConfirmConversions, Link, Attachment: OleVariant); dispid 123;
    function InStory(const Range: Range): WordBool; dispid 125;
    function InRange(const Range: Range): WordBool; dispid 126;
    function Delete(var Unit_, Count: OleVariant): Integer; dispid 127;
    procedure WholeStory; dispid 128;
    function Expand(var Unit_: OleVariant): Integer; dispid 129;
    procedure InsertParagraph; dispid 160;
    procedure InsertParagraphAfter; dispid 161;
    function ConvertToTable(var Separator, NumRows, NumColumns, InitialColumnWidth, Format, ApplyBorders, ApplyShading, ApplyFont, ApplyColor, ApplyHeadingRows, ApplyLastRow, ApplyFirstColumn, ApplyLastColumn, AutoFit: OleVariant): Table; dispid 162;
    procedure InsertDateTime(var DateTimeFormat, InsertAsField, InsertAsFullWidth: OleVariant); dispid 163;
    procedure InsertSymbol(CharacterNumber: Integer; var Font, Unicode, Bias: OleVariant); dispid 164;
    procedure InsertCrossReference(var ReferenceType: OleVariant; ReferenceKind: WdReferenceKind; var ReferenceItem, InsertAsHyperlink, IncludePosition: OleVariant); dispid 165;
    procedure InsertCaption(var Label_, Title, TitleAutoText, Position: OleVariant); dispid 166;
    procedure CopyAsPicture; dispid 167;
    procedure Sort(var ExcludeHeader, FieldNumber, SortFieldType, SortOrder, FieldNumber2, SortFieldType2, SortOrder2, FieldNumber3, SortFieldType3, SortOrder3, SortColumn, Separator, CaseSensitive, LanguageID: OleVariant); dispid 168;
    procedure SortAscending; dispid 169;
    procedure SortDescending; dispid 170;
    function IsEqual(const Range: Range): WordBool; dispid 171;
    function Calculate: Single; dispid 172;
    function GoTo_(var What, Which, Count, Name: OleVariant): Range; dispid 173;
    function GoToNext(What: WdGoToItem): Range; dispid 174;
    function GoToPrevious(What: WdGoToItem): Range; dispid 175;
    procedure PasteSpecial(var IconIndex, Link, Placement, DisplayAsIcon, DataType, IconFileName, IconLabel: OleVariant); dispid 176;
    procedure LookupNameProperties; dispid 177;
    function ComputeStatistics(Statistic: WdStatistic): Integer; dispid 178;
    procedure Relocate(Direction: Integer); dispid 179;
    procedure CheckSynonyms; dispid 180;
    procedure SubscribeTo(const Edition: WideString; var Format: OleVariant); dispid 181;
    procedure CreatePublisher(var Edition, ContainsPICT, ContainsRTF, ContainsText: OleVariant); dispid 182;
    procedure InsertAutoText; dispid 183;
    procedure InsertDatabase(var Format, Style, LinkToSource, Connection, SQLStatement, SQLStatement1, PasswordDocument, PasswordTemplate, WritePasswordDocument, WritePasswordTemplate, DataSource, From, To_, IncludeFields: OleVariant); dispid 194;
    procedure AutoFormat; dispid 195;
    procedure CheckGrammar; dispid 204;
    procedure CheckSpelling(var CustomDictionary, IgnoreUppercase, AlwaysSuggest, CustomDictionary2, CustomDictionary3, CustomDictionary4, CustomDictionary5, CustomDictionary6, CustomDictionary7, CustomDictionary8, CustomDictionary9, CustomDictionary10: OleVariant); dispid 205;
    function GetSpellingSuggestions(var CustomDictionary, IgnoreUppercase, MainDictionary, SuggestionMode, CustomDictionary2, CustomDictionary3, CustomDictionary4, CustomDictionary5, CustomDictionary6, CustomDictionary7, CustomDictionary8, CustomDictionary9, CustomDictionary10: OleVariant): SpellingSuggestions; dispid 209;
    procedure InsertParagraphBefore; dispid 212;
    procedure NextSubdocument; dispid 219;
    procedure PreviousSubdocument; dispid 220;
    procedure ConvertHangulAndHanja(var ConversionsMode, FastConversion, CheckHangulEnding, EnableRecentOrdering, CustomDictionary: OleVariant); dispid 221;
  end;

  ListFormat = interface(IDispatch)
    ['{000209C0-0000-0000-C000-000000000046}']
    function Get_ListLevelNumber: Integer; safecall;
    procedure Set_ListLevelNumber(Value: Integer); safecall;
    function Get_List: List; safecall;
    function Get_ListTemplate: ListTemplate; safecall;
    function Get_ListValue: Integer; safecall;
    function Get_SingleList: WordBool; safecall;
    function Get_SingleListTemplate: WordBool; safecall;
    function Get_ListType: WdListType; safecall;
    function Get_ListString: WideString; safecall;
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function CanContinuePreviousList(const ListTemplate: ListTemplate): WdContinue; safecall;
    procedure RemoveNumbers(var NumberType: OleVariant); safecall;
    procedure ConvertNumbersToText(var NumberType: OleVariant); safecall;
    function CountNumberedItems(var NumberType, Level: OleVariant): Integer; safecall;
    procedure ApplyBulletDefault; safecall;
    procedure ApplyNumberDefault; safecall;
    procedure ApplyOutlineNumberDefault; safecall;
    procedure ApplyListTemplate(const ListTemplate: ListTemplate; var ContinuePreviousList, ApplyTo: OleVariant); safecall;
    procedure ListOutdent; safecall;
    procedure ListIndent; safecall;
    property ListLevelNumber: Integer read Get_ListLevelNumber write Set_ListLevelNumber;
    property List: List read Get_List;
    property ListTemplate: ListTemplate read Get_ListTemplate;
    property ListValue: Integer read Get_ListValue;
    property SingleList: WordBool read Get_SingleList;
    property SingleListTemplate: WordBool read Get_SingleListTemplate;
    property ListType: WdListType read Get_ListType;
    property ListString: WideString read Get_ListString;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
  end;

{ DispInterface declaration for Dual Interface ListFormat }

  ListFormatDisp = dispinterface
    ['{000209C0-0000-0000-C000-000000000046}']
    property ListLevelNumber: Integer dispid 68;
    property List: List readonly dispid 69;
    property ListTemplate: ListTemplate readonly dispid 70;
    property ListValue: Integer readonly dispid 71;
    property SingleList: WordBool readonly dispid 72;
    property SingleListTemplate: WordBool readonly dispid 73;
    property ListType: WdListType readonly dispid 74;
    property ListString: WideString readonly dispid 75;
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    function CanContinuePreviousList(const ListTemplate: ListTemplate): WdContinue; dispid 184;
    procedure RemoveNumbers(var NumberType: OleVariant); dispid 185;
    procedure ConvertNumbersToText(var NumberType: OleVariant); dispid 186;
    function CountNumberedItems(var NumberType, Level: OleVariant): Integer; dispid 187;
    procedure ApplyBulletDefault; dispid 188;
    procedure ApplyNumberDefault; dispid 189;
    procedure ApplyOutlineNumberDefault; dispid 190;
    procedure ApplyListTemplate(const ListTemplate: ListTemplate; var ContinuePreviousList, ApplyTo: OleVariant); dispid 191;
    procedure ListOutdent; dispid 210;
    procedure ListIndent; dispid 211;
  end;

  Find = interface(IDispatch)
    ['{000209B0-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Forward: WordBool; safecall;
    procedure Set_Forward(Value: WordBool); safecall;
    function Get_Font: Font; safecall;
    procedure Set_Font(const Value: Font); safecall;
    function Get_Found: WordBool; safecall;
    function Get_MatchAllWordForms: WordBool; safecall;
    procedure Set_MatchAllWordForms(Value: WordBool); safecall;
    function Get_MatchCase: WordBool; safecall;
    procedure Set_MatchCase(Value: WordBool); safecall;
    function Get_MatchWildcards: WordBool; safecall;
    procedure Set_MatchWildcards(Value: WordBool); safecall;
    function Get_MatchSoundsLike: WordBool; safecall;
    procedure Set_MatchSoundsLike(Value: WordBool); safecall;
    function Get_MatchWholeWord: WordBool; safecall;
    procedure Set_MatchWholeWord(Value: WordBool); safecall;
    function Get_MatchFuzzy: WordBool; safecall;
    procedure Set_MatchFuzzy(Value: WordBool); safecall;
    function Get_MatchByte: WordBool; safecall;
    procedure Set_MatchByte(Value: WordBool); safecall;
    function Get_ParagraphFormat: ParagraphFormat; safecall;
    procedure Set_ParagraphFormat(const Value: ParagraphFormat); safecall;
    function Get_Style: OleVariant; safecall;
    procedure Set_Style(Value: OleVariant); safecall;
    function Get_Text: WideString; safecall;
    procedure Set_Text(const Value: WideString); safecall;
    function Get_LanguageID: WdLanguageID; safecall;
    procedure Set_LanguageID(Value: WdLanguageID); safecall;
    function Get_Highlight: Integer; safecall;
    procedure Set_Highlight(Value: Integer); safecall;
    function Get_Replacement: Replacement; safecall;
    function Get_Frame: Frame; safecall;
    function Get_Wrap: WdFindWrap; safecall;
    procedure Set_Wrap(Value: WdFindWrap); safecall;
    function Get_Format: WordBool; safecall;
    procedure Set_Format(Value: WordBool); safecall;
    function Get_LanguageIDFarEast: WdLanguageID; safecall;
    procedure Set_LanguageIDFarEast(Value: WdLanguageID); safecall;
    function Get_LanguageIDOther: WdLanguageID; safecall;
    procedure Set_LanguageIDOther(Value: WdLanguageID); safecall;
    function Get_CorrectHangulEndings: WordBool; safecall;
    procedure Set_CorrectHangulEndings(Value: WordBool); safecall;
    function Execute(var FindText, MatchCase, MatchWholeWord, MatchWildcards, MatchSoundsLike, MatchAllWordForms, Forward, Wrap, Format, ReplaceWith, Replace: OleVariant): WordBool; safecall;
    procedure ClearFormatting; safecall;
    procedure SetAllFuzzyOptions; safecall;
    procedure ClearAllFuzzyOptions; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property Forward: WordBool read Get_Forward write Set_Forward;
    property Font: Font read Get_Font write Set_Font;
    property Found: WordBool read Get_Found;
    property MatchAllWordForms: WordBool read Get_MatchAllWordForms write Set_MatchAllWordForms;
    property MatchCase: WordBool read Get_MatchCase write Set_MatchCase;
    property MatchWildcards: WordBool read Get_MatchWildcards write Set_MatchWildcards;
    property MatchSoundsLike: WordBool read Get_MatchSoundsLike write Set_MatchSoundsLike;
    property MatchWholeWord: WordBool read Get_MatchWholeWord write Set_MatchWholeWord;
    property MatchFuzzy: WordBool read Get_MatchFuzzy write Set_MatchFuzzy;
    property MatchByte: WordBool read Get_MatchByte write Set_MatchByte;
    property ParagraphFormat: ParagraphFormat read Get_ParagraphFormat write Set_ParagraphFormat;
    property Style: OleVariant read Get_Style write Set_Style;
    property Text: WideString read Get_Text write Set_Text;
    property LanguageID: WdLanguageID read Get_LanguageID write Set_LanguageID;
    property Highlight: Integer read Get_Highlight write Set_Highlight;
    property Replacement: Replacement read Get_Replacement;
    property Frame: Frame read Get_Frame;
    property Wrap: WdFindWrap read Get_Wrap write Set_Wrap;
    property Format: WordBool read Get_Format write Set_Format;
    property LanguageIDFarEast: WdLanguageID read Get_LanguageIDFarEast write Set_LanguageIDFarEast;
    property LanguageIDOther: WdLanguageID read Get_LanguageIDOther write Set_LanguageIDOther;
    property CorrectHangulEndings: WordBool read Get_CorrectHangulEndings write Set_CorrectHangulEndings;
  end;

{ DispInterface declaration for Dual Interface Find }

  FindDisp = dispinterface
    ['{000209B0-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property Forward: WordBool dispid 10;
    property Font: Font dispid 11;
    property Found: WordBool readonly dispid 12;
    property MatchAllWordForms: WordBool dispid 13;
    property MatchCase: WordBool dispid 14;
    property MatchWildcards: WordBool dispid 15;
    property MatchSoundsLike: WordBool dispid 16;
    property MatchWholeWord: WordBool dispid 17;
    property MatchFuzzy: WordBool dispid 40;
    property MatchByte: WordBool dispid 41;
    property ParagraphFormat: ParagraphFormat dispid 18;
    property Style: OleVariant dispid 19;
    property Text: WideString dispid 22;
    property LanguageID: WdLanguageID dispid 23;
    property Highlight: Integer dispid 24;
    property Replacement: Replacement readonly dispid 25;
    property Frame: Frame readonly dispid 26;
    property Wrap: WdFindWrap dispid 27;
    property Format: WordBool dispid 28;
    property LanguageIDFarEast: WdLanguageID dispid 29;
    property LanguageIDOther: WdLanguageID dispid 60;
    property CorrectHangulEndings: WordBool dispid 61;
    function Execute(var FindText, MatchCase, MatchWholeWord, MatchWildcards, MatchSoundsLike, MatchAllWordForms, Forward, Wrap, Format, ReplaceWith, Replace: OleVariant): WordBool; dispid 30;
    procedure ClearFormatting; dispid 31;
    procedure SetAllFuzzyOptions; dispid 32;
    procedure ClearAllFuzzyOptions; dispid 33;
  end;

  Replacement = interface(IDispatch)
    ['{000209B1-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Font: Font; safecall;
    procedure Set_Font(const Value: Font); safecall;
    function Get_ParagraphFormat: ParagraphFormat; safecall;
    procedure Set_ParagraphFormat(const Value: ParagraphFormat); safecall;
    function Get_Style: OleVariant; safecall;
    procedure Set_Style(Value: OleVariant); safecall;
    function Get_Text: WideString; safecall;
    procedure Set_Text(const Value: WideString); safecall;
    function Get_LanguageID: WdLanguageID; safecall;
    procedure Set_LanguageID(Value: WdLanguageID); safecall;
    function Get_Highlight: Integer; safecall;
    procedure Set_Highlight(Value: Integer); safecall;
    function Get_Frame: Frame; safecall;
    function Get_LanguageIDFarEast: WdLanguageID; safecall;
    procedure Set_LanguageIDFarEast(Value: WdLanguageID); safecall;
    procedure ClearFormatting; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property Font: Font read Get_Font write Set_Font;
    property ParagraphFormat: ParagraphFormat read Get_ParagraphFormat write Set_ParagraphFormat;
    property Style: OleVariant read Get_Style write Set_Style;
    property Text: WideString read Get_Text write Set_Text;
    property LanguageID: WdLanguageID read Get_LanguageID write Set_LanguageID;
    property Highlight: Integer read Get_Highlight write Set_Highlight;
    property Frame: Frame read Get_Frame;
    property LanguageIDFarEast: WdLanguageID read Get_LanguageIDFarEast write Set_LanguageIDFarEast;
  end;

{ DispInterface declaration for Dual Interface Replacement }

  ReplacementDisp = dispinterface
    ['{000209B1-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property Font: Font dispid 10;
    property ParagraphFormat: ParagraphFormat dispid 11;
    property Style: OleVariant dispid 12;
    property Text: WideString dispid 15;
    property LanguageID: WdLanguageID dispid 16;
    property Highlight: Integer dispid 17;
    property Frame: Frame readonly dispid 18;
    property LanguageIDFarEast: WdLanguageID dispid 19;
    procedure ClearFormatting; dispid 20;
  end;

  Characters = interface(IDispatch)
    ['{0002095D-0000-0000-C000-000000000046}']
    function Get__NewEnum: IUnknown; safecall;
    function Get_Count: Integer; safecall;
    function Get_First: Range; safecall;
    function Get_Last: Range; safecall;
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Item(Index: Integer): Range; safecall;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Count: Integer read Get_Count;
    property First: Range read Get_First;
    property Last: Range read Get_Last;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
  end;

{ DispInterface declaration for Dual Interface Characters }

  CharactersDisp = dispinterface
    ['{0002095D-0000-0000-C000-000000000046}']
    property _NewEnum: IUnknown readonly dispid -4;
    property Count: Integer readonly dispid 2;
    property First: Range readonly dispid 3;
    property Last: Range readonly dispid 4;
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    function Item(Index: Integer): Range; dispid 0;
  end;

  Words = interface(IDispatch)
    ['{0002095C-0000-0000-C000-000000000046}']
    function Get__NewEnum: IUnknown; safecall;
    function Get_Count: Integer; safecall;
    function Get_First: Range; safecall;
    function Get_Last: Range; safecall;
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Item(Index: Integer): Range; safecall;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Count: Integer read Get_Count;
    property First: Range read Get_First;
    property Last: Range read Get_Last;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
  end;

{ DispInterface declaration for Dual Interface Words }

  WordsDisp = dispinterface
    ['{0002095C-0000-0000-C000-000000000046}']
    property _NewEnum: IUnknown readonly dispid -4;
    property Count: Integer readonly dispid 2;
    property First: Range readonly dispid 3;
    property Last: Range readonly dispid 4;
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    function Item(Index: Integer): Range; dispid 0;
  end;

  Sentences = interface(IDispatch)
    ['{0002095B-0000-0000-C000-000000000046}']
    function Get__NewEnum: IUnknown; safecall;
    function Get_Count: Integer; safecall;
    function Get_First: Range; safecall;
    function Get_Last: Range; safecall;
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Item(Index: Integer): Range; safecall;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Count: Integer read Get_Count;
    property First: Range read Get_First;
    property Last: Range read Get_Last;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
  end;

{ DispInterface declaration for Dual Interface Sentences }

  SentencesDisp = dispinterface
    ['{0002095B-0000-0000-C000-000000000046}']
    property _NewEnum: IUnknown readonly dispid -4;
    property Count: Integer readonly dispid 2;
    property First: Range readonly dispid 3;
    property Last: Range readonly dispid 4;
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    function Item(Index: Integer): Range; dispid 0;
  end;

  Sections = interface(IDispatch)
    ['{0002095A-0000-0000-C000-000000000046}']
    function Get__NewEnum: IUnknown; safecall;
    function Get_Count: Integer; safecall;
    function Get_First: Section; safecall;
    function Get_Last: Section; safecall;
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_PageSetup: PageSetup; safecall;
    procedure Set_PageSetup(const Value: PageSetup); safecall;
    function Item(Index: Integer): Section; safecall;
    function Add(var Range, Start: OleVariant): Section; safecall;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Count: Integer read Get_Count;
    property First: Section read Get_First;
    property Last: Section read Get_Last;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property PageSetup: PageSetup read Get_PageSetup write Set_PageSetup;
  end;

{ DispInterface declaration for Dual Interface Sections }

  SectionsDisp = dispinterface
    ['{0002095A-0000-0000-C000-000000000046}']
    property _NewEnum: IUnknown readonly dispid -4;
    property Count: Integer readonly dispid 2;
    property First: Section readonly dispid 3;
    property Last: Section readonly dispid 4;
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property PageSetup: PageSetup dispid 1101;
    function Item(Index: Integer): Section; dispid 0;
    function Add(var Range, Start: OleVariant): Section; dispid 5;
  end;

  Section = interface(IDispatch)
    ['{00020959-0000-0000-C000-000000000046}']
    function Get_Range: Range; safecall;
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_PageSetup: PageSetup; safecall;
    procedure Set_PageSetup(const Value: PageSetup); safecall;
    function Get_Headers: HeadersFooters; safecall;
    function Get_Footers: HeadersFooters; safecall;
    function Get_ProtectedForForms: WordBool; safecall;
    procedure Set_ProtectedForForms(Value: WordBool); safecall;
    function Get_Index: Integer; safecall;
    function Get_Borders: Borders; safecall;
    procedure Set_Borders(const Value: Borders); safecall;
    property Range: Range read Get_Range;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property PageSetup: PageSetup read Get_PageSetup write Set_PageSetup;
    property Headers: HeadersFooters read Get_Headers;
    property Footers: HeadersFooters read Get_Footers;
    property ProtectedForForms: WordBool read Get_ProtectedForForms write Set_ProtectedForForms;
    property Index: Integer read Get_Index;
    property Borders: Borders read Get_Borders write Set_Borders;
  end;

{ DispInterface declaration for Dual Interface Section }

  SectionDisp = dispinterface
    ['{00020959-0000-0000-C000-000000000046}']
    property Range: Range readonly dispid 0;
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property PageSetup: PageSetup dispid 1101;
    property Headers: HeadersFooters readonly dispid 121;
    property Footers: HeadersFooters readonly dispid 122;
    property ProtectedForForms: WordBool dispid 123;
    property Index: Integer readonly dispid 124;
    property Borders: Borders dispid 1100;
  end;

  Paragraphs = interface(IDispatch)
    ['{00020958-0000-0000-C000-000000000046}']
    function Get__NewEnum: IUnknown; safecall;
    function Get_Count: Integer; safecall;
    function Get_First: Paragraph; safecall;
    function Get_Last: Paragraph; safecall;
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Format: ParagraphFormat; safecall;
    procedure Set_Format(const Value: ParagraphFormat); safecall;
    function Get_TabStops: TabStops; safecall;
    procedure Set_TabStops(const Value: TabStops); safecall;
    function Get_Borders: Borders; safecall;
    procedure Set_Borders(const Value: Borders); safecall;
    function Get_Style: OleVariant; safecall;
    procedure Set_Style(Value: OleVariant); safecall;
    function Get_Alignment: WdParagraphAlignment; safecall;
    procedure Set_Alignment(Value: WdParagraphAlignment); safecall;
    function Get_KeepTogether: Integer; safecall;
    procedure Set_KeepTogether(Value: Integer); safecall;
    function Get_KeepWithNext: Integer; safecall;
    procedure Set_KeepWithNext(Value: Integer); safecall;
    function Get_PageBreakBefore: Integer; safecall;
    procedure Set_PageBreakBefore(Value: Integer); safecall;
    function Get_NoLineNumber: Integer; safecall;
    procedure Set_NoLineNumber(Value: Integer); safecall;
    function Get_RightIndent: Single; safecall;
    procedure Set_RightIndent(Value: Single); safecall;
    function Get_LeftIndent: Single; safecall;
    procedure Set_LeftIndent(Value: Single); safecall;
    function Get_FirstLineIndent: Single; safecall;
    procedure Set_FirstLineIndent(Value: Single); safecall;
    function Get_LineSpacing: Single; safecall;
    procedure Set_LineSpacing(Value: Single); safecall;
    function Get_LineSpacingRule: WdLineSpacing; safecall;
    procedure Set_LineSpacingRule(Value: WdLineSpacing); safecall;
    function Get_SpaceBefore: Single; safecall;
    procedure Set_SpaceBefore(Value: Single); safecall;
    function Get_SpaceAfter: Single; safecall;
    procedure Set_SpaceAfter(Value: Single); safecall;
    function Get_Hyphenation: Integer; safecall;
    procedure Set_Hyphenation(Value: Integer); safecall;
    function Get_WidowControl: Integer; safecall;
    procedure Set_WidowControl(Value: Integer); safecall;
    function Get_Shading: Shading; safecall;
    function Get_FarEastLineBreakControl: Integer; safecall;
    procedure Set_FarEastLineBreakControl(Value: Integer); safecall;
    function Get_WordWrap: Integer; safecall;
    procedure Set_WordWrap(Value: Integer); safecall;
    function Get_HangingPunctuation: Integer; safecall;
    procedure Set_HangingPunctuation(Value: Integer); safecall;
    function Get_HalfWidthPunctuationOnTopOfLine: Integer; safecall;
    procedure Set_HalfWidthPunctuationOnTopOfLine(Value: Integer); safecall;
    function Get_AddSpaceBetweenFarEastAndAlpha: Integer; safecall;
    procedure Set_AddSpaceBetweenFarEastAndAlpha(Value: Integer); safecall;
    function Get_AddSpaceBetweenFarEastAndDigit: Integer; safecall;
    procedure Set_AddSpaceBetweenFarEastAndDigit(Value: Integer); safecall;
    function Get_BaseLineAlignment: WdBaselineAlignment; safecall;
    procedure Set_BaseLineAlignment(Value: WdBaselineAlignment); safecall;
    function Get_AutoAdjustRightIndent: Integer; safecall;
    procedure Set_AutoAdjustRightIndent(Value: Integer); safecall;
    function Get_DisableLineHeightGrid: Integer; safecall;
    procedure Set_DisableLineHeightGrid(Value: Integer); safecall;
    function Get_OutlineLevel: WdOutlineLevel; safecall;
    procedure Set_OutlineLevel(Value: WdOutlineLevel); safecall;
    function Item(Index: Integer): Paragraph; safecall;
    function Add(var Range: OleVariant): Paragraph; safecall;
    procedure CloseUp; safecall;
    procedure OpenUp; safecall;
    procedure OpenOrCloseUp; safecall;
    procedure TabHangingIndent(Count: Smallint); safecall;
    procedure TabIndent(Count: Smallint); safecall;
    procedure Reset; safecall;
    procedure Space1; safecall;
    procedure Space15; safecall;
    procedure Space2; safecall;
    procedure IndentCharWidth(Count: Smallint); safecall;
    procedure IndentFirstLineCharWidth(Count: Smallint); safecall;
    procedure OutlinePromote; safecall;
    procedure OutlineDemote; safecall;
    procedure OutlineDemoteToBody; safecall;
    procedure Indent; safecall;
    procedure Outdent; safecall;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Count: Integer read Get_Count;
    property First: Paragraph read Get_First;
    property Last: Paragraph read Get_Last;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property Format: ParagraphFormat read Get_Format write Set_Format;
    property TabStops: TabStops read Get_TabStops write Set_TabStops;
    property Borders: Borders read Get_Borders write Set_Borders;
    property Style: OleVariant read Get_Style write Set_Style;
    property Alignment: WdParagraphAlignment read Get_Alignment write Set_Alignment;
    property KeepTogether: Integer read Get_KeepTogether write Set_KeepTogether;
    property KeepWithNext: Integer read Get_KeepWithNext write Set_KeepWithNext;
    property PageBreakBefore: Integer read Get_PageBreakBefore write Set_PageBreakBefore;
    property NoLineNumber: Integer read Get_NoLineNumber write Set_NoLineNumber;
    property RightIndent: Single read Get_RightIndent write Set_RightIndent;
    property LeftIndent: Single read Get_LeftIndent write Set_LeftIndent;
    property FirstLineIndent: Single read Get_FirstLineIndent write Set_FirstLineIndent;
    property LineSpacing: Single read Get_LineSpacing write Set_LineSpacing;
    property LineSpacingRule: WdLineSpacing read Get_LineSpacingRule write Set_LineSpacingRule;
    property SpaceBefore: Single read Get_SpaceBefore write Set_SpaceBefore;
    property SpaceAfter: Single read Get_SpaceAfter write Set_SpaceAfter;
    property Hyphenation: Integer read Get_Hyphenation write Set_Hyphenation;
    property WidowControl: Integer read Get_WidowControl write Set_WidowControl;
    property Shading: Shading read Get_Shading;
    property FarEastLineBreakControl: Integer read Get_FarEastLineBreakControl write Set_FarEastLineBreakControl;
    property WordWrap: Integer read Get_WordWrap write Set_WordWrap;
    property HangingPunctuation: Integer read Get_HangingPunctuation write Set_HangingPunctuation;
    property HalfWidthPunctuationOnTopOfLine: Integer read Get_HalfWidthPunctuationOnTopOfLine write Set_HalfWidthPunctuationOnTopOfLine;
    property AddSpaceBetweenFarEastAndAlpha: Integer read Get_AddSpaceBetweenFarEastAndAlpha write Set_AddSpaceBetweenFarEastAndAlpha;
    property AddSpaceBetweenFarEastAndDigit: Integer read Get_AddSpaceBetweenFarEastAndDigit write Set_AddSpaceBetweenFarEastAndDigit;
    property BaseLineAlignment: WdBaselineAlignment read Get_BaseLineAlignment write Set_BaseLineAlignment;
    property AutoAdjustRightIndent: Integer read Get_AutoAdjustRightIndent write Set_AutoAdjustRightIndent;
    property DisableLineHeightGrid: Integer read Get_DisableLineHeightGrid write Set_DisableLineHeightGrid;
    property OutlineLevel: WdOutlineLevel read Get_OutlineLevel write Set_OutlineLevel;
  end;

{ DispInterface declaration for Dual Interface Paragraphs }

  ParagraphsDisp = dispinterface
    ['{00020958-0000-0000-C000-000000000046}']
    property _NewEnum: IUnknown readonly dispid -4;
    property Count: Integer readonly dispid 2;
    property First: Paragraph readonly dispid 3;
    property Last: Paragraph readonly dispid 4;
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property Format: ParagraphFormat dispid 1102;
    property TabStops: TabStops dispid 1103;
    property Borders: Borders dispid 1100;
    property Style: OleVariant dispid 100;
    property Alignment: WdParagraphAlignment dispid 101;
    property KeepTogether: Integer dispid 102;
    property KeepWithNext: Integer dispid 103;
    property PageBreakBefore: Integer dispid 104;
    property NoLineNumber: Integer dispid 105;
    property RightIndent: Single dispid 106;
    property LeftIndent: Single dispid 107;
    property FirstLineIndent: Single dispid 108;
    property LineSpacing: Single dispid 109;
    property LineSpacingRule: WdLineSpacing dispid 110;
    property SpaceBefore: Single dispid 111;
    property SpaceAfter: Single dispid 112;
    property Hyphenation: Integer dispid 113;
    property WidowControl: Integer dispid 114;
    property Shading: Shading readonly dispid 116;
    property FarEastLineBreakControl: Integer dispid 117;
    property WordWrap: Integer dispid 118;
    property HangingPunctuation: Integer dispid 119;
    property HalfWidthPunctuationOnTopOfLine: Integer dispid 120;
    property AddSpaceBetweenFarEastAndAlpha: Integer dispid 121;
    property AddSpaceBetweenFarEastAndDigit: Integer dispid 122;
    property BaseLineAlignment: WdBaselineAlignment dispid 123;
    property AutoAdjustRightIndent: Integer dispid 124;
    property DisableLineHeightGrid: Integer dispid 125;
    property OutlineLevel: WdOutlineLevel dispid 202;
    function Item(Index: Integer): Paragraph; dispid 0;
    function Add(var Range: OleVariant): Paragraph; dispid 5;
    procedure CloseUp; dispid 301;
    procedure OpenUp; dispid 302;
    procedure OpenOrCloseUp; dispid 303;
    procedure TabHangingIndent(Count: Smallint); dispid 304;
    procedure TabIndent(Count: Smallint); dispid 306;
    procedure Reset; dispid 312;
    procedure Space1; dispid 313;
    procedure Space15; dispid 314;
    procedure Space2; dispid 315;
    procedure IndentCharWidth(Count: Smallint); dispid 320;
    procedure IndentFirstLineCharWidth(Count: Smallint); dispid 322;
    procedure OutlinePromote; dispid 324;
    procedure OutlineDemote; dispid 325;
    procedure OutlineDemoteToBody; dispid 326;
    procedure Indent; dispid 333;
    procedure Outdent; dispid 334;
  end;

  Paragraph = interface(IDispatch)
    ['{00020957-0000-0000-C000-000000000046}']
    function Get_Range: Range; safecall;
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Format: ParagraphFormat; safecall;
    procedure Set_Format(const Value: ParagraphFormat); safecall;
    function Get_TabStops: TabStops; safecall;
    procedure Set_TabStops(const Value: TabStops); safecall;
    function Get_Borders: Borders; safecall;
    procedure Set_Borders(const Value: Borders); safecall;
    function Get_DropCap: DropCap; safecall;
    function Get_Style: OleVariant; safecall;
    procedure Set_Style(Value: OleVariant); safecall;
    function Get_Alignment: WdParagraphAlignment; safecall;
    procedure Set_Alignment(Value: WdParagraphAlignment); safecall;
    function Get_KeepTogether: Integer; safecall;
    procedure Set_KeepTogether(Value: Integer); safecall;
    function Get_KeepWithNext: Integer; safecall;
    procedure Set_KeepWithNext(Value: Integer); safecall;
    function Get_PageBreakBefore: Integer; safecall;
    procedure Set_PageBreakBefore(Value: Integer); safecall;
    function Get_NoLineNumber: Integer; safecall;
    procedure Set_NoLineNumber(Value: Integer); safecall;
    function Get_RightIndent: Single; safecall;
    procedure Set_RightIndent(Value: Single); safecall;
    function Get_LeftIndent: Single; safecall;
    procedure Set_LeftIndent(Value: Single); safecall;
    function Get_FirstLineIndent: Single; safecall;
    procedure Set_FirstLineIndent(Value: Single); safecall;
    function Get_LineSpacing: Single; safecall;
    procedure Set_LineSpacing(Value: Single); safecall;
    function Get_LineSpacingRule: WdLineSpacing; safecall;
    procedure Set_LineSpacingRule(Value: WdLineSpacing); safecall;
    function Get_SpaceBefore: Single; safecall;
    procedure Set_SpaceBefore(Value: Single); safecall;
    function Get_SpaceAfter: Single; safecall;
    procedure Set_SpaceAfter(Value: Single); safecall;
    function Get_Hyphenation: Integer; safecall;
    procedure Set_Hyphenation(Value: Integer); safecall;
    function Get_WidowControl: Integer; safecall;
    procedure Set_WidowControl(Value: Integer); safecall;
    function Get_Shading: Shading; safecall;
    function Get_FarEastLineBreakControl: Integer; safecall;
    procedure Set_FarEastLineBreakControl(Value: Integer); safecall;
    function Get_WordWrap: Integer; safecall;
    procedure Set_WordWrap(Value: Integer); safecall;
    function Get_HangingPunctuation: Integer; safecall;
    procedure Set_HangingPunctuation(Value: Integer); safecall;
    function Get_HalfWidthPunctuationOnTopOfLine: Integer; safecall;
    procedure Set_HalfWidthPunctuationOnTopOfLine(Value: Integer); safecall;
    function Get_AddSpaceBetweenFarEastAndAlpha: Integer; safecall;
    procedure Set_AddSpaceBetweenFarEastAndAlpha(Value: Integer); safecall;
    function Get_AddSpaceBetweenFarEastAndDigit: Integer; safecall;
    procedure Set_AddSpaceBetweenFarEastAndDigit(Value: Integer); safecall;
    function Get_BaseLineAlignment: WdBaselineAlignment; safecall;
    procedure Set_BaseLineAlignment(Value: WdBaselineAlignment); safecall;
    function Get_AutoAdjustRightIndent: Integer; safecall;
    procedure Set_AutoAdjustRightIndent(Value: Integer); safecall;
    function Get_DisableLineHeightGrid: Integer; safecall;
    procedure Set_DisableLineHeightGrid(Value: Integer); safecall;
    function Get_OutlineLevel: WdOutlineLevel; safecall;
    procedure Set_OutlineLevel(Value: WdOutlineLevel); safecall;
    procedure CloseUp; safecall;
    procedure OpenUp; safecall;
    procedure OpenOrCloseUp; safecall;
    procedure TabHangingIndent(Count: Smallint); safecall;
    procedure TabIndent(Count: Smallint); safecall;
    procedure Reset; safecall;
    procedure Space1; safecall;
    procedure Space15; safecall;
    procedure Space2; safecall;
    procedure IndentCharWidth(Count: Smallint); safecall;
    procedure IndentFirstLineCharWidth(Count: Smallint); safecall;
    function Next(var Count: OleVariant): Paragraph; safecall;
    function Previous(var Count: OleVariant): Paragraph; safecall;
    procedure OutlinePromote; safecall;
    procedure OutlineDemote; safecall;
    procedure OutlineDemoteToBody; safecall;
    procedure Indent; safecall;
    procedure Outdent; safecall;
    property Range: Range read Get_Range;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property Format: ParagraphFormat read Get_Format write Set_Format;
    property TabStops: TabStops read Get_TabStops write Set_TabStops;
    property Borders: Borders read Get_Borders write Set_Borders;
    property DropCap: DropCap read Get_DropCap;
    property Style: OleVariant read Get_Style write Set_Style;
    property Alignment: WdParagraphAlignment read Get_Alignment write Set_Alignment;
    property KeepTogether: Integer read Get_KeepTogether write Set_KeepTogether;
    property KeepWithNext: Integer read Get_KeepWithNext write Set_KeepWithNext;
    property PageBreakBefore: Integer read Get_PageBreakBefore write Set_PageBreakBefore;
    property NoLineNumber: Integer read Get_NoLineNumber write Set_NoLineNumber;
    property RightIndent: Single read Get_RightIndent write Set_RightIndent;
    property LeftIndent: Single read Get_LeftIndent write Set_LeftIndent;
    property FirstLineIndent: Single read Get_FirstLineIndent write Set_FirstLineIndent;
    property LineSpacing: Single read Get_LineSpacing write Set_LineSpacing;
    property LineSpacingRule: WdLineSpacing read Get_LineSpacingRule write Set_LineSpacingRule;
    property SpaceBefore: Single read Get_SpaceBefore write Set_SpaceBefore;
    property SpaceAfter: Single read Get_SpaceAfter write Set_SpaceAfter;
    property Hyphenation: Integer read Get_Hyphenation write Set_Hyphenation;
    property WidowControl: Integer read Get_WidowControl write Set_WidowControl;
    property Shading: Shading read Get_Shading;
    property FarEastLineBreakControl: Integer read Get_FarEastLineBreakControl write Set_FarEastLineBreakControl;
    property WordWrap: Integer read Get_WordWrap write Set_WordWrap;
    property HangingPunctuation: Integer read Get_HangingPunctuation write Set_HangingPunctuation;
    property HalfWidthPunctuationOnTopOfLine: Integer read Get_HalfWidthPunctuationOnTopOfLine write Set_HalfWidthPunctuationOnTopOfLine;
    property AddSpaceBetweenFarEastAndAlpha: Integer read Get_AddSpaceBetweenFarEastAndAlpha write Set_AddSpaceBetweenFarEastAndAlpha;
    property AddSpaceBetweenFarEastAndDigit: Integer read Get_AddSpaceBetweenFarEastAndDigit write Set_AddSpaceBetweenFarEastAndDigit;
    property BaseLineAlignment: WdBaselineAlignment read Get_BaseLineAlignment write Set_BaseLineAlignment;
    property AutoAdjustRightIndent: Integer read Get_AutoAdjustRightIndent write Set_AutoAdjustRightIndent;
    property DisableLineHeightGrid: Integer read Get_DisableLineHeightGrid write Set_DisableLineHeightGrid;
    property OutlineLevel: WdOutlineLevel read Get_OutlineLevel write Set_OutlineLevel;
  end;

{ DispInterface declaration for Dual Interface Paragraph }

  ParagraphDisp = dispinterface
    ['{00020957-0000-0000-C000-000000000046}']
    property Range: Range readonly dispid 0;
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property Format: ParagraphFormat dispid 1102;
    property TabStops: TabStops dispid 1103;
    property Borders: Borders dispid 1100;
    property DropCap: DropCap readonly dispid 13;
    property Style: OleVariant dispid 100;
    property Alignment: WdParagraphAlignment dispid 101;
    property KeepTogether: Integer dispid 102;
    property KeepWithNext: Integer dispid 103;
    property PageBreakBefore: Integer dispid 104;
    property NoLineNumber: Integer dispid 105;
    property RightIndent: Single dispid 106;
    property LeftIndent: Single dispid 107;
    property FirstLineIndent: Single dispid 108;
    property LineSpacing: Single dispid 109;
    property LineSpacingRule: WdLineSpacing dispid 110;
    property SpaceBefore: Single dispid 111;
    property SpaceAfter: Single dispid 112;
    property Hyphenation: Integer dispid 113;
    property WidowControl: Integer dispid 114;
    property Shading: Shading readonly dispid 116;
    property FarEastLineBreakControl: Integer dispid 117;
    property WordWrap: Integer dispid 118;
    property HangingPunctuation: Integer dispid 119;
    property HalfWidthPunctuationOnTopOfLine: Integer dispid 120;
    property AddSpaceBetweenFarEastAndAlpha: Integer dispid 121;
    property AddSpaceBetweenFarEastAndDigit: Integer dispid 122;
    property BaseLineAlignment: WdBaselineAlignment dispid 123;
    property AutoAdjustRightIndent: Integer dispid 124;
    property DisableLineHeightGrid: Integer dispid 125;
    property OutlineLevel: WdOutlineLevel dispid 202;
    procedure CloseUp; dispid 301;
    procedure OpenUp; dispid 302;
    procedure OpenOrCloseUp; dispid 303;
    procedure TabHangingIndent(Count: Smallint); dispid 304;
    procedure TabIndent(Count: Smallint); dispid 306;
    procedure Reset; dispid 312;
    procedure Space1; dispid 313;
    procedure Space15; dispid 314;
    procedure Space2; dispid 315;
    procedure IndentCharWidth(Count: Smallint); dispid 320;
    procedure IndentFirstLineCharWidth(Count: Smallint); dispid 322;
    function Next(var Count: OleVariant): Paragraph; dispid 324;
    function Previous(var Count: OleVariant): Paragraph; dispid 325;
    procedure OutlinePromote; dispid 326;
    procedure OutlineDemote; dispid 327;
    procedure OutlineDemoteToBody; dispid 328;
    procedure Indent; dispid 333;
    procedure Outdent; dispid 334;
  end;

  DropCap = interface(IDispatch)
    ['{00020956-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Position: WdDropPosition; safecall;
    procedure Set_Position(Value: WdDropPosition); safecall;
    function Get_FontName: WideString; safecall;
    procedure Set_FontName(const Value: WideString); safecall;
    function Get_LinesToDrop: Integer; safecall;
    procedure Set_LinesToDrop(Value: Integer); safecall;
    function Get_DistanceFromText: Single; safecall;
    procedure Set_DistanceFromText(Value: Single); safecall;
    procedure Clear; safecall;
    procedure Enable; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property Position: WdDropPosition read Get_Position write Set_Position;
    property FontName: WideString read Get_FontName write Set_FontName;
    property LinesToDrop: Integer read Get_LinesToDrop write Set_LinesToDrop;
    property DistanceFromText: Single read Get_DistanceFromText write Set_DistanceFromText;
  end;

{ DispInterface declaration for Dual Interface DropCap }

  DropCapDisp = dispinterface
    ['{00020956-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property Position: WdDropPosition dispid 10;
    property FontName: WideString dispid 11;
    property LinesToDrop: Integer dispid 12;
    property DistanceFromText: Single dispid 13;
    procedure Clear; dispid 100;
    procedure Enable; dispid 101;
  end;

  TabStops = interface(IDispatch)
    ['{00020955-0000-0000-C000-000000000046}']
    function Get__NewEnum: IUnknown; safecall;
    function Get_Count: Integer; safecall;
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Item(var Index: OleVariant): TabStop; safecall;
    function Add(Position: Single; var Alignment, Leader: OleVariant): TabStop; safecall;
    procedure ClearAll; safecall;
    function Before(Position: Single): TabStop; safecall;
    function After(Position: Single): TabStop; safecall;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Count: Integer read Get_Count;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
  end;

{ DispInterface declaration for Dual Interface TabStops }

  TabStopsDisp = dispinterface
    ['{00020955-0000-0000-C000-000000000046}']
    property _NewEnum: IUnknown readonly dispid -4;
    property Count: Integer readonly dispid 2;
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    function Item(var Index: OleVariant): TabStop; dispid 0;
    function Add(Position: Single; var Alignment, Leader: OleVariant): TabStop; dispid 100;
    procedure ClearAll; dispid 101;
    function Before(Position: Single): TabStop; dispid 102;
    function After(Position: Single): TabStop; dispid 103;
  end;

  TabStop = interface(IDispatch)
    ['{00020954-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Alignment: WdTabAlignment; safecall;
    procedure Set_Alignment(Value: WdTabAlignment); safecall;
    function Get_Leader: WdTabLeader; safecall;
    procedure Set_Leader(Value: WdTabLeader); safecall;
    function Get_Position: Single; safecall;
    procedure Set_Position(Value: Single); safecall;
    function Get_CustomTab: WordBool; safecall;
    function Get_Next: TabStop; safecall;
    function Get_Previous: TabStop; safecall;
    procedure Clear; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property Alignment: WdTabAlignment read Get_Alignment write Set_Alignment;
    property Leader: WdTabLeader read Get_Leader write Set_Leader;
    property Position: Single read Get_Position write Set_Position;
    property CustomTab: WordBool read Get_CustomTab;
    property Next: TabStop read Get_Next;
    property Previous: TabStop read Get_Previous;
  end;

{ DispInterface declaration for Dual Interface TabStop }

  TabStopDisp = dispinterface
    ['{00020954-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property Alignment: WdTabAlignment dispid 100;
    property Leader: WdTabLeader dispid 101;
    property Position: Single dispid 102;
    property CustomTab: WordBool readonly dispid 103;
    property Next: TabStop readonly dispid 104;
    property Previous: TabStop readonly dispid 105;
    procedure Clear; dispid 200;
  end;

  _ParagraphFormat = interface(IDispatch)
    ['{00020953-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Duplicate: ParagraphFormat; safecall;
    function Get_Style: OleVariant; safecall;
    procedure Set_Style(Value: OleVariant); safecall;
    function Get_Alignment: WdParagraphAlignment; safecall;
    procedure Set_Alignment(Value: WdParagraphAlignment); safecall;
    function Get_KeepTogether: Integer; safecall;
    procedure Set_KeepTogether(Value: Integer); safecall;
    function Get_KeepWithNext: Integer; safecall;
    procedure Set_KeepWithNext(Value: Integer); safecall;
    function Get_PageBreakBefore: Integer; safecall;
    procedure Set_PageBreakBefore(Value: Integer); safecall;
    function Get_NoLineNumber: Integer; safecall;
    procedure Set_NoLineNumber(Value: Integer); safecall;
    function Get_RightIndent: Single; safecall;
    procedure Set_RightIndent(Value: Single); safecall;
    function Get_LeftIndent: Single; safecall;
    procedure Set_LeftIndent(Value: Single); safecall;
    function Get_FirstLineIndent: Single; safecall;
    procedure Set_FirstLineIndent(Value: Single); safecall;
    function Get_LineSpacing: Single; safecall;
    procedure Set_LineSpacing(Value: Single); safecall;
    function Get_LineSpacingRule: WdLineSpacing; safecall;
    procedure Set_LineSpacingRule(Value: WdLineSpacing); safecall;
    function Get_SpaceBefore: Single; safecall;
    procedure Set_SpaceBefore(Value: Single); safecall;
    function Get_SpaceAfter: Single; safecall;
    procedure Set_SpaceAfter(Value: Single); safecall;
    function Get_Hyphenation: Integer; safecall;
    procedure Set_Hyphenation(Value: Integer); safecall;
    function Get_WidowControl: Integer; safecall;
    procedure Set_WidowControl(Value: Integer); safecall;
    function Get_FarEastLineBreakControl: Integer; safecall;
    procedure Set_FarEastLineBreakControl(Value: Integer); safecall;
    function Get_WordWrap: Integer; safecall;
    procedure Set_WordWrap(Value: Integer); safecall;
    function Get_HangingPunctuation: Integer; safecall;
    procedure Set_HangingPunctuation(Value: Integer); safecall;
    function Get_HalfWidthPunctuationOnTopOfLine: Integer; safecall;
    procedure Set_HalfWidthPunctuationOnTopOfLine(Value: Integer); safecall;
    function Get_AddSpaceBetweenFarEastAndAlpha: Integer; safecall;
    procedure Set_AddSpaceBetweenFarEastAndAlpha(Value: Integer); safecall;
    function Get_AddSpaceBetweenFarEastAndDigit: Integer; safecall;
    procedure Set_AddSpaceBetweenFarEastAndDigit(Value: Integer); safecall;
    function Get_BaseLineAlignment: WdBaselineAlignment; safecall;
    procedure Set_BaseLineAlignment(Value: WdBaselineAlignment); safecall;
    function Get_AutoAdjustRightIndent: Integer; safecall;
    procedure Set_AutoAdjustRightIndent(Value: Integer); safecall;
    function Get_DisableLineHeightGrid: Integer; safecall;
    procedure Set_DisableLineHeightGrid(Value: Integer); safecall;
    function Get_TabStops: TabStops; safecall;
    procedure Set_TabStops(const Value: TabStops); safecall;
    function Get_Borders: Borders; safecall;
    procedure Set_Borders(const Value: Borders); safecall;
    function Get_Shading: Shading; safecall;
    function Get_OutlineLevel: WdOutlineLevel; safecall;
    procedure Set_OutlineLevel(Value: WdOutlineLevel); safecall;
    procedure CloseUp; safecall;
    procedure OpenUp; safecall;
    procedure OpenOrCloseUp; safecall;
    procedure TabHangingIndent(Count: Smallint); safecall;
    procedure TabIndent(Count: Smallint); safecall;
    procedure Reset; safecall;
    procedure Space1; safecall;
    procedure Space15; safecall;
    procedure Space2; safecall;
    procedure IndentCharWidth(Count: Smallint); safecall;
    procedure IndentFirstLineCharWidth(Count: Smallint); safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property Duplicate: ParagraphFormat read Get_Duplicate;
    property Style: OleVariant read Get_Style write Set_Style;
    property Alignment: WdParagraphAlignment read Get_Alignment write Set_Alignment;
    property KeepTogether: Integer read Get_KeepTogether write Set_KeepTogether;
    property KeepWithNext: Integer read Get_KeepWithNext write Set_KeepWithNext;
    property PageBreakBefore: Integer read Get_PageBreakBefore write Set_PageBreakBefore;
    property NoLineNumber: Integer read Get_NoLineNumber write Set_NoLineNumber;
    property RightIndent: Single read Get_RightIndent write Set_RightIndent;
    property LeftIndent: Single read Get_LeftIndent write Set_LeftIndent;
    property FirstLineIndent: Single read Get_FirstLineIndent write Set_FirstLineIndent;
    property LineSpacing: Single read Get_LineSpacing write Set_LineSpacing;
    property LineSpacingRule: WdLineSpacing read Get_LineSpacingRule write Set_LineSpacingRule;
    property SpaceBefore: Single read Get_SpaceBefore write Set_SpaceBefore;
    property SpaceAfter: Single read Get_SpaceAfter write Set_SpaceAfter;
    property Hyphenation: Integer read Get_Hyphenation write Set_Hyphenation;
    property WidowControl: Integer read Get_WidowControl write Set_WidowControl;
    property FarEastLineBreakControl: Integer read Get_FarEastLineBreakControl write Set_FarEastLineBreakControl;
    property WordWrap: Integer read Get_WordWrap write Set_WordWrap;
    property HangingPunctuation: Integer read Get_HangingPunctuation write Set_HangingPunctuation;
    property HalfWidthPunctuationOnTopOfLine: Integer read Get_HalfWidthPunctuationOnTopOfLine write Set_HalfWidthPunctuationOnTopOfLine;
    property AddSpaceBetweenFarEastAndAlpha: Integer read Get_AddSpaceBetweenFarEastAndAlpha write Set_AddSpaceBetweenFarEastAndAlpha;
    property AddSpaceBetweenFarEastAndDigit: Integer read Get_AddSpaceBetweenFarEastAndDigit write Set_AddSpaceBetweenFarEastAndDigit;
    property BaseLineAlignment: WdBaselineAlignment read Get_BaseLineAlignment write Set_BaseLineAlignment;
    property AutoAdjustRightIndent: Integer read Get_AutoAdjustRightIndent write Set_AutoAdjustRightIndent;
    property DisableLineHeightGrid: Integer read Get_DisableLineHeightGrid write Set_DisableLineHeightGrid;
    property TabStops: TabStops read Get_TabStops write Set_TabStops;
    property Borders: Borders read Get_Borders write Set_Borders;
    property Shading: Shading read Get_Shading;
    property OutlineLevel: WdOutlineLevel read Get_OutlineLevel write Set_OutlineLevel;
  end;

{ DispInterface declaration for Dual Interface _ParagraphFormat }

  _ParagraphFormatDisp = dispinterface
    ['{00020953-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property Duplicate: ParagraphFormat readonly dispid 10;
    property Style: OleVariant dispid 100;
    property Alignment: WdParagraphAlignment dispid 101;
    property KeepTogether: Integer dispid 102;
    property KeepWithNext: Integer dispid 103;
    property PageBreakBefore: Integer dispid 104;
    property NoLineNumber: Integer dispid 105;
    property RightIndent: Single dispid 106;
    property LeftIndent: Single dispid 107;
    property FirstLineIndent: Single dispid 108;
    property LineSpacing: Single dispid 109;
    property LineSpacingRule: WdLineSpacing dispid 110;
    property SpaceBefore: Single dispid 111;
    property SpaceAfter: Single dispid 112;
    property Hyphenation: Integer dispid 113;
    property WidowControl: Integer dispid 114;
    property FarEastLineBreakControl: Integer dispid 117;
    property WordWrap: Integer dispid 118;
    property HangingPunctuation: Integer dispid 119;
    property HalfWidthPunctuationOnTopOfLine: Integer dispid 120;
    property AddSpaceBetweenFarEastAndAlpha: Integer dispid 121;
    property AddSpaceBetweenFarEastAndDigit: Integer dispid 122;
    property BaseLineAlignment: WdBaselineAlignment dispid 123;
    property AutoAdjustRightIndent: Integer dispid 124;
    property DisableLineHeightGrid: Integer dispid 125;
    property TabStops: TabStops dispid 1103;
    property Borders: Borders dispid 1100;
    property Shading: Shading readonly dispid 1101;
    property OutlineLevel: WdOutlineLevel dispid 202;
    procedure CloseUp; dispid 301;
    procedure OpenUp; dispid 302;
    procedure OpenOrCloseUp; dispid 303;
    procedure TabHangingIndent(Count: Smallint); dispid 304;
    procedure TabIndent(Count: Smallint); dispid 306;
    procedure Reset; dispid 312;
    procedure Space1; dispid 313;
    procedure Space15; dispid 314;
    procedure Space2; dispid 315;
    procedure IndentCharWidth(Count: Smallint); dispid 320;
    procedure IndentFirstLineCharWidth(Count: Smallint); dispid 322;
  end;

  _Font = interface(IDispatch)
    ['{00020952-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Duplicate: Font; safecall;
    function Get_Bold: Integer; safecall;
    procedure Set_Bold(Value: Integer); safecall;
    function Get_Italic: Integer; safecall;
    procedure Set_Italic(Value: Integer); safecall;
    function Get_Hidden: Integer; safecall;
    procedure Set_Hidden(Value: Integer); safecall;
    function Get_SmallCaps: Integer; safecall;
    procedure Set_SmallCaps(Value: Integer); safecall;
    function Get_AllCaps: Integer; safecall;
    procedure Set_AllCaps(Value: Integer); safecall;
    function Get_StrikeThrough: Integer; safecall;
    procedure Set_StrikeThrough(Value: Integer); safecall;
    function Get_DoubleStrikeThrough: Integer; safecall;
    procedure Set_DoubleStrikeThrough(Value: Integer); safecall;
    function Get_ColorIndex: WdColorIndex; safecall;
    procedure Set_ColorIndex(Value: WdColorIndex); safecall;
    function Get_Subscript: Integer; safecall;
    procedure Set_Subscript(Value: Integer); safecall;
    function Get_Superscript: Integer; safecall;
    procedure Set_Superscript(Value: Integer); safecall;
    function Get_Underline: WdUnderline; safecall;
    procedure Set_Underline(Value: WdUnderline); safecall;
    function Get_Size: Single; safecall;
    procedure Set_Size(Value: Single); safecall;
    function Get_Name: WideString; safecall;
    procedure Set_Name(const Value: WideString); safecall;
    function Get_Position: Integer; safecall;
    procedure Set_Position(Value: Integer); safecall;
    function Get_Spacing: Single; safecall;
    procedure Set_Spacing(Value: Single); safecall;
    function Get_Scaling: Integer; safecall;
    procedure Set_Scaling(Value: Integer); safecall;
    function Get_Shadow: Integer; safecall;
    procedure Set_Shadow(Value: Integer); safecall;
    function Get_Outline: Integer; safecall;
    procedure Set_Outline(Value: Integer); safecall;
    function Get_Emboss: Integer; safecall;
    procedure Set_Emboss(Value: Integer); safecall;
    function Get_Kerning: Single; safecall;
    procedure Set_Kerning(Value: Single); safecall;
    function Get_Engrave: Integer; safecall;
    procedure Set_Engrave(Value: Integer); safecall;
    function Get_Animation: WdAnimation; safecall;
    procedure Set_Animation(Value: WdAnimation); safecall;
    function Get_Borders: Borders; safecall;
    procedure Set_Borders(const Value: Borders); safecall;
    function Get_Shading: Shading; safecall;
    function Get_EmphasisMark: WdEmphasisMark; safecall;
    procedure Set_EmphasisMark(Value: WdEmphasisMark); safecall;
    function Get_DisableCharacterSpaceGrid: WordBool; safecall;
    procedure Set_DisableCharacterSpaceGrid(Value: WordBool); safecall;
    function Get_NameFarEast: WideString; safecall;
    procedure Set_NameFarEast(const Value: WideString); safecall;
    function Get_NameAscii: WideString; safecall;
    procedure Set_NameAscii(const Value: WideString); safecall;
    function Get_NameOther: WideString; safecall;
    procedure Set_NameOther(const Value: WideString); safecall;
    procedure Grow; safecall;
    procedure Shrink; safecall;
    procedure Reset; safecall;
    procedure SetAsTemplateDefault; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property Duplicate: Font read Get_Duplicate;
    property Bold: Integer read Get_Bold write Set_Bold;
    property Italic: Integer read Get_Italic write Set_Italic;
    property Hidden: Integer read Get_Hidden write Set_Hidden;
    property SmallCaps: Integer read Get_SmallCaps write Set_SmallCaps;
    property AllCaps: Integer read Get_AllCaps write Set_AllCaps;
    property StrikeThrough: Integer read Get_StrikeThrough write Set_StrikeThrough;
    property DoubleStrikeThrough: Integer read Get_DoubleStrikeThrough write Set_DoubleStrikeThrough;
    property ColorIndex: WdColorIndex read Get_ColorIndex write Set_ColorIndex;
    property Subscript: Integer read Get_Subscript write Set_Subscript;
    property Superscript: Integer read Get_Superscript write Set_Superscript;
    property Underline: WdUnderline read Get_Underline write Set_Underline;
    property Size: Single read Get_Size write Set_Size;
    property Name: WideString read Get_Name write Set_Name;
    property Position: Integer read Get_Position write Set_Position;
    property Spacing: Single read Get_Spacing write Set_Spacing;
    property Scaling: Integer read Get_Scaling write Set_Scaling;
    property Shadow: Integer read Get_Shadow write Set_Shadow;
    property Outline: Integer read Get_Outline write Set_Outline;
    property Emboss: Integer read Get_Emboss write Set_Emboss;
    property Kerning: Single read Get_Kerning write Set_Kerning;
    property Engrave: Integer read Get_Engrave write Set_Engrave;
    property Animation: WdAnimation read Get_Animation write Set_Animation;
    property Borders: Borders read Get_Borders write Set_Borders;
    property Shading: Shading read Get_Shading;
    property EmphasisMark: WdEmphasisMark read Get_EmphasisMark write Set_EmphasisMark;
    property DisableCharacterSpaceGrid: WordBool read Get_DisableCharacterSpaceGrid write Set_DisableCharacterSpaceGrid;
    property NameFarEast: WideString read Get_NameFarEast write Set_NameFarEast;
    property NameAscii: WideString read Get_NameAscii write Set_NameAscii;
    property NameOther: WideString read Get_NameOther write Set_NameOther;
  end;

{ DispInterface declaration for Dual Interface _Font }

  _FontDisp = dispinterface
    ['{00020952-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property Duplicate: Font readonly dispid 10;
    property Bold: Integer dispid 130;
    property Italic: Integer dispid 131;
    property Hidden: Integer dispid 132;
    property SmallCaps: Integer dispid 133;
    property AllCaps: Integer dispid 134;
    property StrikeThrough: Integer dispid 135;
    property DoubleStrikeThrough: Integer dispid 136;
    property ColorIndex: WdColorIndex dispid 137;
    property Subscript: Integer dispid 138;
    property Superscript: Integer dispid 139;
    property Underline: WdUnderline dispid 140;
    property Size: Single dispid 141;
    property Name: WideString dispid 142;
    property Position: Integer dispid 143;
    property Spacing: Single dispid 144;
    property Scaling: Integer dispid 145;
    property Shadow: Integer dispid 146;
    property Outline: Integer dispid 147;
    property Emboss: Integer dispid 148;
    property Kerning: Single dispid 149;
    property Engrave: Integer dispid 150;
    property Animation: WdAnimation dispid 151;
    property Borders: Borders dispid 1100;
    property Shading: Shading readonly dispid 153;
    property EmphasisMark: WdEmphasisMark dispid 154;
    property DisableCharacterSpaceGrid: WordBool dispid 155;
    property NameFarEast: WideString dispid 156;
    property NameAscii: WideString dispid 157;
    property NameOther: WideString dispid 158;
    procedure Grow; dispid 100;
    procedure Shrink; dispid 101;
    procedure Reset; dispid 102;
    procedure SetAsTemplateDefault; dispid 103;
  end;

  Table = interface(IDispatch)
    ['{00020951-0000-0000-C000-000000000046}']
    function Get_Range: Range; safecall;
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Columns: Columns; safecall;
    function Get_Rows: Rows; safecall;
    function Get_Borders: Borders; safecall;
    procedure Set_Borders(const Value: Borders); safecall;
    function Get_Shading: Shading; safecall;
    function Get_Uniform: WordBool; safecall;
    function Get_AutoFormatType: Integer; safecall;
    procedure Select; safecall;
    procedure Delete; safecall;
    procedure Sort(var ExcludeHeader, FieldNumber, SortFieldType, SortOrder, FieldNumber2, SortFieldType2, SortOrder2, FieldNumber3, SortFieldType3, SortOrder3, CaseSensitive, LanguageID: OleVariant); safecall;
    procedure SortAscending; safecall;
    procedure SortDescending; safecall;
    procedure AutoFormat(var Format, ApplyBorders, ApplyShading, ApplyFont, ApplyColor, ApplyHeadingRows, ApplyLastRow, ApplyFirstColumn, ApplyLastColumn, AutoFit: OleVariant); safecall;
    procedure UpdateAutoFormat; safecall;
    function ConvertToText(var Separator: OleVariant): Range; safecall;
    function Cell(Row, Column: Integer): Cell; safecall;
    function Split(var BeforeRow: OleVariant): Table; safecall;
    property Range: Range read Get_Range;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property Columns: Columns read Get_Columns;
    property Rows: Rows read Get_Rows;
    property Borders: Borders read Get_Borders write Set_Borders;
    property Shading: Shading read Get_Shading;
    property Uniform: WordBool read Get_Uniform;
    property AutoFormatType: Integer read Get_AutoFormatType;
  end;

{ DispInterface declaration for Dual Interface Table }

  TableDisp = dispinterface
    ['{00020951-0000-0000-C000-000000000046}']
    property Range: Range readonly dispid 0;
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property Columns: Columns readonly dispid 100;
    property Rows: Rows readonly dispid 101;
    property Borders: Borders dispid 1100;
    property Shading: Shading readonly dispid 104;
    property Uniform: WordBool readonly dispid 105;
    property AutoFormatType: Integer readonly dispid 106;
    procedure Select; dispid 200;
    procedure Delete; dispid 9;
    procedure Sort(var ExcludeHeader, FieldNumber, SortFieldType, SortOrder, FieldNumber2, SortFieldType2, SortOrder2, FieldNumber3, SortFieldType3, SortOrder3, CaseSensitive, LanguageID: OleVariant); dispid 10;
    procedure SortAscending; dispid 12;
    procedure SortDescending; dispid 13;
    procedure AutoFormat(var Format, ApplyBorders, ApplyShading, ApplyFont, ApplyColor, ApplyHeadingRows, ApplyLastRow, ApplyFirstColumn, ApplyLastColumn, AutoFit: OleVariant); dispid 14;
    procedure UpdateAutoFormat; dispid 15;
    function ConvertToText(var Separator: OleVariant): Range; dispid 16;
    function Cell(Row, Column: Integer): Cell; dispid 17;
    function Split(var BeforeRow: OleVariant): Table; dispid 18;
  end;

  Row = interface(IDispatch)
    ['{00020950-0000-0000-C000-000000000046}']
    function Get_Range: Range; safecall;
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_AllowBreakAcrossPages: Integer; safecall;
    procedure Set_AllowBreakAcrossPages(Value: Integer); safecall;
    function Get_Alignment: WdRowAlignment; safecall;
    procedure Set_Alignment(Value: WdRowAlignment); safecall;
    function Get_HeadingFormat: Integer; safecall;
    procedure Set_HeadingFormat(Value: Integer); safecall;
    function Get_SpaceBetweenColumns: Single; safecall;
    procedure Set_SpaceBetweenColumns(Value: Single); safecall;
    function Get_Height: Single; safecall;
    procedure Set_Height(Value: Single); safecall;
    function Get_HeightRule: WdRowHeightRule; safecall;
    procedure Set_HeightRule(Value: WdRowHeightRule); safecall;
    function Get_LeftIndent: Single; safecall;
    procedure Set_LeftIndent(Value: Single); safecall;
    function Get_IsLast: WordBool; safecall;
    function Get_IsFirst: WordBool; safecall;
    function Get_Index: Integer; safecall;
    function Get_Cells: Cells; safecall;
    function Get_Borders: Borders; safecall;
    procedure Set_Borders(const Value: Borders); safecall;
    function Get_Shading: Shading; safecall;
    function Get_Next: Row; safecall;
    function Get_Previous: Row; safecall;
    procedure Select; safecall;
    procedure Delete; safecall;
    procedure SetLeftIndent(LeftIndent: Single; RulerStyle: WdRulerStyle); safecall;
    procedure SetHeight(RowHeight: Single; HeightRule: WdRowHeightRule); safecall;
    function ConvertToText(var Separator: OleVariant): Range; safecall;
    property Range: Range read Get_Range;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property AllowBreakAcrossPages: Integer read Get_AllowBreakAcrossPages write Set_AllowBreakAcrossPages;
    property Alignment: WdRowAlignment read Get_Alignment write Set_Alignment;
    property HeadingFormat: Integer read Get_HeadingFormat write Set_HeadingFormat;
    property SpaceBetweenColumns: Single read Get_SpaceBetweenColumns write Set_SpaceBetweenColumns;
    property Height: Single read Get_Height write Set_Height;
    property HeightRule: WdRowHeightRule read Get_HeightRule write Set_HeightRule;
    property LeftIndent: Single read Get_LeftIndent write Set_LeftIndent;
    property IsLast: WordBool read Get_IsLast;
    property IsFirst: WordBool read Get_IsFirst;
    property Index: Integer read Get_Index;
    property Cells: Cells read Get_Cells;
    property Borders: Borders read Get_Borders write Set_Borders;
    property Shading: Shading read Get_Shading;
    property Next: Row read Get_Next;
    property Previous: Row read Get_Previous;
  end;

{ DispInterface declaration for Dual Interface Row }

  RowDisp = dispinterface
    ['{00020950-0000-0000-C000-000000000046}']
    property Range: Range readonly dispid 0;
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property AllowBreakAcrossPages: Integer dispid 3;
    property Alignment: WdRowAlignment dispid 4;
    property HeadingFormat: Integer dispid 5;
    property SpaceBetweenColumns: Single dispid 6;
    property Height: Single dispid 7;
    property HeightRule: WdRowHeightRule dispid 8;
    property LeftIndent: Single dispid 9;
    property IsLast: WordBool readonly dispid 10;
    property IsFirst: WordBool readonly dispid 11;
    property Index: Integer readonly dispid 12;
    property Cells: Cells readonly dispid 100;
    property Borders: Borders dispid 1100;
    property Shading: Shading readonly dispid 103;
    property Next: Row readonly dispid 104;
    property Previous: Row readonly dispid 105;
    procedure Select; dispid 65535;
    procedure Delete; dispid 200;
    procedure SetLeftIndent(LeftIndent: Single; RulerStyle: WdRulerStyle); dispid 202;
    procedure SetHeight(RowHeight: Single; HeightRule: WdRowHeightRule); dispid 203;
    function ConvertToText(var Separator: OleVariant): Range; dispid 16;
  end;

  Column = interface(IDispatch)
    ['{0002094F-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Width: Single; safecall;
    procedure Set_Width(Value: Single); safecall;
    function Get_IsFirst: WordBool; safecall;
    function Get_IsLast: WordBool; safecall;
    function Get_Index: Integer; safecall;
    function Get_Cells: Cells; safecall;
    function Get_Borders: Borders; safecall;
    procedure Set_Borders(const Value: Borders); safecall;
    function Get_Shading: Shading; safecall;
    function Get_Next: Column; safecall;
    function Get_Previous: Column; safecall;
    procedure Select; safecall;
    procedure Delete; safecall;
    procedure SetWidth(ColumnWidth: Single; RulerStyle: WdRulerStyle); safecall;
    procedure AutoFit; safecall;
    procedure Sort(var ExcludeHeader, SortFieldType, SortOrder, CaseSensitive, LanguageID: OleVariant); safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property Width: Single read Get_Width write Set_Width;
    property IsFirst: WordBool read Get_IsFirst;
    property IsLast: WordBool read Get_IsLast;
    property Index: Integer read Get_Index;
    property Cells: Cells read Get_Cells;
    property Borders: Borders read Get_Borders write Set_Borders;
    property Shading: Shading read Get_Shading;
    property Next: Column read Get_Next;
    property Previous: Column read Get_Previous;
  end;

{ DispInterface declaration for Dual Interface Column }

  ColumnDisp = dispinterface
    ['{0002094F-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property Width: Single dispid 3;
    property IsFirst: WordBool readonly dispid 4;
    property IsLast: WordBool readonly dispid 5;
    property Index: Integer readonly dispid 6;
    property Cells: Cells readonly dispid 100;
    property Borders: Borders dispid 1100;
    property Shading: Shading readonly dispid 102;
    property Next: Column readonly dispid 103;
    property Previous: Column readonly dispid 104;
    procedure Select; dispid 65535;
    procedure Delete; dispid 200;
    procedure SetWidth(ColumnWidth: Single; RulerStyle: WdRulerStyle); dispid 201;
    procedure AutoFit; dispid 202;
    procedure Sort(var ExcludeHeader, SortFieldType, SortOrder, CaseSensitive, LanguageID: OleVariant); dispid 203;
  end;

  Cell = interface(IDispatch)
    ['{0002094E-0000-0000-C000-000000000046}']
    function Get_Range: Range; safecall;
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_RowIndex: Integer; safecall;
    function Get_ColumnIndex: Integer; safecall;
    function Get_Width: Single; safecall;
    procedure Set_Width(Value: Single); safecall;
    function Get_Height: Single; safecall;
    procedure Set_Height(Value: Single); safecall;
    function Get_HeightRule: WdRowHeightRule; safecall;
    procedure Set_HeightRule(Value: WdRowHeightRule); safecall;
    function Get_VerticalAlignment: WdCellVerticalAlignment; safecall;
    procedure Set_VerticalAlignment(Value: WdCellVerticalAlignment); safecall;
    function Get_Column: Column; safecall;
    function Get_Row: Row; safecall;
    function Get_Next: Cell; safecall;
    function Get_Previous: Cell; safecall;
    function Get_Shading: Shading; safecall;
    function Get_Borders: Borders; safecall;
    procedure Set_Borders(const Value: Borders); safecall;
    procedure Select; safecall;
    procedure Delete(var ShiftCells: OleVariant); safecall;
    procedure Formula(var Formula, NumFormat: OleVariant); safecall;
    procedure SetWidth(ColumnWidth: Single; RulerStyle: WdRulerStyle); safecall;
    procedure SetHeight(var RowHeight: OleVariant; HeightRule: WdRowHeightRule); safecall;
    procedure Merge(const MergeTo: Cell); safecall;
    procedure Split(var NumRows, NumColumns: OleVariant); safecall;
    procedure AutoSum; safecall;
    property Range: Range read Get_Range;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property RowIndex: Integer read Get_RowIndex;
    property ColumnIndex: Integer read Get_ColumnIndex;
    property Width: Single read Get_Width write Set_Width;
    property Height: Single read Get_Height write Set_Height;
    property HeightRule: WdRowHeightRule read Get_HeightRule write Set_HeightRule;
    property VerticalAlignment: WdCellVerticalAlignment read Get_VerticalAlignment write Set_VerticalAlignment;
    property Column: Column read Get_Column;
    property Row: Row read Get_Row;
    property Next: Cell read Get_Next;
    property Previous: Cell read Get_Previous;
    property Shading: Shading read Get_Shading;
    property Borders: Borders read Get_Borders write Set_Borders;
  end;

{ DispInterface declaration for Dual Interface Cell }

  CellDisp = dispinterface
    ['{0002094E-0000-0000-C000-000000000046}']
    property Range: Range readonly dispid 0;
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property RowIndex: Integer readonly dispid 4;
    property ColumnIndex: Integer readonly dispid 5;
    property Width: Single dispid 6;
    property Height: Single dispid 7;
    property HeightRule: WdRowHeightRule dispid 8;
    property VerticalAlignment: WdCellVerticalAlignment dispid 1104;
    property Column: Column readonly dispid 101;
    property Row: Row readonly dispid 102;
    property Next: Cell readonly dispid 103;
    property Previous: Cell readonly dispid 104;
    property Shading: Shading readonly dispid 105;
    property Borders: Borders dispid 1100;
    procedure Select; dispid 65535;
    procedure Delete(var ShiftCells: OleVariant); dispid 200;
    procedure Formula(var Formula, NumFormat: OleVariant); dispid 201;
    procedure SetWidth(ColumnWidth: Single; RulerStyle: WdRulerStyle); dispid 202;
    procedure SetHeight(var RowHeight: OleVariant; HeightRule: WdRowHeightRule); dispid 203;
    procedure Merge(const MergeTo: Cell); dispid 204;
    procedure Split(var NumRows, NumColumns: OleVariant); dispid 205;
    procedure AutoSum; dispid 206;
  end;

  Tables = interface(IDispatch)
    ['{0002094D-0000-0000-C000-000000000046}']
    function Get__NewEnum: IUnknown; safecall;
    function Get_Count: Integer; safecall;
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Item(Index: Integer): Table; safecall;
    function Add(const Range: Range; NumRows, NumColumns: Integer): Table; safecall;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Count: Integer read Get_Count;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
  end;

{ DispInterface declaration for Dual Interface Tables }

  TablesDisp = dispinterface
    ['{0002094D-0000-0000-C000-000000000046}']
    property _NewEnum: IUnknown readonly dispid -4;
    property Count: Integer readonly dispid 2;
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    function Item(Index: Integer): Table; dispid 0;
    function Add(const Range: Range; NumRows, NumColumns: Integer): Table; dispid 4;
  end;

  Rows = interface(IDispatch)
    ['{0002094C-0000-0000-C000-000000000046}']
    function Get__NewEnum: IUnknown; safecall;
    function Get_Count: Integer; safecall;
    function Get_AllowBreakAcrossPages: Integer; safecall;
    procedure Set_AllowBreakAcrossPages(Value: Integer); safecall;
    function Get_Alignment: WdRowAlignment; safecall;
    procedure Set_Alignment(Value: WdRowAlignment); safecall;
    function Get_HeadingFormat: Integer; safecall;
    procedure Set_HeadingFormat(Value: Integer); safecall;
    function Get_SpaceBetweenColumns: Single; safecall;
    procedure Set_SpaceBetweenColumns(Value: Single); safecall;
    function Get_Height: Single; safecall;
    procedure Set_Height(Value: Single); safecall;
    function Get_HeightRule: WdRowHeightRule; safecall;
    procedure Set_HeightRule(Value: WdRowHeightRule); safecall;
    function Get_LeftIndent: Single; safecall;
    procedure Set_LeftIndent(Value: Single); safecall;
    function Get_First: Row; safecall;
    function Get_Last: Row; safecall;
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Borders: Borders; safecall;
    procedure Set_Borders(const Value: Borders); safecall;
    function Get_Shading: Shading; safecall;
    function Item(Index: Integer): Row; safecall;
    function Add(var BeforeRow: OleVariant): Row; safecall;
    procedure Select; safecall;
    procedure Delete; safecall;
    procedure SetLeftIndent(LeftIndent: Single; RulerStyle: WdRulerStyle); safecall;
    procedure SetHeight(RowHeight: Single; HeightRule: WdRowHeightRule); safecall;
    function ConvertToText(var Separator: OleVariant): Range; safecall;
    procedure DistributeHeight; safecall;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Count: Integer read Get_Count;
    property AllowBreakAcrossPages: Integer read Get_AllowBreakAcrossPages write Set_AllowBreakAcrossPages;
    property Alignment: WdRowAlignment read Get_Alignment write Set_Alignment;
    property HeadingFormat: Integer read Get_HeadingFormat write Set_HeadingFormat;
    property SpaceBetweenColumns: Single read Get_SpaceBetweenColumns write Set_SpaceBetweenColumns;
    property Height: Single read Get_Height write Set_Height;
    property HeightRule: WdRowHeightRule read Get_HeightRule write Set_HeightRule;
    property LeftIndent: Single read Get_LeftIndent write Set_LeftIndent;
    property First: Row read Get_First;
    property Last: Row read Get_Last;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property Borders: Borders read Get_Borders write Set_Borders;
    property Shading: Shading read Get_Shading;
  end;

{ DispInterface declaration for Dual Interface Rows }

  RowsDisp = dispinterface
    ['{0002094C-0000-0000-C000-000000000046}']
    property _NewEnum: IUnknown readonly dispid -4;
    property Count: Integer readonly dispid 2;
    property AllowBreakAcrossPages: Integer dispid 3;
    property Alignment: WdRowAlignment dispid 4;
    property HeadingFormat: Integer dispid 5;
    property SpaceBetweenColumns: Single dispid 6;
    property Height: Single dispid 7;
    property HeightRule: WdRowHeightRule dispid 8;
    property LeftIndent: Single dispid 9;
    property First: Row readonly dispid 10;
    property Last: Row readonly dispid 11;
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property Borders: Borders dispid 1100;
    property Shading: Shading readonly dispid 102;
    function Item(Index: Integer): Row; dispid 0;
    function Add(var BeforeRow: OleVariant): Row; dispid 100;
    procedure Select; dispid 199;
    procedure Delete; dispid 200;
    procedure SetLeftIndent(LeftIndent: Single; RulerStyle: WdRulerStyle); dispid 202;
    procedure SetHeight(RowHeight: Single; HeightRule: WdRowHeightRule); dispid 203;
    function ConvertToText(var Separator: OleVariant): Range; dispid 16;
    procedure DistributeHeight; dispid 206;
  end;

  Columns = interface(IDispatch)
    ['{0002094B-0000-0000-C000-000000000046}']
    function Get__NewEnum: IUnknown; safecall;
    function Get_Count: Integer; safecall;
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_First: Column; safecall;
    function Get_Last: Column; safecall;
    function Get_Width: Single; safecall;
    procedure Set_Width(Value: Single); safecall;
    function Get_Borders: Borders; safecall;
    procedure Set_Borders(const Value: Borders); safecall;
    function Get_Shading: Shading; safecall;
    function Item(Index: Integer): Column; safecall;
    function Add(var BeforeColumn: OleVariant): Column; safecall;
    procedure Select; safecall;
    procedure Delete; safecall;
    procedure SetWidth(ColumnWidth: Single; RulerStyle: WdRulerStyle); safecall;
    procedure AutoFit; safecall;
    procedure DistributeWidth; safecall;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Count: Integer read Get_Count;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property First: Column read Get_First;
    property Last: Column read Get_Last;
    property Width: Single read Get_Width write Set_Width;
    property Borders: Borders read Get_Borders write Set_Borders;
    property Shading: Shading read Get_Shading;
  end;

{ DispInterface declaration for Dual Interface Columns }

  ColumnsDisp = dispinterface
    ['{0002094B-0000-0000-C000-000000000046}']
    property _NewEnum: IUnknown readonly dispid -4;
    property Count: Integer readonly dispid 2;
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property First: Column readonly dispid 100;
    property Last: Column readonly dispid 101;
    property Width: Single dispid 3;
    property Borders: Borders dispid 1100;
    property Shading: Shading readonly dispid 103;
    function Item(Index: Integer): Column; dispid 0;
    function Add(var BeforeColumn: OleVariant): Column; dispid 5;
    procedure Select; dispid 199;
    procedure Delete; dispid 200;
    procedure SetWidth(ColumnWidth: Single; RulerStyle: WdRulerStyle); dispid 201;
    procedure AutoFit; dispid 202;
    procedure DistributeWidth; dispid 203;
  end;

  Cells = interface(IDispatch)
    ['{0002094A-0000-0000-C000-000000000046}']
    function Get__NewEnum: IUnknown; safecall;
    function Get_Count: Integer; safecall;
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Width: Single; safecall;
    procedure Set_Width(Value: Single); safecall;
    function Get_Height: Single; safecall;
    procedure Set_Height(Value: Single); safecall;
    function Get_HeightRule: WdRowHeightRule; safecall;
    procedure Set_HeightRule(Value: WdRowHeightRule); safecall;
    function Get_VerticalAlignment: WdCellVerticalAlignment; safecall;
    procedure Set_VerticalAlignment(Value: WdCellVerticalAlignment); safecall;
    function Get_Borders: Borders; safecall;
    procedure Set_Borders(const Value: Borders); safecall;
    function Get_Shading: Shading; safecall;
    function Item(Index: Integer): Cell; safecall;
    function Add(var BeforeCell: OleVariant): Cell; safecall;
    procedure Delete(var ShiftCells: OleVariant); safecall;
    procedure SetWidth(ColumnWidth: Single; RulerStyle: WdRulerStyle); safecall;
    procedure SetHeight(var RowHeight: OleVariant; HeightRule: WdRowHeightRule); safecall;
    procedure Merge; safecall;
    procedure Split(var NumRows, NumColumns, MergeBeforeSplit: OleVariant); safecall;
    procedure DistributeHeight; safecall;
    procedure DistributeWidth; safecall;
    procedure AutoFit; safecall;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Count: Integer read Get_Count;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property Width: Single read Get_Width write Set_Width;
    property Height: Single read Get_Height write Set_Height;
    property HeightRule: WdRowHeightRule read Get_HeightRule write Set_HeightRule;
    property VerticalAlignment: WdCellVerticalAlignment read Get_VerticalAlignment write Set_VerticalAlignment;
    property Borders: Borders read Get_Borders write Set_Borders;
    property Shading: Shading read Get_Shading;
  end;

{ DispInterface declaration for Dual Interface Cells }

  CellsDisp = dispinterface
    ['{0002094A-0000-0000-C000-000000000046}']
    property _NewEnum: IUnknown readonly dispid -4;
    property Count: Integer readonly dispid 2;
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property Width: Single dispid 6;
    property Height: Single dispid 7;
    property HeightRule: WdRowHeightRule dispid 8;
    property VerticalAlignment: WdCellVerticalAlignment dispid 1104;
    property Borders: Borders dispid 1100;
    property Shading: Shading readonly dispid 101;
    function Item(Index: Integer): Cell; dispid 0;
    function Add(var BeforeCell: OleVariant): Cell; dispid 4;
    procedure Delete(var ShiftCells: OleVariant); dispid 200;
    procedure SetWidth(ColumnWidth: Single; RulerStyle: WdRulerStyle); dispid 202;
    procedure SetHeight(var RowHeight: OleVariant; HeightRule: WdRowHeightRule); dispid 203;
    procedure Merge; dispid 204;
    procedure Split(var NumRows, NumColumns, MergeBeforeSplit: OleVariant); dispid 205;
    procedure DistributeHeight; dispid 206;
    procedure DistributeWidth; dispid 207;
    procedure AutoFit; dispid 208;
  end;

  AutoCorrect = interface(IDispatch)
    ['{00020949-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_CorrectDays: WordBool; safecall;
    procedure Set_CorrectDays(Value: WordBool); safecall;
    function Get_CorrectInitialCaps: WordBool; safecall;
    procedure Set_CorrectInitialCaps(Value: WordBool); safecall;
    function Get_CorrectSentenceCaps: WordBool; safecall;
    procedure Set_CorrectSentenceCaps(Value: WordBool); safecall;
    function Get_ReplaceText: WordBool; safecall;
    procedure Set_ReplaceText(Value: WordBool); safecall;
    function Get_Entries: AutoCorrectEntries; safecall;
    function Get_FirstLetterExceptions: FirstLetterExceptions; safecall;
    function Get_FirstLetterAutoAdd: WordBool; safecall;
    procedure Set_FirstLetterAutoAdd(Value: WordBool); safecall;
    function Get_TwoInitialCapsExceptions: TwoInitialCapsExceptions; safecall;
    function Get_TwoInitialCapsAutoAdd: WordBool; safecall;
    procedure Set_TwoInitialCapsAutoAdd(Value: WordBool); safecall;
    function Get_CorrectCapsLock: WordBool; safecall;
    procedure Set_CorrectCapsLock(Value: WordBool); safecall;
    function Get_CorrectHangulAndAlphabet: WordBool; safecall;
    procedure Set_CorrectHangulAndAlphabet(Value: WordBool); safecall;
    function Get_HangulAndAlphabetExceptions: HangulAndAlphabetExceptions; safecall;
    function Get_HangulAndAlphabetAutoAdd: WordBool; safecall;
    procedure Set_HangulAndAlphabetAutoAdd(Value: WordBool); safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property CorrectDays: WordBool read Get_CorrectDays write Set_CorrectDays;
    property CorrectInitialCaps: WordBool read Get_CorrectInitialCaps write Set_CorrectInitialCaps;
    property CorrectSentenceCaps: WordBool read Get_CorrectSentenceCaps write Set_CorrectSentenceCaps;
    property ReplaceText: WordBool read Get_ReplaceText write Set_ReplaceText;
    property Entries: AutoCorrectEntries read Get_Entries;
    property FirstLetterExceptions: FirstLetterExceptions read Get_FirstLetterExceptions;
    property FirstLetterAutoAdd: WordBool read Get_FirstLetterAutoAdd write Set_FirstLetterAutoAdd;
    property TwoInitialCapsExceptions: TwoInitialCapsExceptions read Get_TwoInitialCapsExceptions;
    property TwoInitialCapsAutoAdd: WordBool read Get_TwoInitialCapsAutoAdd write Set_TwoInitialCapsAutoAdd;
    property CorrectCapsLock: WordBool read Get_CorrectCapsLock write Set_CorrectCapsLock;
    property CorrectHangulAndAlphabet: WordBool read Get_CorrectHangulAndAlphabet write Set_CorrectHangulAndAlphabet;
    property HangulAndAlphabetExceptions: HangulAndAlphabetExceptions read Get_HangulAndAlphabetExceptions;
    property HangulAndAlphabetAutoAdd: WordBool read Get_HangulAndAlphabetAutoAdd write Set_HangulAndAlphabetAutoAdd;
  end;

{ DispInterface declaration for Dual Interface AutoCorrect }

  AutoCorrectDisp = dispinterface
    ['{00020949-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property CorrectDays: WordBool dispid 1;
    property CorrectInitialCaps: WordBool dispid 2;
    property CorrectSentenceCaps: WordBool dispid 3;
    property ReplaceText: WordBool dispid 4;
    property Entries: AutoCorrectEntries readonly dispid 6;
    property FirstLetterExceptions: FirstLetterExceptions readonly dispid 7;
    property FirstLetterAutoAdd: WordBool dispid 8;
    property TwoInitialCapsExceptions: TwoInitialCapsExceptions readonly dispid 9;
    property TwoInitialCapsAutoAdd: WordBool dispid 10;
    property CorrectCapsLock: WordBool dispid 11;
    property CorrectHangulAndAlphabet: WordBool dispid 12;
    property HangulAndAlphabetExceptions: HangulAndAlphabetExceptions readonly dispid 13;
    property HangulAndAlphabetAutoAdd: WordBool dispid 14;
  end;

  AutoCorrectEntries = interface(IDispatch)
    ['{00020948-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get__NewEnum: IUnknown; safecall;
    function Get_Count: Integer; safecall;
    function Item(var Index: OleVariant): AutoCorrectEntry; safecall;
    function Add(const Name, Value: WideString): AutoCorrectEntry; safecall;
    function AddRichText(const Name: WideString; const Range: Range): AutoCorrectEntry; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Count: Integer read Get_Count;
  end;

{ DispInterface declaration for Dual Interface AutoCorrectEntries }

  AutoCorrectEntriesDisp = dispinterface
    ['{00020948-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property _NewEnum: IUnknown readonly dispid -4;
    property Count: Integer readonly dispid 1;
    function Item(var Index: OleVariant): AutoCorrectEntry; dispid 0;
    function Add(const Name, Value: WideString): AutoCorrectEntry; dispid 101;
    function AddRichText(const Name: WideString; const Range: Range): AutoCorrectEntry; dispid 102;
  end;

  AutoCorrectEntry = interface(IDispatch)
    ['{00020947-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Index: Integer; safecall;
    function Get_Name: WideString; safecall;
    procedure Set_Name(const Value: WideString); safecall;
    function Get_Value: WideString; safecall;
    procedure Set_Value(const Value: WideString); safecall;
    function Get_RichText: WordBool; safecall;
    procedure Delete; safecall;
    procedure Apply(const Range: Range); safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property Index: Integer read Get_Index;
    property Name: WideString read Get_Name write Set_Name;
    property Value: WideString read Get_Value write Set_Value;
    property RichText: WordBool read Get_RichText;
  end;

{ DispInterface declaration for Dual Interface AutoCorrectEntry }

  AutoCorrectEntryDisp = dispinterface
    ['{00020947-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property Index: Integer readonly dispid 1;
    property Name: WideString dispid 2;
    property Value: WideString dispid 3;
    property RichText: WordBool readonly dispid 4;
    procedure Delete; dispid 101;
    procedure Apply(const Range: Range); dispid 102;
  end;

  FirstLetterExceptions = interface(IDispatch)
    ['{00020946-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get__NewEnum: IUnknown; safecall;
    function Get_Count: Integer; safecall;
    function Item(var Index: OleVariant): FirstLetterException; safecall;
    function Add(const Name: WideString): FirstLetterException; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Count: Integer read Get_Count;
  end;

{ DispInterface declaration for Dual Interface FirstLetterExceptions }

  FirstLetterExceptionsDisp = dispinterface
    ['{00020946-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property _NewEnum: IUnknown readonly dispid -4;
    property Count: Integer readonly dispid 1;
    function Item(var Index: OleVariant): FirstLetterException; dispid 0;
    function Add(const Name: WideString): FirstLetterException; dispid 101;
  end;

  FirstLetterException = interface(IDispatch)
    ['{00020945-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Index: Integer; safecall;
    function Get_Name: WideString; safecall;
    procedure Delete; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property Index: Integer read Get_Index;
    property Name: WideString read Get_Name;
  end;

{ DispInterface declaration for Dual Interface FirstLetterException }

  FirstLetterExceptionDisp = dispinterface
    ['{00020945-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property Index: Integer readonly dispid 1;
    property Name: WideString readonly dispid 2;
    procedure Delete; dispid 101;
  end;

  TwoInitialCapsExceptions = interface(IDispatch)
    ['{00020944-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get__NewEnum: IUnknown; safecall;
    function Get_Count: Integer; safecall;
    function Item(var Index: OleVariant): TwoInitialCapsException; safecall;
    function Add(const Name: WideString): TwoInitialCapsException; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Count: Integer read Get_Count;
  end;

{ DispInterface declaration for Dual Interface TwoInitialCapsExceptions }

  TwoInitialCapsExceptionsDisp = dispinterface
    ['{00020944-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property _NewEnum: IUnknown readonly dispid -4;
    property Count: Integer readonly dispid 1;
    function Item(var Index: OleVariant): TwoInitialCapsException; dispid 0;
    function Add(const Name: WideString): TwoInitialCapsException; dispid 101;
  end;

  TwoInitialCapsException = interface(IDispatch)
    ['{00020943-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Index: Integer; safecall;
    function Get_Name: WideString; safecall;
    procedure Delete; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property Index: Integer read Get_Index;
    property Name: WideString read Get_Name;
  end;

{ DispInterface declaration for Dual Interface TwoInitialCapsException }

  TwoInitialCapsExceptionDisp = dispinterface
    ['{00020943-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property Index: Integer readonly dispid 1;
    property Name: WideString readonly dispid 2;
    procedure Delete; dispid 101;
  end;

  Footnotes = interface(IDispatch)
    ['{00020942-0000-0000-C000-000000000046}']
    function Get__NewEnum: IUnknown; safecall;
    function Get_Count: Integer; safecall;
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Location: WdFootnoteLocation; safecall;
    procedure Set_Location(Value: WdFootnoteLocation); safecall;
    function Get_NumberStyle: WdNoteNumberStyle; safecall;
    procedure Set_NumberStyle(Value: WdNoteNumberStyle); safecall;
    function Get_StartingNumber: Integer; safecall;
    procedure Set_StartingNumber(Value: Integer); safecall;
    function Get_NumberingRule: WdNumberingRule; safecall;
    procedure Set_NumberingRule(Value: WdNumberingRule); safecall;
    function Get_Separator: Range; safecall;
    function Get_ContinuationSeparator: Range; safecall;
    function Get_ContinuationNotice: Range; safecall;
    function Item(Index: Integer): Footnote; safecall;
    function Add(const Range: Range; var Reference, Text: OleVariant): Footnote; safecall;
    procedure Convert; safecall;
    procedure SwapWithEndnotes; safecall;
    procedure ResetSeparator; safecall;
    procedure ResetContinuationSeparator; safecall;
    procedure ResetContinuationNotice; safecall;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Count: Integer read Get_Count;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property Location: WdFootnoteLocation read Get_Location write Set_Location;
    property NumberStyle: WdNoteNumberStyle read Get_NumberStyle write Set_NumberStyle;
    property StartingNumber: Integer read Get_StartingNumber write Set_StartingNumber;
    property NumberingRule: WdNumberingRule read Get_NumberingRule write Set_NumberingRule;
    property Separator: Range read Get_Separator;
    property ContinuationSeparator: Range read Get_ContinuationSeparator;
    property ContinuationNotice: Range read Get_ContinuationNotice;
  end;

{ DispInterface declaration for Dual Interface Footnotes }

  FootnotesDisp = dispinterface
    ['{00020942-0000-0000-C000-000000000046}']
    property _NewEnum: IUnknown readonly dispid -4;
    property Count: Integer readonly dispid 2;
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property Location: WdFootnoteLocation dispid 100;
    property NumberStyle: WdNoteNumberStyle dispid 101;
    property StartingNumber: Integer dispid 102;
    property NumberingRule: WdNumberingRule dispid 103;
    property Separator: Range readonly dispid 104;
    property ContinuationSeparator: Range readonly dispid 105;
    property ContinuationNotice: Range readonly dispid 106;
    function Item(Index: Integer): Footnote; dispid 0;
    function Add(const Range: Range; var Reference, Text: OleVariant): Footnote; dispid 4;
    procedure Convert; dispid 5;
    procedure SwapWithEndnotes; dispid 6;
    procedure ResetSeparator; dispid 7;
    procedure ResetContinuationSeparator; dispid 8;
    procedure ResetContinuationNotice; dispid 9;
  end;

  Endnotes = interface(IDispatch)
    ['{00020941-0000-0000-C000-000000000046}']
    function Get__NewEnum: IUnknown; safecall;
    function Get_Count: Integer; safecall;
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Location: WdEndnoteLocation; safecall;
    procedure Set_Location(Value: WdEndnoteLocation); safecall;
    function Get_NumberStyle: WdNoteNumberStyle; safecall;
    procedure Set_NumberStyle(Value: WdNoteNumberStyle); safecall;
    function Get_StartingNumber: Integer; safecall;
    procedure Set_StartingNumber(Value: Integer); safecall;
    function Get_NumberingRule: WdNumberingRule; safecall;
    procedure Set_NumberingRule(Value: WdNumberingRule); safecall;
    function Get_Separator: Range; safecall;
    function Get_ContinuationSeparator: Range; safecall;
    function Get_ContinuationNotice: Range; safecall;
    function Item(Index: Integer): Endnote; safecall;
    function Add(const Range: Range; var Reference, Text: OleVariant): Endnote; safecall;
    procedure Convert; safecall;
    procedure SwapWithFootnotes; safecall;
    procedure ResetSeparator; safecall;
    procedure ResetContinuationSeparator; safecall;
    procedure ResetContinuationNotice; safecall;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Count: Integer read Get_Count;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property Location: WdEndnoteLocation read Get_Location write Set_Location;
    property NumberStyle: WdNoteNumberStyle read Get_NumberStyle write Set_NumberStyle;
    property StartingNumber: Integer read Get_StartingNumber write Set_StartingNumber;
    property NumberingRule: WdNumberingRule read Get_NumberingRule write Set_NumberingRule;
    property Separator: Range read Get_Separator;
    property ContinuationSeparator: Range read Get_ContinuationSeparator;
    property ContinuationNotice: Range read Get_ContinuationNotice;
  end;

{ DispInterface declaration for Dual Interface Endnotes }

  EndnotesDisp = dispinterface
    ['{00020941-0000-0000-C000-000000000046}']
    property _NewEnum: IUnknown readonly dispid -4;
    property Count: Integer readonly dispid 2;
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property Location: WdEndnoteLocation dispid 100;
    property NumberStyle: WdNoteNumberStyle dispid 101;
    property StartingNumber: Integer dispid 102;
    property NumberingRule: WdNumberingRule dispid 103;
    property Separator: Range readonly dispid 104;
    property ContinuationSeparator: Range readonly dispid 105;
    property ContinuationNotice: Range readonly dispid 106;
    function Item(Index: Integer): Endnote; dispid 0;
    function Add(const Range: Range; var Reference, Text: OleVariant): Endnote; dispid 4;
    procedure Convert; dispid 5;
    procedure SwapWithFootnotes; dispid 6;
    procedure ResetSeparator; dispid 7;
    procedure ResetContinuationSeparator; dispid 8;
    procedure ResetContinuationNotice; dispid 9;
  end;

  Comments = interface(IDispatch)
    ['{00020940-0000-0000-C000-000000000046}']
    function Get__NewEnum: IUnknown; safecall;
    function Get_Count: Integer; safecall;
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_ShowBy: WideString; safecall;
    procedure Set_ShowBy(const Value: WideString); safecall;
    function Item(Index: Integer): Comment; safecall;
    function Add(const Range: Range; var Text: OleVariant): Comment; safecall;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Count: Integer read Get_Count;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property ShowBy: WideString read Get_ShowBy write Set_ShowBy;
  end;

{ DispInterface declaration for Dual Interface Comments }

  CommentsDisp = dispinterface
    ['{00020940-0000-0000-C000-000000000046}']
    property _NewEnum: IUnknown readonly dispid -4;
    property Count: Integer readonly dispid 2;
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property ShowBy: WideString dispid 1003;
    function Item(Index: Integer): Comment; dispid 0;
    function Add(const Range: Range; var Text: OleVariant): Comment; dispid 4;
  end;

  Footnote = interface(IDispatch)
    ['{0002093F-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Range: Range; safecall;
    function Get_Reference: Range; safecall;
    function Get_Index: Integer; safecall;
    procedure Delete; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property Range: Range read Get_Range;
    property Reference: Range read Get_Reference;
    property Index: Integer read Get_Index;
  end;

{ DispInterface declaration for Dual Interface Footnote }

  FootnoteDisp = dispinterface
    ['{0002093F-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property Range: Range readonly dispid 4;
    property Reference: Range readonly dispid 5;
    property Index: Integer readonly dispid 6;
    procedure Delete; dispid 10;
  end;

  Endnote = interface(IDispatch)
    ['{0002093E-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Range: Range; safecall;
    function Get_Reference: Range; safecall;
    function Get_Index: Integer; safecall;
    procedure Delete; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property Range: Range read Get_Range;
    property Reference: Range read Get_Reference;
    property Index: Integer read Get_Index;
  end;

{ DispInterface declaration for Dual Interface Endnote }

  EndnoteDisp = dispinterface
    ['{0002093E-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property Range: Range readonly dispid 4;
    property Reference: Range readonly dispid 5;
    property Index: Integer readonly dispid 6;
    procedure Delete; dispid 10;
  end;

  Comment = interface(IDispatch)
    ['{0002093D-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Range: Range; safecall;
    function Get_Reference: Range; safecall;
    function Get_Scope: Range; safecall;
    function Get_Index: Integer; safecall;
    function Get_Author: WideString; safecall;
    procedure Set_Author(const Value: WideString); safecall;
    function Get_Initial: WideString; safecall;
    procedure Set_Initial(const Value: WideString); safecall;
    function Get_ShowTip: WordBool; safecall;
    procedure Set_ShowTip(Value: WordBool); safecall;
    procedure Delete; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property Range: Range read Get_Range;
    property Reference: Range read Get_Reference;
    property Scope: Range read Get_Scope;
    property Index: Integer read Get_Index;
    property Author: WideString read Get_Author write Set_Author;
    property Initial: WideString read Get_Initial write Set_Initial;
    property ShowTip: WordBool read Get_ShowTip write Set_ShowTip;
  end;

{ DispInterface declaration for Dual Interface Comment }

  CommentDisp = dispinterface
    ['{0002093D-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property Range: Range readonly dispid 1003;
    property Reference: Range readonly dispid 1004;
    property Scope: Range readonly dispid 1005;
    property Index: Integer readonly dispid 1006;
    property Author: WideString dispid 1007;
    property Initial: WideString dispid 1008;
    property ShowTip: WordBool dispid 1009;
    procedure Delete; dispid 10;
  end;

  Borders = interface(IDispatch)
    ['{0002093C-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get__NewEnum: IUnknown; safecall;
    function Get_Count: Integer; safecall;
    function Get_Enable: Integer; safecall;
    procedure Set_Enable(Value: Integer); safecall;
    function Get_DistanceFromTop: Integer; safecall;
    procedure Set_DistanceFromTop(Value: Integer); safecall;
    function Get_Shadow: WordBool; safecall;
    procedure Set_Shadow(Value: WordBool); safecall;
    function Get_InsideLineStyle: WdLineStyle; safecall;
    procedure Set_InsideLineStyle(Value: WdLineStyle); safecall;
    function Get_OutsideLineStyle: WdLineStyle; safecall;
    procedure Set_OutsideLineStyle(Value: WdLineStyle); safecall;
    function Get_InsideLineWidth: WdLineWidth; safecall;
    procedure Set_InsideLineWidth(Value: WdLineWidth); safecall;
    function Get_OutsideLineWidth: WdLineWidth; safecall;
    procedure Set_OutsideLineWidth(Value: WdLineWidth); safecall;
    function Get_InsideColorIndex: WdColorIndex; safecall;
    procedure Set_InsideColorIndex(Value: WdColorIndex); safecall;
    function Get_OutsideColorIndex: WdColorIndex; safecall;
    procedure Set_OutsideColorIndex(Value: WdColorIndex); safecall;
    function Get_DistanceFromLeft: Integer; safecall;
    procedure Set_DistanceFromLeft(Value: Integer); safecall;
    function Get_DistanceFromBottom: Integer; safecall;
    procedure Set_DistanceFromBottom(Value: Integer); safecall;
    function Get_DistanceFromRight: Integer; safecall;
    procedure Set_DistanceFromRight(Value: Integer); safecall;
    function Get_AlwaysInFront: WordBool; safecall;
    procedure Set_AlwaysInFront(Value: WordBool); safecall;
    function Get_SurroundHeader: WordBool; safecall;
    procedure Set_SurroundHeader(Value: WordBool); safecall;
    function Get_SurroundFooter: WordBool; safecall;
    procedure Set_SurroundFooter(Value: WordBool); safecall;
    function Get_JoinBorders: WordBool; safecall;
    procedure Set_JoinBorders(Value: WordBool); safecall;
    function Get_HasHorizontal: WordBool; safecall;
    function Get_HasVertical: WordBool; safecall;
    function Get_DistanceFrom: WdBorderDistanceFrom; safecall;
    procedure Set_DistanceFrom(Value: WdBorderDistanceFrom); safecall;
    function Get_EnableFirstPageInSection: WordBool; safecall;
    procedure Set_EnableFirstPageInSection(Value: WordBool); safecall;
    function Get_EnableOtherPagesInSection: WordBool; safecall;
    procedure Set_EnableOtherPagesInSection(Value: WordBool); safecall;
    function Item(Index: WdBorderType): Border; safecall;
    procedure ApplyPageBordersToAllSections; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Count: Integer read Get_Count;
    property Enable: Integer read Get_Enable write Set_Enable;
    property DistanceFromTop: Integer read Get_DistanceFromTop write Set_DistanceFromTop;
    property Shadow: WordBool read Get_Shadow write Set_Shadow;
    property InsideLineStyle: WdLineStyle read Get_InsideLineStyle write Set_InsideLineStyle;
    property OutsideLineStyle: WdLineStyle read Get_OutsideLineStyle write Set_OutsideLineStyle;
    property InsideLineWidth: WdLineWidth read Get_InsideLineWidth write Set_InsideLineWidth;
    property OutsideLineWidth: WdLineWidth read Get_OutsideLineWidth write Set_OutsideLineWidth;
    property InsideColorIndex: WdColorIndex read Get_InsideColorIndex write Set_InsideColorIndex;
    property OutsideColorIndex: WdColorIndex read Get_OutsideColorIndex write Set_OutsideColorIndex;
    property DistanceFromLeft: Integer read Get_DistanceFromLeft write Set_DistanceFromLeft;
    property DistanceFromBottom: Integer read Get_DistanceFromBottom write Set_DistanceFromBottom;
    property DistanceFromRight: Integer read Get_DistanceFromRight write Set_DistanceFromRight;
    property AlwaysInFront: WordBool read Get_AlwaysInFront write Set_AlwaysInFront;
    property SurroundHeader: WordBool read Get_SurroundHeader write Set_SurroundHeader;
    property SurroundFooter: WordBool read Get_SurroundFooter write Set_SurroundFooter;
    property JoinBorders: WordBool read Get_JoinBorders write Set_JoinBorders;
    property HasHorizontal: WordBool read Get_HasHorizontal;
    property HasVertical: WordBool read Get_HasVertical;
    property DistanceFrom: WdBorderDistanceFrom read Get_DistanceFrom write Set_DistanceFrom;
    property EnableFirstPageInSection: WordBool read Get_EnableFirstPageInSection write Set_EnableFirstPageInSection;
    property EnableOtherPagesInSection: WordBool read Get_EnableOtherPagesInSection write Set_EnableOtherPagesInSection;
  end;

{ DispInterface declaration for Dual Interface Borders }

  BordersDisp = dispinterface
    ['{0002093C-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property _NewEnum: IUnknown readonly dispid -4;
    property Count: Integer readonly dispid 1;
    property Enable: Integer dispid 2;
    property DistanceFromTop: Integer dispid 4;
    property Shadow: WordBool dispid 5;
    property InsideLineStyle: WdLineStyle dispid 6;
    property OutsideLineStyle: WdLineStyle dispid 7;
    property InsideLineWidth: WdLineWidth dispid 8;
    property OutsideLineWidth: WdLineWidth dispid 9;
    property InsideColorIndex: WdColorIndex dispid 10;
    property OutsideColorIndex: WdColorIndex dispid 11;
    property DistanceFromLeft: Integer dispid 20;
    property DistanceFromBottom: Integer dispid 21;
    property DistanceFromRight: Integer dispid 22;
    property AlwaysInFront: WordBool dispid 23;
    property SurroundHeader: WordBool dispid 24;
    property SurroundFooter: WordBool dispid 25;
    property JoinBorders: WordBool dispid 26;
    property HasHorizontal: WordBool readonly dispid 27;
    property HasVertical: WordBool readonly dispid 28;
    property DistanceFrom: WdBorderDistanceFrom dispid 29;
    property EnableFirstPageInSection: WordBool dispid 30;
    property EnableOtherPagesInSection: WordBool dispid 31;
    function Item(Index: WdBorderType): Border; dispid 0;
    procedure ApplyPageBordersToAllSections; dispid 2000;
  end;

  Border = interface(IDispatch)
    ['{0002093B-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Visible: WordBool; safecall;
    procedure Set_Visible(Value: WordBool); safecall;
    function Get_ColorIndex: WdColorIndex; safecall;
    procedure Set_ColorIndex(Value: WdColorIndex); safecall;
    function Get_Inside: WordBool; safecall;
    function Get_LineStyle: WdLineStyle; safecall;
    procedure Set_LineStyle(Value: WdLineStyle); safecall;
    function Get_LineWidth: WdLineWidth; safecall;
    procedure Set_LineWidth(Value: WdLineWidth); safecall;
    function Get_ArtStyle: WdPageBorderArt; safecall;
    procedure Set_ArtStyle(Value: WdPageBorderArt); safecall;
    function Get_ArtWidth: Integer; safecall;
    procedure Set_ArtWidth(Value: Integer); safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property Visible: WordBool read Get_Visible write Set_Visible;
    property ColorIndex: WdColorIndex read Get_ColorIndex write Set_ColorIndex;
    property Inside: WordBool read Get_Inside;
    property LineStyle: WdLineStyle read Get_LineStyle write Set_LineStyle;
    property LineWidth: WdLineWidth read Get_LineWidth write Set_LineWidth;
    property ArtStyle: WdPageBorderArt read Get_ArtStyle write Set_ArtStyle;
    property ArtWidth: Integer read Get_ArtWidth write Set_ArtWidth;
  end;

{ DispInterface declaration for Dual Interface Border }

  BorderDisp = dispinterface
    ['{0002093B-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property Visible: WordBool dispid 0;
    property ColorIndex: WdColorIndex dispid 1;
    property Inside: WordBool readonly dispid 2;
    property LineStyle: WdLineStyle dispid 3;
    property LineWidth: WdLineWidth dispid 4;
    property ArtStyle: WdPageBorderArt dispid 5;
    property ArtWidth: Integer dispid 6;
  end;

  Shading = interface(IDispatch)
    ['{0002093A-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_ForegroundPatternColorIndex: WdColorIndex; safecall;
    procedure Set_ForegroundPatternColorIndex(Value: WdColorIndex); safecall;
    function Get_BackgroundPatternColorIndex: WdColorIndex; safecall;
    procedure Set_BackgroundPatternColorIndex(Value: WdColorIndex); safecall;
    function Get_Texture: WdTextureIndex; safecall;
    procedure Set_Texture(Value: WdTextureIndex); safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property ForegroundPatternColorIndex: WdColorIndex read Get_ForegroundPatternColorIndex write Set_ForegroundPatternColorIndex;
    property BackgroundPatternColorIndex: WdColorIndex read Get_BackgroundPatternColorIndex write Set_BackgroundPatternColorIndex;
    property Texture: WdTextureIndex read Get_Texture write Set_Texture;
  end;

{ DispInterface declaration for Dual Interface Shading }

  ShadingDisp = dispinterface
    ['{0002093A-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property ForegroundPatternColorIndex: WdColorIndex dispid 1;
    property BackgroundPatternColorIndex: WdColorIndex dispid 2;
    property Texture: WdTextureIndex dispid 3;
  end;

  TextRetrievalMode = interface(IDispatch)
    ['{00020939-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_ViewType: WdViewType; safecall;
    procedure Set_ViewType(Value: WdViewType); safecall;
    function Get_Duplicate: TextRetrievalMode; safecall;
    function Get_IncludeHiddenText: WordBool; safecall;
    procedure Set_IncludeHiddenText(Value: WordBool); safecall;
    function Get_IncludeFieldCodes: WordBool; safecall;
    procedure Set_IncludeFieldCodes(Value: WordBool); safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property ViewType: WdViewType read Get_ViewType write Set_ViewType;
    property Duplicate: TextRetrievalMode read Get_Duplicate;
    property IncludeHiddenText: WordBool read Get_IncludeHiddenText write Set_IncludeHiddenText;
    property IncludeFieldCodes: WordBool read Get_IncludeFieldCodes write Set_IncludeFieldCodes;
  end;

{ DispInterface declaration for Dual Interface TextRetrievalMode }

  TextRetrievalModeDisp = dispinterface
    ['{00020939-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property ViewType: WdViewType dispid 0;
    property Duplicate: TextRetrievalMode readonly dispid 1;
    property IncludeHiddenText: WordBool dispid 2;
    property IncludeFieldCodes: WordBool dispid 3;
  end;

  AutoTextEntries = interface(IDispatch)
    ['{00020937-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get__NewEnum: IUnknown; safecall;
    function Get_Count: Integer; safecall;
    function Item(var Index: OleVariant): AutoTextEntry; safecall;
    function Add(const Name: WideString; const Range: Range): AutoTextEntry; safecall;
    function AppendToSpike(const Range: Range): AutoTextEntry; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Count: Integer read Get_Count;
  end;

{ DispInterface declaration for Dual Interface AutoTextEntries }

  AutoTextEntriesDisp = dispinterface
    ['{00020937-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property _NewEnum: IUnknown readonly dispid -4;
    property Count: Integer readonly dispid 1;
    function Item(var Index: OleVariant): AutoTextEntry; dispid 0;
    function Add(const Name: WideString; const Range: Range): AutoTextEntry; dispid 101;
    function AppendToSpike(const Range: Range): AutoTextEntry; dispid 102;
  end;

  AutoTextEntry = interface(IDispatch)
    ['{00020936-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Index: Integer; safecall;
    function Get_Name: WideString; safecall;
    procedure Set_Name(const Value: WideString); safecall;
    function Get_StyleName: WideString; safecall;
    function Get_Value: WideString; safecall;
    procedure Set_Value(const Value: WideString); safecall;
    procedure Delete; safecall;
    function Insert(const Where: Range; var RichText: OleVariant): Range; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property Index: Integer read Get_Index;
    property Name: WideString read Get_Name write Set_Name;
    property StyleName: WideString read Get_StyleName;
    property Value: WideString read Get_Value write Set_Value;
  end;

{ DispInterface declaration for Dual Interface AutoTextEntry }

  AutoTextEntryDisp = dispinterface
    ['{00020936-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property Index: Integer readonly dispid 1;
    property Name: WideString dispid 2;
    property StyleName: WideString readonly dispid 3;
    property Value: WideString dispid 0;
    procedure Delete; dispid 101;
    function Insert(const Where: Range; var RichText: OleVariant): Range; dispid 102;
  end;

  System = interface(IDispatch)
    ['{00020935-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_OperatingSystem: WideString; safecall;
    function Get_ProcessorType: WideString; safecall;
    function Get_Version: WideString; safecall;
    function Get_FreeDiskSpace: Integer; safecall;
    function Get_Country: WdCountry; safecall;
    function Get_LanguageDesignation: WideString; safecall;
    function Get_HorizontalResolution: Integer; safecall;
    function Get_VerticalResolution: Integer; safecall;
    function Get_ProfileString(const Section, Key: WideString): WideString; safecall;
    procedure Set_ProfileString(const Section, Key: WideString; const Value: WideString); safecall;
    function Get_PrivateProfileString(const FileName, Section, Key: WideString): WideString; safecall;
    procedure Set_PrivateProfileString(const FileName, Section, Key: WideString; const Value: WideString); safecall;
    function Get_MathCoprocessorInstalled: WordBool; safecall;
    function Get_ComputerType: WideString; safecall;
    function Get_MacintoshName: WideString; safecall;
    function Get_QuickDrawInstalled: WordBool; safecall;
    function Get_Cursor: WdCursorType; safecall;
    procedure Set_Cursor(Value: WdCursorType); safecall;
    procedure MSInfo; safecall;
    procedure Connect(const Path: WideString; var Drive, Password: OleVariant); safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property OperatingSystem: WideString read Get_OperatingSystem;
    property ProcessorType: WideString read Get_ProcessorType;
    property Version: WideString read Get_Version;
    property FreeDiskSpace: Integer read Get_FreeDiskSpace;
    property Country: WdCountry read Get_Country;
    property LanguageDesignation: WideString read Get_LanguageDesignation;
    property HorizontalResolution: Integer read Get_HorizontalResolution;
    property VerticalResolution: Integer read Get_VerticalResolution;
    property ProfileString[const Section, Key: WideString]: WideString read Get_ProfileString write Set_ProfileString;
    property PrivateProfileString[const FileName, Section, Key: WideString]: WideString read Get_PrivateProfileString write Set_PrivateProfileString;
    property MathCoprocessorInstalled: WordBool read Get_MathCoprocessorInstalled;
    property ComputerType: WideString read Get_ComputerType;
    property MacintoshName: WideString read Get_MacintoshName;
    property QuickDrawInstalled: WordBool read Get_QuickDrawInstalled;
    property Cursor: WdCursorType read Get_Cursor write Set_Cursor;
  end;

{ DispInterface declaration for Dual Interface System }

  SystemDisp = dispinterface
    ['{00020935-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property OperatingSystem: WideString readonly dispid 1;
    property ProcessorType: WideString readonly dispid 2;
    property Version: WideString readonly dispid 3;
    property FreeDiskSpace: Integer readonly dispid 4;
    property Country: WdCountry readonly dispid 5;
    property LanguageDesignation: WideString readonly dispid 6;
    property HorizontalResolution: Integer readonly dispid 7;
    property VerticalResolution: Integer readonly dispid 8;
    property ProfileString[const Section, Key: WideString]: WideString dispid 9;
    property PrivateProfileString[const FileName, Section, Key: WideString]: WideString dispid 10;
    property MathCoprocessorInstalled: WordBool readonly dispid 11;
    property ComputerType: WideString readonly dispid 12;
    property MacintoshName: WideString readonly dispid 14;
    property QuickDrawInstalled: WordBool readonly dispid 15;
    property Cursor: WdCursorType dispid 16;
    procedure MSInfo; dispid 101;
    procedure Connect(const Path: WideString; var Drive, Password: OleVariant); dispid 102;
  end;

  OLEFormat = interface(IDispatch)
    ['{00020933-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_ClassType: WideString; safecall;
    procedure Set_ClassType(const Value: WideString); safecall;
    function Get_DisplayAsIcon: WordBool; safecall;
    procedure Set_DisplayAsIcon(Value: WordBool); safecall;
    function Get_IconName: WideString; safecall;
    procedure Set_IconName(const Value: WideString); safecall;
    function Get_IconPath: WideString; safecall;
    function Get_IconIndex: Integer; safecall;
    procedure Set_IconIndex(Value: Integer); safecall;
    function Get_IconLabel: WideString; safecall;
    procedure Set_IconLabel(const Value: WideString); safecall;
    function Get_Label_: WideString; safecall;
    function Get_Object_: IDispatch; safecall;
    function Get_ProgID: WideString; safecall;
    procedure Activate; safecall;
    procedure Edit; safecall;
    procedure Open; safecall;
    procedure DoVerb(var VerbIndex: OleVariant); safecall;
    procedure ConvertTo(var ClassType, DisplayAsIcon, IconFileName, IconIndex, IconLabel: OleVariant); safecall;
    procedure ActivateAs(const ClassType: WideString); safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property ClassType: WideString read Get_ClassType write Set_ClassType;
    property DisplayAsIcon: WordBool read Get_DisplayAsIcon write Set_DisplayAsIcon;
    property IconName: WideString read Get_IconName write Set_IconName;
    property IconPath: WideString read Get_IconPath;
    property IconIndex: Integer read Get_IconIndex write Set_IconIndex;
    property IconLabel: WideString read Get_IconLabel write Set_IconLabel;
    property Label_: WideString read Get_Label_;
    property Object_: IDispatch read Get_Object_;
    property ProgID: WideString read Get_ProgID;
  end;

{ DispInterface declaration for Dual Interface OLEFormat }

  OLEFormatDisp = dispinterface
    ['{00020933-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property ClassType: WideString dispid 2;
    property DisplayAsIcon: WordBool dispid 3;
    property IconName: WideString dispid 7;
    property IconPath: WideString readonly dispid 8;
    property IconIndex: Integer dispid 9;
    property IconLabel: WideString dispid 10;
    property Label_: WideString readonly dispid 12;
    property Object_: IDispatch readonly dispid 14;
    property ProgID: WideString readonly dispid 22;
    procedure Activate; dispid 104;
    procedure Edit; dispid 106;
    procedure Open; dispid 107;
    procedure DoVerb(var VerbIndex: OleVariant); dispid 109;
    procedure ConvertTo(var ClassType, DisplayAsIcon, IconFileName, IconIndex, IconLabel: OleVariant); dispid 110;
    procedure ActivateAs(const ClassType: WideString); dispid 111;
  end;

  LinkFormat = interface(IDispatch)
    ['{00020931-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_AutoUpdate: WordBool; safecall;
    procedure Set_AutoUpdate(Value: WordBool); safecall;
    function Get_SourceName: WideString; safecall;
    function Get_SourcePath: WideString; safecall;
    function Get_Locked: WordBool; safecall;
    procedure Set_Locked(Value: WordBool); safecall;
    function Get_Type_: WdLinkType; safecall;
    function Get_SourceFullName: WideString; safecall;
    procedure Set_SourceFullName(const Value: WideString); safecall;
    function Get_SavePictureWithDocument: WordBool; safecall;
    procedure Set_SavePictureWithDocument(Value: WordBool); safecall;
    procedure BreakLink; safecall;
    procedure Update; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property AutoUpdate: WordBool read Get_AutoUpdate write Set_AutoUpdate;
    property SourceName: WideString read Get_SourceName;
    property SourcePath: WideString read Get_SourcePath;
    property Locked: WordBool read Get_Locked write Set_Locked;
    property Type_: WdLinkType read Get_Type_;
    property SourceFullName: WideString read Get_SourceFullName write Set_SourceFullName;
    property SavePictureWithDocument: WordBool read Get_SavePictureWithDocument write Set_SavePictureWithDocument;
  end;

{ DispInterface declaration for Dual Interface LinkFormat }

  LinkFormatDisp = dispinterface
    ['{00020931-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property AutoUpdate: WordBool dispid 1;
    property SourceName: WideString readonly dispid 4;
    property SourcePath: WideString readonly dispid 5;
    property Locked: WordBool dispid 13;
    property Type_: WdLinkType readonly dispid 16;
    property SourceFullName: WideString dispid 21;
    property SavePictureWithDocument: WordBool dispid 22;
    procedure BreakLink; dispid 104;
    procedure Update; dispid 105;
  end;

  _OLEControl = interface(IDispatch)
    ['{000209A4-0000-0000-C000-000000000046}']
    function Get_Left: Single; safecall;
    procedure Set_Left(Value: Single); safecall;
    function Get_Top: Single; safecall;
    procedure Set_Top(Value: Single); safecall;
    function Get_Height: Single; safecall;
    procedure Set_Height(Value: Single); safecall;
    function Get_Width: Single; safecall;
    procedure Set_Width(Value: Single); safecall;
    function Get_Name: WideString; safecall;
    procedure Set_Name(const Value: WideString); safecall;
    function Get_Automation: IDispatch; safecall;
    procedure Select; safecall;
    procedure Copy; safecall;
    procedure Cut; safecall;
    procedure Delete; safecall;
    procedure Activate; safecall;
    property Left: Single read Get_Left write Set_Left;
    property Top: Single read Get_Top write Set_Top;
    property Height: Single read Get_Height write Set_Height;
    property Width: Single read Get_Width write Set_Width;
    property Name: WideString read Get_Name write Set_Name;
    property Automation: IDispatch read Get_Automation;
  end;

{ DispInterface declaration for Dual Interface _OLEControl }

  _OLEControlDisp = dispinterface
    ['{000209A4-0000-0000-C000-000000000046}']
    property Left: Single dispid -2147417853;
    property Top: Single dispid -2147417852;
    property Height: Single dispid -2147417851;
    property Width: Single dispid -2147417850;
    property Name: WideString dispid -2147418112;
    property Automation: IDispatch readonly dispid -2147417849;
    procedure Select; dispid -2147417568;
    procedure Copy; dispid -2147417560;
    procedure Cut; dispid -2147417559;
    procedure Delete; dispid -2147417520;
    procedure Activate; dispid -2147417519;
  end;

  Fields = interface(IDispatch)
    ['{00020930-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Count: Integer; safecall;
    function Get_Locked: Integer; safecall;
    procedure Set_Locked(Value: Integer); safecall;
    function Get__NewEnum: IUnknown; safecall;
    function Item(Index: Integer): Field; safecall;
    procedure ToggleShowCodes; safecall;
    function Update: Integer; safecall;
    procedure Unlink; safecall;
    procedure UpdateSource; safecall;
    function Add(const Range: Range; var Type_, Text, PreserveFormatting: OleVariant): Field; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property Count: Integer read Get_Count;
    property Locked: Integer read Get_Locked write Set_Locked;
    property _NewEnum: IUnknown read Get__NewEnum;
  end;

{ DispInterface declaration for Dual Interface Fields }

  FieldsDisp = dispinterface
    ['{00020930-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property Count: Integer readonly dispid 1;
    property Locked: Integer dispid 2;
    property _NewEnum: IUnknown readonly dispid -4;
    function Item(Index: Integer): Field; dispid 0;
    procedure ToggleShowCodes; dispid 100;
    function Update: Integer; dispid 101;
    procedure Unlink; dispid 102;
    procedure UpdateSource; dispid 104;
    function Add(const Range: Range; var Type_, Text, PreserveFormatting: OleVariant): Field; dispid 105;
  end;

  Field = interface(IDispatch)
    ['{0002092F-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Code: Range; safecall;
    procedure Set_Code(const Value: Range); safecall;
    function Get_Type_: WdFieldType; safecall;
    function Get_Locked: WordBool; safecall;
    procedure Set_Locked(Value: WordBool); safecall;
    function Get_Kind: WdFieldKind; safecall;
    function Get_Result: Range; safecall;
    procedure Set_Result(const Value: Range); safecall;
    function Get_Data: WideString; safecall;
    procedure Set_Data(const Value: WideString); safecall;
    function Get_Next: Field; safecall;
    function Get_Previous: Field; safecall;
    function Get_Index: Integer; safecall;
    function Get_ShowCodes: WordBool; safecall;
    procedure Set_ShowCodes(Value: WordBool); safecall;
    function Get_LinkFormat: LinkFormat; safecall;
    function Get_OLEFormat: OLEFormat; safecall;
    function Get_InlineShape: InlineShape; safecall;
    procedure Select; safecall;
    function Update: WordBool; safecall;
    procedure Unlink; safecall;
    procedure UpdateSource; safecall;
    procedure DoClick; safecall;
    procedure Copy; safecall;
    procedure Cut; safecall;
    procedure Delete; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property Code: Range read Get_Code write Set_Code;
    property Type_: WdFieldType read Get_Type_;
    property Locked: WordBool read Get_Locked write Set_Locked;
    property Kind: WdFieldKind read Get_Kind;
    property Result: Range read Get_Result write Set_Result;
    property Data: WideString read Get_Data write Set_Data;
    property Next: Field read Get_Next;
    property Previous: Field read Get_Previous;
    property Index: Integer read Get_Index;
    property ShowCodes: WordBool read Get_ShowCodes write Set_ShowCodes;
    property LinkFormat: LinkFormat read Get_LinkFormat;
    property OLEFormat: OLEFormat read Get_OLEFormat;
    property InlineShape: InlineShape read Get_InlineShape;
  end;

{ DispInterface declaration for Dual Interface Field }

  FieldDisp = dispinterface
    ['{0002092F-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property Code: Range dispid 0;
    property Type_: WdFieldType readonly dispid 1;
    property Locked: WordBool dispid 2;
    property Kind: WdFieldKind readonly dispid 3;
    property Result: Range dispid 4;
    property Data: WideString dispid 5;
    property Next: Field readonly dispid 6;
    property Previous: Field readonly dispid 7;
    property Index: Integer readonly dispid 8;
    property ShowCodes: WordBool dispid 9;
    property LinkFormat: LinkFormat readonly dispid 10;
    property OLEFormat: OLEFormat readonly dispid 11;
    property InlineShape: InlineShape readonly dispid 12;
    procedure Select; dispid 65535;
    function Update: WordBool; dispid 101;
    procedure Unlink; dispid 102;
    procedure UpdateSource; dispid 103;
    procedure DoClick; dispid 104;
    procedure Copy; dispid 105;
    procedure Cut; dispid 106;
    procedure Delete; dispid 107;
  end;

  Browser = interface(IDispatch)
    ['{0002092E-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Target: WdBrowseTarget; safecall;
    procedure Set_Target(Value: WdBrowseTarget); safecall;
    procedure Next; safecall;
    procedure Previous; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property Target: WdBrowseTarget read Get_Target write Set_Target;
  end;

{ DispInterface declaration for Dual Interface Browser }

  BrowserDisp = dispinterface
    ['{0002092E-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property Target: WdBrowseTarget dispid 1;
    procedure Next; dispid 101;
    procedure Previous; dispid 102;
  end;

  Styles = interface(IDispatch)
    ['{0002092D-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get__NewEnum: IUnknown; safecall;
    function Get_Count: Integer; safecall;
    function Item(var Index: OleVariant): Style; safecall;
    function Add(const Name: WideString; var Type_: OleVariant): Style; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Count: Integer read Get_Count;
  end;

{ DispInterface declaration for Dual Interface Styles }

  StylesDisp = dispinterface
    ['{0002092D-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property _NewEnum: IUnknown readonly dispid -4;
    property Count: Integer readonly dispid 1;
    function Item(var Index: OleVariant): Style; dispid 0;
    function Add(const Name: WideString; var Type_: OleVariant): Style; dispid 100;
  end;

  Style = interface(IDispatch)
    ['{0002092C-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_NameLocal: WideString; safecall;
    procedure Set_NameLocal(const Value: WideString); safecall;
    function Get_BaseStyle: OleVariant; safecall;
    procedure Set_BaseStyle(Value: OleVariant); safecall;
    function Get_Description: WideString; safecall;
    function Get_Type_: WdStyleType; safecall;
    function Get_BuiltIn: WordBool; safecall;
    function Get_NextParagraphStyle: OleVariant; safecall;
    procedure Set_NextParagraphStyle(Value: OleVariant); safecall;
    function Get_InUse: WordBool; safecall;
    function Get_Shading: Shading; safecall;
    function Get_Borders: Borders; safecall;
    procedure Set_Borders(const Value: Borders); safecall;
    function Get_ParagraphFormat: ParagraphFormat; safecall;
    procedure Set_ParagraphFormat(const Value: ParagraphFormat); safecall;
    function Get_Font: Font; safecall;
    procedure Set_Font(const Value: Font); safecall;
    function Get_Frame: Frame; safecall;
    function Get_LanguageID: WdLanguageID; safecall;
    procedure Set_LanguageID(Value: WdLanguageID); safecall;
    function Get_AutomaticallyUpdate: WordBool; safecall;
    procedure Set_AutomaticallyUpdate(Value: WordBool); safecall;
    function Get_ListTemplate: ListTemplate; safecall;
    function Get_ListLevelNumber: Integer; safecall;
    function Get_LanguageIDFarEast: WdLanguageID; safecall;
    procedure Set_LanguageIDFarEast(Value: WdLanguageID); safecall;
    function Get_Hidden: WordBool; safecall;
    procedure Set_Hidden(Value: WordBool); safecall;
    procedure Delete; safecall;
    procedure LinkToListTemplate(const ListTemplate: ListTemplate; var ListLevelNumber: OleVariant); safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property NameLocal: WideString read Get_NameLocal write Set_NameLocal;
    property BaseStyle: OleVariant read Get_BaseStyle write Set_BaseStyle;
    property Description: WideString read Get_Description;
    property Type_: WdStyleType read Get_Type_;
    property BuiltIn: WordBool read Get_BuiltIn;
    property NextParagraphStyle: OleVariant read Get_NextParagraphStyle write Set_NextParagraphStyle;
    property InUse: WordBool read Get_InUse;
    property Shading: Shading read Get_Shading;
    property Borders: Borders read Get_Borders write Set_Borders;
    property ParagraphFormat: ParagraphFormat read Get_ParagraphFormat write Set_ParagraphFormat;
    property Font: Font read Get_Font write Set_Font;
    property Frame: Frame read Get_Frame;
    property LanguageID: WdLanguageID read Get_LanguageID write Set_LanguageID;
    property AutomaticallyUpdate: WordBool read Get_AutomaticallyUpdate write Set_AutomaticallyUpdate;
    property ListTemplate: ListTemplate read Get_ListTemplate;
    property ListLevelNumber: Integer read Get_ListLevelNumber;
    property LanguageIDFarEast: WdLanguageID read Get_LanguageIDFarEast write Set_LanguageIDFarEast;
    property Hidden: WordBool read Get_Hidden write Set_Hidden;
  end;

{ DispInterface declaration for Dual Interface Style }

  StyleDisp = dispinterface
    ['{0002092C-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property NameLocal: WideString dispid 0;
    property BaseStyle: OleVariant dispid 1;
    property Description: WideString readonly dispid 2;
    property Type_: WdStyleType readonly dispid 3;
    property BuiltIn: WordBool readonly dispid 4;
    property NextParagraphStyle: OleVariant dispid 5;
    property InUse: WordBool readonly dispid 6;
    property Shading: Shading readonly dispid 7;
    property Borders: Borders dispid 8;
    property ParagraphFormat: ParagraphFormat dispid 9;
    property Font: Font dispid 10;
    property Frame: Frame readonly dispid 11;
    property LanguageID: WdLanguageID dispid 12;
    property AutomaticallyUpdate: WordBool dispid 13;
    property ListTemplate: ListTemplate readonly dispid 14;
    property ListLevelNumber: Integer readonly dispid 15;
    property LanguageIDFarEast: WdLanguageID dispid 16;
    property Hidden: WordBool dispid 17;
    procedure Delete; dispid 100;
    procedure LinkToListTemplate(const ListTemplate: ListTemplate; var ListLevelNumber: OleVariant); dispid 101;
  end;

  Frames = interface(IDispatch)
    ['{0002092B-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get__NewEnum: IUnknown; safecall;
    function Get_Count: Integer; safecall;
    function Item(Index: Integer): Frame; safecall;
    function Add(const Range: Range): Frame; safecall;
    procedure Delete; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Count: Integer read Get_Count;
  end;

{ DispInterface declaration for Dual Interface Frames }

  FramesDisp = dispinterface
    ['{0002092B-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property _NewEnum: IUnknown readonly dispid -4;
    property Count: Integer readonly dispid 1;
    function Item(Index: Integer): Frame; dispid 0;
    function Add(const Range: Range): Frame; dispid 100;
    procedure Delete; dispid 101;
  end;

  Frame = interface(IDispatch)
    ['{0002092A-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_HeightRule: WdFrameSizeRule; safecall;
    procedure Set_HeightRule(Value: WdFrameSizeRule); safecall;
    function Get_WidthRule: WdFrameSizeRule; safecall;
    procedure Set_WidthRule(Value: WdFrameSizeRule); safecall;
    function Get_HorizontalDistanceFromText: Single; safecall;
    procedure Set_HorizontalDistanceFromText(Value: Single); safecall;
    function Get_Height: Single; safecall;
    procedure Set_Height(Value: Single); safecall;
    function Get_HorizontalPosition: Single; safecall;
    procedure Set_HorizontalPosition(Value: Single); safecall;
    function Get_LockAnchor: WordBool; safecall;
    procedure Set_LockAnchor(Value: WordBool); safecall;
    function Get_RelativeHorizontalPosition: WdRelativeHorizontalPosition; safecall;
    procedure Set_RelativeHorizontalPosition(Value: WdRelativeHorizontalPosition); safecall;
    function Get_RelativeVerticalPosition: WdRelativeVerticalPosition; safecall;
    procedure Set_RelativeVerticalPosition(Value: WdRelativeVerticalPosition); safecall;
    function Get_VerticalDistanceFromText: Single; safecall;
    procedure Set_VerticalDistanceFromText(Value: Single); safecall;
    function Get_VerticalPosition: Single; safecall;
    procedure Set_VerticalPosition(Value: Single); safecall;
    function Get_Width: Single; safecall;
    procedure Set_Width(Value: Single); safecall;
    function Get_TextWrap: WordBool; safecall;
    procedure Set_TextWrap(Value: WordBool); safecall;
    function Get_Shading: Shading; safecall;
    function Get_Borders: Borders; safecall;
    procedure Set_Borders(const Value: Borders); safecall;
    function Get_Range: Range; safecall;
    procedure Delete; safecall;
    procedure Select; safecall;
    procedure Copy; safecall;
    procedure Cut; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property HeightRule: WdFrameSizeRule read Get_HeightRule write Set_HeightRule;
    property WidthRule: WdFrameSizeRule read Get_WidthRule write Set_WidthRule;
    property HorizontalDistanceFromText: Single read Get_HorizontalDistanceFromText write Set_HorizontalDistanceFromText;
    property Height: Single read Get_Height write Set_Height;
    property HorizontalPosition: Single read Get_HorizontalPosition write Set_HorizontalPosition;
    property LockAnchor: WordBool read Get_LockAnchor write Set_LockAnchor;
    property RelativeHorizontalPosition: WdRelativeHorizontalPosition read Get_RelativeHorizontalPosition write Set_RelativeHorizontalPosition;
    property RelativeVerticalPosition: WdRelativeVerticalPosition read Get_RelativeVerticalPosition write Set_RelativeVerticalPosition;
    property VerticalDistanceFromText: Single read Get_VerticalDistanceFromText write Set_VerticalDistanceFromText;
    property VerticalPosition: Single read Get_VerticalPosition write Set_VerticalPosition;
    property Width: Single read Get_Width write Set_Width;
    property TextWrap: WordBool read Get_TextWrap write Set_TextWrap;
    property Shading: Shading read Get_Shading;
    property Borders: Borders read Get_Borders write Set_Borders;
    property Range: Range read Get_Range;
  end;

{ DispInterface declaration for Dual Interface Frame }

  FrameDisp = dispinterface
    ['{0002092A-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property HeightRule: WdFrameSizeRule dispid 1;
    property WidthRule: WdFrameSizeRule dispid 2;
    property HorizontalDistanceFromText: Single dispid 3;
    property Height: Single dispid 4;
    property HorizontalPosition: Single dispid 5;
    property LockAnchor: WordBool dispid 6;
    property RelativeHorizontalPosition: WdRelativeHorizontalPosition dispid 7;
    property RelativeVerticalPosition: WdRelativeVerticalPosition dispid 8;
    property VerticalDistanceFromText: Single dispid 9;
    property VerticalPosition: Single dispid 10;
    property Width: Single dispid 11;
    property TextWrap: WordBool dispid 12;
    property Shading: Shading readonly dispid 13;
    property Borders: Borders dispid 1100;
    property Range: Range readonly dispid 15;
    procedure Delete; dispid 100;
    procedure Select; dispid 65535;
    procedure Copy; dispid 101;
    procedure Cut; dispid 102;
  end;

  FormFields = interface(IDispatch)
    ['{00020929-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Count: Integer; safecall;
    function Get_Shaded: WordBool; safecall;
    procedure Set_Shaded(Value: WordBool); safecall;
    function Get__NewEnum: IUnknown; safecall;
    function Item(var Index: OleVariant): FormField; safecall;
    function Add(const Range: Range; Type_: WdFieldType): FormField; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property Count: Integer read Get_Count;
    property Shaded: WordBool read Get_Shaded write Set_Shaded;
    property _NewEnum: IUnknown read Get__NewEnum;
  end;

{ DispInterface declaration for Dual Interface FormFields }

  FormFieldsDisp = dispinterface
    ['{00020929-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property Count: Integer readonly dispid 1;
    property Shaded: WordBool dispid 2;
    property _NewEnum: IUnknown readonly dispid -4;
    function Item(var Index: OleVariant): FormField; dispid 0;
    function Add(const Range: Range; Type_: WdFieldType): FormField; dispid 101;
  end;

  FormField = interface(IDispatch)
    ['{00020928-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Type_: WdFieldType; safecall;
    function Get_Name: WideString; safecall;
    procedure Set_Name(const Value: WideString); safecall;
    function Get_EntryMacro: WideString; safecall;
    procedure Set_EntryMacro(const Value: WideString); safecall;
    function Get_ExitMacro: WideString; safecall;
    procedure Set_ExitMacro(const Value: WideString); safecall;
    function Get_OwnHelp: WordBool; safecall;
    procedure Set_OwnHelp(Value: WordBool); safecall;
    function Get_OwnStatus: WordBool; safecall;
    procedure Set_OwnStatus(Value: WordBool); safecall;
    function Get_HelpText: WideString; safecall;
    procedure Set_HelpText(const Value: WideString); safecall;
    function Get_StatusText: WideString; safecall;
    procedure Set_StatusText(const Value: WideString); safecall;
    function Get_Enabled: WordBool; safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    function Get_Result: WideString; safecall;
    procedure Set_Result(const Value: WideString); safecall;
    function Get_TextInput: TextInput; safecall;
    function Get_CheckBox: CheckBox; safecall;
    function Get_DropDown: DropDown; safecall;
    function Get_Next: FormField; safecall;
    function Get_Previous: FormField; safecall;
    function Get_CalculateOnExit: WordBool; safecall;
    procedure Set_CalculateOnExit(Value: WordBool); safecall;
    function Get_Range: Range; safecall;
    procedure Select; safecall;
    procedure Copy; safecall;
    procedure Cut; safecall;
    procedure Delete; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property Type_: WdFieldType read Get_Type_;
    property Name: WideString read Get_Name write Set_Name;
    property EntryMacro: WideString read Get_EntryMacro write Set_EntryMacro;
    property ExitMacro: WideString read Get_ExitMacro write Set_ExitMacro;
    property OwnHelp: WordBool read Get_OwnHelp write Set_OwnHelp;
    property OwnStatus: WordBool read Get_OwnStatus write Set_OwnStatus;
    property HelpText: WideString read Get_HelpText write Set_HelpText;
    property StatusText: WideString read Get_StatusText write Set_StatusText;
    property Enabled: WordBool read Get_Enabled write Set_Enabled;
    property Result: WideString read Get_Result write Set_Result;
    property TextInput: TextInput read Get_TextInput;
    property CheckBox: CheckBox read Get_CheckBox;
    property DropDown: DropDown read Get_DropDown;
    property Next: FormField read Get_Next;
    property Previous: FormField read Get_Previous;
    property CalculateOnExit: WordBool read Get_CalculateOnExit write Set_CalculateOnExit;
    property Range: Range read Get_Range;
  end;

{ DispInterface declaration for Dual Interface FormField }

  FormFieldDisp = dispinterface
    ['{00020928-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property Type_: WdFieldType readonly dispid 0;
    property Name: WideString dispid 2;
    property EntryMacro: WideString dispid 3;
    property ExitMacro: WideString dispid 4;
    property OwnHelp: WordBool dispid 5;
    property OwnStatus: WordBool dispid 6;
    property HelpText: WideString dispid 7;
    property StatusText: WideString dispid 8;
    property Enabled: WordBool dispid 9;
    property Result: WideString dispid 10;
    property TextInput: TextInput readonly dispid 11;
    property CheckBox: CheckBox readonly dispid 12;
    property DropDown: DropDown readonly dispid 13;
    property Next: FormField readonly dispid 14;
    property Previous: FormField readonly dispid 15;
    property CalculateOnExit: WordBool dispid 16;
    property Range: Range readonly dispid 17;
    procedure Select; dispid 65535;
    procedure Copy; dispid 101;
    procedure Cut; dispid 102;
    procedure Delete; dispid 103;
  end;

  TextInput = interface(IDispatch)
    ['{00020927-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Valid: WordBool; safecall;
    function Get_Default: WideString; safecall;
    procedure Set_Default(const Value: WideString); safecall;
    function Get_Type_: WdTextFormFieldType; safecall;
    function Get_Format: WideString; safecall;
    function Get_Width: Integer; safecall;
    procedure Set_Width(Value: Integer); safecall;
    procedure Clear; safecall;
    procedure EditType(Type_: WdTextFormFieldType; var Default, Format, Enabled: OleVariant); safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property Valid: WordBool read Get_Valid;
    property Default: WideString read Get_Default write Set_Default;
    property Type_: WdTextFormFieldType read Get_Type_;
    property Format: WideString read Get_Format;
    property Width: Integer read Get_Width write Set_Width;
  end;

{ DispInterface declaration for Dual Interface TextInput }

  TextInputDisp = dispinterface
    ['{00020927-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property Valid: WordBool readonly dispid 0;
    property Default: WideString dispid 1;
    property Type_: WdTextFormFieldType readonly dispid 2;
    property Format: WideString readonly dispid 3;
    property Width: Integer dispid 4;
    procedure Clear; dispid 101;
    procedure EditType(Type_: WdTextFormFieldType; var Default, Format, Enabled: OleVariant); dispid 102;
  end;

  CheckBox = interface(IDispatch)
    ['{00020926-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Valid: WordBool; safecall;
    function Get_AutoSize: WordBool; safecall;
    procedure Set_AutoSize(Value: WordBool); safecall;
    function Get_Size: Single; safecall;
    procedure Set_Size(Value: Single); safecall;
    function Get_Default: WordBool; safecall;
    procedure Set_Default(Value: WordBool); safecall;
    function Get_Value: WordBool; safecall;
    procedure Set_Value(Value: WordBool); safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property Valid: WordBool read Get_Valid;
    property AutoSize: WordBool read Get_AutoSize write Set_AutoSize;
    property Size: Single read Get_Size write Set_Size;
    property Default: WordBool read Get_Default write Set_Default;
    property Value: WordBool read Get_Value write Set_Value;
  end;

{ DispInterface declaration for Dual Interface CheckBox }

  CheckBoxDisp = dispinterface
    ['{00020926-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property Valid: WordBool readonly dispid 0;
    property AutoSize: WordBool dispid 1;
    property Size: Single dispid 2;
    property Default: WordBool dispid 3;
    property Value: WordBool dispid 4;
  end;

  DropDown = interface(IDispatch)
    ['{00020925-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Valid: WordBool; safecall;
    function Get_Default: Integer; safecall;
    procedure Set_Default(Value: Integer); safecall;
    function Get_Value: Integer; safecall;
    procedure Set_Value(Value: Integer); safecall;
    function Get_ListEntries: ListEntries; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property Valid: WordBool read Get_Valid;
    property Default: Integer read Get_Default write Set_Default;
    property Value: Integer read Get_Value write Set_Value;
    property ListEntries: ListEntries read Get_ListEntries;
  end;

{ DispInterface declaration for Dual Interface DropDown }

  DropDownDisp = dispinterface
    ['{00020925-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property Valid: WordBool readonly dispid 0;
    property Default: Integer dispid 1;
    property Value: Integer dispid 2;
    property ListEntries: ListEntries readonly dispid 3;
  end;

  ListEntries = interface(IDispatch)
    ['{00020924-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get__NewEnum: IUnknown; safecall;
    function Get_Count: Integer; safecall;
    function Item(var Index: OleVariant): ListEntry; safecall;
    function Add(const Name: WideString; var Index: OleVariant): ListEntry; safecall;
    procedure Clear; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Count: Integer read Get_Count;
  end;

{ DispInterface declaration for Dual Interface ListEntries }

  ListEntriesDisp = dispinterface
    ['{00020924-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property _NewEnum: IUnknown readonly dispid -4;
    property Count: Integer readonly dispid 1;
    function Item(var Index: OleVariant): ListEntry; dispid 0;
    function Add(const Name: WideString; var Index: OleVariant): ListEntry; dispid 101;
    procedure Clear; dispid 102;
  end;

  ListEntry = interface(IDispatch)
    ['{00020923-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Index: Integer; safecall;
    function Get_Name: WideString; safecall;
    procedure Set_Name(const Value: WideString); safecall;
    procedure Delete; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property Index: Integer read Get_Index;
    property Name: WideString read Get_Name write Set_Name;
  end;

{ DispInterface declaration for Dual Interface ListEntry }

  ListEntryDisp = dispinterface
    ['{00020923-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property Index: Integer readonly dispid 1;
    property Name: WideString dispid 2;
    procedure Delete; dispid 11;
  end;

  TablesOfFigures = interface(IDispatch)
    ['{00020922-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get__NewEnum: IUnknown; safecall;
    function Get_Count: Integer; safecall;
    function Get_Format: WdTofFormat; safecall;
    procedure Set_Format(Value: WdTofFormat); safecall;
    function Item(Index: Integer): TableOfFigures; safecall;
    function Add(const Range: Range; var Caption, IncludeLabel, UseHeadingStyles, UpperHeadingLevel, LowerHeadingLevel, UseFields, TableID, RightAlignPageNumbers, IncludePageNumbers, AddedStyles: OleVariant): TableOfFigures; safecall;
    function MarkEntry(const Range: Range; var Entry, EntryAutoText, TableID, Level: OleVariant): Field; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Count: Integer read Get_Count;
    property Format: WdTofFormat read Get_Format write Set_Format;
  end;

{ DispInterface declaration for Dual Interface TablesOfFigures }

  TablesOfFiguresDisp = dispinterface
    ['{00020922-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property _NewEnum: IUnknown readonly dispid -4;
    property Count: Integer readonly dispid 1;
    property Format: WdTofFormat dispid 2;
    function Item(Index: Integer): TableOfFigures; dispid 0;
    function Add(const Range: Range; var Caption, IncludeLabel, UseHeadingStyles, UpperHeadingLevel, LowerHeadingLevel, UseFields, TableID, RightAlignPageNumbers, IncludePageNumbers, AddedStyles: OleVariant): TableOfFigures; dispid 100;
    function MarkEntry(const Range: Range; var Entry, EntryAutoText, TableID, Level: OleVariant): Field; dispid 101;
  end;

  TableOfFigures = interface(IDispatch)
    ['{00020921-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Caption: WideString; safecall;
    procedure Set_Caption(const Value: WideString); safecall;
    function Get_IncludeLabel: WordBool; safecall;
    procedure Set_IncludeLabel(Value: WordBool); safecall;
    function Get_RightAlignPageNumbers: WordBool; safecall;
    procedure Set_RightAlignPageNumbers(Value: WordBool); safecall;
    function Get_UseHeadingStyles: WordBool; safecall;
    procedure Set_UseHeadingStyles(Value: WordBool); safecall;
    function Get_LowerHeadingLevel: Integer; safecall;
    procedure Set_LowerHeadingLevel(Value: Integer); safecall;
    function Get_UpperHeadingLevel: Integer; safecall;
    procedure Set_UpperHeadingLevel(Value: Integer); safecall;
    function Get_IncludePageNumbers: WordBool; safecall;
    procedure Set_IncludePageNumbers(Value: WordBool); safecall;
    function Get_Range: Range; safecall;
    function Get_UseFields: WordBool; safecall;
    procedure Set_UseFields(Value: WordBool); safecall;
    function Get_TableID: WideString; safecall;
    procedure Set_TableID(const Value: WideString); safecall;
    function Get_HeadingStyles: HeadingStyles; safecall;
    function Get_TabLeader: WdTabLeader; safecall;
    procedure Set_TabLeader(Value: WdTabLeader); safecall;
    procedure Delete; safecall;
    procedure UpdatePageNumbers; safecall;
    procedure Update; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property Caption: WideString read Get_Caption write Set_Caption;
    property IncludeLabel: WordBool read Get_IncludeLabel write Set_IncludeLabel;
    property RightAlignPageNumbers: WordBool read Get_RightAlignPageNumbers write Set_RightAlignPageNumbers;
    property UseHeadingStyles: WordBool read Get_UseHeadingStyles write Set_UseHeadingStyles;
    property LowerHeadingLevel: Integer read Get_LowerHeadingLevel write Set_LowerHeadingLevel;
    property UpperHeadingLevel: Integer read Get_UpperHeadingLevel write Set_UpperHeadingLevel;
    property IncludePageNumbers: WordBool read Get_IncludePageNumbers write Set_IncludePageNumbers;
    property Range: Range read Get_Range;
    property UseFields: WordBool read Get_UseFields write Set_UseFields;
    property TableID: WideString read Get_TableID write Set_TableID;
    property HeadingStyles: HeadingStyles read Get_HeadingStyles;
    property TabLeader: WdTabLeader read Get_TabLeader write Set_TabLeader;
  end;

{ DispInterface declaration for Dual Interface TableOfFigures }

  TableOfFiguresDisp = dispinterface
    ['{00020921-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property Caption: WideString dispid 1;
    property IncludeLabel: WordBool dispid 2;
    property RightAlignPageNumbers: WordBool dispid 3;
    property UseHeadingStyles: WordBool dispid 4;
    property LowerHeadingLevel: Integer dispid 5;
    property UpperHeadingLevel: Integer dispid 6;
    property IncludePageNumbers: WordBool dispid 7;
    property Range: Range readonly dispid 8;
    property UseFields: WordBool dispid 9;
    property TableID: WideString dispid 10;
    property HeadingStyles: HeadingStyles readonly dispid 11;
    property TabLeader: WdTabLeader dispid 12;
    procedure Delete; dispid 100;
    procedure UpdatePageNumbers; dispid 101;
    procedure Update; dispid 102;
  end;

  MailMerge = interface(IDispatch)
    ['{00020920-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_MainDocumentType: WdMailMergeMainDocType; safecall;
    procedure Set_MainDocumentType(Value: WdMailMergeMainDocType); safecall;
    function Get_State: WdMailMergeState; safecall;
    function Get_Destination: WdMailMergeDestination; safecall;
    procedure Set_Destination(Value: WdMailMergeDestination); safecall;
    function Get_DataSource: MailMergeDataSource; safecall;
    function Get_Fields: MailMergeFields; safecall;
    function Get_ViewMailMergeFieldCodes: Integer; safecall;
    procedure Set_ViewMailMergeFieldCodes(Value: Integer); safecall;
    function Get_SuppressBlankLines: WordBool; safecall;
    procedure Set_SuppressBlankLines(Value: WordBool); safecall;
    function Get_MailAsAttachment: WordBool; safecall;
    procedure Set_MailAsAttachment(Value: WordBool); safecall;
    function Get_MailAddressFieldName: WideString; safecall;
    procedure Set_MailAddressFieldName(const Value: WideString); safecall;
    function Get_MailSubject: WideString; safecall;
    procedure Set_MailSubject(const Value: WideString); safecall;
    procedure CreateDataSource(var Name, PasswordDocument, WritePasswordDocument, HeaderRecord, MSQuery, SQLStatement, SQLStatement1, Connection, LinkToSource: OleVariant); safecall;
    procedure CreateHeaderSource(const Name: WideString; var PasswordDocument, WritePasswordDocument, HeaderRecord: OleVariant); safecall;
    procedure OpenDataSource(const Name: WideString; var Format, ConfirmConversions, ReadOnly, LinkToSource, AddToRecentFiles, PasswordDocument, PasswordTemplate, Revert, WritePasswordDocument, WritePasswordTemplate, Connection, SQLStatement, SQLStatement1: OleVariant); safecall;
    procedure OpenHeaderSource(const Name: WideString; var Format, ConfirmConversions, ReadOnly, AddToRecentFiles, PasswordDocument, PasswordTemplate, Revert, WritePasswordDocument, WritePasswordTemplate: OleVariant); safecall;
    procedure Execute(var Pause: OleVariant); safecall;
    procedure Check; safecall;
    procedure EditDataSource; safecall;
    procedure EditHeaderSource; safecall;
    procedure EditMainDocument; safecall;
    procedure UseAddressBook(const Type_: WideString); safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property MainDocumentType: WdMailMergeMainDocType read Get_MainDocumentType write Set_MainDocumentType;
    property State: WdMailMergeState read Get_State;
    property Destination: WdMailMergeDestination read Get_Destination write Set_Destination;
    property DataSource: MailMergeDataSource read Get_DataSource;
    property Fields: MailMergeFields read Get_Fields;
    property ViewMailMergeFieldCodes: Integer read Get_ViewMailMergeFieldCodes write Set_ViewMailMergeFieldCodes;
    property SuppressBlankLines: WordBool read Get_SuppressBlankLines write Set_SuppressBlankLines;
    property MailAsAttachment: WordBool read Get_MailAsAttachment write Set_MailAsAttachment;
    property MailAddressFieldName: WideString read Get_MailAddressFieldName write Set_MailAddressFieldName;
    property MailSubject: WideString read Get_MailSubject write Set_MailSubject;
  end;

{ DispInterface declaration for Dual Interface MailMerge }

  MailMergeDisp = dispinterface
    ['{00020920-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property MainDocumentType: WdMailMergeMainDocType dispid 1;
    property State: WdMailMergeState readonly dispid 2;
    property Destination: WdMailMergeDestination dispid 3;
    property DataSource: MailMergeDataSource readonly dispid 4;
    property Fields: MailMergeFields readonly dispid 5;
    property ViewMailMergeFieldCodes: Integer dispid 6;
    property SuppressBlankLines: WordBool dispid 7;
    property MailAsAttachment: WordBool dispid 8;
    property MailAddressFieldName: WideString dispid 9;
    property MailSubject: WideString dispid 10;
    procedure CreateDataSource(var Name, PasswordDocument, WritePasswordDocument, HeaderRecord, MSQuery, SQLStatement, SQLStatement1, Connection, LinkToSource: OleVariant); dispid 101;
    procedure CreateHeaderSource(const Name: WideString; var PasswordDocument, WritePasswordDocument, HeaderRecord: OleVariant); dispid 102;
    procedure OpenDataSource(const Name: WideString; var Format, ConfirmConversions, ReadOnly, LinkToSource, AddToRecentFiles, PasswordDocument, PasswordTemplate, Revert, WritePasswordDocument, WritePasswordTemplate, Connection, SQLStatement, SQLStatement1: OleVariant); dispid 103;
    procedure OpenHeaderSource(const Name: WideString; var Format, ConfirmConversions, ReadOnly, AddToRecentFiles, PasswordDocument, PasswordTemplate, Revert, WritePasswordDocument, WritePasswordTemplate: OleVariant); dispid 104;
    procedure Execute(var Pause: OleVariant); dispid 105;
    procedure Check; dispid 106;
    procedure EditDataSource; dispid 107;
    procedure EditHeaderSource; dispid 108;
    procedure EditMainDocument; dispid 109;
    procedure UseAddressBook(const Type_: WideString); dispid 111;
  end;

  MailMergeFields = interface(IDispatch)
    ['{0002091F-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get__NewEnum: IUnknown; safecall;
    function Get_Count: Integer; safecall;
    function Item(Index: Integer): MailMergeField; safecall;
    function Add(const Range: Range; const Name: WideString): MailMergeField; safecall;
    function AddAsk(const Range: Range; const Name: WideString; var Prompt, DefaultAskText, AskOnce: OleVariant): MailMergeField; safecall;
    function AddFillIn(const Range: Range; var Prompt, DefaultFillInText, AskOnce: OleVariant): MailMergeField; safecall;
    function AddIf(const Range: Range; const MergeField: WideString; Comparison: WdMailMergeComparison; var CompareTo, TrueAutoText, TrueText, FalseAutoText, FalseText: OleVariant): MailMergeField; safecall;
    function AddMergeRec(const Range: Range): MailMergeField; safecall;
    function AddMergeSeq(const Range: Range): MailMergeField; safecall;
    function AddNext(const Range: Range): MailMergeField; safecall;
    function AddNextIf(const Range: Range; const MergeField: WideString; Comparison: WdMailMergeComparison; var CompareTo: OleVariant): MailMergeField; safecall;
    function AddSet(const Range: Range; const Name: WideString; var ValueText, ValueAutoText: OleVariant): MailMergeField; safecall;
    function AddSkipIf(const Range: Range; const MergeField: WideString; Comparison: WdMailMergeComparison; var CompareTo: OleVariant): MailMergeField; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Count: Integer read Get_Count;
  end;

{ DispInterface declaration for Dual Interface MailMergeFields }

  MailMergeFieldsDisp = dispinterface
    ['{0002091F-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property _NewEnum: IUnknown readonly dispid -4;
    property Count: Integer readonly dispid 1;
    function Item(Index: Integer): MailMergeField; dispid 0;
    function Add(const Range: Range; const Name: WideString): MailMergeField; dispid 101;
    function AddAsk(const Range: Range; const Name: WideString; var Prompt, DefaultAskText, AskOnce: OleVariant): MailMergeField; dispid 102;
    function AddFillIn(const Range: Range; var Prompt, DefaultFillInText, AskOnce: OleVariant): MailMergeField; dispid 103;
    function AddIf(const Range: Range; const MergeField: WideString; Comparison: WdMailMergeComparison; var CompareTo, TrueAutoText, TrueText, FalseAutoText, FalseText: OleVariant): MailMergeField; dispid 104;
    function AddMergeRec(const Range: Range): MailMergeField; dispid 105;
    function AddMergeSeq(const Range: Range): MailMergeField; dispid 106;
    function AddNext(const Range: Range): MailMergeField; dispid 107;
    function AddNextIf(const Range: Range; const MergeField: WideString; Comparison: WdMailMergeComparison; var CompareTo: OleVariant): MailMergeField; dispid 108;
    function AddSet(const Range: Range; const Name: WideString; var ValueText, ValueAutoText: OleVariant): MailMergeField; dispid 109;
    function AddSkipIf(const Range: Range; const MergeField: WideString; Comparison: WdMailMergeComparison; var CompareTo: OleVariant): MailMergeField; dispid 110;
  end;

  MailMergeField = interface(IDispatch)
    ['{0002091E-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Type_: WdFieldType; safecall;
    function Get_Locked: WordBool; safecall;
    procedure Set_Locked(Value: WordBool); safecall;
    function Get_Code: Range; safecall;
    procedure Set_Code(const Value: Range); safecall;
    function Get_Next: MailMergeField; safecall;
    function Get_Previous: MailMergeField; safecall;
    procedure Select; safecall;
    procedure Copy; safecall;
    procedure Cut; safecall;
    procedure Delete; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property Type_: WdFieldType read Get_Type_;
    property Locked: WordBool read Get_Locked write Set_Locked;
    property Code: Range read Get_Code write Set_Code;
    property Next: MailMergeField read Get_Next;
    property Previous: MailMergeField read Get_Previous;
  end;

{ DispInterface declaration for Dual Interface MailMergeField }

  MailMergeFieldDisp = dispinterface
    ['{0002091E-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property Type_: WdFieldType readonly dispid 0;
    property Locked: WordBool dispid 3;
    property Code: Range dispid 5;
    property Next: MailMergeField readonly dispid 8;
    property Previous: MailMergeField readonly dispid 9;
    procedure Select; dispid 65535;
    procedure Copy; dispid 105;
    procedure Cut; dispid 106;
    procedure Delete; dispid 107;
  end;

  MailMergeDataSource = interface(IDispatch)
    ['{0002091D-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Name: WideString; safecall;
    function Get_HeaderSourceName: WideString; safecall;
    function Get_Type_: WdMailMergeDataSource; safecall;
    function Get_HeaderSourceType: WdMailMergeDataSource; safecall;
    function Get_ConnectString: WideString; safecall;
    function Get_QueryString: WideString; safecall;
    procedure Set_QueryString(const Value: WideString); safecall;
    function Get_ActiveRecord: WdMailMergeActiveRecord; safecall;
    procedure Set_ActiveRecord(Value: WdMailMergeActiveRecord); safecall;
    function Get_FirstRecord: Integer; safecall;
    procedure Set_FirstRecord(Value: Integer); safecall;
    function Get_LastRecord: Integer; safecall;
    procedure Set_LastRecord(Value: Integer); safecall;
    function Get_FieldNames: MailMergeFieldNames; safecall;
    function Get_DataFields: MailMergeDataFields; safecall;
    function FindRecord(const FindText, Field: WideString): WordBool; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property Name: WideString read Get_Name;
    property HeaderSourceName: WideString read Get_HeaderSourceName;
    property Type_: WdMailMergeDataSource read Get_Type_;
    property HeaderSourceType: WdMailMergeDataSource read Get_HeaderSourceType;
    property ConnectString: WideString read Get_ConnectString;
    property QueryString: WideString read Get_QueryString write Set_QueryString;
    property ActiveRecord: WdMailMergeActiveRecord read Get_ActiveRecord write Set_ActiveRecord;
    property FirstRecord: Integer read Get_FirstRecord write Set_FirstRecord;
    property LastRecord: Integer read Get_LastRecord write Set_LastRecord;
    property FieldNames: MailMergeFieldNames read Get_FieldNames;
    property DataFields: MailMergeDataFields read Get_DataFields;
  end;

{ DispInterface declaration for Dual Interface MailMergeDataSource }

  MailMergeDataSourceDisp = dispinterface
    ['{0002091D-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property Name: WideString readonly dispid 1;
    property HeaderSourceName: WideString readonly dispid 2;
    property Type_: WdMailMergeDataSource readonly dispid 3;
    property HeaderSourceType: WdMailMergeDataSource readonly dispid 4;
    property ConnectString: WideString readonly dispid 5;
    property QueryString: WideString dispid 6;
    property ActiveRecord: WdMailMergeActiveRecord dispid 7;
    property FirstRecord: Integer dispid 8;
    property LastRecord: Integer dispid 9;
    property FieldNames: MailMergeFieldNames readonly dispid 10;
    property DataFields: MailMergeDataFields readonly dispid 11;
    function FindRecord(const FindText, Field: WideString): WordBool; dispid 101;
  end;

  MailMergeFieldNames = interface(IDispatch)
    ['{0002091C-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get__NewEnum: IUnknown; safecall;
    function Get_Count: Integer; safecall;
    function Item(var Index: OleVariant): MailMergeFieldName; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Count: Integer read Get_Count;
  end;

{ DispInterface declaration for Dual Interface MailMergeFieldNames }

  MailMergeFieldNamesDisp = dispinterface
    ['{0002091C-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property _NewEnum: IUnknown readonly dispid -4;
    property Count: Integer readonly dispid 1;
    function Item(var Index: OleVariant): MailMergeFieldName; dispid 0;
  end;

  MailMergeFieldName = interface(IDispatch)
    ['{0002091B-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Name: WideString; safecall;
    function Get_Index: Integer; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property Name: WideString read Get_Name;
    property Index: Integer read Get_Index;
  end;

{ DispInterface declaration for Dual Interface MailMergeFieldName }

  MailMergeFieldNameDisp = dispinterface
    ['{0002091B-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property Name: WideString readonly dispid 0;
    property Index: Integer readonly dispid 1;
  end;

  MailMergeDataFields = interface(IDispatch)
    ['{0002091A-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get__NewEnum: IUnknown; safecall;
    function Get_Count: Integer; safecall;
    function Item(var Index: OleVariant): MailMergeDataField; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Count: Integer read Get_Count;
  end;

{ DispInterface declaration for Dual Interface MailMergeDataFields }

  MailMergeDataFieldsDisp = dispinterface
    ['{0002091A-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property _NewEnum: IUnknown readonly dispid -4;
    property Count: Integer readonly dispid 1;
    function Item(var Index: OleVariant): MailMergeDataField; dispid 0;
  end;

  MailMergeDataField = interface(IDispatch)
    ['{00020919-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Value: WideString; safecall;
    function Get_Name: WideString; safecall;
    function Get_Index: Integer; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property Value: WideString read Get_Value;
    property Name: WideString read Get_Name;
    property Index: Integer read Get_Index;
  end;

{ DispInterface declaration for Dual Interface MailMergeDataField }

  MailMergeDataFieldDisp = dispinterface
    ['{00020919-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property Value: WideString readonly dispid 0;
    property Name: WideString readonly dispid 1;
    property Index: Integer readonly dispid 2;
  end;

  Envelope = interface(IDispatch)
    ['{00020918-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Address: Range; safecall;
    function Get_ReturnAddress: Range; safecall;
    function Get_DefaultPrintBarCode: WordBool; safecall;
    procedure Set_DefaultPrintBarCode(Value: WordBool); safecall;
    function Get_DefaultPrintFIMA: WordBool; safecall;
    procedure Set_DefaultPrintFIMA(Value: WordBool); safecall;
    function Get_DefaultHeight: Single; safecall;
    procedure Set_DefaultHeight(Value: Single); safecall;
    function Get_DefaultWidth: Single; safecall;
    procedure Set_DefaultWidth(Value: Single); safecall;
    function Get_DefaultSize: WideString; safecall;
    procedure Set_DefaultSize(const Value: WideString); safecall;
    function Get_DefaultOmitReturnAddress: WordBool; safecall;
    procedure Set_DefaultOmitReturnAddress(Value: WordBool); safecall;
    function Get_FeedSource: WdPaperTray; safecall;
    procedure Set_FeedSource(Value: WdPaperTray); safecall;
    function Get_AddressFromLeft: Single; safecall;
    procedure Set_AddressFromLeft(Value: Single); safecall;
    function Get_AddressFromTop: Single; safecall;
    procedure Set_AddressFromTop(Value: Single); safecall;
    function Get_ReturnAddressFromLeft: Single; safecall;
    procedure Set_ReturnAddressFromLeft(Value: Single); safecall;
    function Get_ReturnAddressFromTop: Single; safecall;
    procedure Set_ReturnAddressFromTop(Value: Single); safecall;
    function Get_AddressStyle: Style; safecall;
    function Get_ReturnAddressStyle: Style; safecall;
    function Get_DefaultOrientation: WdEnvelopeOrientation; safecall;
    procedure Set_DefaultOrientation(Value: WdEnvelopeOrientation); safecall;
    function Get_DefaultFaceUp: WordBool; safecall;
    procedure Set_DefaultFaceUp(Value: WordBool); safecall;
    procedure Insert(var ExtractAddress, Address, AutoText, OmitReturnAddress, ReturnAddress, ReturnAutoText, PrintBarCode, PrintFIMA, Size, Height, Width, FeedSource, AddressFromLeft, AddressFromTop, ReturnAddressFromLeft, ReturnAddressFromTop, DefaultFaceUp, DefaultOrientation: OleVariant); safecall;
    procedure PrintOut(var ExtractAddress, Address, AutoText, OmitReturnAddress, ReturnAddress, ReturnAutoText, PrintBarCode, PrintFIMA, Size, Height, Width, FeedSource, AddressFromLeft, AddressFromTop, ReturnAddressFromLeft, ReturnAddressFromTop, DefaultFaceUp, DefaultOrientation: OleVariant); safecall;
    procedure UpdateDocument; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property Address: Range read Get_Address;
    property ReturnAddress: Range read Get_ReturnAddress;
    property DefaultPrintBarCode: WordBool read Get_DefaultPrintBarCode write Set_DefaultPrintBarCode;
    property DefaultPrintFIMA: WordBool read Get_DefaultPrintFIMA write Set_DefaultPrintFIMA;
    property DefaultHeight: Single read Get_DefaultHeight write Set_DefaultHeight;
    property DefaultWidth: Single read Get_DefaultWidth write Set_DefaultWidth;
    property DefaultSize: WideString read Get_DefaultSize write Set_DefaultSize;
    property DefaultOmitReturnAddress: WordBool read Get_DefaultOmitReturnAddress write Set_DefaultOmitReturnAddress;
    property FeedSource: WdPaperTray read Get_FeedSource write Set_FeedSource;
    property AddressFromLeft: Single read Get_AddressFromLeft write Set_AddressFromLeft;
    property AddressFromTop: Single read Get_AddressFromTop write Set_AddressFromTop;
    property ReturnAddressFromLeft: Single read Get_ReturnAddressFromLeft write Set_ReturnAddressFromLeft;
    property ReturnAddressFromTop: Single read Get_ReturnAddressFromTop write Set_ReturnAddressFromTop;
    property AddressStyle: Style read Get_AddressStyle;
    property ReturnAddressStyle: Style read Get_ReturnAddressStyle;
    property DefaultOrientation: WdEnvelopeOrientation read Get_DefaultOrientation write Set_DefaultOrientation;
    property DefaultFaceUp: WordBool read Get_DefaultFaceUp write Set_DefaultFaceUp;
  end;

{ DispInterface declaration for Dual Interface Envelope }

  EnvelopeDisp = dispinterface
    ['{00020918-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property Address: Range readonly dispid 1;
    property ReturnAddress: Range readonly dispid 2;
    property DefaultPrintBarCode: WordBool dispid 4;
    property DefaultPrintFIMA: WordBool dispid 5;
    property DefaultHeight: Single dispid 6;
    property DefaultWidth: Single dispid 7;
    property DefaultSize: WideString dispid 0;
    property DefaultOmitReturnAddress: WordBool dispid 9;
    property FeedSource: WdPaperTray dispid 12;
    property AddressFromLeft: Single dispid 13;
    property AddressFromTop: Single dispid 14;
    property ReturnAddressFromLeft: Single dispid 15;
    property ReturnAddressFromTop: Single dispid 16;
    property AddressStyle: Style readonly dispid 17;
    property ReturnAddressStyle: Style readonly dispid 18;
    property DefaultOrientation: WdEnvelopeOrientation dispid 19;
    property DefaultFaceUp: WordBool dispid 20;
    procedure Insert(var ExtractAddress, Address, AutoText, OmitReturnAddress, ReturnAddress, ReturnAutoText, PrintBarCode, PrintFIMA, Size, Height, Width, FeedSource, AddressFromLeft, AddressFromTop, ReturnAddressFromLeft, ReturnAddressFromTop, DefaultFaceUp, DefaultOrientation: OleVariant); dispid 101;
    procedure PrintOut(var ExtractAddress, Address, AutoText, OmitReturnAddress, ReturnAddress, ReturnAutoText, PrintBarCode, PrintFIMA, Size, Height, Width, FeedSource, AddressFromLeft, AddressFromTop, ReturnAddressFromLeft, ReturnAddressFromTop, DefaultFaceUp, DefaultOrientation: OleVariant); dispid 102;
    procedure UpdateDocument; dispid 103;
  end;

  MailingLabel = interface(IDispatch)
    ['{00020917-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_DefaultPrintBarCode: WordBool; safecall;
    procedure Set_DefaultPrintBarCode(Value: WordBool); safecall;
    function Get_DefaultLaserTray: WdPaperTray; safecall;
    procedure Set_DefaultLaserTray(Value: WdPaperTray); safecall;
    function Get_CustomLabels: CustomLabels; safecall;
    function Get_DefaultLabelName: WideString; safecall;
    procedure Set_DefaultLabelName(const Value: WideString); safecall;
    function CreateNewDocument(var Name, Address, AutoText, ExtractAddress, LaserTray: OleVariant): Document; safecall;
    procedure PrintOut(var Name, Address, ExtractAddress, LaserTray, SingleLabel, Row, Column: OleVariant); safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property DefaultPrintBarCode: WordBool read Get_DefaultPrintBarCode write Set_DefaultPrintBarCode;
    property DefaultLaserTray: WdPaperTray read Get_DefaultLaserTray write Set_DefaultLaserTray;
    property CustomLabels: CustomLabels read Get_CustomLabels;
    property DefaultLabelName: WideString read Get_DefaultLabelName write Set_DefaultLabelName;
  end;

{ DispInterface declaration for Dual Interface MailingLabel }

  MailingLabelDisp = dispinterface
    ['{00020917-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property DefaultPrintBarCode: WordBool dispid 2;
    property DefaultLaserTray: WdPaperTray dispid 4;
    property CustomLabels: CustomLabels readonly dispid 8;
    property DefaultLabelName: WideString dispid 9;
    function CreateNewDocument(var Name, Address, AutoText, ExtractAddress, LaserTray: OleVariant): Document; dispid 101;
    procedure PrintOut(var Name, Address, ExtractAddress, LaserTray, SingleLabel, Row, Column: OleVariant); dispid 102;
  end;

  CustomLabels = interface(IDispatch)
    ['{00020916-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get__NewEnum: IUnknown; safecall;
    function Get_Count: Integer; safecall;
    function Item(var Index: OleVariant): CustomLabel; safecall;
    function Add(const Name: WideString; var DotMatrix: OleVariant): CustomLabel; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Count: Integer read Get_Count;
  end;

{ DispInterface declaration for Dual Interface CustomLabels }

  CustomLabelsDisp = dispinterface
    ['{00020916-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property _NewEnum: IUnknown readonly dispid -4;
    property Count: Integer readonly dispid 1;
    function Item(var Index: OleVariant): CustomLabel; dispid 0;
    function Add(const Name: WideString; var DotMatrix: OleVariant): CustomLabel; dispid 101;
  end;

  CustomLabel = interface(IDispatch)
    ['{00020915-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Index: Integer; safecall;
    function Get_Name: WideString; safecall;
    procedure Set_Name(const Value: WideString); safecall;
    function Get_TopMargin: Single; safecall;
    procedure Set_TopMargin(Value: Single); safecall;
    function Get_SideMargin: Single; safecall;
    procedure Set_SideMargin(Value: Single); safecall;
    function Get_Height: Single; safecall;
    procedure Set_Height(Value: Single); safecall;
    function Get_Width: Single; safecall;
    procedure Set_Width(Value: Single); safecall;
    function Get_VerticalPitch: Single; safecall;
    procedure Set_VerticalPitch(Value: Single); safecall;
    function Get_HorizontalPitch: Single; safecall;
    procedure Set_HorizontalPitch(Value: Single); safecall;
    function Get_NumberAcross: Integer; safecall;
    procedure Set_NumberAcross(Value: Integer); safecall;
    function Get_NumberDown: Integer; safecall;
    procedure Set_NumberDown(Value: Integer); safecall;
    function Get_DotMatrix: WordBool; safecall;
    function Get_PageSize: WdCustomLabelPageSize; safecall;
    procedure Set_PageSize(Value: WdCustomLabelPageSize); safecall;
    function Get_Valid: WordBool; safecall;
    procedure Delete; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property Index: Integer read Get_Index;
    property Name: WideString read Get_Name write Set_Name;
    property TopMargin: Single read Get_TopMargin write Set_TopMargin;
    property SideMargin: Single read Get_SideMargin write Set_SideMargin;
    property Height: Single read Get_Height write Set_Height;
    property Width: Single read Get_Width write Set_Width;
    property VerticalPitch: Single read Get_VerticalPitch write Set_VerticalPitch;
    property HorizontalPitch: Single read Get_HorizontalPitch write Set_HorizontalPitch;
    property NumberAcross: Integer read Get_NumberAcross write Set_NumberAcross;
    property NumberDown: Integer read Get_NumberDown write Set_NumberDown;
    property DotMatrix: WordBool read Get_DotMatrix;
    property PageSize: WdCustomLabelPageSize read Get_PageSize write Set_PageSize;
    property Valid: WordBool read Get_Valid;
  end;

{ DispInterface declaration for Dual Interface CustomLabel }

  CustomLabelDisp = dispinterface
    ['{00020915-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property Index: Integer readonly dispid 1;
    property Name: WideString dispid 2;
    property TopMargin: Single dispid 3;
    property SideMargin: Single dispid 4;
    property Height: Single dispid 5;
    property Width: Single dispid 6;
    property VerticalPitch: Single dispid 7;
    property HorizontalPitch: Single dispid 8;
    property NumberAcross: Integer dispid 9;
    property NumberDown: Integer dispid 10;
    property DotMatrix: WordBool readonly dispid 11;
    property PageSize: WdCustomLabelPageSize dispid 12;
    property Valid: WordBool readonly dispid 13;
    procedure Delete; dispid 101;
  end;

  TablesOfContents = interface(IDispatch)
    ['{00020914-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get__NewEnum: IUnknown; safecall;
    function Get_Count: Integer; safecall;
    function Get_Format: WdTocFormat; safecall;
    procedure Set_Format(Value: WdTocFormat); safecall;
    function Item(Index: Integer): TableOfContents; safecall;
    function Add(const Range: Range; var UseHeadingStyles, UpperHeadingLevel, LowerHeadingLevel, UseFields, TableID, RightAlignPageNumbers, IncludePageNumbers, AddedStyles: OleVariant): TableOfContents; safecall;
    function MarkEntry(const Range: Range; var Entry, EntryAutoText, TableID, Level: OleVariant): Field; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Count: Integer read Get_Count;
    property Format: WdTocFormat read Get_Format write Set_Format;
  end;

{ DispInterface declaration for Dual Interface TablesOfContents }

  TablesOfContentsDisp = dispinterface
    ['{00020914-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property _NewEnum: IUnknown readonly dispid -4;
    property Count: Integer readonly dispid 1;
    property Format: WdTocFormat dispid 2;
    function Item(Index: Integer): TableOfContents; dispid 0;
    function Add(const Range: Range; var UseHeadingStyles, UpperHeadingLevel, LowerHeadingLevel, UseFields, TableID, RightAlignPageNumbers, IncludePageNumbers, AddedStyles: OleVariant): TableOfContents; dispid 100;
    function MarkEntry(const Range: Range; var Entry, EntryAutoText, TableID, Level: OleVariant): Field; dispid 101;
  end;

  TableOfContents = interface(IDispatch)
    ['{00020913-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_UseHeadingStyles: WordBool; safecall;
    procedure Set_UseHeadingStyles(Value: WordBool); safecall;
    function Get_UseFields: WordBool; safecall;
    procedure Set_UseFields(Value: WordBool); safecall;
    function Get_UpperHeadingLevel: Integer; safecall;
    procedure Set_UpperHeadingLevel(Value: Integer); safecall;
    function Get_LowerHeadingLevel: Integer; safecall;
    procedure Set_LowerHeadingLevel(Value: Integer); safecall;
    function Get_TableID: WideString; safecall;
    procedure Set_TableID(const Value: WideString); safecall;
    function Get_HeadingStyles: HeadingStyles; safecall;
    function Get_RightAlignPageNumbers: WordBool; safecall;
    procedure Set_RightAlignPageNumbers(Value: WordBool); safecall;
    function Get_IncludePageNumbers: WordBool; safecall;
    procedure Set_IncludePageNumbers(Value: WordBool); safecall;
    function Get_Range: Range; safecall;
    function Get_TabLeader: WdTabLeader; safecall;
    procedure Set_TabLeader(Value: WdTabLeader); safecall;
    procedure Delete; safecall;
    procedure UpdatePageNumbers; safecall;
    procedure Update; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property UseHeadingStyles: WordBool read Get_UseHeadingStyles write Set_UseHeadingStyles;
    property UseFields: WordBool read Get_UseFields write Set_UseFields;
    property UpperHeadingLevel: Integer read Get_UpperHeadingLevel write Set_UpperHeadingLevel;
    property LowerHeadingLevel: Integer read Get_LowerHeadingLevel write Set_LowerHeadingLevel;
    property TableID: WideString read Get_TableID write Set_TableID;
    property HeadingStyles: HeadingStyles read Get_HeadingStyles;
    property RightAlignPageNumbers: WordBool read Get_RightAlignPageNumbers write Set_RightAlignPageNumbers;
    property IncludePageNumbers: WordBool read Get_IncludePageNumbers write Set_IncludePageNumbers;
    property Range: Range read Get_Range;
    property TabLeader: WdTabLeader read Get_TabLeader write Set_TabLeader;
  end;

{ DispInterface declaration for Dual Interface TableOfContents }

  TableOfContentsDisp = dispinterface
    ['{00020913-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property UseHeadingStyles: WordBool dispid 1;
    property UseFields: WordBool dispid 2;
    property UpperHeadingLevel: Integer dispid 3;
    property LowerHeadingLevel: Integer dispid 4;
    property TableID: WideString dispid 5;
    property HeadingStyles: HeadingStyles readonly dispid 6;
    property RightAlignPageNumbers: WordBool dispid 7;
    property IncludePageNumbers: WordBool dispid 8;
    property Range: Range readonly dispid 9;
    property TabLeader: WdTabLeader dispid 10;
    procedure Delete; dispid 100;
    procedure UpdatePageNumbers; dispid 101;
    procedure Update; dispid 102;
  end;

  TablesOfAuthorities = interface(IDispatch)
    ['{00020912-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get__NewEnum: IUnknown; safecall;
    function Get_Count: Integer; safecall;
    function Get_Format: WdToaFormat; safecall;
    procedure Set_Format(Value: WdToaFormat); safecall;
    function Item(Index: Integer): TableOfAuthorities; safecall;
    function Add(const Range: Range; var Category, Bookmark, Passim, KeepEntryFormatting, Separator, IncludeSequenceName, EntrySeparator, PageRangeSeparator, IncludeCategoryHeader, PageNumberSeparator: OleVariant): TableOfAuthorities; safecall;
    procedure NextCitation(const ShortCitation: WideString); safecall;
    function MarkCitation(const Range: Range; const ShortCitation: WideString; var LongCitation, LongCitationAutoText, Category: OleVariant): Field; safecall;
    procedure MarkAllCitations(const ShortCitation: WideString; var LongCitation, LongCitationAutoText, Category: OleVariant); safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Count: Integer read Get_Count;
    property Format: WdToaFormat read Get_Format write Set_Format;
  end;

{ DispInterface declaration for Dual Interface TablesOfAuthorities }

  TablesOfAuthoritiesDisp = dispinterface
    ['{00020912-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property _NewEnum: IUnknown readonly dispid -4;
    property Count: Integer readonly dispid 1;
    property Format: WdToaFormat dispid 2;
    function Item(Index: Integer): TableOfAuthorities; dispid 0;
    function Add(const Range: Range; var Category, Bookmark, Passim, KeepEntryFormatting, Separator, IncludeSequenceName, EntrySeparator, PageRangeSeparator, IncludeCategoryHeader, PageNumberSeparator: OleVariant): TableOfAuthorities; dispid 100;
    procedure NextCitation(const ShortCitation: WideString); dispid 103;
    function MarkCitation(const Range: Range; const ShortCitation: WideString; var LongCitation, LongCitationAutoText, Category: OleVariant): Field; dispid 101;
    procedure MarkAllCitations(const ShortCitation: WideString; var LongCitation, LongCitationAutoText, Category: OleVariant); dispid 102;
  end;

  TableOfAuthorities = interface(IDispatch)
    ['{00020911-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Passim: WordBool; safecall;
    procedure Set_Passim(Value: WordBool); safecall;
    function Get_KeepEntryFormatting: WordBool; safecall;
    procedure Set_KeepEntryFormatting(Value: WordBool); safecall;
    function Get_Category: Integer; safecall;
    procedure Set_Category(Value: Integer); safecall;
    function Get_Bookmark: WideString; safecall;
    procedure Set_Bookmark(const Value: WideString); safecall;
    function Get_Separator: WideString; safecall;
    procedure Set_Separator(const Value: WideString); safecall;
    function Get_IncludeSequenceName: WideString; safecall;
    procedure Set_IncludeSequenceName(const Value: WideString); safecall;
    function Get_EntrySeparator: WideString; safecall;
    procedure Set_EntrySeparator(const Value: WideString); safecall;
    function Get_PageRangeSeparator: WideString; safecall;
    procedure Set_PageRangeSeparator(const Value: WideString); safecall;
    function Get_IncludeCategoryHeader: WordBool; safecall;
    procedure Set_IncludeCategoryHeader(Value: WordBool); safecall;
    function Get_PageNumberSeparator: WideString; safecall;
    procedure Set_PageNumberSeparator(const Value: WideString); safecall;
    function Get_Range: Range; safecall;
    function Get_TabLeader: WdTabLeader; safecall;
    procedure Set_TabLeader(Value: WdTabLeader); safecall;
    procedure Delete; safecall;
    procedure Update; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property Passim: WordBool read Get_Passim write Set_Passim;
    property KeepEntryFormatting: WordBool read Get_KeepEntryFormatting write Set_KeepEntryFormatting;
    property Category: Integer read Get_Category write Set_Category;
    property Bookmark: WideString read Get_Bookmark write Set_Bookmark;
    property Separator: WideString read Get_Separator write Set_Separator;
    property IncludeSequenceName: WideString read Get_IncludeSequenceName write Set_IncludeSequenceName;
    property EntrySeparator: WideString read Get_EntrySeparator write Set_EntrySeparator;
    property PageRangeSeparator: WideString read Get_PageRangeSeparator write Set_PageRangeSeparator;
    property IncludeCategoryHeader: WordBool read Get_IncludeCategoryHeader write Set_IncludeCategoryHeader;
    property PageNumberSeparator: WideString read Get_PageNumberSeparator write Set_PageNumberSeparator;
    property Range: Range read Get_Range;
    property TabLeader: WdTabLeader read Get_TabLeader write Set_TabLeader;
  end;

{ DispInterface declaration for Dual Interface TableOfAuthorities }

  TableOfAuthoritiesDisp = dispinterface
    ['{00020911-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property Passim: WordBool dispid 1;
    property KeepEntryFormatting: WordBool dispid 2;
    property Category: Integer dispid 3;
    property Bookmark: WideString dispid 4;
    property Separator: WideString dispid 5;
    property IncludeSequenceName: WideString dispid 6;
    property EntrySeparator: WideString dispid 7;
    property PageRangeSeparator: WideString dispid 8;
    property IncludeCategoryHeader: WordBool dispid 9;
    property PageNumberSeparator: WideString dispid 10;
    property Range: Range readonly dispid 11;
    property TabLeader: WdTabLeader dispid 12;
    procedure Delete; dispid 100;
    procedure Update; dispid 101;
  end;

  Dialogs = interface(IDispatch)
    ['{00020910-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get__NewEnum: IUnknown; safecall;
    function Get_Count: Integer; safecall;
    function Item(Index: WdWordDialog): Dialog; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Count: Integer read Get_Count;
  end;

{ DispInterface declaration for Dual Interface Dialogs }

  DialogsDisp = dispinterface
    ['{00020910-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property _NewEnum: IUnknown readonly dispid -4;
    property Count: Integer readonly dispid 1;
    function Item(Index: WdWordDialog): Dialog; dispid 0;
  end;

  Dialog = interface(IDispatch)
    ['{000209B8-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_DefaultTab: WdWordDialogTab; safecall;
    procedure Set_DefaultTab(Value: WdWordDialogTab); safecall;
    function Get_Type_: WdWordDialog; safecall;
    function Show(var TimeOut: OleVariant): Integer; safecall;
    function Display(var TimeOut: OleVariant): Integer; safecall;
    procedure Execute; safecall;
    procedure Update; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property DefaultTab: WdWordDialogTab read Get_DefaultTab write Set_DefaultTab;
    property Type_: WdWordDialog read Get_Type_;
  end;

{ DispInterface declaration for Dual Interface Dialog }

  DialogDisp = dispinterface
    ['{000209B8-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 32003;
    property Creator: Integer readonly dispid 32004;
    property Parent: IDispatch readonly dispid 32005;
    property DefaultTab: WdWordDialogTab dispid 32002;
    property Type_: WdWordDialog readonly dispid 0;
    function Show(var TimeOut: OleVariant): Integer; dispid 336;
    function Display(var TimeOut: OleVariant): Integer; dispid 338;
    procedure Execute; dispid 32001;
    procedure Update; dispid 302;
  end;

  PageSetup = interface(IDispatch)
    ['{00020971-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_TopMargin: Single; safecall;
    procedure Set_TopMargin(Value: Single); safecall;
    function Get_BottomMargin: Single; safecall;
    procedure Set_BottomMargin(Value: Single); safecall;
    function Get_LeftMargin: Single; safecall;
    procedure Set_LeftMargin(Value: Single); safecall;
    function Get_RightMargin: Single; safecall;
    procedure Set_RightMargin(Value: Single); safecall;
    function Get_Gutter: Single; safecall;
    procedure Set_Gutter(Value: Single); safecall;
    function Get_PageWidth: Single; safecall;
    procedure Set_PageWidth(Value: Single); safecall;
    function Get_PageHeight: Single; safecall;
    procedure Set_PageHeight(Value: Single); safecall;
    function Get_Orientation: WdOrientation; safecall;
    procedure Set_Orientation(Value: WdOrientation); safecall;
    function Get_FirstPageTray: WdPaperTray; safecall;
    procedure Set_FirstPageTray(Value: WdPaperTray); safecall;
    function Get_OtherPagesTray: WdPaperTray; safecall;
    procedure Set_OtherPagesTray(Value: WdPaperTray); safecall;
    function Get_VerticalAlignment: WdVerticalAlignment; safecall;
    procedure Set_VerticalAlignment(Value: WdVerticalAlignment); safecall;
    function Get_MirrorMargins: Integer; safecall;
    procedure Set_MirrorMargins(Value: Integer); safecall;
    function Get_HeaderDistance: Single; safecall;
    procedure Set_HeaderDistance(Value: Single); safecall;
    function Get_FooterDistance: Single; safecall;
    procedure Set_FooterDistance(Value: Single); safecall;
    function Get_SectionStart: WdSectionStart; safecall;
    procedure Set_SectionStart(Value: WdSectionStart); safecall;
    function Get_OddAndEvenPagesHeaderFooter: Integer; safecall;
    procedure Set_OddAndEvenPagesHeaderFooter(Value: Integer); safecall;
    function Get_DifferentFirstPageHeaderFooter: Integer; safecall;
    procedure Set_DifferentFirstPageHeaderFooter(Value: Integer); safecall;
    function Get_SuppressEndnotes: Integer; safecall;
    procedure Set_SuppressEndnotes(Value: Integer); safecall;
    function Get_LineNumbering: LineNumbering; safecall;
    procedure Set_LineNumbering(const Value: LineNumbering); safecall;
    function Get_TextColumns: TextColumns; safecall;
    procedure Set_TextColumns(const Value: TextColumns); safecall;
    function Get_PaperSize: WdPaperSize; safecall;
    procedure Set_PaperSize(Value: WdPaperSize); safecall;
    function Get_TwoPagesOnOne: WordBool; safecall;
    procedure Set_TwoPagesOnOne(Value: WordBool); safecall;
    function Get_GutterOnTop: WordBool; safecall;
    procedure Set_GutterOnTop(Value: WordBool); safecall;
    function Get_CharsLine: Single; safecall;
    procedure Set_CharsLine(Value: Single); safecall;
    function Get_LinesPage: Single; safecall;
    procedure Set_LinesPage(Value: Single); safecall;
    function Get_ShowGrid: WordBool; safecall;
    procedure Set_ShowGrid(Value: WordBool); safecall;
    procedure TogglePortrait; safecall;
    procedure SetAsTemplateDefault; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property TopMargin: Single read Get_TopMargin write Set_TopMargin;
    property BottomMargin: Single read Get_BottomMargin write Set_BottomMargin;
    property LeftMargin: Single read Get_LeftMargin write Set_LeftMargin;
    property RightMargin: Single read Get_RightMargin write Set_RightMargin;
    property Gutter: Single read Get_Gutter write Set_Gutter;
    property PageWidth: Single read Get_PageWidth write Set_PageWidth;
    property PageHeight: Single read Get_PageHeight write Set_PageHeight;
    property Orientation: WdOrientation read Get_Orientation write Set_Orientation;
    property FirstPageTray: WdPaperTray read Get_FirstPageTray write Set_FirstPageTray;
    property OtherPagesTray: WdPaperTray read Get_OtherPagesTray write Set_OtherPagesTray;
    property VerticalAlignment: WdVerticalAlignment read Get_VerticalAlignment write Set_VerticalAlignment;
    property MirrorMargins: Integer read Get_MirrorMargins write Set_MirrorMargins;
    property HeaderDistance: Single read Get_HeaderDistance write Set_HeaderDistance;
    property FooterDistance: Single read Get_FooterDistance write Set_FooterDistance;
    property SectionStart: WdSectionStart read Get_SectionStart write Set_SectionStart;
    property OddAndEvenPagesHeaderFooter: Integer read Get_OddAndEvenPagesHeaderFooter write Set_OddAndEvenPagesHeaderFooter;
    property DifferentFirstPageHeaderFooter: Integer read Get_DifferentFirstPageHeaderFooter write Set_DifferentFirstPageHeaderFooter;
    property SuppressEndnotes: Integer read Get_SuppressEndnotes write Set_SuppressEndnotes;
    property LineNumbering: LineNumbering read Get_LineNumbering write Set_LineNumbering;
    property TextColumns: TextColumns read Get_TextColumns write Set_TextColumns;
    property PaperSize: WdPaperSize read Get_PaperSize write Set_PaperSize;
    property TwoPagesOnOne: WordBool read Get_TwoPagesOnOne write Set_TwoPagesOnOne;
    property GutterOnTop: WordBool read Get_GutterOnTop write Set_GutterOnTop;
    property CharsLine: Single read Get_CharsLine write Set_CharsLine;
    property LinesPage: Single read Get_LinesPage write Set_LinesPage;
    property ShowGrid: WordBool read Get_ShowGrid write Set_ShowGrid;
  end;

{ DispInterface declaration for Dual Interface PageSetup }

  PageSetupDisp = dispinterface
    ['{00020971-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property TopMargin: Single dispid 100;
    property BottomMargin: Single dispid 101;
    property LeftMargin: Single dispid 102;
    property RightMargin: Single dispid 103;
    property Gutter: Single dispid 104;
    property PageWidth: Single dispid 105;
    property PageHeight: Single dispid 106;
    property Orientation: WdOrientation dispid 107;
    property FirstPageTray: WdPaperTray dispid 108;
    property OtherPagesTray: WdPaperTray dispid 109;
    property VerticalAlignment: WdVerticalAlignment dispid 110;
    property MirrorMargins: Integer dispid 111;
    property HeaderDistance: Single dispid 112;
    property FooterDistance: Single dispid 113;
    property SectionStart: WdSectionStart dispid 114;
    property OddAndEvenPagesHeaderFooter: Integer dispid 115;
    property DifferentFirstPageHeaderFooter: Integer dispid 116;
    property SuppressEndnotes: Integer dispid 117;
    property LineNumbering: LineNumbering dispid 118;
    property TextColumns: TextColumns dispid 119;
    property PaperSize: WdPaperSize dispid 120;
    property TwoPagesOnOne: WordBool dispid 121;
    property GutterOnTop: WordBool dispid 122;
    property CharsLine: Single dispid 123;
    property LinesPage: Single dispid 124;
    property ShowGrid: WordBool dispid 128;
    procedure TogglePortrait; dispid 201;
    procedure SetAsTemplateDefault; dispid 202;
  end;

  LineNumbering = interface(IDispatch)
    ['{00020972-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_RestartMode: WdNumberingRule; safecall;
    procedure Set_RestartMode(Value: WdNumberingRule); safecall;
    function Get_StartingNumber: Integer; safecall;
    procedure Set_StartingNumber(Value: Integer); safecall;
    function Get_DistanceFromText: Single; safecall;
    procedure Set_DistanceFromText(Value: Single); safecall;
    function Get_CountBy: Integer; safecall;
    procedure Set_CountBy(Value: Integer); safecall;
    function Get_Active: Integer; safecall;
    procedure Set_Active(Value: Integer); safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property RestartMode: WdNumberingRule read Get_RestartMode write Set_RestartMode;
    property StartingNumber: Integer read Get_StartingNumber write Set_StartingNumber;
    property DistanceFromText: Single read Get_DistanceFromText write Set_DistanceFromText;
    property CountBy: Integer read Get_CountBy write Set_CountBy;
    property Active: Integer read Get_Active write Set_Active;
  end;

{ DispInterface declaration for Dual Interface LineNumbering }

  LineNumberingDisp = dispinterface
    ['{00020972-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property RestartMode: WdNumberingRule dispid 100;
    property StartingNumber: Integer dispid 101;
    property DistanceFromText: Single dispid 102;
    property CountBy: Integer dispid 103;
    property Active: Integer dispid 104;
  end;

  TextColumns = interface(IDispatch)
    ['{00020973-0000-0000-C000-000000000046}']
    function Get__NewEnum: IUnknown; safecall;
    function Get_Count: Integer; safecall;
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_EvenlySpaced: Integer; safecall;
    procedure Set_EvenlySpaced(Value: Integer); safecall;
    function Get_LineBetween: Integer; safecall;
    procedure Set_LineBetween(Value: Integer); safecall;
    function Get_Width: Single; safecall;
    procedure Set_Width(Value: Single); safecall;
    function Get_Spacing: Single; safecall;
    procedure Set_Spacing(Value: Single); safecall;
    function Item(Index: Integer): TextColumn; safecall;
    function Add(var Width, Spacing, EvenlySpaced: OleVariant): TextColumn; safecall;
    procedure SetCount(NumColumns: Integer); safecall;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Count: Integer read Get_Count;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property EvenlySpaced: Integer read Get_EvenlySpaced write Set_EvenlySpaced;
    property LineBetween: Integer read Get_LineBetween write Set_LineBetween;
    property Width: Single read Get_Width write Set_Width;
    property Spacing: Single read Get_Spacing write Set_Spacing;
  end;

{ DispInterface declaration for Dual Interface TextColumns }

  TextColumnsDisp = dispinterface
    ['{00020973-0000-0000-C000-000000000046}']
    property _NewEnum: IUnknown readonly dispid -4;
    property Count: Integer readonly dispid 2;
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property EvenlySpaced: Integer dispid 100;
    property LineBetween: Integer dispid 101;
    property Width: Single dispid 102;
    property Spacing: Single dispid 103;
    function Item(Index: Integer): TextColumn; dispid 0;
    function Add(var Width, Spacing, EvenlySpaced: OleVariant): TextColumn; dispid 201;
    procedure SetCount(NumColumns: Integer); dispid 202;
  end;

  TextColumn = interface(IDispatch)
    ['{00020974-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Width: Single; safecall;
    procedure Set_Width(Value: Single); safecall;
    function Get_SpaceAfter: Single; safecall;
    procedure Set_SpaceAfter(Value: Single); safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property Width: Single read Get_Width write Set_Width;
    property SpaceAfter: Single read Get_SpaceAfter write Set_SpaceAfter;
  end;

{ DispInterface declaration for Dual Interface TextColumn }

  TextColumnDisp = dispinterface
    ['{00020974-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property Width: Single dispid 100;
    property SpaceAfter: Single dispid 101;
  end;

  Selection = interface(IDispatch)
    ['{00020975-0000-0000-C000-000000000046}']
    function Get_Text: WideString; safecall;
    procedure Set_Text(const Value: WideString); safecall;
    function Get_FormattedText: Range; safecall;
    procedure Set_FormattedText(const Value: Range); safecall;
    function Get_Start: Integer; safecall;
    procedure Set_Start(Value: Integer); safecall;
    function Get_End_: Integer; safecall;
    procedure Set_End_(Value: Integer); safecall;
    function Get_Font: Font; safecall;
    procedure Set_Font(const Value: Font); safecall;
    function Get_Type_: WdSelectionType; safecall;
    function Get_StoryType: WdStoryType; safecall;
    function Get_Style: OleVariant; safecall;
    procedure Set_Style(Value: OleVariant); safecall;
    function Get_Tables: Tables; safecall;
    function Get_Words: Words; safecall;
    function Get_Sentences: Sentences; safecall;
    function Get_Characters: Characters; safecall;
    function Get_Footnotes: Footnotes; safecall;
    function Get_Endnotes: Endnotes; safecall;
    function Get_Comments: Comments; safecall;
    function Get_Cells: Cells; safecall;
    function Get_Sections: Sections; safecall;
    function Get_Paragraphs: Paragraphs; safecall;
    function Get_Borders: Borders; safecall;
    procedure Set_Borders(const Value: Borders); safecall;
    function Get_Shading: Shading; safecall;
    function Get_Fields: Fields; safecall;
    function Get_FormFields: FormFields; safecall;
    function Get_Frames: Frames; safecall;
    function Get_ParagraphFormat: ParagraphFormat; safecall;
    procedure Set_ParagraphFormat(const Value: ParagraphFormat); safecall;
    function Get_PageSetup: PageSetup; safecall;
    procedure Set_PageSetup(const Value: PageSetup); safecall;
    function Get_Bookmarks: Bookmarks; safecall;
    function Get_StoryLength: Integer; safecall;
    function Get_LanguageID: WdLanguageID; safecall;
    procedure Set_LanguageID(Value: WdLanguageID); safecall;
    function Get_LanguageIDFarEast: WdLanguageID; safecall;
    procedure Set_LanguageIDFarEast(Value: WdLanguageID); safecall;
    function Get_LanguageIDOther: WdLanguageID; safecall;
    procedure Set_LanguageIDOther(Value: WdLanguageID); safecall;
    function Get_Hyperlinks: Hyperlinks; safecall;
    function Get_Columns: Columns; safecall;
    function Get_Rows: Rows; safecall;
    function Get_HeaderFooter: HeaderFooter; safecall;
    function Get_IsEndOfRowMark: WordBool; safecall;
    function Get_BookmarkID: Integer; safecall;
    function Get_PreviousBookmarkID: Integer; safecall;
    function Get_Find: Find; safecall;
    function Get_Range: Range; safecall;
    function Get_Information(Type_: WdInformation): OleVariant; safecall;
    function Get_Flags: WdSelectionFlags; safecall;
    procedure Set_Flags(Value: WdSelectionFlags); safecall;
    function Get_Active: WordBool; safecall;
    function Get_StartIsActive: WordBool; safecall;
    procedure Set_StartIsActive(Value: WordBool); safecall;
    function Get_IPAtEndOfLine: WordBool; safecall;
    function Get_ExtendMode: WordBool; safecall;
    procedure Set_ExtendMode(Value: WordBool); safecall;
    function Get_ColumnSelectMode: WordBool; safecall;
    procedure Set_ColumnSelectMode(Value: WordBool); safecall;
    function Get_Orientation: WdTextOrientation; safecall;
    procedure Set_Orientation(Value: WdTextOrientation); safecall;
    function Get_InlineShapes: InlineShapes; safecall;
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Document: Document; safecall;
    function Get_ShapeRange: ShapeRange; safecall;
    procedure Select; safecall;
    procedure SetRange(Start, End_: Integer); safecall;
    procedure Collapse(var Direction: OleVariant); safecall;
    procedure InsertBefore(const Text: WideString); safecall;
    procedure InsertAfter(const Text: WideString); safecall;
    function Next(var Unit_, Count: OleVariant): Range; safecall;
    function Previous(var Unit_, Count: OleVariant): Range; safecall;
    function StartOf(var Unit_, Extend: OleVariant): Integer; safecall;
    function EndOf(var Unit_, Extend: OleVariant): Integer; safecall;
    function Move(var Unit_, Count: OleVariant): Integer; safecall;
    function MoveStart(var Unit_, Count: OleVariant): Integer; safecall;
    function MoveEnd(var Unit_, Count: OleVariant): Integer; safecall;
    function MoveWhile(var Cset, Count: OleVariant): Integer; safecall;
    function MoveStartWhile(var Cset, Count: OleVariant): Integer; safecall;
    function MoveEndWhile(var Cset, Count: OleVariant): Integer; safecall;
    function MoveUntil(var Cset, Count: OleVariant): Integer; safecall;
    function MoveStartUntil(var Cset, Count: OleVariant): Integer; safecall;
    function MoveEndUntil(var Cset, Count: OleVariant): Integer; safecall;
    procedure Cut; safecall;
    procedure Copy; safecall;
    procedure Paste; safecall;
    procedure InsertBreak(var Type_: OleVariant); safecall;
    procedure InsertFile(const FileName: WideString; var Range, ConfirmConversions, Link, Attachment: OleVariant); safecall;
    function InStory(const Range: Range): WordBool; safecall;
    function InRange(const Range: Range): WordBool; safecall;
    function Delete(var Unit_, Count: OleVariant): Integer; safecall;
    function Expand(var Unit_: OleVariant): Integer; safecall;
    procedure InsertParagraph; safecall;
    procedure InsertParagraphAfter; safecall;
    function ConvertToTable(var Separator, NumRows, NumColumns, InitialColumnWidth, Format, ApplyBorders, ApplyShading, ApplyFont, ApplyColor, ApplyHeadingRows, ApplyLastRow, ApplyFirstColumn, ApplyLastColumn, AutoFit: OleVariant): Table; safecall;
    procedure InsertDateTime(var DateTimeFormat, InsertAsField, InsertAsFullWidth: OleVariant); safecall;
    procedure InsertSymbol(CharacterNumber: Integer; var Font, Unicode, Bias: OleVariant); safecall;
    procedure InsertCrossReference(var ReferenceType: OleVariant; ReferenceKind: WdReferenceKind; var ReferenceItem, InsertAsHyperlink, IncludePosition: OleVariant); safecall;
    procedure InsertCaption(var Label_, Title, TitleAutoText, Position: OleVariant); safecall;
    procedure CopyAsPicture; safecall;
    procedure Sort(var ExcludeHeader, FieldNumber, SortFieldType, SortOrder, FieldNumber2, SortFieldType2, SortOrder2, FieldNumber3, SortFieldType3, SortOrder3, SortColumn, Separator, CaseSensitive, LanguageID: OleVariant); safecall;
    procedure SortAscending; safecall;
    procedure SortDescending; safecall;
    function IsEqual(const Range: Range): WordBool; safecall;
    function Calculate: Single; safecall;
    function GoTo_(var What, Which, Count, Name: OleVariant): Range; safecall;
    function GoToNext(What: WdGoToItem): Range; safecall;
    function GoToPrevious(What: WdGoToItem): Range; safecall;
    procedure PasteSpecial(var IconIndex, Link, Placement, DisplayAsIcon, DataType, IconFileName, IconLabel: OleVariant); safecall;
    function PreviousField: Field; safecall;
    function NextField: Field; safecall;
    procedure InsertParagraphBefore; safecall;
    procedure InsertCells(var ShiftCells: OleVariant); safecall;
    procedure Extend(var Character: OleVariant); safecall;
    procedure Shrink; safecall;
    function MoveLeft(var Unit_, Count, Extend: OleVariant): Integer; safecall;
    function MoveRight(var Unit_, Count, Extend: OleVariant): Integer; safecall;
    function MoveUp(var Unit_, Count, Extend: OleVariant): Integer; safecall;
    function MoveDown(var Unit_, Count, Extend: OleVariant): Integer; safecall;
    function HomeKey(var Unit_, Extend: OleVariant): Integer; safecall;
    function EndKey(var Unit_, Extend: OleVariant): Integer; safecall;
    procedure EscapeKey; safecall;
    procedure TypeText(const Text: WideString); safecall;
    procedure CopyFormat; safecall;
    procedure PasteFormat; safecall;
    procedure TypeParagraph; safecall;
    procedure TypeBackspace; safecall;
    procedure NextSubdocument; safecall;
    procedure PreviousSubdocument; safecall;
    procedure SelectColumn; safecall;
    procedure SelectCurrentFont; safecall;
    procedure SelectCurrentAlignment; safecall;
    procedure SelectCurrentSpacing; safecall;
    procedure SelectCurrentIndent; safecall;
    procedure SelectCurrentTabs; safecall;
    procedure SelectCurrentColor; safecall;
    procedure CreateTextbox; safecall;
    procedure WholeStory; safecall;
    procedure SelectRow; safecall;
    procedure SplitTable; safecall;
    procedure InsertRows(var NumRows: OleVariant); safecall;
    procedure InsertColumns; safecall;
    procedure InsertFormula(var Formula, NumberFormat: OleVariant); safecall;
    function NextRevision(var Wrap: OleVariant): Revision; safecall;
    function PreviousRevision(var Wrap: OleVariant): Revision; safecall;
    property Text: WideString read Get_Text write Set_Text;
    property FormattedText: Range read Get_FormattedText write Set_FormattedText;
    property Start: Integer read Get_Start write Set_Start;
    property End_: Integer read Get_End_ write Set_End_;
    property Font: Font read Get_Font write Set_Font;
    property Type_: WdSelectionType read Get_Type_;
    property StoryType: WdStoryType read Get_StoryType;
    property Style: OleVariant read Get_Style write Set_Style;
    property Tables: Tables read Get_Tables;
    property Words: Words read Get_Words;
    property Sentences: Sentences read Get_Sentences;
    property Characters: Characters read Get_Characters;
    property Footnotes: Footnotes read Get_Footnotes;
    property Endnotes: Endnotes read Get_Endnotes;
    property Comments: Comments read Get_Comments;
    property Cells: Cells read Get_Cells;
    property Sections: Sections read Get_Sections;
    property Paragraphs: Paragraphs read Get_Paragraphs;
    property Borders: Borders read Get_Borders write Set_Borders;
    property Shading: Shading read Get_Shading;
    property Fields: Fields read Get_Fields;
    property FormFields: FormFields read Get_FormFields;
    property Frames: Frames read Get_Frames;
    property ParagraphFormat: ParagraphFormat read Get_ParagraphFormat write Set_ParagraphFormat;
    property PageSetup: PageSetup read Get_PageSetup write Set_PageSetup;
    property Bookmarks: Bookmarks read Get_Bookmarks;
    property StoryLength: Integer read Get_StoryLength;
    property LanguageID: WdLanguageID read Get_LanguageID write Set_LanguageID;
    property LanguageIDFarEast: WdLanguageID read Get_LanguageIDFarEast write Set_LanguageIDFarEast;
    property LanguageIDOther: WdLanguageID read Get_LanguageIDOther write Set_LanguageIDOther;
    property Hyperlinks: Hyperlinks read Get_Hyperlinks;
    property Columns: Columns read Get_Columns;
    property Rows: Rows read Get_Rows;
    property HeaderFooter: HeaderFooter read Get_HeaderFooter;
    property IsEndOfRowMark: WordBool read Get_IsEndOfRowMark;
    property BookmarkID: Integer read Get_BookmarkID;
    property PreviousBookmarkID: Integer read Get_PreviousBookmarkID;
    property Find: Find read Get_Find;
    property Range: Range read Get_Range;
    property Information[Type_: WdInformation]: OleVariant read Get_Information;
    property Flags: WdSelectionFlags read Get_Flags write Set_Flags;
    property Active: WordBool read Get_Active;
    property StartIsActive: WordBool read Get_StartIsActive write Set_StartIsActive;
    property IPAtEndOfLine: WordBool read Get_IPAtEndOfLine;
    property ExtendMode: WordBool read Get_ExtendMode write Set_ExtendMode;
    property ColumnSelectMode: WordBool read Get_ColumnSelectMode write Set_ColumnSelectMode;
    property Orientation: WdTextOrientation read Get_Orientation write Set_Orientation;
    property InlineShapes: InlineShapes read Get_InlineShapes;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property Document: Document read Get_Document;
    property ShapeRange: ShapeRange read Get_ShapeRange;
  end;

{ DispInterface declaration for Dual Interface Selection }

  SelectionDisp = dispinterface
    ['{00020975-0000-0000-C000-000000000046}']
    property Text: WideString dispid 0;
    property FormattedText: Range dispid 2;
    property Start: Integer dispid 3;
    property End_: Integer dispid 4;
    property Font: Font dispid 5;
    property Type_: WdSelectionType readonly dispid 6;
    property StoryType: WdStoryType readonly dispid 7;
    property Style: OleVariant dispid 8;
    property Tables: Tables readonly dispid 50;
    property Words: Words readonly dispid 51;
    property Sentences: Sentences readonly dispid 52;
    property Characters: Characters readonly dispid 53;
    property Footnotes: Footnotes readonly dispid 54;
    property Endnotes: Endnotes readonly dispid 55;
    property Comments: Comments readonly dispid 56;
    property Cells: Cells readonly dispid 57;
    property Sections: Sections readonly dispid 58;
    property Paragraphs: Paragraphs readonly dispid 59;
    property Borders: Borders dispid 1100;
    property Shading: Shading readonly dispid 61;
    property Fields: Fields readonly dispid 64;
    property FormFields: FormFields readonly dispid 65;
    property Frames: Frames readonly dispid 66;
    property ParagraphFormat: ParagraphFormat dispid 1102;
    property PageSetup: PageSetup dispid 1101;
    property Bookmarks: Bookmarks readonly dispid 75;
    property StoryLength: Integer readonly dispid 152;
    property LanguageID: WdLanguageID dispid 153;
    property LanguageIDFarEast: WdLanguageID dispid 154;
    property LanguageIDOther: WdLanguageID dispid 155;
    property Hyperlinks: Hyperlinks readonly dispid 156;
    property Columns: Columns readonly dispid 302;
    property Rows: Rows readonly dispid 303;
    property HeaderFooter: HeaderFooter readonly dispid 306;
    property IsEndOfRowMark: WordBool readonly dispid 307;
    property BookmarkID: Integer readonly dispid 308;
    property PreviousBookmarkID: Integer readonly dispid 309;
    property Find: Find readonly dispid 262;
    property Range: Range readonly dispid 400;
    property Information[Type_: WdInformation]: OleVariant readonly dispid 401;
    property Flags: WdSelectionFlags dispid 402;
    property Active: WordBool readonly dispid 403;
    property StartIsActive: WordBool dispid 404;
    property IPAtEndOfLine: WordBool readonly dispid 405;
    property ExtendMode: WordBool dispid 406;
    property ColumnSelectMode: WordBool dispid 407;
    property Orientation: WdTextOrientation dispid 410;
    property InlineShapes: InlineShapes readonly dispid 411;
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property Document: Document readonly dispid 1003;
    property ShapeRange: ShapeRange readonly dispid 1004;
    procedure Select; dispid 65535;
    procedure SetRange(Start, End_: Integer); dispid 100;
    procedure Collapse(var Direction: OleVariant); dispid 101;
    procedure InsertBefore(const Text: WideString); dispid 102;
    procedure InsertAfter(const Text: WideString); dispid 104;
    function Next(var Unit_, Count: OleVariant): Range; dispid 105;
    function Previous(var Unit_, Count: OleVariant): Range; dispid 106;
    function StartOf(var Unit_, Extend: OleVariant): Integer; dispid 107;
    function EndOf(var Unit_, Extend: OleVariant): Integer; dispid 108;
    function Move(var Unit_, Count: OleVariant): Integer; dispid 109;
    function MoveStart(var Unit_, Count: OleVariant): Integer; dispid 110;
    function MoveEnd(var Unit_, Count: OleVariant): Integer; dispid 111;
    function MoveWhile(var Cset, Count: OleVariant): Integer; dispid 112;
    function MoveStartWhile(var Cset, Count: OleVariant): Integer; dispid 113;
    function MoveEndWhile(var Cset, Count: OleVariant): Integer; dispid 114;
    function MoveUntil(var Cset, Count: OleVariant): Integer; dispid 115;
    function MoveStartUntil(var Cset, Count: OleVariant): Integer; dispid 116;
    function MoveEndUntil(var Cset, Count: OleVariant): Integer; dispid 117;
    procedure Cut; dispid 119;
    procedure Copy; dispid 120;
    procedure Paste; dispid 121;
    procedure InsertBreak(var Type_: OleVariant); dispid 122;
    procedure InsertFile(const FileName: WideString; var Range, ConfirmConversions, Link, Attachment: OleVariant); dispid 123;
    function InStory(const Range: Range): WordBool; dispid 125;
    function InRange(const Range: Range): WordBool; dispid 126;
    function Delete(var Unit_, Count: OleVariant): Integer; dispid 127;
    function Expand(var Unit_: OleVariant): Integer; dispid 129;
    procedure InsertParagraph; dispid 160;
    procedure InsertParagraphAfter; dispid 161;
    function ConvertToTable(var Separator, NumRows, NumColumns, InitialColumnWidth, Format, ApplyBorders, ApplyShading, ApplyFont, ApplyColor, ApplyHeadingRows, ApplyLastRow, ApplyFirstColumn, ApplyLastColumn, AutoFit: OleVariant): Table; dispid 162;
    procedure InsertDateTime(var DateTimeFormat, InsertAsField, InsertAsFullWidth: OleVariant); dispid 163;
    procedure InsertSymbol(CharacterNumber: Integer; var Font, Unicode, Bias: OleVariant); dispid 164;
    procedure InsertCrossReference(var ReferenceType: OleVariant; ReferenceKind: WdReferenceKind; var ReferenceItem, InsertAsHyperlink, IncludePosition: OleVariant); dispid 165;
    procedure InsertCaption(var Label_, Title, TitleAutoText, Position: OleVariant); dispid 166;
    procedure CopyAsPicture; dispid 167;
    procedure Sort(var ExcludeHeader, FieldNumber, SortFieldType, SortOrder, FieldNumber2, SortFieldType2, SortOrder2, FieldNumber3, SortFieldType3, SortOrder3, SortColumn, Separator, CaseSensitive, LanguageID: OleVariant); dispid 168;
    procedure SortAscending; dispid 169;
    procedure SortDescending; dispid 170;
    function IsEqual(const Range: Range): WordBool; dispid 171;
    function Calculate: Single; dispid 172;
    function GoTo_(var What, Which, Count, Name: OleVariant): Range; dispid 173;
    function GoToNext(What: WdGoToItem): Range; dispid 174;
    function GoToPrevious(What: WdGoToItem): Range; dispid 175;
    procedure PasteSpecial(var IconIndex, Link, Placement, DisplayAsIcon, DataType, IconFileName, IconLabel: OleVariant); dispid 176;
    function PreviousField: Field; dispid 177;
    function NextField: Field; dispid 178;
    procedure InsertParagraphBefore; dispid 212;
    procedure InsertCells(var ShiftCells: OleVariant); dispid 214;
    procedure Extend(var Character: OleVariant); dispid 300;
    procedure Shrink; dispid 301;
    function MoveLeft(var Unit_, Count, Extend: OleVariant): Integer; dispid 500;
    function MoveRight(var Unit_, Count, Extend: OleVariant): Integer; dispid 501;
    function MoveUp(var Unit_, Count, Extend: OleVariant): Integer; dispid 502;
    function MoveDown(var Unit_, Count, Extend: OleVariant): Integer; dispid 503;
    function HomeKey(var Unit_, Extend: OleVariant): Integer; dispid 504;
    function EndKey(var Unit_, Extend: OleVariant): Integer; dispid 505;
    procedure EscapeKey; dispid 506;
    procedure TypeText(const Text: WideString); dispid 507;
    procedure CopyFormat; dispid 509;
    procedure PasteFormat; dispid 510;
    procedure TypeParagraph; dispid 512;
    procedure TypeBackspace; dispid 513;
    procedure NextSubdocument; dispid 514;
    procedure PreviousSubdocument; dispid 515;
    procedure SelectColumn; dispid 516;
    procedure SelectCurrentFont; dispid 517;
    procedure SelectCurrentAlignment; dispid 518;
    procedure SelectCurrentSpacing; dispid 519;
    procedure SelectCurrentIndent; dispid 520;
    procedure SelectCurrentTabs; dispid 521;
    procedure SelectCurrentColor; dispid 522;
    procedure CreateTextbox; dispid 523;
    procedure WholeStory; dispid 524;
    procedure SelectRow; dispid 525;
    procedure SplitTable; dispid 526;
    procedure InsertRows(var NumRows: OleVariant); dispid 528;
    procedure InsertColumns; dispid 529;
    procedure InsertFormula(var Formula, NumberFormat: OleVariant); dispid 530;
    function NextRevision(var Wrap: OleVariant): Revision; dispid 531;
    function PreviousRevision(var Wrap: OleVariant): Revision; dispid 532;
  end;

  TablesOfAuthoritiesCategories = interface(IDispatch)
    ['{00020976-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get__NewEnum: IUnknown; safecall;
    function Get_Count: Integer; safecall;
    function Item(var Index: OleVariant): TableOfAuthoritiesCategory; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Count: Integer read Get_Count;
  end;

{ DispInterface declaration for Dual Interface TablesOfAuthoritiesCategories }

  TablesOfAuthoritiesCategoriesDisp = dispinterface
    ['{00020976-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property _NewEnum: IUnknown readonly dispid -4;
    property Count: Integer readonly dispid 1;
    function Item(var Index: OleVariant): TableOfAuthoritiesCategory; dispid 0;
  end;

  TableOfAuthoritiesCategory = interface(IDispatch)
    ['{00020977-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Name: WideString; safecall;
    procedure Set_Name(const Value: WideString); safecall;
    function Get_Index: Integer; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property Name: WideString read Get_Name write Set_Name;
    property Index: Integer read Get_Index;
  end;

{ DispInterface declaration for Dual Interface TableOfAuthoritiesCategory }

  TableOfAuthoritiesCategoryDisp = dispinterface
    ['{00020977-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property Name: WideString dispid 0;
    property Index: Integer readonly dispid 1;
  end;

  CaptionLabels = interface(IDispatch)
    ['{00020978-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get__NewEnum: IUnknown; safecall;
    function Get_Count: Integer; safecall;
    function Item(var Index: OleVariant): CaptionLabel; safecall;
    function Add(const Name: WideString): CaptionLabel; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Count: Integer read Get_Count;
  end;

{ DispInterface declaration for Dual Interface CaptionLabels }

  CaptionLabelsDisp = dispinterface
    ['{00020978-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property _NewEnum: IUnknown readonly dispid -4;
    property Count: Integer readonly dispid 1;
    function Item(var Index: OleVariant): CaptionLabel; dispid 0;
    function Add(const Name: WideString): CaptionLabel; dispid 100;
  end;

  CaptionLabel = interface(IDispatch)
    ['{00020979-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Name: WideString; safecall;
    function Get_BuiltIn: WordBool; safecall;
    function Get_ID: WdCaptionLabelID; safecall;
    function Get_IncludeChapterNumber: WordBool; safecall;
    procedure Set_IncludeChapterNumber(Value: WordBool); safecall;
    function Get_NumberStyle: WdCaptionNumberStyle; safecall;
    procedure Set_NumberStyle(Value: WdCaptionNumberStyle); safecall;
    function Get_ChapterStyleLevel: Integer; safecall;
    procedure Set_ChapterStyleLevel(Value: Integer); safecall;
    function Get_Separator: WdSeparatorType; safecall;
    procedure Set_Separator(Value: WdSeparatorType); safecall;
    function Get_Position: WdCaptionPosition; safecall;
    procedure Set_Position(Value: WdCaptionPosition); safecall;
    procedure Delete; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property Name: WideString read Get_Name;
    property BuiltIn: WordBool read Get_BuiltIn;
    property ID: WdCaptionLabelID read Get_ID;
    property IncludeChapterNumber: WordBool read Get_IncludeChapterNumber write Set_IncludeChapterNumber;
    property NumberStyle: WdCaptionNumberStyle read Get_NumberStyle write Set_NumberStyle;
    property ChapterStyleLevel: Integer read Get_ChapterStyleLevel write Set_ChapterStyleLevel;
    property Separator: WdSeparatorType read Get_Separator write Set_Separator;
    property Position: WdCaptionPosition read Get_Position write Set_Position;
  end;

{ DispInterface declaration for Dual Interface CaptionLabel }

  CaptionLabelDisp = dispinterface
    ['{00020979-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property Name: WideString readonly dispid 0;
    property BuiltIn: WordBool readonly dispid 1;
    property ID: WdCaptionLabelID readonly dispid 2;
    property IncludeChapterNumber: WordBool dispid 3;
    property NumberStyle: WdCaptionNumberStyle dispid 4;
    property ChapterStyleLevel: Integer dispid 5;
    property Separator: WdSeparatorType dispid 6;
    property Position: WdCaptionPosition dispid 7;
    procedure Delete; dispid 100;
  end;

  AutoCaptions = interface(IDispatch)
    ['{0002097A-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get__NewEnum: IUnknown; safecall;
    function Get_Count: Integer; safecall;
    function Item(var Index: OleVariant): AutoCaption; safecall;
    procedure CancelAutoInsert; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Count: Integer read Get_Count;
  end;

{ DispInterface declaration for Dual Interface AutoCaptions }

  AutoCaptionsDisp = dispinterface
    ['{0002097A-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property _NewEnum: IUnknown readonly dispid -4;
    property Count: Integer readonly dispid 1;
    function Item(var Index: OleVariant): AutoCaption; dispid 0;
    procedure CancelAutoInsert; dispid 100;
  end;

  AutoCaption = interface(IDispatch)
    ['{0002097B-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Name: WideString; safecall;
    function Get_AutoInsert: WordBool; safecall;
    procedure Set_AutoInsert(Value: WordBool); safecall;
    function Get_Index: Integer; safecall;
    function Get_CaptionLabel: OleVariant; safecall;
    procedure Set_CaptionLabel(Value: OleVariant); safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property Name: WideString read Get_Name;
    property AutoInsert: WordBool read Get_AutoInsert write Set_AutoInsert;
    property Index: Integer read Get_Index;
    property CaptionLabel: OleVariant read Get_CaptionLabel write Set_CaptionLabel;
  end;

{ DispInterface declaration for Dual Interface AutoCaption }

  AutoCaptionDisp = dispinterface
    ['{0002097B-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property Name: WideString readonly dispid 0;
    property AutoInsert: WordBool dispid 1;
    property Index: Integer readonly dispid 2;
    property CaptionLabel: OleVariant dispid 3;
  end;

  Indexes = interface(IDispatch)
    ['{0002097C-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get__NewEnum: IUnknown; safecall;
    function Get_Count: Integer; safecall;
    function Get_Format: WdIndexFormat; safecall;
    procedure Set_Format(Value: WdIndexFormat); safecall;
    function Item(Index: Integer): Index; safecall;
    function Add(const Range: Range; var HeadingSeparator, RightAlignPageNumbers, Type_, NumberOfColumns, AccentedLetters: OleVariant): Index; safecall;
    function MarkEntry(const Range: Range; var Entry, EntryAutoText, CrossReference, CrossReferenceAutoText, BookmarkName, Bold, Italic, Reading: OleVariant): Field; safecall;
    procedure MarkAllEntries(const Range: Range; var Entry, EntryAutoText, CrossReference, CrossReferenceAutoText, BookmarkName, Bold, Italic: OleVariant); safecall;
    procedure AutoMarkEntries(const ConcordanceFileName: WideString); safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Count: Integer read Get_Count;
    property Format: WdIndexFormat read Get_Format write Set_Format;
  end;

{ DispInterface declaration for Dual Interface Indexes }

  IndexesDisp = dispinterface
    ['{0002097C-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property _NewEnum: IUnknown readonly dispid -4;
    property Count: Integer readonly dispid 1;
    property Format: WdIndexFormat dispid 2;
    function Item(Index: Integer): Index; dispid 0;
    function Add(const Range: Range; var HeadingSeparator, RightAlignPageNumbers, Type_, NumberOfColumns, AccentedLetters: OleVariant): Index; dispid 100;
    function MarkEntry(const Range: Range; var Entry, EntryAutoText, CrossReference, CrossReferenceAutoText, BookmarkName, Bold, Italic, Reading: OleVariant): Field; dispid 101;
    procedure MarkAllEntries(const Range: Range; var Entry, EntryAutoText, CrossReference, CrossReferenceAutoText, BookmarkName, Bold, Italic: OleVariant); dispid 102;
    procedure AutoMarkEntries(const ConcordanceFileName: WideString); dispid 103;
  end;

  Index = interface(IDispatch)
    ['{0002097D-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_HeadingSeparator: WdHeadingSeparator; safecall;
    procedure Set_HeadingSeparator(Value: WdHeadingSeparator); safecall;
    function Get_RightAlignPageNumbers: WordBool; safecall;
    procedure Set_RightAlignPageNumbers(Value: WordBool); safecall;
    function Get_Type_: WdIndexType; safecall;
    procedure Set_Type_(Value: WdIndexType); safecall;
    function Get_NumberOfColumns: Integer; safecall;
    procedure Set_NumberOfColumns(Value: Integer); safecall;
    function Get_Range: Range; safecall;
    function Get_TabLeader: WdTabLeader; safecall;
    procedure Set_TabLeader(Value: WdTabLeader); safecall;
    function Get_AccentedLetters: WordBool; safecall;
    procedure Set_AccentedLetters(Value: WordBool); safecall;
    function Get_SortBy: WdIndexSortBy; safecall;
    procedure Set_SortBy(Value: WdIndexSortBy); safecall;
    function Get_Filter: WdIndexFilter; safecall;
    procedure Set_Filter(Value: WdIndexFilter); safecall;
    procedure Delete; safecall;
    procedure Update; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property HeadingSeparator: WdHeadingSeparator read Get_HeadingSeparator write Set_HeadingSeparator;
    property RightAlignPageNumbers: WordBool read Get_RightAlignPageNumbers write Set_RightAlignPageNumbers;
    property Type_: WdIndexType read Get_Type_ write Set_Type_;
    property NumberOfColumns: Integer read Get_NumberOfColumns write Set_NumberOfColumns;
    property Range: Range read Get_Range;
    property TabLeader: WdTabLeader read Get_TabLeader write Set_TabLeader;
    property AccentedLetters: WordBool read Get_AccentedLetters write Set_AccentedLetters;
    property SortBy: WdIndexSortBy read Get_SortBy write Set_SortBy;
    property Filter: WdIndexFilter read Get_Filter write Set_Filter;
  end;

{ DispInterface declaration for Dual Interface Index }

  IndexDisp = dispinterface
    ['{0002097D-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property HeadingSeparator: WdHeadingSeparator dispid 1;
    property RightAlignPageNumbers: WordBool dispid 2;
    property Type_: WdIndexType dispid 3;
    property NumberOfColumns: Integer dispid 4;
    property Range: Range readonly dispid 5;
    property TabLeader: WdTabLeader dispid 6;
    property AccentedLetters: WordBool dispid 7;
    property SortBy: WdIndexSortBy dispid 8;
    property Filter: WdIndexFilter dispid 9;
    procedure Delete; dispid 100;
    procedure Update; dispid 102;
  end;

  AddIn = interface(IDispatch)
    ['{0002097E-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Name: WideString; safecall;
    function Get_Index: Integer; safecall;
    function Get_Path: WideString; safecall;
    function Get_Installed: WordBool; safecall;
    procedure Set_Installed(Value: WordBool); safecall;
    function Get_Compiled: WordBool; safecall;
    function Get_Autoload: WordBool; safecall;
    procedure Delete; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property Name: WideString read Get_Name;
    property Index: Integer read Get_Index;
    property Path: WideString read Get_Path;
    property Installed: WordBool read Get_Installed write Set_Installed;
    property Compiled: WordBool read Get_Compiled;
    property Autoload: WordBool read Get_Autoload;
  end;

{ DispInterface declaration for Dual Interface AddIn }

  AddInDisp = dispinterface
    ['{0002097E-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property Name: WideString readonly dispid 0;
    property Index: Integer readonly dispid 1;
    property Path: WideString readonly dispid 3;
    property Installed: WordBool dispid 4;
    property Compiled: WordBool readonly dispid 5;
    property Autoload: WordBool readonly dispid 6;
    procedure Delete; dispid 101;
  end;

  AddIns = interface(IDispatch)
    ['{0002097F-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get__NewEnum: IUnknown; safecall;
    function Get_Count: Integer; safecall;
    function Item(var Index: OleVariant): AddIn; safecall;
    function Add(const FileName: WideString; var Install: OleVariant): AddIn; safecall;
    procedure Unload(RemoveFromList: WordBool); safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Count: Integer read Get_Count;
  end;

{ DispInterface declaration for Dual Interface AddIns }

  AddInsDisp = dispinterface
    ['{0002097F-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property _NewEnum: IUnknown readonly dispid -4;
    property Count: Integer readonly dispid 1;
    function Item(var Index: OleVariant): AddIn; dispid 0;
    function Add(const FileName: WideString; var Install: OleVariant): AddIn; dispid 2;
    procedure Unload(RemoveFromList: WordBool); dispid 3;
  end;

  Revisions = interface(IDispatch)
    ['{00020980-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get__NewEnum: IUnknown; safecall;
    function Get_Count: Integer; safecall;
    function Item(Index: Integer): Revision; safecall;
    procedure AcceptAll; safecall;
    procedure RejectAll; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Count: Integer read Get_Count;
  end;

{ DispInterface declaration for Dual Interface Revisions }

  RevisionsDisp = dispinterface
    ['{00020980-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property _NewEnum: IUnknown readonly dispid -4;
    property Count: Integer readonly dispid 5;
    function Item(Index: Integer): Revision; dispid 0;
    procedure AcceptAll; dispid 101;
    procedure RejectAll; dispid 102;
  end;

  Revision = interface(IDispatch)
    ['{00020981-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Author: WideString; safecall;
    function Get_Date: TDateTime; safecall;
    function Get_Range: Range; safecall;
    function Get_Type_: WdRevisionType; safecall;
    function Get_Index: Integer; safecall;
    procedure Accept; safecall;
    procedure Reject; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property Author: WideString read Get_Author;
    property Date: TDateTime read Get_Date;
    property Range: Range read Get_Range;
    property Type_: WdRevisionType read Get_Type_;
    property Index: Integer read Get_Index;
  end;

{ DispInterface declaration for Dual Interface Revision }

  RevisionDisp = dispinterface
    ['{00020981-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property Author: WideString readonly dispid 1;
    property Date: TDateTime readonly dispid 2;
    property Range: Range readonly dispid 3;
    property Type_: WdRevisionType readonly dispid 4;
    property Index: Integer readonly dispid 5;
    procedure Accept; dispid 101;
    procedure Reject; dispid 102;
  end;

  Task = interface(IDispatch)
    ['{00020982-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Name: WideString; safecall;
    function Get_Left: Integer; safecall;
    procedure Set_Left(Value: Integer); safecall;
    function Get_Top: Integer; safecall;
    procedure Set_Top(Value: Integer); safecall;
    function Get_Width: Integer; safecall;
    procedure Set_Width(Value: Integer); safecall;
    function Get_Height: Integer; safecall;
    procedure Set_Height(Value: Integer); safecall;
    function Get_WindowState: WdWindowState; safecall;
    procedure Set_WindowState(Value: WdWindowState); safecall;
    function Get_Visible: WordBool; safecall;
    procedure Set_Visible(Value: WordBool); safecall;
    procedure Activate(var Wait: OleVariant); safecall;
    procedure Close; safecall;
    procedure Move(Left, Top: Integer); safecall;
    procedure Resize(Width, Height: Integer); safecall;
    procedure SendWindowMessage(Message, wParam, lParam: Integer); safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property Name: WideString read Get_Name;
    property Left: Integer read Get_Left write Set_Left;
    property Top: Integer read Get_Top write Set_Top;
    property Width: Integer read Get_Width write Set_Width;
    property Height: Integer read Get_Height write Set_Height;
    property WindowState: WdWindowState read Get_WindowState write Set_WindowState;
    property Visible: WordBool read Get_Visible write Set_Visible;
  end;

{ DispInterface declaration for Dual Interface Task }

  TaskDisp = dispinterface
    ['{00020982-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property Name: WideString readonly dispid 0;
    property Left: Integer dispid 1;
    property Top: Integer dispid 2;
    property Width: Integer dispid 3;
    property Height: Integer dispid 4;
    property WindowState: WdWindowState dispid 5;
    property Visible: WordBool dispid 6;
    procedure Activate(var Wait: OleVariant); dispid 10;
    procedure Close; dispid 11;
    procedure Move(Left, Top: Integer); dispid 12;
    procedure Resize(Width, Height: Integer); dispid 13;
    procedure SendWindowMessage(Message, wParam, lParam: Integer); dispid 14;
  end;

  Tasks = interface(IDispatch)
    ['{00020983-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get__NewEnum: IUnknown; safecall;
    function Get_Count: Integer; safecall;
    function Item(var Index: OleVariant): Task; safecall;
    function Exists(const Name: WideString): WordBool; safecall;
    procedure ExitWindows; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Count: Integer read Get_Count;
  end;

{ DispInterface declaration for Dual Interface Tasks }

  TasksDisp = dispinterface
    ['{00020983-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property _NewEnum: IUnknown readonly dispid -4;
    property Count: Integer readonly dispid 1;
    function Item(var Index: OleVariant): Task; dispid 0;
    function Exists(const Name: WideString): WordBool; dispid 2;
    procedure ExitWindows; dispid 3;
  end;

  HeadersFooters = interface(IDispatch)
    ['{00020984-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get__NewEnum: IUnknown; safecall;
    function Get_Count: Integer; safecall;
    function Item(Index: WdHeaderFooterIndex): HeaderFooter; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Count: Integer read Get_Count;
  end;

{ DispInterface declaration for Dual Interface HeadersFooters }

  HeadersFootersDisp = dispinterface
    ['{00020984-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property _NewEnum: IUnknown readonly dispid -4;
    property Count: Integer readonly dispid 1;
    function Item(Index: WdHeaderFooterIndex): HeaderFooter; dispid 0;
  end;

  HeaderFooter = interface(IDispatch)
    ['{00020985-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Range: Range; safecall;
    function Get_Index: WdHeaderFooterIndex; safecall;
    function Get_IsHeader: WordBool; safecall;
    function Get_Exists: WordBool; safecall;
    procedure Set_Exists(Value: WordBool); safecall;
    function Get_PageNumbers: PageNumbers; safecall;
    function Get_LinkToPrevious: WordBool; safecall;
    procedure Set_LinkToPrevious(Value: WordBool); safecall;
    function Get_Shapes: Shapes; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property Range: Range read Get_Range;
    property Index: WdHeaderFooterIndex read Get_Index;
    property IsHeader: WordBool read Get_IsHeader;
    property Exists: WordBool read Get_Exists write Set_Exists;
    property PageNumbers: PageNumbers read Get_PageNumbers;
    property LinkToPrevious: WordBool read Get_LinkToPrevious write Set_LinkToPrevious;
    property Shapes: Shapes read Get_Shapes;
  end;

{ DispInterface declaration for Dual Interface HeaderFooter }

  HeaderFooterDisp = dispinterface
    ['{00020985-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property Range: Range readonly dispid 0;
    property Index: WdHeaderFooterIndex readonly dispid 2;
    property IsHeader: WordBool readonly dispid 3;
    property Exists: WordBool dispid 4;
    property PageNumbers: PageNumbers readonly dispid 5;
    property LinkToPrevious: WordBool dispid 6;
    property Shapes: Shapes readonly dispid 7;
  end;

  PageNumbers = interface(IDispatch)
    ['{00020986-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get__NewEnum: IUnknown; safecall;
    function Get_Count: Integer; safecall;
    function Get_NumberStyle: WdPageNumberStyle; safecall;
    procedure Set_NumberStyle(Value: WdPageNumberStyle); safecall;
    function Get_IncludeChapterNumber: WordBool; safecall;
    procedure Set_IncludeChapterNumber(Value: WordBool); safecall;
    function Get_HeadingLevelForChapter: Integer; safecall;
    procedure Set_HeadingLevelForChapter(Value: Integer); safecall;
    function Get_ChapterPageSeparator: WdSeparatorType; safecall;
    procedure Set_ChapterPageSeparator(Value: WdSeparatorType); safecall;
    function Get_RestartNumberingAtSection: WordBool; safecall;
    procedure Set_RestartNumberingAtSection(Value: WordBool); safecall;
    function Get_StartingNumber: Integer; safecall;
    procedure Set_StartingNumber(Value: Integer); safecall;
    function Get_ShowFirstPageNumber: WordBool; safecall;
    procedure Set_ShowFirstPageNumber(Value: WordBool); safecall;
    function Item(Index: Integer): PageNumber; safecall;
    function Add(var PageNumberAlignment, FirstPage: OleVariant): PageNumber; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Count: Integer read Get_Count;
    property NumberStyle: WdPageNumberStyle read Get_NumberStyle write Set_NumberStyle;
    property IncludeChapterNumber: WordBool read Get_IncludeChapterNumber write Set_IncludeChapterNumber;
    property HeadingLevelForChapter: Integer read Get_HeadingLevelForChapter write Set_HeadingLevelForChapter;
    property ChapterPageSeparator: WdSeparatorType read Get_ChapterPageSeparator write Set_ChapterPageSeparator;
    property RestartNumberingAtSection: WordBool read Get_RestartNumberingAtSection write Set_RestartNumberingAtSection;
    property StartingNumber: Integer read Get_StartingNumber write Set_StartingNumber;
    property ShowFirstPageNumber: WordBool read Get_ShowFirstPageNumber write Set_ShowFirstPageNumber;
  end;

{ DispInterface declaration for Dual Interface PageNumbers }

  PageNumbersDisp = dispinterface
    ['{00020986-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property _NewEnum: IUnknown readonly dispid -4;
    property Count: Integer readonly dispid 1;
    property NumberStyle: WdPageNumberStyle dispid 2;
    property IncludeChapterNumber: WordBool dispid 3;
    property HeadingLevelForChapter: Integer dispid 4;
    property ChapterPageSeparator: WdSeparatorType dispid 5;
    property RestartNumberingAtSection: WordBool dispid 6;
    property StartingNumber: Integer dispid 7;
    property ShowFirstPageNumber: WordBool dispid 8;
    function Item(Index: Integer): PageNumber; dispid 0;
    function Add(var PageNumberAlignment, FirstPage: OleVariant): PageNumber; dispid 101;
  end;

  PageNumber = interface(IDispatch)
    ['{00020987-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Index: Integer; safecall;
    function Get_Alignment: WdPageNumberAlignment; safecall;
    procedure Set_Alignment(Value: WdPageNumberAlignment); safecall;
    procedure Select; safecall;
    procedure Copy; safecall;
    procedure Cut; safecall;
    procedure Delete; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property Index: Integer read Get_Index;
    property Alignment: WdPageNumberAlignment read Get_Alignment write Set_Alignment;
  end;

{ DispInterface declaration for Dual Interface PageNumber }

  PageNumberDisp = dispinterface
    ['{00020987-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property Index: Integer readonly dispid 1;
    property Alignment: WdPageNumberAlignment dispid 3;
    procedure Select; dispid 65535;
    procedure Copy; dispid 101;
    procedure Cut; dispid 102;
    procedure Delete; dispid 103;
  end;

  Subdocuments = interface(IDispatch)
    ['{00020988-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Count: Integer; safecall;
    function Get__NewEnum: IUnknown; safecall;
    function Get_Expanded: WordBool; safecall;
    procedure Set_Expanded(Value: WordBool); safecall;
    function Item(Index: Integer): Subdocument; safecall;
    function AddFromFile(var Name, ConfirmConversions, ReadOnly, PasswordDocument, PasswordTemplate, Revert, WritePasswordDocument, WritePasswordTemplate: OleVariant): Subdocument; safecall;
    function AddFromRange(const Range: Range): Subdocument; safecall;
    procedure Merge(var FirstSubdocument, LastSubdocument: OleVariant); safecall;
    procedure Delete; safecall;
    procedure Select; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property Count: Integer read Get_Count;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Expanded: WordBool read Get_Expanded write Set_Expanded;
  end;

{ DispInterface declaration for Dual Interface Subdocuments }

  SubdocumentsDisp = dispinterface
    ['{00020988-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property Count: Integer readonly dispid 1;
    property _NewEnum: IUnknown readonly dispid -4;
    property Expanded: WordBool dispid 2;
    function Item(Index: Integer): Subdocument; dispid 0;
    function AddFromFile(var Name, ConfirmConversions, ReadOnly, PasswordDocument, PasswordTemplate, Revert, WritePasswordDocument, WritePasswordTemplate: OleVariant): Subdocument; dispid 100;
    function AddFromRange(const Range: Range): Subdocument; dispid 101;
    procedure Merge(var FirstSubdocument, LastSubdocument: OleVariant); dispid 102;
    procedure Delete; dispid 103;
    procedure Select; dispid 104;
  end;

  Subdocument = interface(IDispatch)
    ['{00020989-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Locked: WordBool; safecall;
    procedure Set_Locked(Value: WordBool); safecall;
    function Get_Range: Range; safecall;
    function Get_Name: WideString; safecall;
    function Get_Path: WideString; safecall;
    function Get_HasFile: WordBool; safecall;
    function Get_Level: Integer; safecall;
    procedure Delete; safecall;
    procedure Split(const Range: Range); safecall;
    function Open: Document; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property Locked: WordBool read Get_Locked write Set_Locked;
    property Range: Range read Get_Range;
    property Name: WideString read Get_Name;
    property Path: WideString read Get_Path;
    property HasFile: WordBool read Get_HasFile;
    property Level: Integer read Get_Level;
  end;

{ DispInterface declaration for Dual Interface Subdocument }

  SubdocumentDisp = dispinterface
    ['{00020989-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property Locked: WordBool dispid 1;
    property Range: Range readonly dispid 2;
    property Name: WideString readonly dispid 3;
    property Path: WideString readonly dispid 4;
    property HasFile: WordBool readonly dispid 5;
    property Level: Integer readonly dispid 6;
    procedure Delete; dispid 100;
    procedure Split(const Range: Range); dispid 101;
    function Open: Document; dispid 102;
  end;

  HeadingStyles = interface(IDispatch)
    ['{0002098A-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get__NewEnum: IUnknown; safecall;
    function Get_Count: Integer; safecall;
    function Item(Index: Integer): HeadingStyle; safecall;
    function Add(var Style: OleVariant; Level: Smallint): HeadingStyle; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Count: Integer read Get_Count;
  end;

{ DispInterface declaration for Dual Interface HeadingStyles }

  HeadingStylesDisp = dispinterface
    ['{0002098A-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property _NewEnum: IUnknown readonly dispid -4;
    property Count: Integer readonly dispid 1;
    function Item(Index: Integer): HeadingStyle; dispid 0;
    function Add(var Style: OleVariant; Level: Smallint): HeadingStyle; dispid 100;
  end;

  HeadingStyle = interface(IDispatch)
    ['{0002098B-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Style: OleVariant; safecall;
    procedure Set_Style(Value: OleVariant); safecall;
    function Get_Level: Smallint; safecall;
    procedure Set_Level(Value: Smallint); safecall;
    procedure Delete; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property Style: OleVariant read Get_Style write Set_Style;
    property Level: Smallint read Get_Level write Set_Level;
  end;

{ DispInterface declaration for Dual Interface HeadingStyle }

  HeadingStyleDisp = dispinterface
    ['{0002098B-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property Style: OleVariant dispid 0;
    property Level: Smallint dispid 2;
    procedure Delete; dispid 100;
  end;

  StoryRanges = interface(IDispatch)
    ['{0002098C-0000-0000-C000-000000000046}']
    function Get__NewEnum: IUnknown; safecall;
    function Get_Count: Integer; safecall;
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Item(Index: WdStoryType): Range; safecall;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Count: Integer read Get_Count;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
  end;

{ DispInterface declaration for Dual Interface StoryRanges }

  StoryRangesDisp = dispinterface
    ['{0002098C-0000-0000-C000-000000000046}']
    property _NewEnum: IUnknown readonly dispid -4;
    property Count: Integer readonly dispid 2;
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    function Item(Index: WdStoryType): Range; dispid 0;
  end;

  ListLevel = interface(IDispatch)
    ['{0002098D-0000-0000-C000-000000000046}']
    function Get_Index: Integer; safecall;
    function Get_NumberFormat: WideString; safecall;
    procedure Set_NumberFormat(const Value: WideString); safecall;
    function Get_TrailingCharacter: WdTrailingCharacter; safecall;
    procedure Set_TrailingCharacter(Value: WdTrailingCharacter); safecall;
    function Get_NumberStyle: WdListNumberStyle; safecall;
    procedure Set_NumberStyle(Value: WdListNumberStyle); safecall;
    function Get_NumberPosition: Single; safecall;
    procedure Set_NumberPosition(Value: Single); safecall;
    function Get_Alignment: WdListLevelAlignment; safecall;
    procedure Set_Alignment(Value: WdListLevelAlignment); safecall;
    function Get_TextPosition: Single; safecall;
    procedure Set_TextPosition(Value: Single); safecall;
    function Get_TabPosition: Single; safecall;
    procedure Set_TabPosition(Value: Single); safecall;
    function Get_ResetOnHigher: WordBool; safecall;
    procedure Set_ResetOnHigher(Value: WordBool); safecall;
    function Get_StartAt: Integer; safecall;
    procedure Set_StartAt(Value: Integer); safecall;
    function Get_LinkedStyle: WideString; safecall;
    procedure Set_LinkedStyle(const Value: WideString); safecall;
    function Get_Font: Font; safecall;
    procedure Set_Font(const Value: Font); safecall;
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    property Index: Integer read Get_Index;
    property NumberFormat: WideString read Get_NumberFormat write Set_NumberFormat;
    property TrailingCharacter: WdTrailingCharacter read Get_TrailingCharacter write Set_TrailingCharacter;
    property NumberStyle: WdListNumberStyle read Get_NumberStyle write Set_NumberStyle;
    property NumberPosition: Single read Get_NumberPosition write Set_NumberPosition;
    property Alignment: WdListLevelAlignment read Get_Alignment write Set_Alignment;
    property TextPosition: Single read Get_TextPosition write Set_TextPosition;
    property TabPosition: Single read Get_TabPosition write Set_TabPosition;
    property ResetOnHigher: WordBool read Get_ResetOnHigher write Set_ResetOnHigher;
    property StartAt: Integer read Get_StartAt write Set_StartAt;
    property LinkedStyle: WideString read Get_LinkedStyle write Set_LinkedStyle;
    property Font: Font read Get_Font write Set_Font;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
  end;

{ DispInterface declaration for Dual Interface ListLevel }

  ListLevelDisp = dispinterface
    ['{0002098D-0000-0000-C000-000000000046}']
    property Index: Integer readonly dispid 1;
    property NumberFormat: WideString dispid 2;
    property TrailingCharacter: WdTrailingCharacter dispid 3;
    property NumberStyle: WdListNumberStyle dispid 4;
    property NumberPosition: Single dispid 5;
    property Alignment: WdListLevelAlignment dispid 6;
    property TextPosition: Single dispid 7;
    property TabPosition: Single dispid 8;
    property ResetOnHigher: WordBool dispid 9;
    property StartAt: Integer dispid 10;
    property LinkedStyle: WideString dispid 11;
    property Font: Font dispid 12;
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
  end;

  ListLevels = interface(IDispatch)
    ['{0002098E-0000-0000-C000-000000000046}']
    function Get__NewEnum: IUnknown; safecall;
    function Get_Count: Integer; safecall;
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Item(Index: Integer): ListLevel; safecall;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Count: Integer read Get_Count;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
  end;

{ DispInterface declaration for Dual Interface ListLevels }

  ListLevelsDisp = dispinterface
    ['{0002098E-0000-0000-C000-000000000046}']
    property _NewEnum: IUnknown readonly dispid -4;
    property Count: Integer readonly dispid 2;
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    function Item(Index: Integer): ListLevel; dispid 0;
  end;

  ListTemplate = interface(IDispatch)
    ['{0002098F-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_OutlineNumbered: WordBool; safecall;
    procedure Set_OutlineNumbered(Value: WordBool); safecall;
    function Get_Name: WideString; safecall;
    procedure Set_Name(const Value: WideString); safecall;
    function Get_ListLevels: ListLevels; safecall;
    function Convert(var Level: OleVariant): ListTemplate; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property OutlineNumbered: WordBool read Get_OutlineNumbered write Set_OutlineNumbered;
    property Name: WideString read Get_Name write Set_Name;
    property ListLevels: ListLevels read Get_ListLevels;
  end;

{ DispInterface declaration for Dual Interface ListTemplate }

  ListTemplateDisp = dispinterface
    ['{0002098F-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property OutlineNumbered: WordBool dispid 1;
    property Name: WideString dispid 3;
    property ListLevels: ListLevels readonly dispid 2;
    function Convert(var Level: OleVariant): ListTemplate; dispid 101;
  end;

  ListTemplates = interface(IDispatch)
    ['{00020990-0000-0000-C000-000000000046}']
    function Get__NewEnum: IUnknown; safecall;
    function Get_Count: Integer; safecall;
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Item(var Index: OleVariant): ListTemplate; safecall;
    function Add(var OutlineNumbered, Name: OleVariant): ListTemplate; safecall;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Count: Integer read Get_Count;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
  end;

{ DispInterface declaration for Dual Interface ListTemplates }

  ListTemplatesDisp = dispinterface
    ['{00020990-0000-0000-C000-000000000046}']
    property _NewEnum: IUnknown readonly dispid -4;
    property Count: Integer readonly dispid 2;
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    function Item(var Index: OleVariant): ListTemplate; dispid 0;
    function Add(var OutlineNumbered, Name: OleVariant): ListTemplate; dispid 100;
  end;

  ListParagraphs = interface(IDispatch)
    ['{00020991-0000-0000-C000-000000000046}']
    function Get__NewEnum: IUnknown; safecall;
    function Get_Count: Integer; safecall;
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Item(Index: Integer): Paragraph; safecall;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Count: Integer read Get_Count;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
  end;

{ DispInterface declaration for Dual Interface ListParagraphs }

  ListParagraphsDisp = dispinterface
    ['{00020991-0000-0000-C000-000000000046}']
    property _NewEnum: IUnknown readonly dispid -4;
    property Count: Integer readonly dispid 2;
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    function Item(Index: Integer): Paragraph; dispid 0;
  end;

  List = interface(IDispatch)
    ['{00020992-0000-0000-C000-000000000046}']
    function Get_Range: Range; safecall;
    function Get_ListParagraphs: ListParagraphs; safecall;
    function Get_SingleListTemplate: WordBool; safecall;
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    procedure ConvertNumbersToText(var NumberType: OleVariant); safecall;
    procedure RemoveNumbers(var NumberType: OleVariant); safecall;
    function CountNumberedItems(var NumberType, Level: OleVariant): Integer; safecall;
    procedure ApplyListTemplate(const ListTemplate: ListTemplate; var ContinuePreviousList: OleVariant); safecall;
    function CanContinuePreviousList(const ListTemplate: ListTemplate): WdContinue; safecall;
    property Range: Range read Get_Range;
    property ListParagraphs: ListParagraphs read Get_ListParagraphs;
    property SingleListTemplate: WordBool read Get_SingleListTemplate;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
  end;

{ DispInterface declaration for Dual Interface List }

  ListDisp = dispinterface
    ['{00020992-0000-0000-C000-000000000046}']
    property Range: Range readonly dispid 1;
    property ListParagraphs: ListParagraphs readonly dispid 2;
    property SingleListTemplate: WordBool readonly dispid 3;
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    procedure ConvertNumbersToText(var NumberType: OleVariant); dispid 101;
    procedure RemoveNumbers(var NumberType: OleVariant); dispid 102;
    function CountNumberedItems(var NumberType, Level: OleVariant): Integer; dispid 103;
    procedure ApplyListTemplate(const ListTemplate: ListTemplate; var ContinuePreviousList: OleVariant); dispid 104;
    function CanContinuePreviousList(const ListTemplate: ListTemplate): WdContinue; dispid 105;
  end;

  Lists = interface(IDispatch)
    ['{00020993-0000-0000-C000-000000000046}']
    function Get__NewEnum: IUnknown; safecall;
    function Get_Count: Integer; safecall;
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Item(Index: Integer): List; safecall;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Count: Integer read Get_Count;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
  end;

{ DispInterface declaration for Dual Interface Lists }

  ListsDisp = dispinterface
    ['{00020993-0000-0000-C000-000000000046}']
    property _NewEnum: IUnknown readonly dispid -4;
    property Count: Integer readonly dispid 2;
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    function Item(Index: Integer): List; dispid 0;
  end;

  ListGallery = interface(IDispatch)
    ['{00020994-0000-0000-C000-000000000046}']
    function Get_ListTemplates: ListTemplates; safecall;
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Modified(Index: Integer): WordBool; safecall;
    procedure Reset(Index: Integer); safecall;
    property ListTemplates: ListTemplates read Get_ListTemplates;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property Modified[Index: Integer]: WordBool read Get_Modified;
  end;

{ DispInterface declaration for Dual Interface ListGallery }

  ListGalleryDisp = dispinterface
    ['{00020994-0000-0000-C000-000000000046}']
    property ListTemplates: ListTemplates readonly dispid 1;
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property Modified[Index: Integer]: WordBool readonly dispid 101;
    procedure Reset(Index: Integer); dispid 100;
  end;

  ListGalleries = interface(IDispatch)
    ['{00020995-0000-0000-C000-000000000046}']
    function Get__NewEnum: IUnknown; safecall;
    function Get_Count: Integer; safecall;
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Item(Index: WdListGalleryType): ListGallery; safecall;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Count: Integer read Get_Count;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
  end;

{ DispInterface declaration for Dual Interface ListGalleries }

  ListGalleriesDisp = dispinterface
    ['{00020995-0000-0000-C000-000000000046}']
    property _NewEnum: IUnknown readonly dispid -4;
    property Count: Integer readonly dispid 2;
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    function Item(Index: WdListGalleryType): ListGallery; dispid 0;
  end;

  KeyBindings = interface(IDispatch)
    ['{00020996-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get__NewEnum: IUnknown; safecall;
    function Get_Count: Integer; safecall;
    function Get_Context: IDispatch; safecall;
    function Item(Index: Integer): KeyBinding; safecall;
    function Add(KeyCategory: WdKeyCategory; const Command: WideString; KeyCode: Integer; var KeyCode2, CommandParameter: OleVariant): KeyBinding; safecall;
    procedure ClearAll; safecall;
    function Key(KeyCode: Integer; var KeyCode2: OleVariant): KeyBinding; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Count: Integer read Get_Count;
    property Context: IDispatch read Get_Context;
  end;

{ DispInterface declaration for Dual Interface KeyBindings }

  KeyBindingsDisp = dispinterface
    ['{00020996-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property _NewEnum: IUnknown readonly dispid -4;
    property Count: Integer readonly dispid 2;
    property Context: IDispatch readonly dispid 10;
    function Item(Index: Integer): KeyBinding; dispid 0;
    function Add(KeyCategory: WdKeyCategory; const Command: WideString; KeyCode: Integer; var KeyCode2, CommandParameter: OleVariant): KeyBinding; dispid 101;
    procedure ClearAll; dispid 102;
    function Key(KeyCode: Integer; var KeyCode2: OleVariant): KeyBinding; dispid 110;
  end;

  KeysBoundTo = interface(IDispatch)
    ['{00020997-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get__NewEnum: IUnknown; safecall;
    function Get_Count: Integer; safecall;
    function Get_KeyCategory: WdKeyCategory; safecall;
    function Get_Command: WideString; safecall;
    function Get_CommandParameter: WideString; safecall;
    function Get_Context: IDispatch; safecall;
    function Item(Index: Integer): KeyBinding; safecall;
    function Key(KeyCode: Integer; var KeyCode2: OleVariant): KeyBinding; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Count: Integer read Get_Count;
    property KeyCategory: WdKeyCategory read Get_KeyCategory;
    property Command: WideString read Get_Command;
    property CommandParameter: WideString read Get_CommandParameter;
    property Context: IDispatch read Get_Context;
  end;

{ DispInterface declaration for Dual Interface KeysBoundTo }

  KeysBoundToDisp = dispinterface
    ['{00020997-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property _NewEnum: IUnknown readonly dispid -4;
    property Count: Integer readonly dispid 2;
    property KeyCategory: WdKeyCategory readonly dispid 3;
    property Command: WideString readonly dispid 4;
    property CommandParameter: WideString readonly dispid 5;
    property Context: IDispatch readonly dispid 10;
    function Item(Index: Integer): KeyBinding; dispid 0;
    function Key(KeyCode: Integer; var KeyCode2: OleVariant): KeyBinding; dispid 1;
  end;

  KeyBinding = interface(IDispatch)
    ['{00020998-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Command: WideString; safecall;
    function Get_KeyString: WideString; safecall;
    function Get_Protected_: WordBool; safecall;
    function Get_KeyCategory: WdKeyCategory; safecall;
    function Get_KeyCode: Integer; safecall;
    function Get_KeyCode2: Integer; safecall;
    function Get_CommandParameter: WideString; safecall;
    function Get_Context: IDispatch; safecall;
    procedure Clear; safecall;
    procedure Disable; safecall;
    procedure Execute; safecall;
    procedure Rebind(KeyCategory: WdKeyCategory; const Command: WideString; var CommandParameter: OleVariant); safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property Command: WideString read Get_Command;
    property KeyString: WideString read Get_KeyString;
    property Protected_: WordBool read Get_Protected_;
    property KeyCategory: WdKeyCategory read Get_KeyCategory;
    property KeyCode: Integer read Get_KeyCode;
    property KeyCode2: Integer read Get_KeyCode2;
    property CommandParameter: WideString read Get_CommandParameter;
    property Context: IDispatch read Get_Context;
  end;

{ DispInterface declaration for Dual Interface KeyBinding }

  KeyBindingDisp = dispinterface
    ['{00020998-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property Command: WideString readonly dispid 1;
    property KeyString: WideString readonly dispid 2;
    property Protected_: WordBool readonly dispid 3;
    property KeyCategory: WdKeyCategory readonly dispid 4;
    property KeyCode: Integer readonly dispid 6;
    property KeyCode2: Integer readonly dispid 7;
    property CommandParameter: WideString readonly dispid 8;
    property Context: IDispatch readonly dispid 10;
    procedure Clear; dispid 101;
    procedure Disable; dispid 102;
    procedure Execute; dispid 103;
    procedure Rebind(KeyCategory: WdKeyCategory; const Command: WideString; var CommandParameter: OleVariant); dispid 104;
  end;

  FileConverter = interface(IDispatch)
    ['{00020999-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_FormatName: WideString; safecall;
    function Get_ClassName: WideString; safecall;
    function Get_SaveFormat: Integer; safecall;
    function Get_OpenFormat: Integer; safecall;
    function Get_CanSave: WordBool; safecall;
    function Get_CanOpen: WordBool; safecall;
    function Get_Path: WideString; safecall;
    function Get_Name: WideString; safecall;
    function Get_Extensions: WideString; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property FormatName: WideString read Get_FormatName;
    property ClassName: WideString read Get_ClassName;
    property SaveFormat: Integer read Get_SaveFormat;
    property OpenFormat: Integer read Get_OpenFormat;
    property CanSave: WordBool read Get_CanSave;
    property CanOpen: WordBool read Get_CanOpen;
    property Path: WideString read Get_Path;
    property Name: WideString read Get_Name;
    property Extensions: WideString read Get_Extensions;
  end;

{ DispInterface declaration for Dual Interface FileConverter }

  FileConverterDisp = dispinterface
    ['{00020999-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property FormatName: WideString readonly dispid 0;
    property ClassName: WideString readonly dispid 1;
    property SaveFormat: Integer readonly dispid 2;
    property OpenFormat: Integer readonly dispid 3;
    property CanSave: WordBool readonly dispid 4;
    property CanOpen: WordBool readonly dispid 5;
    property Path: WideString readonly dispid 6;
    property Name: WideString readonly dispid 7;
    property Extensions: WideString readonly dispid 8;
  end;

  FileConverters = interface(IDispatch)
    ['{0002099A-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Count: Integer; safecall;
    function Get__NewEnum: IUnknown; safecall;
    function Get_ConvertMacWordChevrons: WdChevronConvertRule; safecall;
    procedure Set_ConvertMacWordChevrons(Value: WdChevronConvertRule); safecall;
    function Item(var Index: OleVariant): FileConverter; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property Count: Integer read Get_Count;
    property _NewEnum: IUnknown read Get__NewEnum;
    property ConvertMacWordChevrons: WdChevronConvertRule read Get_ConvertMacWordChevrons write Set_ConvertMacWordChevrons;
  end;

{ DispInterface declaration for Dual Interface FileConverters }

  FileConvertersDisp = dispinterface
    ['{0002099A-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property Count: Integer readonly dispid 1;
    property _NewEnum: IUnknown readonly dispid -4;
    property ConvertMacWordChevrons: WdChevronConvertRule dispid 2;
    function Item(var Index: OleVariant): FileConverter; dispid 0;
  end;

  SynonymInfo = interface(IDispatch)
    ['{0002099B-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Word: WideString; safecall;
    function Get_Found: WordBool; safecall;
    function Get_MeaningCount: Integer; safecall;
    function Get_MeaningList: OleVariant; safecall;
    function Get_PartOfSpeechList: OleVariant; safecall;
    function Get_SynonymList(var Meaning: OleVariant): OleVariant; safecall;
    function Get_AntonymList: OleVariant; safecall;
    function Get_RelatedExpressionList: OleVariant; safecall;
    function Get_RelatedWordList: OleVariant; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property Word: WideString read Get_Word;
    property Found: WordBool read Get_Found;
    property MeaningCount: Integer read Get_MeaningCount;
    property MeaningList: OleVariant read Get_MeaningList;
    property PartOfSpeechList: OleVariant read Get_PartOfSpeechList;
    property SynonymList[var Meaning: OleVariant]: OleVariant read Get_SynonymList;
    property AntonymList: OleVariant read Get_AntonymList;
    property RelatedExpressionList: OleVariant read Get_RelatedExpressionList;
    property RelatedWordList: OleVariant read Get_RelatedWordList;
  end;

{ DispInterface declaration for Dual Interface SynonymInfo }

  SynonymInfoDisp = dispinterface
    ['{0002099B-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property Word: WideString readonly dispid 1;
    property Found: WordBool readonly dispid 2;
    property MeaningCount: Integer readonly dispid 3;
    property MeaningList: OleVariant readonly dispid 4;
    property PartOfSpeechList: OleVariant readonly dispid 5;
    property SynonymList[var Meaning: OleVariant]: OleVariant readonly dispid 7;
    property AntonymList: OleVariant readonly dispid 8;
    property RelatedExpressionList: OleVariant readonly dispid 9;
    property RelatedWordList: OleVariant readonly dispid 10;
  end;

  Hyperlinks = interface(IDispatch)
    ['{0002099C-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Count: Integer; safecall;
    function Get__NewEnum: IUnknown; safecall;
    function Item(var Index: OleVariant): Hyperlink; safecall;
    function Add(Anchor: IDispatch; var Address, SubAddress: OleVariant): Hyperlink; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property Count: Integer read Get_Count;
    property _NewEnum: IUnknown read Get__NewEnum;
  end;

{ DispInterface declaration for Dual Interface Hyperlinks }

  HyperlinksDisp = dispinterface
    ['{0002099C-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property Count: Integer readonly dispid 1;
    property _NewEnum: IUnknown readonly dispid -4;
    function Item(var Index: OleVariant): Hyperlink; dispid 0;
    function Add(Anchor: IDispatch; var Address, SubAddress: OleVariant): Hyperlink; dispid 100;
  end;

  Hyperlink = interface(IDispatch)
    ['{0002099D-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Name: WideString; safecall;
    function Get_Address: WideString; safecall;
    function Get_Type_: MsoHyperlinkType; safecall;
    function Get_Range: Range; safecall;
    function Get_Shape: Shape; safecall;
    function Get_SubAddress: WideString; safecall;
    function Get_ExtraInfoRequired: WordBool; safecall;
    procedure Delete; safecall;
    procedure Follow(var NewWindow, AddHistory, ExtraInfo, Method, HeaderInfo: OleVariant); safecall;
    procedure AddToFavorites; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property Name: WideString read Get_Name;
    property Address: WideString read Get_Address;
    property Type_: MsoHyperlinkType read Get_Type_;
    property Range: Range read Get_Range;
    property Shape: Shape read Get_Shape;
    property SubAddress: WideString read Get_SubAddress;
    property ExtraInfoRequired: WordBool read Get_ExtraInfoRequired;
  end;

{ DispInterface declaration for Dual Interface Hyperlink }

  HyperlinkDisp = dispinterface
    ['{0002099D-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property Name: WideString readonly dispid 1003;
    property Address: WideString readonly dispid 1004;
    property Type_: MsoHyperlinkType readonly dispid 1005;
    property Range: Range readonly dispid 1006;
    property Shape: Shape readonly dispid 1007;
    property SubAddress: WideString readonly dispid 1008;
    property ExtraInfoRequired: WordBool readonly dispid 1009;
    procedure Delete; dispid 103;
    procedure Follow(var NewWindow, AddHistory, ExtraInfo, Method, HeaderInfo: OleVariant); dispid 104;
    procedure AddToFavorites; dispid 105;
  end;

  Shapes = interface(IDispatch)
    ['{0002099F-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Count: Integer; safecall;
    function Get__NewEnum: IUnknown; safecall;
    function Item(var Index: OleVariant): Shape; safecall;
    function AddCallout(Type_: MsoCalloutType; Left, Top, Width, Height: Single; var Anchor: OleVariant): Shape; safecall;
    function AddConnector(Type_: MsoConnectorType; BeginX, BeginY, EndX, EndY: Single): Shape; safecall;
    function AddCurve(var SafeArrayOfPoints, Anchor: OleVariant): Shape; safecall;
    function AddLabel(Orientation: MsoTextOrientation; Left, Top, Width, Height: Single; var Anchor: OleVariant): Shape; safecall;
    function AddLine(BeginX, BeginY, EndX, EndY: Single; var Anchor: OleVariant): Shape; safecall;
    function AddPicture(const FileName: WideString; var LinkToFile, SaveWithDocument, Left, Top, Width, Height, Anchor: OleVariant): Shape; safecall;
    function AddPolyline(var SafeArrayOfPoints, Anchor: OleVariant): Shape; safecall;
    function AddShape(Type_: Integer; Left, Top, Width, Height: Single; var Anchor: OleVariant): Shape; safecall;
    function AddTextEffect(PresetTextEffect: MsoPresetTextEffect; const Text, FontName: WideString; FontSize: Single; FontBold, FontItalic: MsoTriState; Left, Top: Single; var Anchor: OleVariant): Shape; safecall;
    function AddTextbox(Orientation: MsoTextOrientation; Left, Top, Width, Height: Single; var Anchor: OleVariant): Shape; safecall;
    function BuildFreeform(EditingType: MsoEditingType; X1, Y1: Single): FreeformBuilder; safecall;
    function Range(var Index: OleVariant): ShapeRange; safecall;
    procedure SelectAll; safecall;
    function AddOLEObject(var ClassType, FileName, LinkToFile, DisplayAsIcon, IconFileName, IconIndex, IconLabel, Left, Top, Width, Height, Anchor: OleVariant): Shape; safecall;
    function AddOLEControl(var ClassType, Left, Top, Width, Height, Anchor: OleVariant): Shape; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property Count: Integer read Get_Count;
    property _NewEnum: IUnknown read Get__NewEnum;
  end;

{ DispInterface declaration for Dual Interface Shapes }

  ShapesDisp = dispinterface
    ['{0002099F-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 8000;
    property Creator: Integer readonly dispid 8001;
    property Parent: IDispatch readonly dispid 1;
    property Count: Integer readonly dispid 2;
    property _NewEnum: IUnknown readonly dispid -4;
    function Item(var Index: OleVariant): Shape; dispid 0;
    function AddCallout(Type_: MsoCalloutType; Left, Top, Width, Height: Single; var Anchor: OleVariant): Shape; dispid 10;
    function AddConnector(Type_: MsoConnectorType; BeginX, BeginY, EndX, EndY: Single): Shape; dispid 11;
    function AddCurve(var SafeArrayOfPoints, Anchor: OleVariant): Shape; dispid 12;
    function AddLabel(Orientation: MsoTextOrientation; Left, Top, Width, Height: Single; var Anchor: OleVariant): Shape; dispid 13;
    function AddLine(BeginX, BeginY, EndX, EndY: Single; var Anchor: OleVariant): Shape; dispid 14;
    function AddPicture(const FileName: WideString; var LinkToFile, SaveWithDocument, Left, Top, Width, Height, Anchor: OleVariant): Shape; dispid 15;
    function AddPolyline(var SafeArrayOfPoints, Anchor: OleVariant): Shape; dispid 16;
    function AddShape(Type_: Integer; Left, Top, Width, Height: Single; var Anchor: OleVariant): Shape; dispid 17;
    function AddTextEffect(PresetTextEffect: MsoPresetTextEffect; const Text, FontName: WideString; FontSize: Single; FontBold, FontItalic: MsoTriState; Left, Top: Single; var Anchor: OleVariant): Shape; dispid 18;
    function AddTextbox(Orientation: MsoTextOrientation; Left, Top, Width, Height: Single; var Anchor: OleVariant): Shape; dispid 19;
    function BuildFreeform(EditingType: MsoEditingType; X1, Y1: Single): FreeformBuilder; dispid 20;
    function Range(var Index: OleVariant): ShapeRange; dispid 21;
    procedure SelectAll; dispid 22;
    function AddOLEObject(var ClassType, FileName, LinkToFile, DisplayAsIcon, IconFileName, IconIndex, IconLabel, Left, Top, Width, Height, Anchor: OleVariant): Shape; dispid 24;
    function AddOLEControl(var ClassType, Left, Top, Width, Height, Anchor: OleVariant): Shape; dispid 102;
  end;

  ShapeRange = interface(IDispatch)
    ['{000209B5-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Count: Integer; safecall;
    function Get__NewEnum: IUnknown; safecall;
    function Get_Adjustments: Adjustments; safecall;
    function Get_AutoShapeType: MsoAutoShapeType; safecall;
    procedure Set_AutoShapeType(Value: MsoAutoShapeType); safecall;
    function Get_Callout: CalloutFormat; safecall;
    function Get_ConnectionSiteCount: Integer; safecall;
    function Get_Connector: MsoTriState; safecall;
    function Get_ConnectorFormat: ConnectorFormat; safecall;
    function Get_Fill: FillFormat; safecall;
    function Get_GroupItems: GroupShapes; safecall;
    function Get_Height: Single; safecall;
    procedure Set_Height(Value: Single); safecall;
    function Get_HorizontalFlip: MsoTriState; safecall;
    function Get_Left: Single; safecall;
    procedure Set_Left(Value: Single); safecall;
    function Get_Line: LineFormat; safecall;
    function Get_LockAspectRatio: MsoTriState; safecall;
    procedure Set_LockAspectRatio(Value: MsoTriState); safecall;
    function Get_Name: WideString; safecall;
    procedure Set_Name(const Value: WideString); safecall;
    function Get_Nodes: ShapeNodes; safecall;
    function Get_Rotation: Single; safecall;
    procedure Set_Rotation(Value: Single); safecall;
    function Get_PictureFormat: PictureFormat; safecall;
    function Get_Shadow: ShadowFormat; safecall;
    function Get_TextEffect: TextEffectFormat; safecall;
    function Get_TextFrame: TextFrame; safecall;
    function Get_ThreeD: ThreeDFormat; safecall;
    function Get_Top: Single; safecall;
    procedure Set_Top(Value: Single); safecall;
    function Get_Type_: MsoShapeType; safecall;
    function Get_VerticalFlip: MsoTriState; safecall;
    function Get_Vertices: OleVariant; safecall;
    function Get_Visible: MsoTriState; safecall;
    procedure Set_Visible(Value: MsoTriState); safecall;
    function Get_Width: Single; safecall;
    procedure Set_Width(Value: Single); safecall;
    function Get_ZOrderPosition: Integer; safecall;
    function Get_Hyperlink: Hyperlink; safecall;
    function Get_RelativeHorizontalPosition: WdRelativeHorizontalPosition; safecall;
    procedure Set_RelativeHorizontalPosition(Value: WdRelativeHorizontalPosition); safecall;
    function Get_RelativeVerticalPosition: WdRelativeVerticalPosition; safecall;
    procedure Set_RelativeVerticalPosition(Value: WdRelativeVerticalPosition); safecall;
    function Get_LockAnchor: Integer; safecall;
    procedure Set_LockAnchor(Value: Integer); safecall;
    function Get_WrapFormat: WrapFormat; safecall;
    function Get_Anchor: Range; safecall;
    function Item(var Index: OleVariant): Shape; safecall;
    procedure Align(Align: MsoAlignCmd; RelativeTo: Integer); safecall;
    procedure Apply; safecall;
    procedure Delete; safecall;
    procedure Distribute(Distribute: MsoDistributeCmd; RelativeTo: Integer); safecall;
    function Duplicate: ShapeRange; safecall;
    procedure Flip(FlipCmd: MsoFlipCmd); safecall;
    procedure IncrementLeft(Increment: Single); safecall;
    procedure IncrementRotation(Increment: Single); safecall;
    procedure IncrementTop(Increment: Single); safecall;
    function Group: Shape; safecall;
    procedure PickUp; safecall;
    function Regroup: Shape; safecall;
    procedure RerouteConnections; safecall;
    procedure ScaleHeight(Factor: Single; RelativeToOriginalSize: MsoTriState; Scale: MsoScaleFrom); safecall;
    procedure ScaleWidth(Factor: Single; RelativeToOriginalSize: MsoTriState; Scale: MsoScaleFrom); safecall;
    procedure Select(var Replace: OleVariant); safecall;
    procedure SetShapesDefaultProperties; safecall;
    function Ungroup: ShapeRange; safecall;
    procedure ZOrder(ZOrderCmd: MsoZOrderCmd); safecall;
    function ConvertToFrame: Frame; safecall;
    function ConvertToInlineShape: InlineShape; safecall;
    procedure Activate; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property Count: Integer read Get_Count;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Adjustments: Adjustments read Get_Adjustments;
    property AutoShapeType: MsoAutoShapeType read Get_AutoShapeType write Set_AutoShapeType;
    property Callout: CalloutFormat read Get_Callout;
    property ConnectionSiteCount: Integer read Get_ConnectionSiteCount;
    property Connector: MsoTriState read Get_Connector;
    property ConnectorFormat: ConnectorFormat read Get_ConnectorFormat;
    property Fill: FillFormat read Get_Fill;
    property GroupItems: GroupShapes read Get_GroupItems;
    property Height: Single read Get_Height write Set_Height;
    property HorizontalFlip: MsoTriState read Get_HorizontalFlip;
    property Left: Single read Get_Left write Set_Left;
    property Line: LineFormat read Get_Line;
    property LockAspectRatio: MsoTriState read Get_LockAspectRatio write Set_LockAspectRatio;
    property Name: WideString read Get_Name write Set_Name;
    property Nodes: ShapeNodes read Get_Nodes;
    property Rotation: Single read Get_Rotation write Set_Rotation;
    property PictureFormat: PictureFormat read Get_PictureFormat;
    property Shadow: ShadowFormat read Get_Shadow;
    property TextEffect: TextEffectFormat read Get_TextEffect;
    property TextFrame: TextFrame read Get_TextFrame;
    property ThreeD: ThreeDFormat read Get_ThreeD;
    property Top: Single read Get_Top write Set_Top;
    property Type_: MsoShapeType read Get_Type_;
    property VerticalFlip: MsoTriState read Get_VerticalFlip;
    property Vertices: OleVariant read Get_Vertices;
    property Visible: MsoTriState read Get_Visible write Set_Visible;
    property Width: Single read Get_Width write Set_Width;
    property ZOrderPosition: Integer read Get_ZOrderPosition;
    property Hyperlink: Hyperlink read Get_Hyperlink;
    property RelativeHorizontalPosition: WdRelativeHorizontalPosition read Get_RelativeHorizontalPosition write Set_RelativeHorizontalPosition;
    property RelativeVerticalPosition: WdRelativeVerticalPosition read Get_RelativeVerticalPosition write Set_RelativeVerticalPosition;
    property LockAnchor: Integer read Get_LockAnchor write Set_LockAnchor;
    property WrapFormat: WrapFormat read Get_WrapFormat;
    property Anchor: Range read Get_Anchor;
  end;

{ DispInterface declaration for Dual Interface ShapeRange }

  ShapeRangeDisp = dispinterface
    ['{000209B5-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 8000;
    property Creator: Integer readonly dispid 8001;
    property Parent: IDispatch readonly dispid 1;
    property Count: Integer readonly dispid 2;
    property _NewEnum: IUnknown readonly dispid -4;
    property Adjustments: Adjustments readonly dispid 100;
    property AutoShapeType: MsoAutoShapeType dispid 101;
    property Callout: CalloutFormat readonly dispid 103;
    property ConnectionSiteCount: Integer readonly dispid 104;
    property Connector: MsoTriState readonly dispid 105;
    property ConnectorFormat: ConnectorFormat readonly dispid 106;
    property Fill: FillFormat readonly dispid 107;
    property GroupItems: GroupShapes readonly dispid 108;
    property Height: Single dispid 109;
    property HorizontalFlip: MsoTriState readonly dispid 110;
    property Left: Single dispid 111;
    property Line: LineFormat readonly dispid 112;
    property LockAspectRatio: MsoTriState dispid 113;
    property Name: WideString dispid 115;
    property Nodes: ShapeNodes readonly dispid 116;
    property Rotation: Single dispid 117;
    property PictureFormat: PictureFormat readonly dispid 118;
    property Shadow: ShadowFormat readonly dispid 119;
    property TextEffect: TextEffectFormat readonly dispid 120;
    property TextFrame: TextFrame readonly dispid 121;
    property ThreeD: ThreeDFormat readonly dispid 122;
    property Top: Single dispid 123;
    property Type_: MsoShapeType readonly dispid 124;
    property VerticalFlip: MsoTriState readonly dispid 125;
    property Vertices: OleVariant readonly dispid 126;
    property Visible: MsoTriState dispid 127;
    property Width: Single dispid 128;
    property ZOrderPosition: Integer readonly dispid 129;
    property Hyperlink: Hyperlink readonly dispid 1001;
    property RelativeHorizontalPosition: WdRelativeHorizontalPosition dispid 300;
    property RelativeVerticalPosition: WdRelativeVerticalPosition dispid 301;
    property LockAnchor: Integer dispid 302;
    property WrapFormat: WrapFormat readonly dispid 303;
    property Anchor: Range readonly dispid 304;
    function Item(var Index: OleVariant): Shape; dispid 0;
    procedure Align(Align: MsoAlignCmd; RelativeTo: Integer); dispid 10;
    procedure Apply; dispid 11;
    procedure Delete; dispid 12;
    procedure Distribute(Distribute: MsoDistributeCmd; RelativeTo: Integer); dispid 13;
    function Duplicate: ShapeRange; dispid 14;
    procedure Flip(FlipCmd: MsoFlipCmd); dispid 15;
    procedure IncrementLeft(Increment: Single); dispid 16;
    procedure IncrementRotation(Increment: Single); dispid 17;
    procedure IncrementTop(Increment: Single); dispid 18;
    function Group: Shape; dispid 19;
    procedure PickUp; dispid 20;
    function Regroup: Shape; dispid 21;
    procedure RerouteConnections; dispid 22;
    procedure ScaleHeight(Factor: Single; RelativeToOriginalSize: MsoTriState; Scale: MsoScaleFrom); dispid 23;
    procedure ScaleWidth(Factor: Single; RelativeToOriginalSize: MsoTriState; Scale: MsoScaleFrom); dispid 24;
    procedure Select(var Replace: OleVariant); dispid 25;
    procedure SetShapesDefaultProperties; dispid 26;
    function Ungroup: ShapeRange; dispid 27;
    procedure ZOrder(ZOrderCmd: MsoZOrderCmd); dispid 28;
    function ConvertToFrame: Frame; dispid 29;
    function ConvertToInlineShape: InlineShape; dispid 30;
    procedure Activate; dispid 50;
  end;

  GroupShapes = interface(IDispatch)
    ['{000209B6-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Count: Integer; safecall;
    function Get__NewEnum: IUnknown; safecall;
    function Item(var Index: OleVariant): Shape; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property Count: Integer read Get_Count;
    property _NewEnum: IUnknown read Get__NewEnum;
  end;

{ DispInterface declaration for Dual Interface GroupShapes }

  GroupShapesDisp = dispinterface
    ['{000209B6-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 8000;
    property Creator: Integer readonly dispid 8001;
    property Parent: IDispatch readonly dispid 1;
    property Count: Integer readonly dispid 2;
    property _NewEnum: IUnknown readonly dispid -4;
    function Item(var Index: OleVariant): Shape; dispid 0;
  end;

  Shape = interface(IDispatch)
    ['{000209A0-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Adjustments: Adjustments; safecall;
    function Get_AutoShapeType: MsoAutoShapeType; safecall;
    procedure Set_AutoShapeType(Value: MsoAutoShapeType); safecall;
    function Get_Callout: CalloutFormat; safecall;
    function Get_ConnectionSiteCount: Integer; safecall;
    function Get_Connector: MsoTriState; safecall;
    function Get_ConnectorFormat: ConnectorFormat; safecall;
    function Get_Fill: FillFormat; safecall;
    function Get_GroupItems: GroupShapes; safecall;
    function Get_Height: Single; safecall;
    procedure Set_Height(Value: Single); safecall;
    function Get_HorizontalFlip: MsoTriState; safecall;
    function Get_Left: Single; safecall;
    procedure Set_Left(Value: Single); safecall;
    function Get_Line: LineFormat; safecall;
    function Get_LockAspectRatio: MsoTriState; safecall;
    procedure Set_LockAspectRatio(Value: MsoTriState); safecall;
    function Get_Name: WideString; safecall;
    procedure Set_Name(const Value: WideString); safecall;
    function Get_Nodes: ShapeNodes; safecall;
    function Get_Rotation: Single; safecall;
    procedure Set_Rotation(Value: Single); safecall;
    function Get_PictureFormat: PictureFormat; safecall;
    function Get_Shadow: ShadowFormat; safecall;
    function Get_TextEffect: TextEffectFormat; safecall;
    function Get_TextFrame: TextFrame; safecall;
    function Get_ThreeD: ThreeDFormat; safecall;
    function Get_Top: Single; safecall;
    procedure Set_Top(Value: Single); safecall;
    function Get_Type_: MsoShapeType; safecall;
    function Get_VerticalFlip: MsoTriState; safecall;
    function Get_Vertices: OleVariant; safecall;
    function Get_Visible: MsoTriState; safecall;
    procedure Set_Visible(Value: MsoTriState); safecall;
    function Get_Width: Single; safecall;
    procedure Set_Width(Value: Single); safecall;
    function Get_ZOrderPosition: Integer; safecall;
    function Get_Hyperlink: Hyperlink; safecall;
    function Get_RelativeHorizontalPosition: WdRelativeHorizontalPosition; safecall;
    procedure Set_RelativeHorizontalPosition(Value: WdRelativeHorizontalPosition); safecall;
    function Get_RelativeVerticalPosition: WdRelativeVerticalPosition; safecall;
    procedure Set_RelativeVerticalPosition(Value: WdRelativeVerticalPosition); safecall;
    function Get_LockAnchor: Integer; safecall;
    procedure Set_LockAnchor(Value: Integer); safecall;
    function Get_WrapFormat: WrapFormat; safecall;
    function Get_OLEFormat: OLEFormat; safecall;
    function Get_Anchor: Range; safecall;
    function Get_LinkFormat: LinkFormat; safecall;
    procedure Apply; safecall;
    procedure Delete; safecall;
    function Duplicate: Shape; safecall;
    procedure Flip(FlipCmd: MsoFlipCmd); safecall;
    procedure IncrementLeft(Increment: Single); safecall;
    procedure IncrementRotation(Increment: Single); safecall;
    procedure IncrementTop(Increment: Single); safecall;
    procedure PickUp; safecall;
    procedure RerouteConnections; safecall;
    procedure ScaleHeight(Factor: Single; RelativeToOriginalSize: MsoTriState; Scale: MsoScaleFrom); safecall;
    procedure ScaleWidth(Factor: Single; RelativeToOriginalSize: MsoTriState; Scale: MsoScaleFrom); safecall;
    procedure Select(var Replace: OleVariant); safecall;
    procedure SetShapesDefaultProperties; safecall;
    function Ungroup: ShapeRange; safecall;
    procedure ZOrder(ZOrderCmd: MsoZOrderCmd); safecall;
    function ConvertToInlineShape: InlineShape; safecall;
    function ConvertToFrame: Frame; safecall;
    procedure Activate; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property Adjustments: Adjustments read Get_Adjustments;
    property AutoShapeType: MsoAutoShapeType read Get_AutoShapeType write Set_AutoShapeType;
    property Callout: CalloutFormat read Get_Callout;
    property ConnectionSiteCount: Integer read Get_ConnectionSiteCount;
    property Connector: MsoTriState read Get_Connector;
    property ConnectorFormat: ConnectorFormat read Get_ConnectorFormat;
    property Fill: FillFormat read Get_Fill;
    property GroupItems: GroupShapes read Get_GroupItems;
    property Height: Single read Get_Height write Set_Height;
    property HorizontalFlip: MsoTriState read Get_HorizontalFlip;
    property Left: Single read Get_Left write Set_Left;
    property Line: LineFormat read Get_Line;
    property LockAspectRatio: MsoTriState read Get_LockAspectRatio write Set_LockAspectRatio;
    property Name: WideString read Get_Name write Set_Name;
    property Nodes: ShapeNodes read Get_Nodes;
    property Rotation: Single read Get_Rotation write Set_Rotation;
    property PictureFormat: PictureFormat read Get_PictureFormat;
    property Shadow: ShadowFormat read Get_Shadow;
    property TextEffect: TextEffectFormat read Get_TextEffect;
    property TextFrame: TextFrame read Get_TextFrame;
    property ThreeD: ThreeDFormat read Get_ThreeD;
    property Top: Single read Get_Top write Set_Top;
    property Type_: MsoShapeType read Get_Type_;
    property VerticalFlip: MsoTriState read Get_VerticalFlip;
    property Vertices: OleVariant read Get_Vertices;
    property Visible: MsoTriState read Get_Visible write Set_Visible;
    property Width: Single read Get_Width write Set_Width;
    property ZOrderPosition: Integer read Get_ZOrderPosition;
    property Hyperlink: Hyperlink read Get_Hyperlink;
    property RelativeHorizontalPosition: WdRelativeHorizontalPosition read Get_RelativeHorizontalPosition write Set_RelativeHorizontalPosition;
    property RelativeVerticalPosition: WdRelativeVerticalPosition read Get_RelativeVerticalPosition write Set_RelativeVerticalPosition;
    property LockAnchor: Integer read Get_LockAnchor write Set_LockAnchor;
    property WrapFormat: WrapFormat read Get_WrapFormat;
    property OLEFormat: OLEFormat read Get_OLEFormat;
    property Anchor: Range read Get_Anchor;
    property LinkFormat: LinkFormat read Get_LinkFormat;
  end;

{ DispInterface declaration for Dual Interface Shape }

  ShapeDisp = dispinterface
    ['{000209A0-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 8000;
    property Creator: Integer readonly dispid 8001;
    property Parent: IDispatch readonly dispid 1;
    property Adjustments: Adjustments readonly dispid 100;
    property AutoShapeType: MsoAutoShapeType dispid 101;
    property Callout: CalloutFormat readonly dispid 103;
    property ConnectionSiteCount: Integer readonly dispid 104;
    property Connector: MsoTriState readonly dispid 105;
    property ConnectorFormat: ConnectorFormat readonly dispid 106;
    property Fill: FillFormat readonly dispid 107;
    property GroupItems: GroupShapes readonly dispid 108;
    property Height: Single dispid 109;
    property HorizontalFlip: MsoTriState readonly dispid 110;
    property Left: Single dispid 111;
    property Line: LineFormat readonly dispid 112;
    property LockAspectRatio: MsoTriState dispid 113;
    property Name: WideString dispid 115;
    property Nodes: ShapeNodes readonly dispid 116;
    property Rotation: Single dispid 117;
    property PictureFormat: PictureFormat readonly dispid 118;
    property Shadow: ShadowFormat readonly dispid 119;
    property TextEffect: TextEffectFormat readonly dispid 120;
    property TextFrame: TextFrame readonly dispid 121;
    property ThreeD: ThreeDFormat readonly dispid 122;
    property Top: Single dispid 123;
    property Type_: MsoShapeType readonly dispid 124;
    property VerticalFlip: MsoTriState readonly dispid 125;
    property Vertices: OleVariant readonly dispid 126;
    property Visible: MsoTriState dispid 127;
    property Width: Single dispid 128;
    property ZOrderPosition: Integer readonly dispid 129;
    property Hyperlink: Hyperlink readonly dispid 1001;
    property RelativeHorizontalPosition: WdRelativeHorizontalPosition dispid 300;
    property RelativeVerticalPosition: WdRelativeVerticalPosition dispid 301;
    property LockAnchor: Integer dispid 302;
    property WrapFormat: WrapFormat readonly dispid 303;
    property OLEFormat: OLEFormat readonly dispid 500;
    property Anchor: Range readonly dispid 501;
    property LinkFormat: LinkFormat readonly dispid 502;
    procedure Apply; dispid 10;
    procedure Delete; dispid 11;
    function Duplicate: Shape; dispid 12;
    procedure Flip(FlipCmd: MsoFlipCmd); dispid 13;
    procedure IncrementLeft(Increment: Single); dispid 14;
    procedure IncrementRotation(Increment: Single); dispid 15;
    procedure IncrementTop(Increment: Single); dispid 16;
    procedure PickUp; dispid 17;
    procedure RerouteConnections; dispid 18;
    procedure ScaleHeight(Factor: Single; RelativeToOriginalSize: MsoTriState; Scale: MsoScaleFrom); dispid 19;
    procedure ScaleWidth(Factor: Single; RelativeToOriginalSize: MsoTriState; Scale: MsoScaleFrom); dispid 20;
    procedure Select(var Replace: OleVariant); dispid 21;
    procedure SetShapesDefaultProperties; dispid 22;
    function Ungroup: ShapeRange; dispid 23;
    procedure ZOrder(ZOrderCmd: MsoZOrderCmd); dispid 24;
    function ConvertToInlineShape: InlineShape; dispid 25;
    function ConvertToFrame: Frame; dispid 29;
    procedure Activate; dispid 50;
  end;

  TextFrame = interface(IDispatch)
    ['{000209B2-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: Shape; safecall;
    function Get_MarginBottom: Single; safecall;
    procedure Set_MarginBottom(Value: Single); safecall;
    function Get_MarginLeft: Single; safecall;
    procedure Set_MarginLeft(Value: Single); safecall;
    function Get_MarginRight: Single; safecall;
    procedure Set_MarginRight(Value: Single); safecall;
    function Get_MarginTop: Single; safecall;
    procedure Set_MarginTop(Value: Single); safecall;
    function Get_Orientation: MsoTextOrientation; safecall;
    procedure Set_Orientation(Value: MsoTextOrientation); safecall;
    function Get_TextRange: Range; safecall;
    function Get_ContainingRange: Range; safecall;
    function Get_Next: TextFrame; safecall;
    procedure Set_Next(const Value: TextFrame); safecall;
    function Get_Previous: TextFrame; safecall;
    procedure Set_Previous(const Value: TextFrame); safecall;
    function Get_Overflowing: WordBool; safecall;
    function Get_HasText: Integer; safecall;
    procedure BreakForwardLink; safecall;
    function ValidLinkTarget(const TargetTextFrame: TextFrame): WordBool; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: Shape read Get_Parent;
    property MarginBottom: Single read Get_MarginBottom write Set_MarginBottom;
    property MarginLeft: Single read Get_MarginLeft write Set_MarginLeft;
    property MarginRight: Single read Get_MarginRight write Set_MarginRight;
    property MarginTop: Single read Get_MarginTop write Set_MarginTop;
    property Orientation: MsoTextOrientation read Get_Orientation write Set_Orientation;
    property TextRange: Range read Get_TextRange;
    property ContainingRange: Range read Get_ContainingRange;
    property Next: TextFrame read Get_Next write Set_Next;
    property Previous: TextFrame read Get_Previous write Set_Previous;
    property Overflowing: WordBool read Get_Overflowing;
    property HasText: Integer read Get_HasText;
  end;

{ DispInterface declaration for Dual Interface TextFrame }

  TextFrameDisp = dispinterface
    ['{000209B2-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 8000;
    property Creator: Integer readonly dispid 8001;
    property Parent: Shape readonly dispid 1;
    property MarginBottom: Single dispid 100;
    property MarginLeft: Single dispid 101;
    property MarginRight: Single dispid 102;
    property MarginTop: Single dispid 103;
    property Orientation: MsoTextOrientation dispid 104;
    property TextRange: Range readonly dispid 1001;
    property ContainingRange: Range readonly dispid 1002;
    property Next: TextFrame dispid 5001;
    property Previous: TextFrame dispid 5002;
    property Overflowing: WordBool readonly dispid 5003;
    property HasText: Integer readonly dispid 5008;
    procedure BreakForwardLink; dispid 5004;
    function ValidLinkTarget(const TargetTextFrame: TextFrame): WordBool; dispid 5006;
  end;

  _LetterContent = interface(IDispatch)
    ['{000209A1-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Duplicate: LetterContent; safecall;
    function Get_DateFormat: WideString; safecall;
    procedure Set_DateFormat(const Value: WideString); safecall;
    function Get_IncludeHeaderFooter: WordBool; safecall;
    procedure Set_IncludeHeaderFooter(Value: WordBool); safecall;
    function Get_PageDesign: WideString; safecall;
    procedure Set_PageDesign(const Value: WideString); safecall;
    function Get_LetterStyle: WdLetterStyle; safecall;
    procedure Set_LetterStyle(Value: WdLetterStyle); safecall;
    function Get_Letterhead: WordBool; safecall;
    procedure Set_Letterhead(Value: WordBool); safecall;
    function Get_LetterheadLocation: WdLetterheadLocation; safecall;
    procedure Set_LetterheadLocation(Value: WdLetterheadLocation); safecall;
    function Get_LetterheadSize: Single; safecall;
    procedure Set_LetterheadSize(Value: Single); safecall;
    function Get_RecipientName: WideString; safecall;
    procedure Set_RecipientName(const Value: WideString); safecall;
    function Get_RecipientAddress: WideString; safecall;
    procedure Set_RecipientAddress(const Value: WideString); safecall;
    function Get_Salutation: WideString; safecall;
    procedure Set_Salutation(const Value: WideString); safecall;
    function Get_SalutationType: WdSalutationType; safecall;
    procedure Set_SalutationType(Value: WdSalutationType); safecall;
    function Get_RecipientReference: WideString; safecall;
    procedure Set_RecipientReference(const Value: WideString); safecall;
    function Get_MailingInstructions: WideString; safecall;
    procedure Set_MailingInstructions(const Value: WideString); safecall;
    function Get_AttentionLine: WideString; safecall;
    procedure Set_AttentionLine(const Value: WideString); safecall;
    function Get_Subject: WideString; safecall;
    procedure Set_Subject(const Value: WideString); safecall;
    function Get_EnclosureNumber: Integer; safecall;
    procedure Set_EnclosureNumber(Value: Integer); safecall;
    function Get_CCList: WideString; safecall;
    procedure Set_CCList(const Value: WideString); safecall;
    function Get_ReturnAddress: WideString; safecall;
    procedure Set_ReturnAddress(const Value: WideString); safecall;
    function Get_SenderName: WideString; safecall;
    procedure Set_SenderName(const Value: WideString); safecall;
    function Get_Closing: WideString; safecall;
    procedure Set_Closing(const Value: WideString); safecall;
    function Get_SenderCompany: WideString; safecall;
    procedure Set_SenderCompany(const Value: WideString); safecall;
    function Get_SenderJobTitle: WideString; safecall;
    procedure Set_SenderJobTitle(const Value: WideString); safecall;
    function Get_SenderInitials: WideString; safecall;
    procedure Set_SenderInitials(const Value: WideString); safecall;
    function Get_InfoBlock: WordBool; safecall;
    procedure Set_InfoBlock(Value: WordBool); safecall;
    function Get_RecipientCode: WideString; safecall;
    procedure Set_RecipientCode(const Value: WideString); safecall;
    function Get_RecipientGender: WdSalutationGender; safecall;
    procedure Set_RecipientGender(Value: WdSalutationGender); safecall;
    function Get_ReturnAddressShortForm: WideString; safecall;
    procedure Set_ReturnAddressShortForm(const Value: WideString); safecall;
    function Get_SenderCity: WideString; safecall;
    procedure Set_SenderCity(const Value: WideString); safecall;
    function Get_SenderCode: WideString; safecall;
    procedure Set_SenderCode(const Value: WideString); safecall;
    function Get_SenderGender: WdSalutationGender; safecall;
    procedure Set_SenderGender(Value: WdSalutationGender); safecall;
    function Get_SenderReference: WideString; safecall;
    procedure Set_SenderReference(const Value: WideString); safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property Duplicate: LetterContent read Get_Duplicate;
    property DateFormat: WideString read Get_DateFormat write Set_DateFormat;
    property IncludeHeaderFooter: WordBool read Get_IncludeHeaderFooter write Set_IncludeHeaderFooter;
    property PageDesign: WideString read Get_PageDesign write Set_PageDesign;
    property LetterStyle: WdLetterStyle read Get_LetterStyle write Set_LetterStyle;
    property Letterhead: WordBool read Get_Letterhead write Set_Letterhead;
    property LetterheadLocation: WdLetterheadLocation read Get_LetterheadLocation write Set_LetterheadLocation;
    property LetterheadSize: Single read Get_LetterheadSize write Set_LetterheadSize;
    property RecipientName: WideString read Get_RecipientName write Set_RecipientName;
    property RecipientAddress: WideString read Get_RecipientAddress write Set_RecipientAddress;
    property Salutation: WideString read Get_Salutation write Set_Salutation;
    property SalutationType: WdSalutationType read Get_SalutationType write Set_SalutationType;
    property RecipientReference: WideString read Get_RecipientReference write Set_RecipientReference;
    property MailingInstructions: WideString read Get_MailingInstructions write Set_MailingInstructions;
    property AttentionLine: WideString read Get_AttentionLine write Set_AttentionLine;
    property Subject: WideString read Get_Subject write Set_Subject;
    property EnclosureNumber: Integer read Get_EnclosureNumber write Set_EnclosureNumber;
    property CCList: WideString read Get_CCList write Set_CCList;
    property ReturnAddress: WideString read Get_ReturnAddress write Set_ReturnAddress;
    property SenderName: WideString read Get_SenderName write Set_SenderName;
    property Closing: WideString read Get_Closing write Set_Closing;
    property SenderCompany: WideString read Get_SenderCompany write Set_SenderCompany;
    property SenderJobTitle: WideString read Get_SenderJobTitle write Set_SenderJobTitle;
    property SenderInitials: WideString read Get_SenderInitials write Set_SenderInitials;
    property InfoBlock: WordBool read Get_InfoBlock write Set_InfoBlock;
    property RecipientCode: WideString read Get_RecipientCode write Set_RecipientCode;
    property RecipientGender: WdSalutationGender read Get_RecipientGender write Set_RecipientGender;
    property ReturnAddressShortForm: WideString read Get_ReturnAddressShortForm write Set_ReturnAddressShortForm;
    property SenderCity: WideString read Get_SenderCity write Set_SenderCity;
    property SenderCode: WideString read Get_SenderCode write Set_SenderCode;
    property SenderGender: WdSalutationGender read Get_SenderGender write Set_SenderGender;
    property SenderReference: WideString read Get_SenderReference write Set_SenderReference;
  end;

{ DispInterface declaration for Dual Interface _LetterContent }

  _LetterContentDisp = dispinterface
    ['{000209A1-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property Duplicate: LetterContent readonly dispid 10;
    property DateFormat: WideString dispid 101;
    property IncludeHeaderFooter: WordBool dispid 102;
    property PageDesign: WideString dispid 103;
    property LetterStyle: WdLetterStyle dispid 104;
    property Letterhead: WordBool dispid 105;
    property LetterheadLocation: WdLetterheadLocation dispid 106;
    property LetterheadSize: Single dispid 107;
    property RecipientName: WideString dispid 108;
    property RecipientAddress: WideString dispid 109;
    property Salutation: WideString dispid 110;
    property SalutationType: WdSalutationType dispid 111;
    property RecipientReference: WideString dispid 112;
    property MailingInstructions: WideString dispid 114;
    property AttentionLine: WideString dispid 115;
    property Subject: WideString dispid 116;
    property EnclosureNumber: Integer dispid 117;
    property CCList: WideString dispid 118;
    property ReturnAddress: WideString dispid 119;
    property SenderName: WideString dispid 120;
    property Closing: WideString dispid 121;
    property SenderCompany: WideString dispid 122;
    property SenderJobTitle: WideString dispid 123;
    property SenderInitials: WideString dispid 124;
    property InfoBlock: WordBool dispid 125;
    property RecipientCode: WideString dispid 126;
    property RecipientGender: WdSalutationGender dispid 127;
    property ReturnAddressShortForm: WideString dispid 128;
    property SenderCity: WideString dispid 129;
    property SenderCode: WideString dispid 130;
    property SenderGender: WdSalutationGender dispid 131;
    property SenderReference: WideString dispid 132;
  end;

  View = interface(IDispatch)
    ['{000209A5-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Type_: WdViewType; safecall;
    procedure Set_Type_(Value: WdViewType); safecall;
    function Get_FullScreen: WordBool; safecall;
    procedure Set_FullScreen(Value: WordBool); safecall;
    function Get_Draft: WordBool; safecall;
    procedure Set_Draft(Value: WordBool); safecall;
    function Get_ShowAll: WordBool; safecall;
    procedure Set_ShowAll(Value: WordBool); safecall;
    function Get_ShowFieldCodes: WordBool; safecall;
    procedure Set_ShowFieldCodes(Value: WordBool); safecall;
    function Get_MailMergeDataView: WordBool; safecall;
    procedure Set_MailMergeDataView(Value: WordBool); safecall;
    function Get_Magnifier: WordBool; safecall;
    procedure Set_Magnifier(Value: WordBool); safecall;
    function Get_ShowFirstLineOnly: WordBool; safecall;
    procedure Set_ShowFirstLineOnly(Value: WordBool); safecall;
    function Get_ShowFormat: WordBool; safecall;
    procedure Set_ShowFormat(Value: WordBool); safecall;
    function Get_Zoom: Zoom; safecall;
    function Get_ShowObjectAnchors: WordBool; safecall;
    procedure Set_ShowObjectAnchors(Value: WordBool); safecall;
    function Get_ShowTextBoundaries: WordBool; safecall;
    procedure Set_ShowTextBoundaries(Value: WordBool); safecall;
    function Get_ShowHighlight: WordBool; safecall;
    procedure Set_ShowHighlight(Value: WordBool); safecall;
    function Get_ShowDrawings: WordBool; safecall;
    procedure Set_ShowDrawings(Value: WordBool); safecall;
    function Get_ShowTabs: WordBool; safecall;
    procedure Set_ShowTabs(Value: WordBool); safecall;
    function Get_ShowSpaces: WordBool; safecall;
    procedure Set_ShowSpaces(Value: WordBool); safecall;
    function Get_ShowParagraphs: WordBool; safecall;
    procedure Set_ShowParagraphs(Value: WordBool); safecall;
    function Get_ShowHyphens: WordBool; safecall;
    procedure Set_ShowHyphens(Value: WordBool); safecall;
    function Get_ShowHiddenText: WordBool; safecall;
    procedure Set_ShowHiddenText(Value: WordBool); safecall;
    function Get_WrapToWindow: WordBool; safecall;
    procedure Set_WrapToWindow(Value: WordBool); safecall;
    function Get_ShowPicturePlaceHolders: WordBool; safecall;
    procedure Set_ShowPicturePlaceHolders(Value: WordBool); safecall;
    function Get_ShowBookmarks: WordBool; safecall;
    procedure Set_ShowBookmarks(Value: WordBool); safecall;
    function Get_FieldShading: WdFieldShading; safecall;
    procedure Set_FieldShading(Value: WdFieldShading); safecall;
    function Get_ShowAnimation: WordBool; safecall;
    procedure Set_ShowAnimation(Value: WordBool); safecall;
    function Get_TableGridlines: WordBool; safecall;
    procedure Set_TableGridlines(Value: WordBool); safecall;
    function Get_EnlargeFontsLessThan: Integer; safecall;
    procedure Set_EnlargeFontsLessThan(Value: Integer); safecall;
    function Get_ShowMainTextLayer: WordBool; safecall;
    procedure Set_ShowMainTextLayer(Value: WordBool); safecall;
    function Get_SeekView: WdSeekView; safecall;
    procedure Set_SeekView(Value: WdSeekView); safecall;
    function Get_SplitSpecial: WdSpecialPane; safecall;
    procedure Set_SplitSpecial(Value: WdSpecialPane); safecall;
    function Get_BrowseToWindow: Integer; safecall;
    procedure Set_BrowseToWindow(Value: Integer); safecall;
    function Get_ShowOptionalBreaks: WordBool; safecall;
    procedure Set_ShowOptionalBreaks(Value: WordBool); safecall;
    procedure CollapseOutline(var Range: OleVariant); safecall;
    procedure ExpandOutline(var Range: OleVariant); safecall;
    procedure ShowAllHeadings; safecall;
    procedure ShowHeading(Level: Integer); safecall;
    procedure PreviousHeaderFooter; safecall;
    procedure NextHeaderFooter; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property Type_: WdViewType read Get_Type_ write Set_Type_;
    property FullScreen: WordBool read Get_FullScreen write Set_FullScreen;
    property Draft: WordBool read Get_Draft write Set_Draft;
    property ShowAll: WordBool read Get_ShowAll write Set_ShowAll;
    property ShowFieldCodes: WordBool read Get_ShowFieldCodes write Set_ShowFieldCodes;
    property MailMergeDataView: WordBool read Get_MailMergeDataView write Set_MailMergeDataView;
    property Magnifier: WordBool read Get_Magnifier write Set_Magnifier;
    property ShowFirstLineOnly: WordBool read Get_ShowFirstLineOnly write Set_ShowFirstLineOnly;
    property ShowFormat: WordBool read Get_ShowFormat write Set_ShowFormat;
    property Zoom: Zoom read Get_Zoom;
    property ShowObjectAnchors: WordBool read Get_ShowObjectAnchors write Set_ShowObjectAnchors;
    property ShowTextBoundaries: WordBool read Get_ShowTextBoundaries write Set_ShowTextBoundaries;
    property ShowHighlight: WordBool read Get_ShowHighlight write Set_ShowHighlight;
    property ShowDrawings: WordBool read Get_ShowDrawings write Set_ShowDrawings;
    property ShowTabs: WordBool read Get_ShowTabs write Set_ShowTabs;
    property ShowSpaces: WordBool read Get_ShowSpaces write Set_ShowSpaces;
    property ShowParagraphs: WordBool read Get_ShowParagraphs write Set_ShowParagraphs;
    property ShowHyphens: WordBool read Get_ShowHyphens write Set_ShowHyphens;
    property ShowHiddenText: WordBool read Get_ShowHiddenText write Set_ShowHiddenText;
    property WrapToWindow: WordBool read Get_WrapToWindow write Set_WrapToWindow;
    property ShowPicturePlaceHolders: WordBool read Get_ShowPicturePlaceHolders write Set_ShowPicturePlaceHolders;
    property ShowBookmarks: WordBool read Get_ShowBookmarks write Set_ShowBookmarks;
    property FieldShading: WdFieldShading read Get_FieldShading write Set_FieldShading;
    property ShowAnimation: WordBool read Get_ShowAnimation write Set_ShowAnimation;
    property TableGridlines: WordBool read Get_TableGridlines write Set_TableGridlines;
    property EnlargeFontsLessThan: Integer read Get_EnlargeFontsLessThan write Set_EnlargeFontsLessThan;
    property ShowMainTextLayer: WordBool read Get_ShowMainTextLayer write Set_ShowMainTextLayer;
    property SeekView: WdSeekView read Get_SeekView write Set_SeekView;
    property SplitSpecial: WdSpecialPane read Get_SplitSpecial write Set_SplitSpecial;
    property BrowseToWindow: Integer read Get_BrowseToWindow write Set_BrowseToWindow;
    property ShowOptionalBreaks: WordBool read Get_ShowOptionalBreaks write Set_ShowOptionalBreaks;
  end;

{ DispInterface declaration for Dual Interface View }

  ViewDisp = dispinterface
    ['{000209A5-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property Type_: WdViewType dispid 0;
    property FullScreen: WordBool dispid 1;
    property Draft: WordBool dispid 2;
    property ShowAll: WordBool dispid 3;
    property ShowFieldCodes: WordBool dispid 4;
    property MailMergeDataView: WordBool dispid 5;
    property Magnifier: WordBool dispid 7;
    property ShowFirstLineOnly: WordBool dispid 8;
    property ShowFormat: WordBool dispid 9;
    property Zoom: Zoom readonly dispid 10;
    property ShowObjectAnchors: WordBool dispid 11;
    property ShowTextBoundaries: WordBool dispid 12;
    property ShowHighlight: WordBool dispid 13;
    property ShowDrawings: WordBool dispid 14;
    property ShowTabs: WordBool dispid 15;
    property ShowSpaces: WordBool dispid 16;
    property ShowParagraphs: WordBool dispid 17;
    property ShowHyphens: WordBool dispid 18;
    property ShowHiddenText: WordBool dispid 19;
    property WrapToWindow: WordBool dispid 20;
    property ShowPicturePlaceHolders: WordBool dispid 21;
    property ShowBookmarks: WordBool dispid 22;
    property FieldShading: WdFieldShading dispid 23;
    property ShowAnimation: WordBool dispid 24;
    property TableGridlines: WordBool dispid 25;
    property EnlargeFontsLessThan: Integer dispid 26;
    property ShowMainTextLayer: WordBool dispid 27;
    property SeekView: WdSeekView dispid 28;
    property SplitSpecial: WdSpecialPane dispid 29;
    property BrowseToWindow: Integer dispid 30;
    property ShowOptionalBreaks: WordBool dispid 31;
    procedure CollapseOutline(var Range: OleVariant); dispid 101;
    procedure ExpandOutline(var Range: OleVariant); dispid 102;
    procedure ShowAllHeadings; dispid 103;
    procedure ShowHeading(Level: Integer); dispid 104;
    procedure PreviousHeaderFooter; dispid 105;
    procedure NextHeaderFooter; dispid 106;
  end;

  Zoom = interface(IDispatch)
    ['{000209A6-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Percentage: Integer; safecall;
    procedure Set_Percentage(Value: Integer); safecall;
    function Get_PageFit: WdPageFit; safecall;
    procedure Set_PageFit(Value: WdPageFit); safecall;
    function Get_PageRows: Integer; safecall;
    procedure Set_PageRows(Value: Integer); safecall;
    function Get_PageColumns: Integer; safecall;
    procedure Set_PageColumns(Value: Integer); safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property Percentage: Integer read Get_Percentage write Set_Percentage;
    property PageFit: WdPageFit read Get_PageFit write Set_PageFit;
    property PageRows: Integer read Get_PageRows write Set_PageRows;
    property PageColumns: Integer read Get_PageColumns write Set_PageColumns;
  end;

{ DispInterface declaration for Dual Interface Zoom }

  ZoomDisp = dispinterface
    ['{000209A6-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property Percentage: Integer dispid 0;
    property PageFit: WdPageFit dispid 1;
    property PageRows: Integer dispid 2;
    property PageColumns: Integer dispid 3;
  end;

  Zooms = interface(IDispatch)
    ['{000209A7-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Item(Index: WdViewType): Zoom; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
  end;

{ DispInterface declaration for Dual Interface Zooms }

  ZoomsDisp = dispinterface
    ['{000209A7-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    function Item(Index: WdViewType): Zoom; dispid 0;
  end;

  InlineShape = interface(IDispatch)
    ['{000209A8-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Borders: Borders; safecall;
    procedure Set_Borders(const Value: Borders); safecall;
    function Get_Range: Range; safecall;
    function Get_LinkFormat: LinkFormat; safecall;
    function Get_Field: Field; safecall;
    function Get_OLEFormat: OLEFormat; safecall;
    function Get_Type_: WdInlineShapeType; safecall;
    function Get_Hyperlink: Hyperlink; safecall;
    function Get_Height: Single; safecall;
    procedure Set_Height(Value: Single); safecall;
    function Get_Width: Single; safecall;
    procedure Set_Width(Value: Single); safecall;
    function Get_ScaleHeight: Single; safecall;
    procedure Set_ScaleHeight(Value: Single); safecall;
    function Get_ScaleWidth: Single; safecall;
    procedure Set_ScaleWidth(Value: Single); safecall;
    function Get_LockAspectRatio: MsoTriState; safecall;
    procedure Set_LockAspectRatio(Value: MsoTriState); safecall;
    function Get_Line: LineFormat; safecall;
    function Get_Fill: FillFormat; safecall;
    function Get_PictureFormat: PictureFormat; safecall;
    procedure Set_PictureFormat(const Value: PictureFormat); safecall;
    procedure Activate; safecall;
    procedure Reset; safecall;
    procedure Delete; safecall;
    procedure Select; safecall;
    function ConvertToShape: Shape; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property Borders: Borders read Get_Borders write Set_Borders;
    property Range: Range read Get_Range;
    property LinkFormat: LinkFormat read Get_LinkFormat;
    property Field: Field read Get_Field;
    property OLEFormat: OLEFormat read Get_OLEFormat;
    property Type_: WdInlineShapeType read Get_Type_;
    property Hyperlink: Hyperlink read Get_Hyperlink;
    property Height: Single read Get_Height write Set_Height;
    property Width: Single read Get_Width write Set_Width;
    property ScaleHeight: Single read Get_ScaleHeight write Set_ScaleHeight;
    property ScaleWidth: Single read Get_ScaleWidth write Set_ScaleWidth;
    property LockAspectRatio: MsoTriState read Get_LockAspectRatio write Set_LockAspectRatio;
    property Line: LineFormat read Get_Line;
    property Fill: FillFormat read Get_Fill;
    property PictureFormat: PictureFormat read Get_PictureFormat write Set_PictureFormat;
  end;

{ DispInterface declaration for Dual Interface InlineShape }

  InlineShapeDisp = dispinterface
    ['{000209A8-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property Borders: Borders dispid 1100;
    property Range: Range readonly dispid 2;
    property LinkFormat: LinkFormat readonly dispid 3;
    property Field: Field readonly dispid 4;
    property OLEFormat: OLEFormat readonly dispid 5;
    property Type_: WdInlineShapeType readonly dispid 6;
    property Hyperlink: Hyperlink readonly dispid 7;
    property Height: Single dispid 8;
    property Width: Single dispid 9;
    property ScaleHeight: Single dispid 10;
    property ScaleWidth: Single dispid 11;
    property LockAspectRatio: MsoTriState dispid 12;
    property Line: LineFormat readonly dispid 112;
    property Fill: FillFormat readonly dispid 107;
    property PictureFormat: PictureFormat dispid 118;
    procedure Activate; dispid 100;
    procedure Reset; dispid 101;
    procedure Delete; dispid 102;
    procedure Select; dispid 65535;
    function ConvertToShape: Shape; dispid 104;
  end;

  InlineShapes = interface(IDispatch)
    ['{000209A9-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Count: Integer; safecall;
    function Get__NewEnum: IUnknown; safecall;
    function Item(Index: Integer): InlineShape; safecall;
    function AddPicture(const FileName: WideString; var LinkToFile, SaveWithDocument, Range: OleVariant): InlineShape; safecall;
    function AddOLEObject(var ClassType, FileName, LinkToFile, DisplayAsIcon, IconFileName, IconIndex, IconLabel, Range: OleVariant): InlineShape; safecall;
    function AddOLEControl(var ClassType, Range: OleVariant): InlineShape; safecall;
    function New(const Range: Range): InlineShape; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property Count: Integer read Get_Count;
    property _NewEnum: IUnknown read Get__NewEnum;
  end;

{ DispInterface declaration for Dual Interface InlineShapes }

  InlineShapesDisp = dispinterface
    ['{000209A9-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property Count: Integer readonly dispid 1;
    property _NewEnum: IUnknown readonly dispid -4;
    function Item(Index: Integer): InlineShape; dispid 0;
    function AddPicture(const FileName: WideString; var LinkToFile, SaveWithDocument, Range: OleVariant): InlineShape; dispid 100;
    function AddOLEObject(var ClassType, FileName, LinkToFile, DisplayAsIcon, IconFileName, IconIndex, IconLabel, Range: OleVariant): InlineShape; dispid 24;
    function AddOLEControl(var ClassType, Range: OleVariant): InlineShape; dispid 102;
    function New(const Range: Range): InlineShape; dispid 200;
  end;

  SpellingSuggestions = interface(IDispatch)
    ['{000209AA-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get__NewEnum: IUnknown; safecall;
    function Get_Count: Integer; safecall;
    function Get_SpellingErrorType: WdSpellingErrorType; safecall;
    function Item(Index: Integer): SpellingSuggestion; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Count: Integer read Get_Count;
    property SpellingErrorType: WdSpellingErrorType read Get_SpellingErrorType;
  end;

{ DispInterface declaration for Dual Interface SpellingSuggestions }

  SpellingSuggestionsDisp = dispinterface
    ['{000209AA-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property _NewEnum: IUnknown readonly dispid -4;
    property Count: Integer readonly dispid 1;
    property SpellingErrorType: WdSpellingErrorType readonly dispid 2;
    function Item(Index: Integer): SpellingSuggestion; dispid 0;
  end;

  SpellingSuggestion = interface(IDispatch)
    ['{000209AB-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Name: WideString; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property Name: WideString read Get_Name;
  end;

{ DispInterface declaration for Dual Interface SpellingSuggestion }

  SpellingSuggestionDisp = dispinterface
    ['{000209AB-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property Name: WideString readonly dispid 0;
  end;

  Dictionaries = interface(IDispatch)
    ['{000209AC-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get__NewEnum: IUnknown; safecall;
    function Get_Count: Integer; safecall;
    function Get_Maximum: Integer; safecall;
    function Get_ActiveCustomDictionary: Dictionary; safecall;
    procedure Set_ActiveCustomDictionary(const Value: Dictionary); safecall;
    function Item(var Index: OleVariant): Dictionary; safecall;
    function Add(const FileName: WideString): Dictionary; safecall;
    procedure ClearAll; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Count: Integer read Get_Count;
    property Maximum: Integer read Get_Maximum;
    property ActiveCustomDictionary: Dictionary read Get_ActiveCustomDictionary write Set_ActiveCustomDictionary;
  end;

{ DispInterface declaration for Dual Interface Dictionaries }

  DictionariesDisp = dispinterface
    ['{000209AC-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property _NewEnum: IUnknown readonly dispid -4;
    property Count: Integer readonly dispid 1;
    property Maximum: Integer readonly dispid 2;
    property ActiveCustomDictionary: Dictionary dispid 3;
    function Item(var Index: OleVariant): Dictionary; dispid 0;
    function Add(const FileName: WideString): Dictionary; dispid 101;
    procedure ClearAll; dispid 102;
  end;

  HangulHanjaConversionDictionaries = interface(IDispatch)
    ['{000209E0-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get__NewEnum: IUnknown; safecall;
    function Get_Count: Integer; safecall;
    function Get_Maximum: Integer; safecall;
    function Get_ActiveCustomDictionary: Dictionary; safecall;
    procedure Set_ActiveCustomDictionary(const Value: Dictionary); safecall;
    function Get_BuiltinDictionary: Dictionary; safecall;
    function Item(var Index: OleVariant): Dictionary; safecall;
    function Add(const FileName: WideString): Dictionary; safecall;
    procedure ClearAll; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Count: Integer read Get_Count;
    property Maximum: Integer read Get_Maximum;
    property ActiveCustomDictionary: Dictionary read Get_ActiveCustomDictionary write Set_ActiveCustomDictionary;
    property BuiltinDictionary: Dictionary read Get_BuiltinDictionary;
  end;

{ DispInterface declaration for Dual Interface HangulHanjaConversionDictionaries }

  HangulHanjaConversionDictionariesDisp = dispinterface
    ['{000209E0-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property _NewEnum: IUnknown readonly dispid -4;
    property Count: Integer readonly dispid 1;
    property Maximum: Integer readonly dispid 2;
    property ActiveCustomDictionary: Dictionary dispid 3;
    property BuiltinDictionary: Dictionary readonly dispid 4;
    function Item(var Index: OleVariant): Dictionary; dispid 0;
    function Add(const FileName: WideString): Dictionary; dispid 101;
    procedure ClearAll; dispid 102;
  end;

  Dictionary = interface(IDispatch)
    ['{000209AD-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Name: WideString; safecall;
    function Get_Path: WideString; safecall;
    function Get_LanguageID: WdLanguageID; safecall;
    procedure Set_LanguageID(Value: WdLanguageID); safecall;
    function Get_ReadOnly: WordBool; safecall;
    function Get_Type_: WdDictionaryType; safecall;
    function Get_LanguageSpecific: WordBool; safecall;
    procedure Set_LanguageSpecific(Value: WordBool); safecall;
    procedure Delete; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property Name: WideString read Get_Name;
    property Path: WideString read Get_Path;
    property LanguageID: WdLanguageID read Get_LanguageID write Set_LanguageID;
    property ReadOnly: WordBool read Get_ReadOnly;
    property Type_: WdDictionaryType read Get_Type_;
    property LanguageSpecific: WordBool read Get_LanguageSpecific write Set_LanguageSpecific;
  end;

{ DispInterface declaration for Dual Interface Dictionary }

  DictionaryDisp = dispinterface
    ['{000209AD-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property Name: WideString readonly dispid 0;
    property Path: WideString readonly dispid 1;
    property LanguageID: WdLanguageID dispid 2;
    property ReadOnly: WordBool readonly dispid 3;
    property Type_: WdDictionaryType readonly dispid 4;
    property LanguageSpecific: WordBool dispid 5;
    procedure Delete; dispid 101;
  end;

  ReadabilityStatistics = interface(IDispatch)
    ['{000209AE-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get__NewEnum: IUnknown; safecall;
    function Get_Count: Integer; safecall;
    function Item(var Index: OleVariant): ReadabilityStatistic; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Count: Integer read Get_Count;
  end;

{ DispInterface declaration for Dual Interface ReadabilityStatistics }

  ReadabilityStatisticsDisp = dispinterface
    ['{000209AE-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property _NewEnum: IUnknown readonly dispid -4;
    property Count: Integer readonly dispid 1;
    function Item(var Index: OleVariant): ReadabilityStatistic; dispid 0;
  end;

  ReadabilityStatistic = interface(IDispatch)
    ['{000209AF-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Name: WideString; safecall;
    function Get_Value: Single; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property Name: WideString read Get_Name;
    property Value: Single read Get_Value;
  end;

{ DispInterface declaration for Dual Interface ReadabilityStatistic }

  ReadabilityStatisticDisp = dispinterface
    ['{000209AF-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property Name: WideString readonly dispid 0;
    property Value: Single readonly dispid 1;
  end;

  Versions = interface(IDispatch)
    ['{000209B3-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get__NewEnum: IUnknown; safecall;
    function Get_Count: Integer; safecall;
    function Get_AutoVersion: WdAutoVersions; safecall;
    procedure Set_AutoVersion(Value: WdAutoVersions); safecall;
    function Item(Index: Integer): Version; safecall;
    procedure Save(var Comment: OleVariant); safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Count: Integer read Get_Count;
    property AutoVersion: WdAutoVersions read Get_AutoVersion write Set_AutoVersion;
  end;

{ DispInterface declaration for Dual Interface Versions }

  VersionsDisp = dispinterface
    ['{000209B3-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property _NewEnum: IUnknown readonly dispid -4;
    property Count: Integer readonly dispid 2;
    property AutoVersion: WdAutoVersions dispid 3;
    function Item(Index: Integer): Version; dispid 0;
    procedure Save(var Comment: OleVariant); dispid 11;
  end;

  Version = interface(IDispatch)
    ['{000209B4-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_SavedBy: WideString; safecall;
    function Get_Comment: WideString; safecall;
    function Get_Date: TDateTime; safecall;
    function Get_Index: Integer; safecall;
    procedure Open; safecall;
    procedure Delete; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property SavedBy: WideString read Get_SavedBy;
    property Comment: WideString read Get_Comment;
    property Date: TDateTime read Get_Date;
    property Index: Integer read Get_Index;
  end;

{ DispInterface declaration for Dual Interface Version }

  VersionDisp = dispinterface
    ['{000209B4-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property SavedBy: WideString readonly dispid 1003;
    property Comment: WideString readonly dispid 1004;
    property Date: TDateTime readonly dispid 1005;
    property Index: Integer readonly dispid 2;
    procedure Open; dispid 101;
    procedure Delete; dispid 102;
  end;

  Options = interface(IDispatch)
    ['{000209B7-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_AllowAccentedUppercase: WordBool; safecall;
    procedure Set_AllowAccentedUppercase(Value: WordBool); safecall;
    function Get_WPHelp: WordBool; safecall;
    procedure Set_WPHelp(Value: WordBool); safecall;
    function Get_WPDocNavKeys: WordBool; safecall;
    procedure Set_WPDocNavKeys(Value: WordBool); safecall;
    function Get_Pagination: WordBool; safecall;
    procedure Set_Pagination(Value: WordBool); safecall;
    function Get_BlueScreen: WordBool; safecall;
    procedure Set_BlueScreen(Value: WordBool); safecall;
    function Get_EnableSound: WordBool; safecall;
    procedure Set_EnableSound(Value: WordBool); safecall;
    function Get_ConfirmConversions: WordBool; safecall;
    procedure Set_ConfirmConversions(Value: WordBool); safecall;
    function Get_UpdateLinksAtOpen: WordBool; safecall;
    procedure Set_UpdateLinksAtOpen(Value: WordBool); safecall;
    function Get_SendMailAttach: WordBool; safecall;
    procedure Set_SendMailAttach(Value: WordBool); safecall;
    function Get_MeasurementUnit: WdMeasurementUnits; safecall;
    procedure Set_MeasurementUnit(Value: WdMeasurementUnits); safecall;
    function Get_ButtonFieldClicks: Integer; safecall;
    procedure Set_ButtonFieldClicks(Value: Integer); safecall;
    function Get_ShortMenuNames: WordBool; safecall;
    procedure Set_ShortMenuNames(Value: WordBool); safecall;
    function Get_RTFInClipboard: WordBool; safecall;
    procedure Set_RTFInClipboard(Value: WordBool); safecall;
    function Get_UpdateFieldsAtPrint: WordBool; safecall;
    procedure Set_UpdateFieldsAtPrint(Value: WordBool); safecall;
    function Get_PrintProperties: WordBool; safecall;
    procedure Set_PrintProperties(Value: WordBool); safecall;
    function Get_PrintFieldCodes: WordBool; safecall;
    procedure Set_PrintFieldCodes(Value: WordBool); safecall;
    function Get_PrintComments: WordBool; safecall;
    procedure Set_PrintComments(Value: WordBool); safecall;
    function Get_PrintHiddenText: WordBool; safecall;
    procedure Set_PrintHiddenText(Value: WordBool); safecall;
    function Get_EnvelopeFeederInstalled: WordBool; safecall;
    function Get_UpdateLinksAtPrint: WordBool; safecall;
    procedure Set_UpdateLinksAtPrint(Value: WordBool); safecall;
    function Get_PrintBackground: WordBool; safecall;
    procedure Set_PrintBackground(Value: WordBool); safecall;
    function Get_PrintDrawingObjects: WordBool; safecall;
    procedure Set_PrintDrawingObjects(Value: WordBool); safecall;
    function Get_DefaultTray: WideString; safecall;
    procedure Set_DefaultTray(const Value: WideString); safecall;
    function Get_DefaultTrayID: Integer; safecall;
    procedure Set_DefaultTrayID(Value: Integer); safecall;
    function Get_CreateBackup: WordBool; safecall;
    procedure Set_CreateBackup(Value: WordBool); safecall;
    function Get_AllowFastSave: WordBool; safecall;
    procedure Set_AllowFastSave(Value: WordBool); safecall;
    function Get_SavePropertiesPrompt: WordBool; safecall;
    procedure Set_SavePropertiesPrompt(Value: WordBool); safecall;
    function Get_SaveNormalPrompt: WordBool; safecall;
    procedure Set_SaveNormalPrompt(Value: WordBool); safecall;
    function Get_SaveInterval: Integer; safecall;
    procedure Set_SaveInterval(Value: Integer); safecall;
    function Get_BackgroundSave: WordBool; safecall;
    procedure Set_BackgroundSave(Value: WordBool); safecall;
    function Get_InsertedTextMark: WdInsertedTextMark; safecall;
    procedure Set_InsertedTextMark(Value: WdInsertedTextMark); safecall;
    function Get_DeletedTextMark: WdDeletedTextMark; safecall;
    procedure Set_DeletedTextMark(Value: WdDeletedTextMark); safecall;
    function Get_RevisedLinesMark: WdRevisedLinesMark; safecall;
    procedure Set_RevisedLinesMark(Value: WdRevisedLinesMark); safecall;
    function Get_InsertedTextColor: WdColorIndex; safecall;
    procedure Set_InsertedTextColor(Value: WdColorIndex); safecall;
    function Get_DeletedTextColor: WdColorIndex; safecall;
    procedure Set_DeletedTextColor(Value: WdColorIndex); safecall;
    function Get_RevisedLinesColor: WdColorIndex; safecall;
    procedure Set_RevisedLinesColor(Value: WdColorIndex); safecall;
    function Get_DefaultFilePath(Path: WdDefaultFilePath): WideString; safecall;
    procedure Set_DefaultFilePath(Path: WdDefaultFilePath; const Value: WideString); safecall;
    function Get_Overtype: WordBool; safecall;
    procedure Set_Overtype(Value: WordBool); safecall;
    function Get_ReplaceSelection: WordBool; safecall;
    procedure Set_ReplaceSelection(Value: WordBool); safecall;
    function Get_AllowDragAndDrop: WordBool; safecall;
    procedure Set_AllowDragAndDrop(Value: WordBool); safecall;
    function Get_AutoWordSelection: WordBool; safecall;
    procedure Set_AutoWordSelection(Value: WordBool); safecall;
    function Get_INSKeyForPaste: WordBool; safecall;
    procedure Set_INSKeyForPaste(Value: WordBool); safecall;
    function Get_SmartCutPaste: WordBool; safecall;
    procedure Set_SmartCutPaste(Value: WordBool); safecall;
    function Get_TabIndentKey: WordBool; safecall;
    procedure Set_TabIndentKey(Value: WordBool); safecall;
    function Get_PictureEditor: WideString; safecall;
    procedure Set_PictureEditor(const Value: WideString); safecall;
    function Get_AnimateScreenMovements: WordBool; safecall;
    procedure Set_AnimateScreenMovements(Value: WordBool); safecall;
    function Get_VirusProtection: WordBool; safecall;
    procedure Set_VirusProtection(Value: WordBool); safecall;
    function Get_RevisedPropertiesMark: WdRevisedPropertiesMark; safecall;
    procedure Set_RevisedPropertiesMark(Value: WdRevisedPropertiesMark); safecall;
    function Get_RevisedPropertiesColor: WdColorIndex; safecall;
    procedure Set_RevisedPropertiesColor(Value: WdColorIndex); safecall;
    function Get_SnapToGrid: WordBool; safecall;
    procedure Set_SnapToGrid(Value: WordBool); safecall;
    function Get_SnapToShapes: WordBool; safecall;
    procedure Set_SnapToShapes(Value: WordBool); safecall;
    function Get_GridDistanceHorizontal: Single; safecall;
    procedure Set_GridDistanceHorizontal(Value: Single); safecall;
    function Get_GridDistanceVertical: Single; safecall;
    procedure Set_GridDistanceVertical(Value: Single); safecall;
    function Get_GridOriginHorizontal: Single; safecall;
    procedure Set_GridOriginHorizontal(Value: Single); safecall;
    function Get_GridOriginVertical: Single; safecall;
    procedure Set_GridOriginVertical(Value: Single); safecall;
    function Get_InlineConversion: WordBool; safecall;
    procedure Set_InlineConversion(Value: WordBool); safecall;
    function Get_IMEAutomaticControl: WordBool; safecall;
    procedure Set_IMEAutomaticControl(Value: WordBool); safecall;
    function Get_AutoFormatApplyHeadings: WordBool; safecall;
    procedure Set_AutoFormatApplyHeadings(Value: WordBool); safecall;
    function Get_AutoFormatApplyLists: WordBool; safecall;
    procedure Set_AutoFormatApplyLists(Value: WordBool); safecall;
    function Get_AutoFormatApplyBulletedLists: WordBool; safecall;
    procedure Set_AutoFormatApplyBulletedLists(Value: WordBool); safecall;
    function Get_AutoFormatApplyOtherParas: WordBool; safecall;
    procedure Set_AutoFormatApplyOtherParas(Value: WordBool); safecall;
    function Get_AutoFormatReplaceQuotes: WordBool; safecall;
    procedure Set_AutoFormatReplaceQuotes(Value: WordBool); safecall;
    function Get_AutoFormatReplaceSymbols: WordBool; safecall;
    procedure Set_AutoFormatReplaceSymbols(Value: WordBool); safecall;
    function Get_AutoFormatReplaceOrdinals: WordBool; safecall;
    procedure Set_AutoFormatReplaceOrdinals(Value: WordBool); safecall;
    function Get_AutoFormatReplaceFractions: WordBool; safecall;
    procedure Set_AutoFormatReplaceFractions(Value: WordBool); safecall;
    function Get_AutoFormatReplacePlainTextEmphasis: WordBool; safecall;
    procedure Set_AutoFormatReplacePlainTextEmphasis(Value: WordBool); safecall;
    function Get_AutoFormatPreserveStyles: WordBool; safecall;
    procedure Set_AutoFormatPreserveStyles(Value: WordBool); safecall;
    function Get_AutoFormatAsYouTypeApplyHeadings: WordBool; safecall;
    procedure Set_AutoFormatAsYouTypeApplyHeadings(Value: WordBool); safecall;
    function Get_AutoFormatAsYouTypeApplyBorders: WordBool; safecall;
    procedure Set_AutoFormatAsYouTypeApplyBorders(Value: WordBool); safecall;
    function Get_AutoFormatAsYouTypeApplyBulletedLists: WordBool; safecall;
    procedure Set_AutoFormatAsYouTypeApplyBulletedLists(Value: WordBool); safecall;
    function Get_AutoFormatAsYouTypeApplyNumberedLists: WordBool; safecall;
    procedure Set_AutoFormatAsYouTypeApplyNumberedLists(Value: WordBool); safecall;
    function Get_AutoFormatAsYouTypeReplaceQuotes: WordBool; safecall;
    procedure Set_AutoFormatAsYouTypeReplaceQuotes(Value: WordBool); safecall;
    function Get_AutoFormatAsYouTypeReplaceSymbols: WordBool; safecall;
    procedure Set_AutoFormatAsYouTypeReplaceSymbols(Value: WordBool); safecall;
    function Get_AutoFormatAsYouTypeReplaceOrdinals: WordBool; safecall;
    procedure Set_AutoFormatAsYouTypeReplaceOrdinals(Value: WordBool); safecall;
    function Get_AutoFormatAsYouTypeReplaceFractions: WordBool; safecall;
    procedure Set_AutoFormatAsYouTypeReplaceFractions(Value: WordBool); safecall;
    function Get_AutoFormatAsYouTypeReplacePlainTextEmphasis: WordBool; safecall;
    procedure Set_AutoFormatAsYouTypeReplacePlainTextEmphasis(Value: WordBool); safecall;
    function Get_AutoFormatAsYouTypeFormatListItemBeginning: WordBool; safecall;
    procedure Set_AutoFormatAsYouTypeFormatListItemBeginning(Value: WordBool); safecall;
    function Get_AutoFormatAsYouTypeDefineStyles: WordBool; safecall;
    procedure Set_AutoFormatAsYouTypeDefineStyles(Value: WordBool); safecall;
    function Get_AutoFormatPlainTextWordMail: WordBool; safecall;
    procedure Set_AutoFormatPlainTextWordMail(Value: WordBool); safecall;
    function Get_AutoFormatAsYouTypeReplaceHyperlinks: WordBool; safecall;
    procedure Set_AutoFormatAsYouTypeReplaceHyperlinks(Value: WordBool); safecall;
    function Get_AutoFormatReplaceHyperlinks: WordBool; safecall;
    procedure Set_AutoFormatReplaceHyperlinks(Value: WordBool); safecall;
    function Get_DefaultHighlightColorIndex: WdColorIndex; safecall;
    procedure Set_DefaultHighlightColorIndex(Value: WdColorIndex); safecall;
    function Get_DefaultBorderLineStyle: WdLineStyle; safecall;
    procedure Set_DefaultBorderLineStyle(Value: WdLineStyle); safecall;
    function Get_CheckSpellingAsYouType: WordBool; safecall;
    procedure Set_CheckSpellingAsYouType(Value: WordBool); safecall;
    function Get_CheckGrammarAsYouType: WordBool; safecall;
    procedure Set_CheckGrammarAsYouType(Value: WordBool); safecall;
    function Get_IgnoreInternetAndFileAddresses: WordBool; safecall;
    procedure Set_IgnoreInternetAndFileAddresses(Value: WordBool); safecall;
    function Get_ShowReadabilityStatistics: WordBool; safecall;
    procedure Set_ShowReadabilityStatistics(Value: WordBool); safecall;
    function Get_IgnoreUppercase: WordBool; safecall;
    procedure Set_IgnoreUppercase(Value: WordBool); safecall;
    function Get_IgnoreMixedDigits: WordBool; safecall;
    procedure Set_IgnoreMixedDigits(Value: WordBool); safecall;
    function Get_SuggestFromMainDictionaryOnly: WordBool; safecall;
    procedure Set_SuggestFromMainDictionaryOnly(Value: WordBool); safecall;
    function Get_SuggestSpellingCorrections: WordBool; safecall;
    procedure Set_SuggestSpellingCorrections(Value: WordBool); safecall;
    function Get_DefaultBorderLineWidth: WdLineWidth; safecall;
    procedure Set_DefaultBorderLineWidth(Value: WdLineWidth); safecall;
    function Get_CheckGrammarWithSpelling: WordBool; safecall;
    procedure Set_CheckGrammarWithSpelling(Value: WordBool); safecall;
    function Get_DefaultOpenFormat: WdOpenFormat; safecall;
    procedure Set_DefaultOpenFormat(Value: WdOpenFormat); safecall;
    function Get_PrintDraft: WordBool; safecall;
    procedure Set_PrintDraft(Value: WordBool); safecall;
    function Get_PrintReverse: WordBool; safecall;
    procedure Set_PrintReverse(Value: WordBool); safecall;
    function Get_MapPaperSize: WordBool; safecall;
    procedure Set_MapPaperSize(Value: WordBool); safecall;
    function Get_AutoFormatAsYouTypeApplyTables: WordBool; safecall;
    procedure Set_AutoFormatAsYouTypeApplyTables(Value: WordBool); safecall;
    function Get_AutoFormatApplyFirstIndents: WordBool; safecall;
    procedure Set_AutoFormatApplyFirstIndents(Value: WordBool); safecall;
    function Get_AutoFormatMatchParentheses: WordBool; safecall;
    procedure Set_AutoFormatMatchParentheses(Value: WordBool); safecall;
    function Get_AutoFormatReplaceFarEastDashes: WordBool; safecall;
    procedure Set_AutoFormatReplaceFarEastDashes(Value: WordBool); safecall;
    function Get_AutoFormatDeleteAutoSpaces: WordBool; safecall;
    procedure Set_AutoFormatDeleteAutoSpaces(Value: WordBool); safecall;
    function Get_AutoFormatAsYouTypeApplyFirstIndents: WordBool; safecall;
    procedure Set_AutoFormatAsYouTypeApplyFirstIndents(Value: WordBool); safecall;
    function Get_AutoFormatAsYouTypeApplyDates: WordBool; safecall;
    procedure Set_AutoFormatAsYouTypeApplyDates(Value: WordBool); safecall;
    function Get_AutoFormatAsYouTypeApplyClosings: WordBool; safecall;
    procedure Set_AutoFormatAsYouTypeApplyClosings(Value: WordBool); safecall;
    function Get_AutoFormatAsYouTypeMatchParentheses: WordBool; safecall;
    procedure Set_AutoFormatAsYouTypeMatchParentheses(Value: WordBool); safecall;
    function Get_AutoFormatAsYouTypeReplaceFarEastDashes: WordBool; safecall;
    procedure Set_AutoFormatAsYouTypeReplaceFarEastDashes(Value: WordBool); safecall;
    function Get_AutoFormatAsYouTypeDeleteAutoSpaces: WordBool; safecall;
    procedure Set_AutoFormatAsYouTypeDeleteAutoSpaces(Value: WordBool); safecall;
    function Get_AutoFormatAsYouTypeInsertClosings: WordBool; safecall;
    procedure Set_AutoFormatAsYouTypeInsertClosings(Value: WordBool); safecall;
    function Get_AutoFormatAsYouTypeAutoLetterWizard: WordBool; safecall;
    procedure Set_AutoFormatAsYouTypeAutoLetterWizard(Value: WordBool); safecall;
    function Get_AutoFormatAsYouTypeInsertOvers: WordBool; safecall;
    procedure Set_AutoFormatAsYouTypeInsertOvers(Value: WordBool); safecall;
    function Get_DisplayGridLines: WordBool; safecall;
    procedure Set_DisplayGridLines(Value: WordBool); safecall;
    function Get_MatchFuzzyCase: WordBool; safecall;
    procedure Set_MatchFuzzyCase(Value: WordBool); safecall;
    function Get_MatchFuzzyByte: WordBool; safecall;
    procedure Set_MatchFuzzyByte(Value: WordBool); safecall;
    function Get_MatchFuzzyHiragana: WordBool; safecall;
    procedure Set_MatchFuzzyHiragana(Value: WordBool); safecall;
    function Get_MatchFuzzySmallKana: WordBool; safecall;
    procedure Set_MatchFuzzySmallKana(Value: WordBool); safecall;
    function Get_MatchFuzzyDash: WordBool; safecall;
    procedure Set_MatchFuzzyDash(Value: WordBool); safecall;
    function Get_MatchFuzzyIterationMark: WordBool; safecall;
    procedure Set_MatchFuzzyIterationMark(Value: WordBool); safecall;
    function Get_MatchFuzzyKanji: WordBool; safecall;
    procedure Set_MatchFuzzyKanji(Value: WordBool); safecall;
    function Get_MatchFuzzyOldKana: WordBool; safecall;
    procedure Set_MatchFuzzyOldKana(Value: WordBool); safecall;
    function Get_MatchFuzzyProlongedSoundMark: WordBool; safecall;
    procedure Set_MatchFuzzyProlongedSoundMark(Value: WordBool); safecall;
    function Get_MatchFuzzyDZ: WordBool; safecall;
    procedure Set_MatchFuzzyDZ(Value: WordBool); safecall;
    function Get_MatchFuzzyBV: WordBool; safecall;
    procedure Set_MatchFuzzyBV(Value: WordBool); safecall;
    function Get_MatchFuzzyTC: WordBool; safecall;
    procedure Set_MatchFuzzyTC(Value: WordBool); safecall;
    function Get_MatchFuzzyHF: WordBool; safecall;
    procedure Set_MatchFuzzyHF(Value: WordBool); safecall;
    function Get_MatchFuzzyZJ: WordBool; safecall;
    procedure Set_MatchFuzzyZJ(Value: WordBool); safecall;
    function Get_MatchFuzzyAY: WordBool; safecall;
    procedure Set_MatchFuzzyAY(Value: WordBool); safecall;
    function Get_MatchFuzzyKiKu: WordBool; safecall;
    procedure Set_MatchFuzzyKiKu(Value: WordBool); safecall;
    function Get_MatchFuzzyPunctuation: WordBool; safecall;
    procedure Set_MatchFuzzyPunctuation(Value: WordBool); safecall;
    function Get_MatchFuzzySpace: WordBool; safecall;
    procedure Set_MatchFuzzySpace(Value: WordBool); safecall;
    function Get_ApplyFarEastFontsToAscii: WordBool; safecall;
    procedure Set_ApplyFarEastFontsToAscii(Value: WordBool); safecall;
    function Get_ConvertHighAnsiToFarEast: WordBool; safecall;
    procedure Set_ConvertHighAnsiToFarEast(Value: WordBool); safecall;
    function Get_PrintOddPagesInAscendingOrder: WordBool; safecall;
    procedure Set_PrintOddPagesInAscendingOrder(Value: WordBool); safecall;
    function Get_PrintEvenPagesInAscendingOrder: WordBool; safecall;
    procedure Set_PrintEvenPagesInAscendingOrder(Value: WordBool); safecall;
    function Get_DefaultBorderColorIndex: WdColorIndex; safecall;
    procedure Set_DefaultBorderColorIndex(Value: WdColorIndex); safecall;
    function Get_EnableMisusedWordsDictionary: WordBool; safecall;
    procedure Set_EnableMisusedWordsDictionary(Value: WordBool); safecall;
    function Get_AllowCombinedAuxiliaryForms: WordBool; safecall;
    procedure Set_AllowCombinedAuxiliaryForms(Value: WordBool); safecall;
    function Get_HangulHanjaFastConversion: WordBool; safecall;
    procedure Set_HangulHanjaFastConversion(Value: WordBool); safecall;
    function Get_CheckHangulEndings: WordBool; safecall;
    procedure Set_CheckHangulEndings(Value: WordBool); safecall;
    function Get_EnableHangulHanjaRecentOrdering: WordBool; safecall;
    procedure Set_EnableHangulHanjaRecentOrdering(Value: WordBool); safecall;
    function Get_MultipleWordConversionsMode: WdMultipleWordConversionsMode; safecall;
    procedure Set_MultipleWordConversionsMode(Value: WdMultipleWordConversionsMode); safecall;
    procedure SetWPHelpOptions(var CommandKeyHelp, DocNavigationKeys, MouseSimulation, DemoGuidance, DemoSpeed, HelpType: OleVariant); safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property AllowAccentedUppercase: WordBool read Get_AllowAccentedUppercase write Set_AllowAccentedUppercase;
    property WPHelp: WordBool read Get_WPHelp write Set_WPHelp;
    property WPDocNavKeys: WordBool read Get_WPDocNavKeys write Set_WPDocNavKeys;
    property Pagination: WordBool read Get_Pagination write Set_Pagination;
    property BlueScreen: WordBool read Get_BlueScreen write Set_BlueScreen;
    property EnableSound: WordBool read Get_EnableSound write Set_EnableSound;
    property ConfirmConversions: WordBool read Get_ConfirmConversions write Set_ConfirmConversions;
    property UpdateLinksAtOpen: WordBool read Get_UpdateLinksAtOpen write Set_UpdateLinksAtOpen;
    property SendMailAttach: WordBool read Get_SendMailAttach write Set_SendMailAttach;
    property MeasurementUnit: WdMeasurementUnits read Get_MeasurementUnit write Set_MeasurementUnit;
    property ButtonFieldClicks: Integer read Get_ButtonFieldClicks write Set_ButtonFieldClicks;
    property ShortMenuNames: WordBool read Get_ShortMenuNames write Set_ShortMenuNames;
    property RTFInClipboard: WordBool read Get_RTFInClipboard write Set_RTFInClipboard;
    property UpdateFieldsAtPrint: WordBool read Get_UpdateFieldsAtPrint write Set_UpdateFieldsAtPrint;
    property PrintProperties: WordBool read Get_PrintProperties write Set_PrintProperties;
    property PrintFieldCodes: WordBool read Get_PrintFieldCodes write Set_PrintFieldCodes;
    property PrintComments: WordBool read Get_PrintComments write Set_PrintComments;
    property PrintHiddenText: WordBool read Get_PrintHiddenText write Set_PrintHiddenText;
    property EnvelopeFeederInstalled: WordBool read Get_EnvelopeFeederInstalled;
    property UpdateLinksAtPrint: WordBool read Get_UpdateLinksAtPrint write Set_UpdateLinksAtPrint;
    property PrintBackground: WordBool read Get_PrintBackground write Set_PrintBackground;
    property PrintDrawingObjects: WordBool read Get_PrintDrawingObjects write Set_PrintDrawingObjects;
    property DefaultTray: WideString read Get_DefaultTray write Set_DefaultTray;
    property DefaultTrayID: Integer read Get_DefaultTrayID write Set_DefaultTrayID;
    property CreateBackup: WordBool read Get_CreateBackup write Set_CreateBackup;
    property AllowFastSave: WordBool read Get_AllowFastSave write Set_AllowFastSave;
    property SavePropertiesPrompt: WordBool read Get_SavePropertiesPrompt write Set_SavePropertiesPrompt;
    property SaveNormalPrompt: WordBool read Get_SaveNormalPrompt write Set_SaveNormalPrompt;
    property SaveInterval: Integer read Get_SaveInterval write Set_SaveInterval;
    property BackgroundSave: WordBool read Get_BackgroundSave write Set_BackgroundSave;
    property InsertedTextMark: WdInsertedTextMark read Get_InsertedTextMark write Set_InsertedTextMark;
    property DeletedTextMark: WdDeletedTextMark read Get_DeletedTextMark write Set_DeletedTextMark;
    property RevisedLinesMark: WdRevisedLinesMark read Get_RevisedLinesMark write Set_RevisedLinesMark;
    property InsertedTextColor: WdColorIndex read Get_InsertedTextColor write Set_InsertedTextColor;
    property DeletedTextColor: WdColorIndex read Get_DeletedTextColor write Set_DeletedTextColor;
    property RevisedLinesColor: WdColorIndex read Get_RevisedLinesColor write Set_RevisedLinesColor;
    property DefaultFilePath[Path: WdDefaultFilePath]: WideString read Get_DefaultFilePath write Set_DefaultFilePath;
    property Overtype: WordBool read Get_Overtype write Set_Overtype;
    property ReplaceSelection: WordBool read Get_ReplaceSelection write Set_ReplaceSelection;
    property AllowDragAndDrop: WordBool read Get_AllowDragAndDrop write Set_AllowDragAndDrop;
    property AutoWordSelection: WordBool read Get_AutoWordSelection write Set_AutoWordSelection;
    property INSKeyForPaste: WordBool read Get_INSKeyForPaste write Set_INSKeyForPaste;
    property SmartCutPaste: WordBool read Get_SmartCutPaste write Set_SmartCutPaste;
    property TabIndentKey: WordBool read Get_TabIndentKey write Set_TabIndentKey;
    property PictureEditor: WideString read Get_PictureEditor write Set_PictureEditor;
    property AnimateScreenMovements: WordBool read Get_AnimateScreenMovements write Set_AnimateScreenMovements;
    property VirusProtection: WordBool read Get_VirusProtection write Set_VirusProtection;
    property RevisedPropertiesMark: WdRevisedPropertiesMark read Get_RevisedPropertiesMark write Set_RevisedPropertiesMark;
    property RevisedPropertiesColor: WdColorIndex read Get_RevisedPropertiesColor write Set_RevisedPropertiesColor;
    property SnapToGrid: WordBool read Get_SnapToGrid write Set_SnapToGrid;
    property SnapToShapes: WordBool read Get_SnapToShapes write Set_SnapToShapes;
    property GridDistanceHorizontal: Single read Get_GridDistanceHorizontal write Set_GridDistanceHorizontal;
    property GridDistanceVertical: Single read Get_GridDistanceVertical write Set_GridDistanceVertical;
    property GridOriginHorizontal: Single read Get_GridOriginHorizontal write Set_GridOriginHorizontal;
    property GridOriginVertical: Single read Get_GridOriginVertical write Set_GridOriginVertical;
    property InlineConversion: WordBool read Get_InlineConversion write Set_InlineConversion;
    property IMEAutomaticControl: WordBool read Get_IMEAutomaticControl write Set_IMEAutomaticControl;
    property AutoFormatApplyHeadings: WordBool read Get_AutoFormatApplyHeadings write Set_AutoFormatApplyHeadings;
    property AutoFormatApplyLists: WordBool read Get_AutoFormatApplyLists write Set_AutoFormatApplyLists;
    property AutoFormatApplyBulletedLists: WordBool read Get_AutoFormatApplyBulletedLists write Set_AutoFormatApplyBulletedLists;
    property AutoFormatApplyOtherParas: WordBool read Get_AutoFormatApplyOtherParas write Set_AutoFormatApplyOtherParas;
    property AutoFormatReplaceQuotes: WordBool read Get_AutoFormatReplaceQuotes write Set_AutoFormatReplaceQuotes;
    property AutoFormatReplaceSymbols: WordBool read Get_AutoFormatReplaceSymbols write Set_AutoFormatReplaceSymbols;
    property AutoFormatReplaceOrdinals: WordBool read Get_AutoFormatReplaceOrdinals write Set_AutoFormatReplaceOrdinals;
    property AutoFormatReplaceFractions: WordBool read Get_AutoFormatReplaceFractions write Set_AutoFormatReplaceFractions;
    property AutoFormatReplacePlainTextEmphasis: WordBool read Get_AutoFormatReplacePlainTextEmphasis write Set_AutoFormatReplacePlainTextEmphasis;
    property AutoFormatPreserveStyles: WordBool read Get_AutoFormatPreserveStyles write Set_AutoFormatPreserveStyles;
    property AutoFormatAsYouTypeApplyHeadings: WordBool read Get_AutoFormatAsYouTypeApplyHeadings write Set_AutoFormatAsYouTypeApplyHeadings;
    property AutoFormatAsYouTypeApplyBorders: WordBool read Get_AutoFormatAsYouTypeApplyBorders write Set_AutoFormatAsYouTypeApplyBorders;
    property AutoFormatAsYouTypeApplyBulletedLists: WordBool read Get_AutoFormatAsYouTypeApplyBulletedLists write Set_AutoFormatAsYouTypeApplyBulletedLists;
    property AutoFormatAsYouTypeApplyNumberedLists: WordBool read Get_AutoFormatAsYouTypeApplyNumberedLists write Set_AutoFormatAsYouTypeApplyNumberedLists;
    property AutoFormatAsYouTypeReplaceQuotes: WordBool read Get_AutoFormatAsYouTypeReplaceQuotes write Set_AutoFormatAsYouTypeReplaceQuotes;
    property AutoFormatAsYouTypeReplaceSymbols: WordBool read Get_AutoFormatAsYouTypeReplaceSymbols write Set_AutoFormatAsYouTypeReplaceSymbols;
    property AutoFormatAsYouTypeReplaceOrdinals: WordBool read Get_AutoFormatAsYouTypeReplaceOrdinals write Set_AutoFormatAsYouTypeReplaceOrdinals;
    property AutoFormatAsYouTypeReplaceFractions: WordBool read Get_AutoFormatAsYouTypeReplaceFractions write Set_AutoFormatAsYouTypeReplaceFractions;
    property AutoFormatAsYouTypeReplacePlainTextEmphasis: WordBool read Get_AutoFormatAsYouTypeReplacePlainTextEmphasis write Set_AutoFormatAsYouTypeReplacePlainTextEmphasis;
    property AutoFormatAsYouTypeFormatListItemBeginning: WordBool read Get_AutoFormatAsYouTypeFormatListItemBeginning write Set_AutoFormatAsYouTypeFormatListItemBeginning;
    property AutoFormatAsYouTypeDefineStyles: WordBool read Get_AutoFormatAsYouTypeDefineStyles write Set_AutoFormatAsYouTypeDefineStyles;
    property AutoFormatPlainTextWordMail: WordBool read Get_AutoFormatPlainTextWordMail write Set_AutoFormatPlainTextWordMail;
    property AutoFormatAsYouTypeReplaceHyperlinks: WordBool read Get_AutoFormatAsYouTypeReplaceHyperlinks write Set_AutoFormatAsYouTypeReplaceHyperlinks;
    property AutoFormatReplaceHyperlinks: WordBool read Get_AutoFormatReplaceHyperlinks write Set_AutoFormatReplaceHyperlinks;
    property DefaultHighlightColorIndex: WdColorIndex read Get_DefaultHighlightColorIndex write Set_DefaultHighlightColorIndex;
    property DefaultBorderLineStyle: WdLineStyle read Get_DefaultBorderLineStyle write Set_DefaultBorderLineStyle;
    property CheckSpellingAsYouType: WordBool read Get_CheckSpellingAsYouType write Set_CheckSpellingAsYouType;
    property CheckGrammarAsYouType: WordBool read Get_CheckGrammarAsYouType write Set_CheckGrammarAsYouType;
    property IgnoreInternetAndFileAddresses: WordBool read Get_IgnoreInternetAndFileAddresses write Set_IgnoreInternetAndFileAddresses;
    property ShowReadabilityStatistics: WordBool read Get_ShowReadabilityStatistics write Set_ShowReadabilityStatistics;
    property IgnoreUppercase: WordBool read Get_IgnoreUppercase write Set_IgnoreUppercase;
    property IgnoreMixedDigits: WordBool read Get_IgnoreMixedDigits write Set_IgnoreMixedDigits;
    property SuggestFromMainDictionaryOnly: WordBool read Get_SuggestFromMainDictionaryOnly write Set_SuggestFromMainDictionaryOnly;
    property SuggestSpellingCorrections: WordBool read Get_SuggestSpellingCorrections write Set_SuggestSpellingCorrections;
    property DefaultBorderLineWidth: WdLineWidth read Get_DefaultBorderLineWidth write Set_DefaultBorderLineWidth;
    property CheckGrammarWithSpelling: WordBool read Get_CheckGrammarWithSpelling write Set_CheckGrammarWithSpelling;
    property DefaultOpenFormat: WdOpenFormat read Get_DefaultOpenFormat write Set_DefaultOpenFormat;
    property PrintDraft: WordBool read Get_PrintDraft write Set_PrintDraft;
    property PrintReverse: WordBool read Get_PrintReverse write Set_PrintReverse;
    property MapPaperSize: WordBool read Get_MapPaperSize write Set_MapPaperSize;
    property AutoFormatAsYouTypeApplyTables: WordBool read Get_AutoFormatAsYouTypeApplyTables write Set_AutoFormatAsYouTypeApplyTables;
    property AutoFormatApplyFirstIndents: WordBool read Get_AutoFormatApplyFirstIndents write Set_AutoFormatApplyFirstIndents;
    property AutoFormatMatchParentheses: WordBool read Get_AutoFormatMatchParentheses write Set_AutoFormatMatchParentheses;
    property AutoFormatReplaceFarEastDashes: WordBool read Get_AutoFormatReplaceFarEastDashes write Set_AutoFormatReplaceFarEastDashes;
    property AutoFormatDeleteAutoSpaces: WordBool read Get_AutoFormatDeleteAutoSpaces write Set_AutoFormatDeleteAutoSpaces;
    property AutoFormatAsYouTypeApplyFirstIndents: WordBool read Get_AutoFormatAsYouTypeApplyFirstIndents write Set_AutoFormatAsYouTypeApplyFirstIndents;
    property AutoFormatAsYouTypeApplyDates: WordBool read Get_AutoFormatAsYouTypeApplyDates write Set_AutoFormatAsYouTypeApplyDates;
    property AutoFormatAsYouTypeApplyClosings: WordBool read Get_AutoFormatAsYouTypeApplyClosings write Set_AutoFormatAsYouTypeApplyClosings;
    property AutoFormatAsYouTypeMatchParentheses: WordBool read Get_AutoFormatAsYouTypeMatchParentheses write Set_AutoFormatAsYouTypeMatchParentheses;
    property AutoFormatAsYouTypeReplaceFarEastDashes: WordBool read Get_AutoFormatAsYouTypeReplaceFarEastDashes write Set_AutoFormatAsYouTypeReplaceFarEastDashes;
    property AutoFormatAsYouTypeDeleteAutoSpaces: WordBool read Get_AutoFormatAsYouTypeDeleteAutoSpaces write Set_AutoFormatAsYouTypeDeleteAutoSpaces;
    property AutoFormatAsYouTypeInsertClosings: WordBool read Get_AutoFormatAsYouTypeInsertClosings write Set_AutoFormatAsYouTypeInsertClosings;
    property AutoFormatAsYouTypeAutoLetterWizard: WordBool read Get_AutoFormatAsYouTypeAutoLetterWizard write Set_AutoFormatAsYouTypeAutoLetterWizard;
    property AutoFormatAsYouTypeInsertOvers: WordBool read Get_AutoFormatAsYouTypeInsertOvers write Set_AutoFormatAsYouTypeInsertOvers;
    property DisplayGridLines: WordBool read Get_DisplayGridLines write Set_DisplayGridLines;
    property MatchFuzzyCase: WordBool read Get_MatchFuzzyCase write Set_MatchFuzzyCase;
    property MatchFuzzyByte: WordBool read Get_MatchFuzzyByte write Set_MatchFuzzyByte;
    property MatchFuzzyHiragana: WordBool read Get_MatchFuzzyHiragana write Set_MatchFuzzyHiragana;
    property MatchFuzzySmallKana: WordBool read Get_MatchFuzzySmallKana write Set_MatchFuzzySmallKana;
    property MatchFuzzyDash: WordBool read Get_MatchFuzzyDash write Set_MatchFuzzyDash;
    property MatchFuzzyIterationMark: WordBool read Get_MatchFuzzyIterationMark write Set_MatchFuzzyIterationMark;
    property MatchFuzzyKanji: WordBool read Get_MatchFuzzyKanji write Set_MatchFuzzyKanji;
    property MatchFuzzyOldKana: WordBool read Get_MatchFuzzyOldKana write Set_MatchFuzzyOldKana;
    property MatchFuzzyProlongedSoundMark: WordBool read Get_MatchFuzzyProlongedSoundMark write Set_MatchFuzzyProlongedSoundMark;
    property MatchFuzzyDZ: WordBool read Get_MatchFuzzyDZ write Set_MatchFuzzyDZ;
    property MatchFuzzyBV: WordBool read Get_MatchFuzzyBV write Set_MatchFuzzyBV;
    property MatchFuzzyTC: WordBool read Get_MatchFuzzyTC write Set_MatchFuzzyTC;
    property MatchFuzzyHF: WordBool read Get_MatchFuzzyHF write Set_MatchFuzzyHF;
    property MatchFuzzyZJ: WordBool read Get_MatchFuzzyZJ write Set_MatchFuzzyZJ;
    property MatchFuzzyAY: WordBool read Get_MatchFuzzyAY write Set_MatchFuzzyAY;
    property MatchFuzzyKiKu: WordBool read Get_MatchFuzzyKiKu write Set_MatchFuzzyKiKu;
    property MatchFuzzyPunctuation: WordBool read Get_MatchFuzzyPunctuation write Set_MatchFuzzyPunctuation;
    property MatchFuzzySpace: WordBool read Get_MatchFuzzySpace write Set_MatchFuzzySpace;
    property ApplyFarEastFontsToAscii: WordBool read Get_ApplyFarEastFontsToAscii write Set_ApplyFarEastFontsToAscii;
    property ConvertHighAnsiToFarEast: WordBool read Get_ConvertHighAnsiToFarEast write Set_ConvertHighAnsiToFarEast;
    property PrintOddPagesInAscendingOrder: WordBool read Get_PrintOddPagesInAscendingOrder write Set_PrintOddPagesInAscendingOrder;
    property PrintEvenPagesInAscendingOrder: WordBool read Get_PrintEvenPagesInAscendingOrder write Set_PrintEvenPagesInAscendingOrder;
    property DefaultBorderColorIndex: WdColorIndex read Get_DefaultBorderColorIndex write Set_DefaultBorderColorIndex;
    property EnableMisusedWordsDictionary: WordBool read Get_EnableMisusedWordsDictionary write Set_EnableMisusedWordsDictionary;
    property AllowCombinedAuxiliaryForms: WordBool read Get_AllowCombinedAuxiliaryForms write Set_AllowCombinedAuxiliaryForms;
    property HangulHanjaFastConversion: WordBool read Get_HangulHanjaFastConversion write Set_HangulHanjaFastConversion;
    property CheckHangulEndings: WordBool read Get_CheckHangulEndings write Set_CheckHangulEndings;
    property EnableHangulHanjaRecentOrdering: WordBool read Get_EnableHangulHanjaRecentOrdering write Set_EnableHangulHanjaRecentOrdering;
    property MultipleWordConversionsMode: WdMultipleWordConversionsMode read Get_MultipleWordConversionsMode write Set_MultipleWordConversionsMode;
  end;

{ DispInterface declaration for Dual Interface Options }

  OptionsDisp = dispinterface
    ['{000209B7-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property AllowAccentedUppercase: WordBool dispid 1;
    property WPHelp: WordBool dispid 17;
    property WPDocNavKeys: WordBool dispid 18;
    property Pagination: WordBool dispid 19;
    property BlueScreen: WordBool dispid 20;
    property EnableSound: WordBool dispid 21;
    property ConfirmConversions: WordBool dispid 22;
    property UpdateLinksAtOpen: WordBool dispid 23;
    property SendMailAttach: WordBool dispid 24;
    property MeasurementUnit: WdMeasurementUnits dispid 26;
    property ButtonFieldClicks: Integer dispid 27;
    property ShortMenuNames: WordBool dispid 28;
    property RTFInClipboard: WordBool dispid 29;
    property UpdateFieldsAtPrint: WordBool dispid 30;
    property PrintProperties: WordBool dispid 31;
    property PrintFieldCodes: WordBool dispid 32;
    property PrintComments: WordBool dispid 33;
    property PrintHiddenText: WordBool dispid 34;
    property EnvelopeFeederInstalled: WordBool readonly dispid 35;
    property UpdateLinksAtPrint: WordBool dispid 36;
    property PrintBackground: WordBool dispid 37;
    property PrintDrawingObjects: WordBool dispid 38;
    property DefaultTray: WideString dispid 39;
    property DefaultTrayID: Integer dispid 40;
    property CreateBackup: WordBool dispid 41;
    property AllowFastSave: WordBool dispid 42;
    property SavePropertiesPrompt: WordBool dispid 43;
    property SaveNormalPrompt: WordBool dispid 44;
    property SaveInterval: Integer dispid 45;
    property BackgroundSave: WordBool dispid 46;
    property InsertedTextMark: WdInsertedTextMark dispid 57;
    property DeletedTextMark: WdDeletedTextMark dispid 58;
    property RevisedLinesMark: WdRevisedLinesMark dispid 59;
    property InsertedTextColor: WdColorIndex dispid 60;
    property DeletedTextColor: WdColorIndex dispid 61;
    property RevisedLinesColor: WdColorIndex dispid 62;
    property DefaultFilePath[Path: WdDefaultFilePath]: WideString dispid 65;
    property Overtype: WordBool dispid 66;
    property ReplaceSelection: WordBool dispid 67;
    property AllowDragAndDrop: WordBool dispid 68;
    property AutoWordSelection: WordBool dispid 69;
    property INSKeyForPaste: WordBool dispid 70;
    property SmartCutPaste: WordBool dispid 71;
    property TabIndentKey: WordBool dispid 72;
    property PictureEditor: WideString dispid 73;
    property AnimateScreenMovements: WordBool dispid 74;
    property VirusProtection: WordBool dispid 75;
    property RevisedPropertiesMark: WdRevisedPropertiesMark dispid 76;
    property RevisedPropertiesColor: WdColorIndex dispid 77;
    property SnapToGrid: WordBool dispid 79;
    property SnapToShapes: WordBool dispid 80;
    property GridDistanceHorizontal: Single dispid 81;
    property GridDistanceVertical: Single dispid 82;
    property GridOriginHorizontal: Single dispid 83;
    property GridOriginVertical: Single dispid 84;
    property InlineConversion: WordBool dispid 86;
    property IMEAutomaticControl: WordBool dispid 87;
    property AutoFormatApplyHeadings: WordBool dispid 250;
    property AutoFormatApplyLists: WordBool dispid 251;
    property AutoFormatApplyBulletedLists: WordBool dispid 252;
    property AutoFormatApplyOtherParas: WordBool dispid 253;
    property AutoFormatReplaceQuotes: WordBool dispid 254;
    property AutoFormatReplaceSymbols: WordBool dispid 255;
    property AutoFormatReplaceOrdinals: WordBool dispid 256;
    property AutoFormatReplaceFractions: WordBool dispid 257;
    property AutoFormatReplacePlainTextEmphasis: WordBool dispid 258;
    property AutoFormatPreserveStyles: WordBool dispid 259;
    property AutoFormatAsYouTypeApplyHeadings: WordBool dispid 260;
    property AutoFormatAsYouTypeApplyBorders: WordBool dispid 261;
    property AutoFormatAsYouTypeApplyBulletedLists: WordBool dispid 262;
    property AutoFormatAsYouTypeApplyNumberedLists: WordBool dispid 263;
    property AutoFormatAsYouTypeReplaceQuotes: WordBool dispid 264;
    property AutoFormatAsYouTypeReplaceSymbols: WordBool dispid 265;
    property AutoFormatAsYouTypeReplaceOrdinals: WordBool dispid 266;
    property AutoFormatAsYouTypeReplaceFractions: WordBool dispid 267;
    property AutoFormatAsYouTypeReplacePlainTextEmphasis: WordBool dispid 268;
    property AutoFormatAsYouTypeFormatListItemBeginning: WordBool dispid 269;
    property AutoFormatAsYouTypeDefineStyles: WordBool dispid 270;
    property AutoFormatPlainTextWordMail: WordBool dispid 271;
    property AutoFormatAsYouTypeReplaceHyperlinks: WordBool dispid 272;
    property AutoFormatReplaceHyperlinks: WordBool dispid 273;
    property DefaultHighlightColorIndex: WdColorIndex dispid 274;
    property DefaultBorderLineStyle: WdLineStyle dispid 275;
    property CheckSpellingAsYouType: WordBool dispid 276;
    property CheckGrammarAsYouType: WordBool dispid 277;
    property IgnoreInternetAndFileAddresses: WordBool dispid 278;
    property ShowReadabilityStatistics: WordBool dispid 279;
    property IgnoreUppercase: WordBool dispid 280;
    property IgnoreMixedDigits: WordBool dispid 281;
    property SuggestFromMainDictionaryOnly: WordBool dispid 282;
    property SuggestSpellingCorrections: WordBool dispid 283;
    property DefaultBorderLineWidth: WdLineWidth dispid 284;
    property CheckGrammarWithSpelling: WordBool dispid 285;
    property DefaultOpenFormat: WdOpenFormat dispid 286;
    property PrintDraft: WordBool dispid 287;
    property PrintReverse: WordBool dispid 288;
    property MapPaperSize: WordBool dispid 289;
    property AutoFormatAsYouTypeApplyTables: WordBool dispid 290;
    property AutoFormatApplyFirstIndents: WordBool dispid 291;
    property AutoFormatMatchParentheses: WordBool dispid 294;
    property AutoFormatReplaceFarEastDashes: WordBool dispid 295;
    property AutoFormatDeleteAutoSpaces: WordBool dispid 296;
    property AutoFormatAsYouTypeApplyFirstIndents: WordBool dispid 297;
    property AutoFormatAsYouTypeApplyDates: WordBool dispid 298;
    property AutoFormatAsYouTypeApplyClosings: WordBool dispid 299;
    property AutoFormatAsYouTypeMatchParentheses: WordBool dispid 300;
    property AutoFormatAsYouTypeReplaceFarEastDashes: WordBool dispid 301;
    property AutoFormatAsYouTypeDeleteAutoSpaces: WordBool dispid 302;
    property AutoFormatAsYouTypeInsertClosings: WordBool dispid 303;
    property AutoFormatAsYouTypeAutoLetterWizard: WordBool dispid 304;
    property AutoFormatAsYouTypeInsertOvers: WordBool dispid 305;
    property DisplayGridLines: WordBool dispid 306;
    property MatchFuzzyCase: WordBool dispid 309;
    property MatchFuzzyByte: WordBool dispid 310;
    property MatchFuzzyHiragana: WordBool dispid 311;
    property MatchFuzzySmallKana: WordBool dispid 312;
    property MatchFuzzyDash: WordBool dispid 313;
    property MatchFuzzyIterationMark: WordBool dispid 314;
    property MatchFuzzyKanji: WordBool dispid 315;
    property MatchFuzzyOldKana: WordBool dispid 316;
    property MatchFuzzyProlongedSoundMark: WordBool dispid 317;
    property MatchFuzzyDZ: WordBool dispid 318;
    property MatchFuzzyBV: WordBool dispid 319;
    property MatchFuzzyTC: WordBool dispid 320;
    property MatchFuzzyHF: WordBool dispid 321;
    property MatchFuzzyZJ: WordBool dispid 322;
    property MatchFuzzyAY: WordBool dispid 323;
    property MatchFuzzyKiKu: WordBool dispid 324;
    property MatchFuzzyPunctuation: WordBool dispid 325;
    property MatchFuzzySpace: WordBool dispid 326;
    property ApplyFarEastFontsToAscii: WordBool dispid 327;
    property ConvertHighAnsiToFarEast: WordBool dispid 328;
    property PrintOddPagesInAscendingOrder: WordBool dispid 330;
    property PrintEvenPagesInAscendingOrder: WordBool dispid 331;
    property DefaultBorderColorIndex: WdColorIndex dispid 337;
    property EnableMisusedWordsDictionary: WordBool dispid 338;
    property AllowCombinedAuxiliaryForms: WordBool dispid 339;
    property HangulHanjaFastConversion: WordBool dispid 340;
    property CheckHangulEndings: WordBool dispid 341;
    property EnableHangulHanjaRecentOrdering: WordBool dispid 342;
    property MultipleWordConversionsMode: WdMultipleWordConversionsMode dispid 343;
    procedure SetWPHelpOptions(var CommandKeyHelp, DocNavigationKeys, MouseSimulation, DemoGuidance, DemoSpeed, HelpType: OleVariant); dispid 333;
  end;

  MailMessage = interface(IDispatch)
    ['{000209BA-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    procedure CheckName; safecall;
    procedure Delete; safecall;
    procedure DisplayMoveDialog; safecall;
    procedure DisplayProperties; safecall;
    procedure DisplaySelectNamesDialog; safecall;
    procedure Forward; safecall;
    procedure GoToNext; safecall;
    procedure GoToPrevious; safecall;
    procedure Reply; safecall;
    procedure ReplyAll; safecall;
    procedure ToggleHeader; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
  end;

{ DispInterface declaration for Dual Interface MailMessage }

  MailMessageDisp = dispinterface
    ['{000209BA-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    procedure CheckName; dispid 334;
    procedure Delete; dispid 335;
    procedure DisplayMoveDialog; dispid 336;
    procedure DisplayProperties; dispid 337;
    procedure DisplaySelectNamesDialog; dispid 338;
    procedure Forward; dispid 339;
    procedure GoToNext; dispid 340;
    procedure GoToPrevious; dispid 341;
    procedure Reply; dispid 342;
    procedure ReplyAll; dispid 343;
    procedure ToggleHeader; dispid 344;
  end;

  ProofreadingErrors = interface(IDispatch)
    ['{000209BB-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get__NewEnum: IUnknown; safecall;
    function Get_Count: Integer; safecall;
    function Get_Type_: WdProofreadingErrorType; safecall;
    function Item(Index: Integer): Range; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Count: Integer read Get_Count;
    property Type_: WdProofreadingErrorType read Get_Type_;
  end;

{ DispInterface declaration for Dual Interface ProofreadingErrors }

  ProofreadingErrorsDisp = dispinterface
    ['{000209BB-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property _NewEnum: IUnknown readonly dispid -4;
    property Count: Integer readonly dispid 1;
    property Type_: WdProofreadingErrorType readonly dispid 2;
    function Item(Index: Integer): Range; dispid 0;
  end;

  Mailer = interface(IDispatch)
    ['{000209BD-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_BCCRecipients: OleVariant; safecall;
    procedure Set_BCCRecipients(Value: OleVariant); safecall;
    function Get_CCRecipients: OleVariant; safecall;
    procedure Set_CCRecipients(Value: OleVariant); safecall;
    function Get_Recipients: OleVariant; safecall;
    procedure Set_Recipients(Value: OleVariant); safecall;
    function Get_Enclosures: OleVariant; safecall;
    procedure Set_Enclosures(Value: OleVariant); safecall;
    function Get_Sender: WideString; safecall;
    function Get_SendDateTime: TDateTime; safecall;
    function Get_Received: WordBool; safecall;
    function Get_Subject: WideString; safecall;
    procedure Set_Subject(const Value: WideString); safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property BCCRecipients: OleVariant read Get_BCCRecipients write Set_BCCRecipients;
    property CCRecipients: OleVariant read Get_CCRecipients write Set_CCRecipients;
    property Recipients: OleVariant read Get_Recipients write Set_Recipients;
    property Enclosures: OleVariant read Get_Enclosures write Set_Enclosures;
    property Sender: WideString read Get_Sender;
    property SendDateTime: TDateTime read Get_SendDateTime;
    property Received: WordBool read Get_Received;
    property Subject: WideString read Get_Subject write Set_Subject;
  end;

{ DispInterface declaration for Dual Interface Mailer }

  MailerDisp = dispinterface
    ['{000209BD-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property BCCRecipients: OleVariant dispid 100;
    property CCRecipients: OleVariant dispid 101;
    property Recipients: OleVariant dispid 102;
    property Enclosures: OleVariant dispid 103;
    property Sender: WideString readonly dispid 104;
    property SendDateTime: TDateTime readonly dispid 105;
    property Received: WordBool readonly dispid 106;
    property Subject: WideString dispid 107;
  end;

  WrapFormat = interface(IDispatch)
    ['{000209C3-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Type_: WdWrapType; safecall;
    procedure Set_Type_(Value: WdWrapType); safecall;
    function Get_Side: WdWrapSideType; safecall;
    procedure Set_Side(Value: WdWrapSideType); safecall;
    function Get_DistanceTop: Single; safecall;
    procedure Set_DistanceTop(Value: Single); safecall;
    function Get_DistanceBottom: Single; safecall;
    procedure Set_DistanceBottom(Value: Single); safecall;
    function Get_DistanceLeft: Single; safecall;
    procedure Set_DistanceLeft(Value: Single); safecall;
    function Get_DistanceRight: Single; safecall;
    procedure Set_DistanceRight(Value: Single); safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property Type_: WdWrapType read Get_Type_ write Set_Type_;
    property Side: WdWrapSideType read Get_Side write Set_Side;
    property DistanceTop: Single read Get_DistanceTop write Set_DistanceTop;
    property DistanceBottom: Single read Get_DistanceBottom write Set_DistanceBottom;
    property DistanceLeft: Single read Get_DistanceLeft write Set_DistanceLeft;
    property DistanceRight: Single read Get_DistanceRight write Set_DistanceRight;
  end;

{ DispInterface declaration for Dual Interface WrapFormat }

  WrapFormatDisp = dispinterface
    ['{000209C3-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property Type_: WdWrapType dispid 100;
    property Side: WdWrapSideType dispid 101;
    property DistanceTop: Single dispid 102;
    property DistanceBottom: Single dispid 103;
    property DistanceLeft: Single dispid 104;
    property DistanceRight: Single dispid 105;
  end;

  HangulAndAlphabetExceptions = interface(IDispatch)
    ['{000209D1-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get__NewEnum: IUnknown; safecall;
    function Get_Count: Integer; safecall;
    function Item(var Index: OleVariant): HangulAndAlphabetException; safecall;
    function Add(const Name: WideString): HangulAndAlphabetException; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Count: Integer read Get_Count;
  end;

{ DispInterface declaration for Dual Interface HangulAndAlphabetExceptions }

  HangulAndAlphabetExceptionsDisp = dispinterface
    ['{000209D1-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property _NewEnum: IUnknown readonly dispid -4;
    property Count: Integer readonly dispid 1;
    function Item(var Index: OleVariant): HangulAndAlphabetException; dispid 0;
    function Add(const Name: WideString): HangulAndAlphabetException; dispid 101;
  end;

  HangulAndAlphabetException = interface(IDispatch)
    ['{000209D2-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Index: Integer; safecall;
    function Get_Name: WideString; safecall;
    procedure Delete; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property Index: Integer read Get_Index;
    property Name: WideString read Get_Name;
  end;

{ DispInterface declaration for Dual Interface HangulAndAlphabetException }

  HangulAndAlphabetExceptionDisp = dispinterface
    ['{000209D2-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1002;
    property Index: Integer readonly dispid 1;
    property Name: WideString readonly dispid 2;
    procedure Delete; dispid 101;
  end;

  Adjustments = interface(IDispatch)
    ['{000209C4-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Count: Integer; safecall;
    function Get_Item(Index: Integer): Single; safecall;
    procedure Set_Item(Index: Integer; Value: Single); safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property Count: Integer read Get_Count;
    property Item[Index: Integer]: Single read Get_Item write Set_Item; default;
  end;

{ DispInterface declaration for Dual Interface Adjustments }

  AdjustmentsDisp = dispinterface
    ['{000209C4-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1;
    property Count: Integer readonly dispid 2;
    property Item[Index: Integer]: Single dispid 0; default;
  end;

  CalloutFormat = interface(IDispatch)
    ['{000209C5-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Accent: MsoTriState; safecall;
    procedure Set_Accent(Value: MsoTriState); safecall;
    function Get_Angle: MsoCalloutAngleType; safecall;
    procedure Set_Angle(Value: MsoCalloutAngleType); safecall;
    function Get_AutoAttach: MsoTriState; safecall;
    procedure Set_AutoAttach(Value: MsoTriState); safecall;
    function Get_AutoLength: MsoTriState; safecall;
    function Get_Border: MsoTriState; safecall;
    procedure Set_Border(Value: MsoTriState); safecall;
    function Get_Drop: Single; safecall;
    function Get_DropType: MsoCalloutDropType; safecall;
    function Get_Gap: Single; safecall;
    procedure Set_Gap(Value: Single); safecall;
    function Get_Length: Single; safecall;
    function Get_Type_: MsoCalloutType; safecall;
    procedure Set_Type_(Value: MsoCalloutType); safecall;
    procedure AutomaticLength; safecall;
    procedure CustomDrop(Drop: Single); safecall;
    procedure CustomLength(Length: Single); safecall;
    procedure PresetDrop(DropType: MsoCalloutDropType); safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property Accent: MsoTriState read Get_Accent write Set_Accent;
    property Angle: MsoCalloutAngleType read Get_Angle write Set_Angle;
    property AutoAttach: MsoTriState read Get_AutoAttach write Set_AutoAttach;
    property AutoLength: MsoTriState read Get_AutoLength;
    property Border: MsoTriState read Get_Border write Set_Border;
    property Drop: Single read Get_Drop;
    property DropType: MsoCalloutDropType read Get_DropType;
    property Gap: Single read Get_Gap write Set_Gap;
    property Length: Single read Get_Length;
    property Type_: MsoCalloutType read Get_Type_ write Set_Type_;
  end;

{ DispInterface declaration for Dual Interface CalloutFormat }

  CalloutFormatDisp = dispinterface
    ['{000209C5-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1;
    property Accent: MsoTriState dispid 100;
    property Angle: MsoCalloutAngleType dispid 101;
    property AutoAttach: MsoTriState dispid 102;
    property AutoLength: MsoTriState readonly dispid 103;
    property Border: MsoTriState dispid 104;
    property Drop: Single readonly dispid 105;
    property DropType: MsoCalloutDropType readonly dispid 106;
    property Gap: Single dispid 107;
    property Length: Single readonly dispid 108;
    property Type_: MsoCalloutType dispid 109;
    procedure AutomaticLength; dispid 10;
    procedure CustomDrop(Drop: Single); dispid 11;
    procedure CustomLength(Length: Single); dispid 12;
    procedure PresetDrop(DropType: MsoCalloutDropType); dispid 13;
  end;

  ColorFormat = interface(IDispatch)
    ['{000209C6-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_RGB: Integer; safecall;
    procedure Set_RGB(Value: Integer); safecall;
    function Get_SchemeColor: Integer; safecall;
    procedure Set_SchemeColor(Value: Integer); safecall;
    function Get_Type_: MsoColorType; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property RGB: Integer read Get_RGB write Set_RGB;
    property SchemeColor: Integer read Get_SchemeColor write Set_SchemeColor;
    property Type_: MsoColorType read Get_Type_;
  end;

{ DispInterface declaration for Dual Interface ColorFormat }

  ColorFormatDisp = dispinterface
    ['{000209C6-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1;
    property RGB: Integer dispid 0;
    property SchemeColor: Integer dispid 100;
    property Type_: MsoColorType readonly dispid 101;
  end;

  ConnectorFormat = interface(IDispatch)
    ['{000209C7-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_BeginConnected: MsoTriState; safecall;
    function Get_BeginConnectedShape: Shape; safecall;
    function Get_BeginConnectionSite: Integer; safecall;
    function Get_EndConnected: MsoTriState; safecall;
    function Get_EndConnectedShape: Shape; safecall;
    function Get_EndConnectionSite: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Type_: MsoConnectorType; safecall;
    procedure Set_Type_(Value: MsoConnectorType); safecall;
    procedure BeginConnect(var ConnectedShape: Shape; ConnectionSite: Integer); safecall;
    procedure BeginDisconnect; safecall;
    procedure EndConnect(var ConnectedShape: Shape; ConnectionSite: Integer); safecall;
    procedure EndDisconnect; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property BeginConnected: MsoTriState read Get_BeginConnected;
    property BeginConnectedShape: Shape read Get_BeginConnectedShape;
    property BeginConnectionSite: Integer read Get_BeginConnectionSite;
    property EndConnected: MsoTriState read Get_EndConnected;
    property EndConnectedShape: Shape read Get_EndConnectedShape;
    property EndConnectionSite: Integer read Get_EndConnectionSite;
    property Parent: IDispatch read Get_Parent;
    property Type_: MsoConnectorType read Get_Type_ write Set_Type_;
  end;

{ DispInterface declaration for Dual Interface ConnectorFormat }

  ConnectorFormatDisp = dispinterface
    ['{000209C7-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property BeginConnected: MsoTriState readonly dispid 100;
    property BeginConnectedShape: Shape readonly dispid 101;
    property BeginConnectionSite: Integer readonly dispid 102;
    property EndConnected: MsoTriState readonly dispid 103;
    property EndConnectedShape: Shape readonly dispid 104;
    property EndConnectionSite: Integer readonly dispid 105;
    property Parent: IDispatch readonly dispid 1;
    property Type_: MsoConnectorType dispid 106;
    procedure BeginConnect(var ConnectedShape: Shape; ConnectionSite: Integer); dispid 10;
    procedure BeginDisconnect; dispid 11;
    procedure EndConnect(var ConnectedShape: Shape; ConnectionSite: Integer); dispid 12;
    procedure EndDisconnect; dispid 13;
  end;

  FillFormat = interface(IDispatch)
    ['{000209C8-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_BackColor: ColorFormat; safecall;
    function Get_ForeColor: ColorFormat; safecall;
    function Get_GradientColorType: MsoGradientColorType; safecall;
    function Get_GradientDegree: Single; safecall;
    function Get_GradientStyle: MsoGradientStyle; safecall;
    function Get_GradientVariant: Integer; safecall;
    function Get_Pattern: MsoPatternType; safecall;
    function Get_PresetGradientType: MsoPresetGradientType; safecall;
    function Get_PresetTexture: MsoPresetTexture; safecall;
    function Get_TextureName: WideString; safecall;
    function Get_TextureType: MsoTextureType; safecall;
    function Get_Transparency: Single; safecall;
    procedure Set_Transparency(Value: Single); safecall;
    function Get_Type_: MsoFillType; safecall;
    function Get_Visible: MsoTriState; safecall;
    procedure Set_Visible(Value: MsoTriState); safecall;
    procedure Background; safecall;
    procedure OneColorGradient(Style: MsoGradientStyle; Variant: Integer; Degree: Single); safecall;
    procedure Patterned(Pattern: MsoPatternType); safecall;
    procedure PresetGradient(Style: MsoGradientStyle; Variant: Integer; PresetGradientType: MsoPresetGradientType); safecall;
    procedure PresetTextured(PresetTexture: MsoPresetTexture); safecall;
    procedure Solid; safecall;
    procedure TwoColorGradient(Style: MsoGradientStyle; Variant: Integer); safecall;
    procedure UserPicture(const PictureFile: WideString); safecall;
    procedure UserTextured(const TextureFile: WideString); safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property BackColor: ColorFormat read Get_BackColor;
    property ForeColor: ColorFormat read Get_ForeColor;
    property GradientColorType: MsoGradientColorType read Get_GradientColorType;
    property GradientDegree: Single read Get_GradientDegree;
    property GradientStyle: MsoGradientStyle read Get_GradientStyle;
    property GradientVariant: Integer read Get_GradientVariant;
    property Pattern: MsoPatternType read Get_Pattern;
    property PresetGradientType: MsoPresetGradientType read Get_PresetGradientType;
    property PresetTexture: MsoPresetTexture read Get_PresetTexture;
    property TextureName: WideString read Get_TextureName;
    property TextureType: MsoTextureType read Get_TextureType;
    property Transparency: Single read Get_Transparency write Set_Transparency;
    property Type_: MsoFillType read Get_Type_;
    property Visible: MsoTriState read Get_Visible write Set_Visible;
  end;

{ DispInterface declaration for Dual Interface FillFormat }

  FillFormatDisp = dispinterface
    ['{000209C8-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1;
    property BackColor: ColorFormat readonly dispid 100;
    property ForeColor: ColorFormat readonly dispid 101;
    property GradientColorType: MsoGradientColorType readonly dispid 102;
    property GradientDegree: Single readonly dispid 103;
    property GradientStyle: MsoGradientStyle readonly dispid 104;
    property GradientVariant: Integer readonly dispid 105;
    property Pattern: MsoPatternType readonly dispid 106;
    property PresetGradientType: MsoPresetGradientType readonly dispid 107;
    property PresetTexture: MsoPresetTexture readonly dispid 108;
    property TextureName: WideString readonly dispid 109;
    property TextureType: MsoTextureType readonly dispid 110;
    property Transparency: Single dispid 111;
    property Type_: MsoFillType readonly dispid 112;
    property Visible: MsoTriState dispid 113;
    procedure Background; dispid 10;
    procedure OneColorGradient(Style: MsoGradientStyle; Variant: Integer; Degree: Single); dispid 11;
    procedure Patterned(Pattern: MsoPatternType); dispid 12;
    procedure PresetGradient(Style: MsoGradientStyle; Variant: Integer; PresetGradientType: MsoPresetGradientType); dispid 13;
    procedure PresetTextured(PresetTexture: MsoPresetTexture); dispid 14;
    procedure Solid; dispid 15;
    procedure TwoColorGradient(Style: MsoGradientStyle; Variant: Integer); dispid 16;
    procedure UserPicture(const PictureFile: WideString); dispid 17;
    procedure UserTextured(const TextureFile: WideString); dispid 18;
  end;

  FreeformBuilder = interface(IDispatch)
    ['{000209C9-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    procedure AddNodes(SegmentType: MsoSegmentType; EditingType: MsoEditingType; X1, Y1, X2, Y2, X3, Y3: Single); safecall;
    function ConvertToShape(var Anchor: OleVariant): Shape; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
  end;

{ DispInterface declaration for Dual Interface FreeformBuilder }

  FreeformBuilderDisp = dispinterface
    ['{000209C9-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1;
    procedure AddNodes(SegmentType: MsoSegmentType; EditingType: MsoEditingType; X1, Y1, X2, Y2, X3, Y3: Single); dispid 10;
    function ConvertToShape(var Anchor: OleVariant): Shape; dispid 11;
  end;

  LineFormat = interface(IDispatch)
    ['{000209CA-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_BackColor: ColorFormat; safecall;
    function Get_BeginArrowheadLength: MsoArrowheadLength; safecall;
    procedure Set_BeginArrowheadLength(Value: MsoArrowheadLength); safecall;
    function Get_BeginArrowheadStyle: MsoArrowheadStyle; safecall;
    procedure Set_BeginArrowheadStyle(Value: MsoArrowheadStyle); safecall;
    function Get_BeginArrowheadWidth: MsoArrowheadWidth; safecall;
    procedure Set_BeginArrowheadWidth(Value: MsoArrowheadWidth); safecall;
    function Get_DashStyle: MsoLineDashStyle; safecall;
    procedure Set_DashStyle(Value: MsoLineDashStyle); safecall;
    function Get_EndArrowheadLength: MsoArrowheadLength; safecall;
    procedure Set_EndArrowheadLength(Value: MsoArrowheadLength); safecall;
    function Get_EndArrowheadStyle: MsoArrowheadStyle; safecall;
    procedure Set_EndArrowheadStyle(Value: MsoArrowheadStyle); safecall;
    function Get_EndArrowheadWidth: MsoArrowheadWidth; safecall;
    procedure Set_EndArrowheadWidth(Value: MsoArrowheadWidth); safecall;
    function Get_ForeColor: ColorFormat; safecall;
    function Get_Pattern: MsoPatternType; safecall;
    procedure Set_Pattern(Value: MsoPatternType); safecall;
    function Get_Style: MsoLineStyle; safecall;
    procedure Set_Style(Value: MsoLineStyle); safecall;
    function Get_Transparency: Single; safecall;
    procedure Set_Transparency(Value: Single); safecall;
    function Get_Visible: MsoTriState; safecall;
    procedure Set_Visible(Value: MsoTriState); safecall;
    function Get_Weight: Single; safecall;
    procedure Set_Weight(Value: Single); safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property BackColor: ColorFormat read Get_BackColor;
    property BeginArrowheadLength: MsoArrowheadLength read Get_BeginArrowheadLength write Set_BeginArrowheadLength;
    property BeginArrowheadStyle: MsoArrowheadStyle read Get_BeginArrowheadStyle write Set_BeginArrowheadStyle;
    property BeginArrowheadWidth: MsoArrowheadWidth read Get_BeginArrowheadWidth write Set_BeginArrowheadWidth;
    property DashStyle: MsoLineDashStyle read Get_DashStyle write Set_DashStyle;
    property EndArrowheadLength: MsoArrowheadLength read Get_EndArrowheadLength write Set_EndArrowheadLength;
    property EndArrowheadStyle: MsoArrowheadStyle read Get_EndArrowheadStyle write Set_EndArrowheadStyle;
    property EndArrowheadWidth: MsoArrowheadWidth read Get_EndArrowheadWidth write Set_EndArrowheadWidth;
    property ForeColor: ColorFormat read Get_ForeColor;
    property Pattern: MsoPatternType read Get_Pattern write Set_Pattern;
    property Style: MsoLineStyle read Get_Style write Set_Style;
    property Transparency: Single read Get_Transparency write Set_Transparency;
    property Visible: MsoTriState read Get_Visible write Set_Visible;
    property Weight: Single read Get_Weight write Set_Weight;
  end;

{ DispInterface declaration for Dual Interface LineFormat }

  LineFormatDisp = dispinterface
    ['{000209CA-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1;
    property BackColor: ColorFormat readonly dispid 100;
    property BeginArrowheadLength: MsoArrowheadLength dispid 101;
    property BeginArrowheadStyle: MsoArrowheadStyle dispid 102;
    property BeginArrowheadWidth: MsoArrowheadWidth dispid 103;
    property DashStyle: MsoLineDashStyle dispid 104;
    property EndArrowheadLength: MsoArrowheadLength dispid 105;
    property EndArrowheadStyle: MsoArrowheadStyle dispid 106;
    property EndArrowheadWidth: MsoArrowheadWidth dispid 107;
    property ForeColor: ColorFormat readonly dispid 108;
    property Pattern: MsoPatternType dispid 109;
    property Style: MsoLineStyle dispid 110;
    property Transparency: Single dispid 111;
    property Visible: MsoTriState dispid 112;
    property Weight: Single dispid 113;
  end;

  PictureFormat = interface(IDispatch)
    ['{000209CB-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Brightness: Single; safecall;
    procedure Set_Brightness(Value: Single); safecall;
    function Get_ColorType: MsoPictureColorType; safecall;
    procedure Set_ColorType(Value: MsoPictureColorType); safecall;
    function Get_Contrast: Single; safecall;
    procedure Set_Contrast(Value: Single); safecall;
    function Get_CropBottom: Single; safecall;
    procedure Set_CropBottom(Value: Single); safecall;
    function Get_CropLeft: Single; safecall;
    procedure Set_CropLeft(Value: Single); safecall;
    function Get_CropRight: Single; safecall;
    procedure Set_CropRight(Value: Single); safecall;
    function Get_CropTop: Single; safecall;
    procedure Set_CropTop(Value: Single); safecall;
    function Get_TransparencyColor: Integer; safecall;
    procedure Set_TransparencyColor(Value: Integer); safecall;
    function Get_TransparentBackground: MsoTriState; safecall;
    procedure Set_TransparentBackground(Value: MsoTriState); safecall;
    procedure IncrementBrightness(Increment: Single); safecall;
    procedure IncrementContrast(Increment: Single); safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property Brightness: Single read Get_Brightness write Set_Brightness;
    property ColorType: MsoPictureColorType read Get_ColorType write Set_ColorType;
    property Contrast: Single read Get_Contrast write Set_Contrast;
    property CropBottom: Single read Get_CropBottom write Set_CropBottom;
    property CropLeft: Single read Get_CropLeft write Set_CropLeft;
    property CropRight: Single read Get_CropRight write Set_CropRight;
    property CropTop: Single read Get_CropTop write Set_CropTop;
    property TransparencyColor: Integer read Get_TransparencyColor write Set_TransparencyColor;
    property TransparentBackground: MsoTriState read Get_TransparentBackground write Set_TransparentBackground;
  end;

{ DispInterface declaration for Dual Interface PictureFormat }

  PictureFormatDisp = dispinterface
    ['{000209CB-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1;
    property Brightness: Single dispid 100;
    property ColorType: MsoPictureColorType dispid 101;
    property Contrast: Single dispid 102;
    property CropBottom: Single dispid 103;
    property CropLeft: Single dispid 104;
    property CropRight: Single dispid 105;
    property CropTop: Single dispid 106;
    property TransparencyColor: Integer dispid 107;
    property TransparentBackground: MsoTriState dispid 108;
    procedure IncrementBrightness(Increment: Single); dispid 10;
    procedure IncrementContrast(Increment: Single); dispid 11;
  end;

  ShadowFormat = interface(IDispatch)
    ['{000209CC-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_ForeColor: ColorFormat; safecall;
    function Get_Obscured: MsoTriState; safecall;
    procedure Set_Obscured(Value: MsoTriState); safecall;
    function Get_OffsetX: Single; safecall;
    procedure Set_OffsetX(Value: Single); safecall;
    function Get_OffsetY: Single; safecall;
    procedure Set_OffsetY(Value: Single); safecall;
    function Get_Transparency: Single; safecall;
    procedure Set_Transparency(Value: Single); safecall;
    function Get_Type_: MsoShadowType; safecall;
    procedure Set_Type_(Value: MsoShadowType); safecall;
    function Get_Visible: MsoTriState; safecall;
    procedure Set_Visible(Value: MsoTriState); safecall;
    procedure IncrementOffsetX(Increment: Single); safecall;
    procedure IncrementOffsetY(Increment: Single); safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property ForeColor: ColorFormat read Get_ForeColor;
    property Obscured: MsoTriState read Get_Obscured write Set_Obscured;
    property OffsetX: Single read Get_OffsetX write Set_OffsetX;
    property OffsetY: Single read Get_OffsetY write Set_OffsetY;
    property Transparency: Single read Get_Transparency write Set_Transparency;
    property Type_: MsoShadowType read Get_Type_ write Set_Type_;
    property Visible: MsoTriState read Get_Visible write Set_Visible;
  end;

{ DispInterface declaration for Dual Interface ShadowFormat }

  ShadowFormatDisp = dispinterface
    ['{000209CC-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1;
    property ForeColor: ColorFormat readonly dispid 100;
    property Obscured: MsoTriState dispid 101;
    property OffsetX: Single dispid 102;
    property OffsetY: Single dispid 103;
    property Transparency: Single dispid 104;
    property Type_: MsoShadowType dispid 105;
    property Visible: MsoTriState dispid 106;
    procedure IncrementOffsetX(Increment: Single); dispid 10;
    procedure IncrementOffsetY(Increment: Single); dispid 11;
  end;

  ShapeNode = interface(IDispatch)
    ['{000209CD-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_EditingType: MsoEditingType; safecall;
    function Get_Points: OleVariant; safecall;
    function Get_SegmentType: MsoSegmentType; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property EditingType: MsoEditingType read Get_EditingType;
    property Points: OleVariant read Get_Points;
    property SegmentType: MsoSegmentType read Get_SegmentType;
  end;

{ DispInterface declaration for Dual Interface ShapeNode }

  ShapeNodeDisp = dispinterface
    ['{000209CD-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1;
    property EditingType: MsoEditingType readonly dispid 100;
    property Points: OleVariant readonly dispid 101;
    property SegmentType: MsoSegmentType readonly dispid 102;
  end;

  ShapeNodes = interface(IDispatch)
    ['{000209CE-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Count: Integer; safecall;
    function Get__NewEnum: IUnknown; safecall;
    procedure Delete(Index: Integer); safecall;
    function Item(var Index: OleVariant): ShapeNode; safecall;
    procedure SetEditingType(Index: Integer; EditingType: MsoEditingType); safecall;
    procedure SetPosition(Index: Integer; X1, Y1: Single); safecall;
    procedure SetSegmentType(Index: Integer; SegmentType: MsoSegmentType); safecall;
    procedure Insert(Index: Integer; SegmentType: MsoSegmentType; EditingType: MsoEditingType; X1, Y1, X2, Y2, X3, Y3: Single); safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property Count: Integer read Get_Count;
    property _NewEnum: IUnknown read Get__NewEnum;
  end;

{ DispInterface declaration for Dual Interface ShapeNodes }

  ShapeNodesDisp = dispinterface
    ['{000209CE-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1;
    property Count: Integer readonly dispid 2;
    property _NewEnum: IUnknown readonly dispid -4;
    procedure Delete(Index: Integer); dispid 11;
    function Item(var Index: OleVariant): ShapeNode; dispid 0;
    procedure SetEditingType(Index: Integer; EditingType: MsoEditingType); dispid 13;
    procedure SetPosition(Index: Integer; X1, Y1: Single); dispid 14;
    procedure SetSegmentType(Index: Integer; SegmentType: MsoSegmentType); dispid 15;
    procedure Insert(Index: Integer; SegmentType: MsoSegmentType; EditingType: MsoEditingType; X1, Y1, X2, Y2, X3, Y3: Single); dispid 12;
  end;

  TextEffectFormat = interface(IDispatch)
    ['{000209CF-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Alignment: MsoTextEffectAlignment; safecall;
    procedure Set_Alignment(Value: MsoTextEffectAlignment); safecall;
    function Get_FontBold: MsoTriState; safecall;
    procedure Set_FontBold(Value: MsoTriState); safecall;
    function Get_FontItalic: MsoTriState; safecall;
    procedure Set_FontItalic(Value: MsoTriState); safecall;
    function Get_FontName: WideString; safecall;
    procedure Set_FontName(const Value: WideString); safecall;
    function Get_FontSize: Single; safecall;
    procedure Set_FontSize(Value: Single); safecall;
    function Get_KernedPairs: MsoTriState; safecall;
    procedure Set_KernedPairs(Value: MsoTriState); safecall;
    function Get_NormalizedHeight: MsoTriState; safecall;
    procedure Set_NormalizedHeight(Value: MsoTriState); safecall;
    function Get_PresetShape: MsoPresetTextEffectShape; safecall;
    procedure Set_PresetShape(Value: MsoPresetTextEffectShape); safecall;
    function Get_PresetTextEffect: MsoPresetTextEffect; safecall;
    procedure Set_PresetTextEffect(Value: MsoPresetTextEffect); safecall;
    function Get_RotatedChars: MsoTriState; safecall;
    procedure Set_RotatedChars(Value: MsoTriState); safecall;
    function Get_Text: WideString; safecall;
    procedure Set_Text(const Value: WideString); safecall;
    function Get_Tracking: Single; safecall;
    procedure Set_Tracking(Value: Single); safecall;
    procedure ToggleVerticalText; safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property Alignment: MsoTextEffectAlignment read Get_Alignment write Set_Alignment;
    property FontBold: MsoTriState read Get_FontBold write Set_FontBold;
    property FontItalic: MsoTriState read Get_FontItalic write Set_FontItalic;
    property FontName: WideString read Get_FontName write Set_FontName;
    property FontSize: Single read Get_FontSize write Set_FontSize;
    property KernedPairs: MsoTriState read Get_KernedPairs write Set_KernedPairs;
    property NormalizedHeight: MsoTriState read Get_NormalizedHeight write Set_NormalizedHeight;
    property PresetShape: MsoPresetTextEffectShape read Get_PresetShape write Set_PresetShape;
    property PresetTextEffect: MsoPresetTextEffect read Get_PresetTextEffect write Set_PresetTextEffect;
    property RotatedChars: MsoTriState read Get_RotatedChars write Set_RotatedChars;
    property Text: WideString read Get_Text write Set_Text;
    property Tracking: Single read Get_Tracking write Set_Tracking;
  end;

{ DispInterface declaration for Dual Interface TextEffectFormat }

  TextEffectFormatDisp = dispinterface
    ['{000209CF-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1;
    property Alignment: MsoTextEffectAlignment dispid 100;
    property FontBold: MsoTriState dispid 101;
    property FontItalic: MsoTriState dispid 102;
    property FontName: WideString dispid 103;
    property FontSize: Single dispid 104;
    property KernedPairs: MsoTriState dispid 105;
    property NormalizedHeight: MsoTriState dispid 106;
    property PresetShape: MsoPresetTextEffectShape dispid 107;
    property PresetTextEffect: MsoPresetTextEffect dispid 108;
    property RotatedChars: MsoTriState dispid 109;
    property Text: WideString dispid 110;
    property Tracking: Single dispid 111;
    procedure ToggleVerticalText; dispid 10;
  end;

  ThreeDFormat = interface(IDispatch)
    ['{000209D0-0000-0000-C000-000000000046}']
    function Get_Application: Application; safecall;
    function Get_Creator: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Get_Depth: Single; safecall;
    procedure Set_Depth(Value: Single); safecall;
    function Get_ExtrusionColor: ColorFormat; safecall;
    function Get_ExtrusionColorType: MsoExtrusionColorType; safecall;
    procedure Set_ExtrusionColorType(Value: MsoExtrusionColorType); safecall;
    function Get_Perspective: MsoTriState; safecall;
    procedure Set_Perspective(Value: MsoTriState); safecall;
    function Get_PresetExtrusionDirection: MsoPresetExtrusionDirection; safecall;
    function Get_PresetLightingDirection: MsoPresetLightingDirection; safecall;
    procedure Set_PresetLightingDirection(Value: MsoPresetLightingDirection); safecall;
    function Get_PresetLightingSoftness: MsoPresetLightingSoftness; safecall;
    procedure Set_PresetLightingSoftness(Value: MsoPresetLightingSoftness); safecall;
    function Get_PresetMaterial: MsoPresetMaterial; safecall;
    procedure Set_PresetMaterial(Value: MsoPresetMaterial); safecall;
    function Get_PresetThreeDFormat: MsoPresetThreeDFormat; safecall;
    function Get_RotationX: Single; safecall;
    procedure Set_RotationX(Value: Single); safecall;
    function Get_RotationY: Single; safecall;
    procedure Set_RotationY(Value: Single); safecall;
    function Get_Visible: MsoTriState; safecall;
    procedure Set_Visible(Value: MsoTriState); safecall;
    procedure IncrementRotationX(Increment: Single); safecall;
    procedure IncrementRotationY(Increment: Single); safecall;
    procedure ResetRotation; safecall;
    procedure SetExtrusionDirection(PresetExtrusionDirection: MsoPresetExtrusionDirection); safecall;
    procedure SetThreeDFormat(PresetThreeDFormat: MsoPresetThreeDFormat); safecall;
    property Application: Application read Get_Application;
    property Creator: Integer read Get_Creator;
    property Parent: IDispatch read Get_Parent;
    property Depth: Single read Get_Depth write Set_Depth;
    property ExtrusionColor: ColorFormat read Get_ExtrusionColor;
    property ExtrusionColorType: MsoExtrusionColorType read Get_ExtrusionColorType write Set_ExtrusionColorType;
    property Perspective: MsoTriState read Get_Perspective write Set_Perspective;
    property PresetExtrusionDirection: MsoPresetExtrusionDirection read Get_PresetExtrusionDirection;
    property PresetLightingDirection: MsoPresetLightingDirection read Get_PresetLightingDirection write Set_PresetLightingDirection;
    property PresetLightingSoftness: MsoPresetLightingSoftness read Get_PresetLightingSoftness write Set_PresetLightingSoftness;
    property PresetMaterial: MsoPresetMaterial read Get_PresetMaterial write Set_PresetMaterial;
    property PresetThreeDFormat: MsoPresetThreeDFormat read Get_PresetThreeDFormat;
    property RotationX: Single read Get_RotationX write Set_RotationX;
    property RotationY: Single read Get_RotationY write Set_RotationY;
    property Visible: MsoTriState read Get_Visible write Set_Visible;
  end;

{ DispInterface declaration for Dual Interface ThreeDFormat }

  ThreeDFormatDisp = dispinterface
    ['{000209D0-0000-0000-C000-000000000046}']
    property Application: Application readonly dispid 1000;
    property Creator: Integer readonly dispid 1001;
    property Parent: IDispatch readonly dispid 1;
    property Depth: Single dispid 100;
    property ExtrusionColor: ColorFormat readonly dispid 101;
    property ExtrusionColorType: MsoExtrusionColorType dispid 102;
    property Perspective: MsoTriState dispid 103;
    property PresetExtrusionDirection: MsoPresetExtrusionDirection readonly dispid 104;
    property PresetLightingDirection: MsoPresetLightingDirection dispid 105;
    property PresetLightingSoftness: MsoPresetLightingSoftness dispid 106;
    property PresetMaterial: MsoPresetMaterial dispid 107;
    property PresetThreeDFormat: MsoPresetThreeDFormat readonly dispid 108;
    property RotationX: Single dispid 109;
    property RotationY: Single dispid 110;
    property Visible: MsoTriState dispid 111;
    procedure IncrementRotationX(Increment: Single); dispid 10;
    procedure IncrementRotationY(Increment: Single); dispid 11;
    procedure ResetRotation; dispid 12;
    procedure SetExtrusionDirection(PresetExtrusionDirection: MsoPresetExtrusionDirection); dispid 14;
    procedure SetThreeDFormat(PresetThreeDFormat: MsoPresetThreeDFormat); dispid 13;
  end;

  ApplicationEvents = dispinterface
    ['{000209F7-0000-0000-C000-000000000046}']
    procedure Quit; dispid 2;
    procedure DocumentChange; dispid 3;
  end;

  DocumentEvents = dispinterface
    ['{000209F6-0000-0000-C000-000000000046}']
    procedure New; dispid 4;
    procedure Open; dispid 5;
    procedure Close; dispid 6;
  end;

  OCXEvents = dispinterface
    ['{000209F3-0000-0000-C000-000000000046}']
    procedure GotFocus; dispid -2147417888;
    procedure LostFocus; dispid -2147417887;
  end;

  CoGlobal = class
    class function Create: _Global;
    class function CreateRemote(const MachineName: string): _Global;
  end;

  CoApplication = class
    class function Create: _Application;
    class function CreateRemote(const MachineName: string): _Application;
  end;

  CoDocument = class
    class function Create: _Document;
    class function CreateRemote(const MachineName: string): _Document;
  end;

  CoFont = class
    class function Create: _Font;
    class function CreateRemote(const MachineName: string): _Font;
  end;

  CoParagraphFormat = class
    class function Create: _ParagraphFormat;
    class function CreateRemote(const MachineName: string): _ParagraphFormat;
  end;

  CoOLEControl = class
    class function Create: _OLEControl;
    class function CreateRemote(const MachineName: string): _OLEControl;
  end;

  CoLetterContent = class
    class function Create: _LetterContent;
    class function CreateRemote(const MachineName: string): _LetterContent;
  end;



implementation

uses ComObj;

class function CoGlobal.Create: _Global;
begin
  Result := CreateComObject(Class_Global) as _Global;
end;

class function CoGlobal.CreateRemote(const MachineName: string): _Global;
begin
  Result := CreateRemoteComObject(MachineName, Class_Global) as _Global;
end;

class function CoApplication.Create: _Application;
begin
  Result := CreateComObject(Class_Application) as _Application;
end;

class function CoApplication.CreateRemote(const MachineName: string): _Application;
begin
  Result := CreateRemoteComObject(MachineName, Class_Application) as _Application;
end;

class function CoDocument.Create: _Document;
begin
  Result := CreateComObject(Class_Document) as _Document;
end;

class function CoDocument.CreateRemote(const MachineName: string): _Document;
begin
  Result := CreateRemoteComObject(MachineName, Class_Document) as _Document;
end;

class function CoFont.Create: _Font;
begin
  Result := CreateComObject(Class_Font) as _Font;
end;

class function CoFont.CreateRemote(const MachineName: string): _Font;
begin
  Result := CreateRemoteComObject(MachineName, Class_Font) as _Font;
end;

class function CoParagraphFormat.Create: _ParagraphFormat;
begin
  Result := CreateComObject(Class_ParagraphFormat) as _ParagraphFormat;
end;

class function CoParagraphFormat.CreateRemote(const MachineName: string): _ParagraphFormat;
begin
  Result := CreateRemoteComObject(MachineName, Class_ParagraphFormat) as _ParagraphFormat;
end;

class function CoOLEControl.Create: _OLEControl;
begin
  Result := CreateComObject(Class_OLEControl) as _OLEControl;
end;

class function CoOLEControl.CreateRemote(const MachineName: string): _OLEControl;
begin
  Result := CreateRemoteComObject(MachineName, Class_OLEControl) as _OLEControl;
end;

class function CoLetterContent.Create: _LetterContent;
begin
  Result := CreateComObject(Class_LetterContent) as _LetterContent;
end;

class function CoLetterContent.CreateRemote(const MachineName: string): _LetterContent;
begin
  Result := CreateRemoteComObject(MachineName, Class_LetterContent) as _LetterContent;
end;


end.
