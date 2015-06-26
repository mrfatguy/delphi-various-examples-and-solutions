{*******************************************************************************
   Class: TSortGrid
   Copyright © 1996
   Author: Bill Menees
           bmenees@usit.net
           www.public.usit.net/bmenees
   Modified by Eric W. Engler, Feb 1997
    - fixed a bug in autodetection of type
    - OnBeginSort event was called before the autodetect of type; moved to after.
    - expanded date sort to incl datetime (these are usu compatible in Delphi)
    - added a time sort

   IMPORTANT!  Do NOT use Delphi's "Break on Exception" option if you run
   a program that uses this component from the Delphi GUI.  This VCL uses
   exceptions during normal processing.
*******************************************************************************}
unit SortGrid;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids;

type
  TSortStyle = (ssAutomatic, ssAlphabetic, ssNumeric, ssDateTime, ssTime,ssCustom);
  {TSortCompare must return < 0 if Str1 is less than Str2,
   0 if they are equal, and > 0 if Str1 is greater than Str2.}
  TSortCompare = function (const Str1, Str2: String): Integer;
  TSortDirection = (sdAscending, sdDescending);
  {**************************************************************}
  {*** NOTE: These are the options you can set to affect sorting.}
  TSortOptions = record
      SortStyle: TSortStyle;
      SortDirection: TSortDirection;
      SortCaseSensitive: Boolean;
      SortCompare: TSortCompare;  //Used only if SortStyle = ssCustom.
  end;

  TSortedListEntry = record
      Str: String;
      RowNum: Longint;
  end;
  PSortedListEntry = ^TSortedListEntry;
  TSortedList = class(TList)
  public
        function GetItem(const i: Integer): PSortedListEntry;
        procedure Reset;
  end;

  TCellBevelStyle = (cbNone, cbRaised, cbLowered);
  {**********************************************************}
  {*** NOTE: This is one of the structures in TFormatOptions.}
  TCellBevel = record
      Style: TCellBevelStyle;
      UpperLeftColor: TColor;
      LowerRightColor: TColor;
  end;
  TVertAlignment = (taTopJustify, taBottomJustify, taMiddle);
  {**************************************************}
  {*** NOTE: These are the display options you can set
             for each cell in OnGetCellFormat.}
  TFormatOptions = record
      Brush: TBrush;
      Font: TFont;
      AlignmentHorz: TAlignment;
      AlignmentVert: TVertAlignment;
      Bevel: TCellBevel;
      HideText: Boolean;
  end;

  {These are the new events defined for TSortGrid.}
  TFormatDrawCellEvent = procedure(Sender: TObject; Col, Row: Longint;
                          State: TGridDrawState;
                          var FormatOptions: TFormatOptions) of object;
  TClickSortEvent = procedure(Sender: TObject; Col, Row: Longint;
                          var SortOptions: TSortOptions) of object;
  TUpdateGridEvent = procedure(Sender: TObject; Index: Longint) of object;
  TSizeChangedEvent = procedure(Sender: TObject; OldColCount, OldRowCount: Longint) of object;
  TBeginSortEvent = procedure(Sender: TObject; Col: Longint; var SortOptions: TSortOptions) of object;
  TEndSortEvent = procedure(Sender: TObject; Col: Longint) of object;
  TCellValidateEvent = procedure(Sender: TObject; Col, Row: Longint;
                     var Value: String; var Valid: Boolean) of object;

  {Here's the main new class: TSortGrid}
  TSortGrid = class(TStringGrid)
  private
    { Private declarations }
    fCaseSensitive: Boolean;
    fSortedList: TSortedList;
    fAlignmentHorz: TAlignment;
    fAlignmentVert: TVertAlignment;
    fClickSorting: Boolean;
    fBevelStyle: TCellBevelStyle;
    fProportionalScrollBars: Boolean;
    fExtendedKeys: Boolean;
    fSorting: Boolean;
    fModified: Boolean;
    fOldCellText: String;
    fOldCol, fOldRow: Longint;
    fOldModifiedValue: Boolean;
    fEntered: Boolean;

    fOnGetCellFormat: TFormatDrawCellEvent;
    fOnClickSort: TClickSortEvent;
    fOnRowInsert: TUpdateGridEvent;
    fOnRowDelete: TUpdateGridEvent;
    fOnColumnInsert: TUpdateGridEvent;
    fOnColumnDelete: TUpdateGridEvent;
    fOnColumnWidthsChanged: TNotifyEvent;
    fOnRowHeightsChanged: TNotifyEvent;
    fOnSizeChanged: TSizeChangedEvent;
    fOnBeginSort: TBeginSortEvent;
    fOnEndSort: TEndSortEvent;
    fOnCellValidate: TCellValidateEvent;

    procedure SetAlignmentHorz(Value: TAlignment);
    procedure SetAlignmentVert(Value: TVertAlignment);
    procedure SetBevelStyle(Value: TCellBevelStyle);
    procedure WMSize(var Msg: TWMSize); message WM_SIZE;
    procedure SetProportionalScrollBars(Value: Boolean);
  protected
    { Protected declarations }
    procedure ListQuickSort(const ACol: Longint; const SortOptions: TSortOptions); virtual;
    function DetermineSortStyle(const ACol: Longint): TSortStyle; virtual;
    procedure InitializeFormatOptions(var FmtOpts: TFormatOptions);
    procedure DrawCell(ACol, ARow: Longint; ARect: TRect; AState: TGridDrawState); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure ColWidthsChanged; override;
    procedure RowHeightsChanged; override;
    procedure SizeChanged(OldColCount, OldRowCount: Longint); override;
    procedure UpdateScrollPage; virtual;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure SetEditText(ACol, ARow: Longint; const Value: string); override;
    procedure Click; override;
    procedure DoEnter; override;
    procedure DoExit; override;
    procedure InitValidate; virtual;
    procedure KeyPress(var Key: Char); override;
public
    { Public declarations }
    { run time properties }
    property Sorting: Boolean read fSorting default False;
    property Modified: Boolean read fModified write fModified default False;

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure MoveTo(ACol, ARow: Longint); virtual;
    procedure Clear; virtual;
    procedure InsertRow(ARow: Longint); virtual;
    procedure InsertColumn(ACol: Longint); virtual;
    procedure DeleteRow(ARow: Longint); virtual;
    procedure DeleteColumn(ACol: Longint); virtual;
    procedure MoveRow(FromIndex, ToIndex: Longint); virtual;
    procedure MoveColumn(FromIndex, ToIndex: Longint); virtual;
    procedure SwapRows(ARow1, ARow2: Longint); virtual;
    procedure SwapColumns(ACol1, ACol2: Longint); virtual;

    procedure AutoSizeCol(const ACol: LongInt); virtual;
    procedure AutoSizeColumns(const DoFixedCols: Boolean; const Padding: Integer); virtual;
    procedure SortByColumn(const ACol: LongInt; SortOptions: TSortOptions); virtual;
    function IsCell(const Value: String; var ACol, ARow: Longint): Boolean; virtual;
    procedure LoadFromFile(const FileName: String; const Delimiter: Char); virtual;
    procedure SaveToFile(const FileName: String; const Delimiter: Char); virtual;
    function CanUndoSort: Boolean; virtual;
    procedure UndoSort; virtual;
    function GetCellDrawState(const ACol, ARow: Longint): TGridDrawState;
    function SelectCell(ACol, ARow: Longint): Boolean; override;
    procedure ValidateCell; virtual;

  published
    { Published declarations }
    property CaseSensitive: Boolean read fCaseSensitive write fCaseSensitive;
    property AlignmentHorz: TAlignment read fAlignmentHorz write SetAlignmentHorz;
    property AlignmentVert: TVertAlignment read fAlignmentVert write SetAlignmentVert;
    property ClickSorting: Boolean read fClickSorting write fClickSorting;
    property BevelStyle: TCellBevelStyle read fBevelStyle write SetBevelStyle;
    property ProportionalScrollBars: Boolean read fProportionalScrollBars
                                             write SetProportionalScrollBars;
    property ExtendedKeys: Boolean read fExtendedKeys write fExtendedKeys;

    { Published events }
    property OnGetCellFormat: TFormatDrawCellEvent read fOnGetCellFormat write fOnGetCellFormat;
    property OnClickSort: TClickSortEvent read fOnClickSort write fOnClickSort;
    property OnRowInsert: TUpdateGridEvent read fOnRowInsert write fOnRowInsert;
    property OnRowDelete: TUpdateGridEvent read fOnRowDelete write fOnRowDelete;
    property OnColumnInsert: TUpdateGridEvent read fOnColumnInsert write fOnColumnInsert;
    property OnColumnDelete: TUpdateGridEvent read fOnColumnDelete write fOnColumnDelete;
    property OnColumnWidthsChanged: TNotifyEvent read fOnColumnWidthsChanged write fOnColumnWidthsChanged;
    property OnRowHeightsChanged: TNotifyEvent read fOnRowHeightsChanged write fOnRowHeightsChanged;
    property OnSizeChanged: TSizeChangedEvent read fOnSizeChanged write fOnSizeChanged;
    property OnBeginSort: TBeginSortEvent read fOnBeginSort write fOnBeginSort;
    property OnEndSort: TEndSortEvent read fOnEndSort write fOnEndSort;
    property OnCellValidate: TCellValidateEvent read fOnCellValidate write fOnCellValidate;
  end;

procedure Register;
function StringCompare(const Str1, Str2: String): Integer;
function DateTimeCompare(const Str1, Str2: String): Integer;
function NumericCompare(const Str1, Str2: String): Integer;
function TimeCompare(const Str1, Str2: String): Integer;

implementation

{$R SortGrid.Res}

var
   //This is here for Compare.  I can't pass it as a parameter,
   //and I can't make Compare a method.  So I had to use a global. :-(
   GlobalSortOptions: TSortOptions;

{******************************************************************************}
{** Miscellaneous Non-Member Functions                                       **}
{******************************************************************************}
procedure TokenizeGridString(const S: String; const Delimiter: Char; Tokens: TStringList);
var
   i, Len: Integer;
   CurToken: String;
begin
     Tokens.Clear;
     CurToken:='';
     Len:=Length(S);
     for i:=1 to Len do
     begin
          if S[i] = Delimiter then
          begin
               Tokens.Add(CurToken);
               CurToken:='';
          end
          else
              CurToken:=CurToken+S[i];
     end;
     Tokens.Add(CurToken);
end;

function StringCompare(const Str1, Str2: String): Integer;
begin
     if Str1 < Str2 then Result:=-1
     else if Str2 < Str1 then Result:=1
     else Result:=0;
end;

function DateTimeCompare(const Str1, Str2: String): Integer;
var
   Val1, Val2: TDateTime;
begin
     try
        Val1:=StrToDateTime(Str1);
        Val2:=StrToDateTime(Str2);
        if Val1 < Val2 then Result:=-1
        else if Val2 < Val1 then Result:=1
        else Result:=0;
     except
        on EConvertError do Result:=0;
     end;
end;

function TimeCompare(const Str1, Str2: String): Integer;
var
   Val1, Val2: TDateTime;
begin
     try
        Val1:=StrToTime(Str1);
        Val2:=StrToTime(Str2);
        if Val1 < Val2 then Result:=-1
        else if Val2 < Val1 then Result:=1
        else Result:=0;
     except
        on EConvertError do Result:=0;
     end;
end;

function NumericCompare(const Str1, Str2: String): Integer;
var
   Val1, Val2: Extended;
begin
     try
        Val1:=StrToFloat(Str1);
        Val2:=StrToFloat(Str2);
        if Val1 < Val2 then Result:=-1
        else if Val2 < Val1 then Result:=1
        else Result:=0;
     except
        on EConvertError do Result:=0;
     end;
end;

//This looks at the global variable GlobalSortOptions.
//I hated to use a global, but I can't pass any additional
//parameters to Compare, and I can't make Compare a
//method of an object.  A global seemed the only choice.
function Compare(Item1, Item2: Pointer): Integer;
var
   Entry1, Entry2: PSortedListEntry;
begin
     Entry1:=Item1;
     Entry2:=Item2;

     //Handle Case-Insensitivity.
     if not GlobalSortOptions.SortCaseSensitive then
     begin
          Entry1^.Str:=Uppercase(Entry1^.Str);
          Entry2^.Str:=Uppercase(Entry2^.Str);
     end;

     //Determine compare type and do the comparison.
     case GlobalSortOptions.SortStyle of
          ssNumeric: Result:=NumericCompare(Entry1^.Str, Entry2^.Str);
          ssDateTime: Result:=DateTimeCompare(Entry1^.Str, Entry2^.Str);
          ssTime: Result:=TimeCompare(Entry1^.Str, Entry2^.Str);
          ssCustom: Result:=GlobalSortOptions.SortCompare(Entry1^.Str, Entry2^.Str);
     else
         Result:=StringCompare(Entry1^.Str, Entry2^.Str);
     end;

     //Now, make sure we don't swap the rows if the Keys are equal.
     //If they're equal then we sort by row number.
     if Result = 0 then
     begin
          if Entry1^.RowNum < Entry2^.RowNum then Result:=-1
          else if Entry1^.RowNum > Entry2^.RowNum then Result:=1
          else Result:=0; //Sometimes an item does get compared to itself.
     end
     else //Reverse polarity if descending sort.
         if GlobalSortOptions.SortDirection = sdDescending then
            Result:=-1*Result;
end;

//I put TSortGrid on the 'Additional' page because
//I like having it with the other grids.
procedure Register;
begin
     RegisterComponents('Samples', [TSortGrid]);
end;

{******************************************************************************}
{** Public Members for TSortedList                                           **}
{******************************************************************************}
function TSortedList.GetItem(const i: Integer): PSortedListEntry;
begin
     //Cast the pointer.
     Result:=PSortedListEntry(Items[i]);
end;

procedure TSortedList.Reset;
var
   i: Integer;
begin
     //Dispose of anything in the list first.
     for i:=0 to Count-1 do
         if Items[i] <> nil then
            Dispose(Items[i]);
     //Now clear the list.
     Clear;
end;

{******************************************************************************}
{** Private Members for TSortGrid                                            **}
{******************************************************************************}
procedure TSortGrid.SetAlignmentHorz(Value: TAlignment);
begin
     fAlignmentHorz:=Value;
     Invalidate;
end;

procedure TSortGrid.SetAlignmentVert(Value: TVertAlignment);
begin
     fAlignmentVert:=Value;
     Invalidate;
end;

procedure TSortGrid.SetBevelStyle(Value: TCellBevelStyle);
begin
     fBevelStyle:=Value;
     Invalidate;
end;

procedure TSortGrid.WMSize(var Msg: TWMSize);
begin
     inherited;
     UpdateScrollPage;
end;

procedure TSortGrid.SetProportionalScrollBars(Value: Boolean);
begin
     fProportionalScrollBars:=Value;
     UpdateScrollPage;
end;

{******************************************************************************}
{** Protected Members for TSortGrid                                          **}
{******************************************************************************}
procedure TSortGrid.ListQuickSort(const ACol: Longint; const SortOptions: TSortOptions);
var
   i: Integer;
   Item: PSortedListEntry;
   BufferGrid: TStringGrid;
{$IFDEF DEBUG}
   Order: String;
{$ENDIF}
begin
     //Let everyone know we're sorting.
     fSorting:=True;
     try
        //Get rid of any old entries in the sorted list.
        fSortedList.Reset;

        //Set the sort options for the list.
        //"Compare" can only look at GlobalSortOptions.
        GlobalSortOptions:=SortOptions;

{$IFDEF DEBUG}
        if SortOptions.SortDirection=sdAscending then
           Order:='ascending'
        else
           Order:='descending';
        case GlobalSortOptions.SortStyle of
          ssNumeric: ShowMessage('Sorting Column ' + IntToStr(ACol) + ', numeric, ' + Order);
          ssDateTime: ShowMessage('Sorting Column ' + IntToStr(ACol) + ', datetime, ' + Order);
          ssTime:    ShowMessage('Sorting Column ' + IntToStr(ACol) + ', time, ' + Order);
          ssCustom:  ShowMessage('Sorting Column ' + IntToStr(ACol) + ', custom, ' + Order);
        else
          ShowMessage('Sorting Column ' + IntToStr(ACol) + ', alpha, ' + Order);
       end;
{$ENDIF}

        //Insert the Row Number and Key (Str) into
        for i:=FixedRows to RowCount-1 do
        begin
             New(Item);
             Item^.RowNum:=i;
             Item^.Str:=Cells[ACol, i];
             fSortedList.Add(Item);
        end;

        //Quick Sort the list by key string.
        //Then the row numbers will indicate where
        //each row should be placed.
        //E.g. If list item 0 contains a RowNum of 4 then
        //row 4 should be the first row (position 0).
        fSortedList.Sort(Compare);

        //Now rearrange the rows of the grid in sorted order.
        //This is a fast but space inefficient way to do it.
        //First, create a buffer grid and size it correctly.
        BufferGrid:=TStringGrid.Create(Self);
        try
           BufferGrid.ColCount:=ColCount;
           BufferGrid.RowCount:=RowCount;
           //Copy the rows to the buffer grid in sorted order.
           for i:=0 to fSortedList.Count-1 do
           begin
                Item:=fSortedList.GetItem(i);
                BufferGrid.Rows[i+FixedRows].Assign(Rows[Item^.RowNum]);
           end;
           //Now put the rows back into the original grid.
           for i:=FixedRows to RowCount-1 do
           begin
                Rows[i].Assign(BufferGrid.Rows[i]);
           end;
        finally
           BufferGrid.Free;
        end;

        //Now put the selection back on the right row.
        for i:=0 to fSortedList.Count-1 do
        begin
             Item:=fSortedList.GetItem(i);
             if Item^.RowNum = Row then
             begin
                  MoveTo(Col, i+FixedRows);
                  Break;
             end;
        end;

     finally
        //Make sure we get this turned off.
        fSorting:=False;
     end;
end;

//This function tries to determine the best sort style
//for a column.  If all the entries can be converted to
//numbers, a numeric sort is returned.  If they can all
//be converted to dates, a date sort is returned.  If time,
//then a time sort is returned,
//Otherwise, an alphabetic sort is returned.
function TSortGrid.DetermineSortStyle(const ACol: Longint): TSortStyle;
var
   i: Integer;
   DoNumeric, DoDateTime, DoTime: Boolean;
begin
     DoNumeric:=True;
     DoDateTime:=True;
     DoTime:=True;

     //Note: We only go through the rows once.
     //This code depends on the fact that no
     //entry can be both a date and number.
     for i:=FixedRows to RowCount-1 do
     begin
          if DoNumeric then
          begin
               try
// IF YOU GET AN EXCEPTION HERE WHEN RUNNING FROM THE IDE,
// THEN YOU NEED TO TURN OFF "Break on Exception"
                  StrToFloat(Cells[ACol, i]);
               except
                  on EConvertError do
                     DoNumeric:=False;
               end;
          end;

          if DoTime then
          begin
               try
// IF YOU GET AN EXCEPTION HERE WHEN RUNNING FROM THE IDE,
// THEN YOU NEED TO TURN OFF "Break on Exception"
                  StrToTime(Cells[ACol, i]);
               except
                  on EConvertError do
                     DoTime:=False;
               end;
          end;

          if DoDateTime then
          begin
               try
// IF YOU GET AN EXCEPTION HERE WHEN RUNNING FROM THE IDE,
// THEN YOU NEED TO TURN OFF "Break on Exception"
                  StrToDateTime(Cells[ACol, i]);
               except
                  on EConvertError do
                     DoDateTime:=False;
               end;
          end;
     end;

     if DoNumeric then Result := ssNumeric
     else if DoDateTime then Result := ssDateTime
     else if DoTime then Result := ssTime
     else Result := ssAlphabetic;
end;

procedure TSortGrid.InitializeFormatOptions(var FmtOpts: TFormatOptions);
begin
     //Setup good defaults for FormatOptions.
     FmtOpts.HideText:=False;
     FmtOpts.Font:=Canvas.Font;
     FmtOpts.Brush:=Canvas.Brush;
     FmtOpts.AlignmentHorz:=AlignmentHorz;
     FmtOpts.AlignmentVert:=AlignmentVert;
     FmtOpts.Bevel.Style:=BevelStyle;
     //Set defaults for the bevel colors.
     case BevelStyle of
          cbRaised:
          begin
               FmtOpts.Bevel.UpperLeftColor:=clBtnHighlight;
               FmtOpts.Bevel.LowerRightColor:=clBtnShadow;
          end;
          cbLowered:
          begin
               FmtOpts.Bevel.UpperLeftColor:=clBtnShadow;
               FmtOpts.Bevel.LowerRightColor:=clBtnHighlight;
          end;
     else
         FmtOpts.Bevel.UpperLeftColor:=clWindow;
         FmtOpts.Bevel.LowerRightColor:=clWindow;
     end;
end;

procedure TSortGrid.DrawCell(ACol, ARow: Longint; ARect: TRect; AState: TGridDrawState);
var
   xOffset, yOffset: Integer;
   FmtOpts: TFormatOptions;
begin
     InitializeFormatOptions(FmtOpts);

     //Now do the OnGetCellFormat event if necessary.
     if Assigned(fOnGetCellFormat) then
        fOnGetCellFormat(Self, ACol, ARow, AState, FmtOpts);

     if DefaultDrawing then
     begin
          //Calculate horizontal offset.
          case FmtOpts.AlignmentHorz of
               taRightJustify:
                   xOffset:=ARect.Right-ARect.Left-Canvas.TextWidth(Cells[ACol, ARow])-2;
               taCenter:
                   xOffset:=(ARect.Right-ARect.Left-Canvas.TextWidth(Cells[ACol, ARow])) div 2;
          else
              xOffset:=2;
          end;

          //Calculate vertical offset.
          case FmtOpts.AlignmentVert of
               taBottomJustify:
                   yOffset:=ARect.Bottom-ARect.Top-Canvas.TextHeight(Cells[ACol, ARow])-3;
               taMiddle:
                   yOffset:=(ARect.Bottom-ARect.Top-Canvas.TextHeight(Cells[ACol, ARow])) div 2;
          else
              yOffset:=2;
          end;

          //Now do the text drawing.
          if not FmtOpts.HideText then
             Canvas.TextRect(ARect, ARect.Left+xOffset, ARect.Top+yOffset, Cells[ACol, ARow])
          else
              Canvas.TextRect(ARect, ARect.Left+xOffset, ARect.Top+yOffset, '');

          //Draw Bevel.
          if (FmtOpts.Bevel.Style <> cbNone) and
             (ACol >= FixedCols) and (ARow >= FixedRows) then
          begin
               //Draw from bottom-most lines out to mimic behaviour of
               //fixed cells when FixedXXXXLine is toggled.
               with ARect do
               begin
                    if goFixedVertLine in Options then
                    begin
                         Canvas.Pen.Color := FmtOpts.Bevel.LowerRightColor;
                         Canvas.PolyLine([Point(Right-1, Top), Point(Right-1, Bottom)]);
                    end;
                    if goFixedHorzLine in Options then
                    begin
                         Canvas.Pen.Color := FmtOpts.Bevel.LowerRightColor;
                         Canvas.PolyLine([Point(Left, Bottom-1), Point(Right, Bottom-1)]);
                    end;
                    if goFixedVertLine in Options then
                    begin
                         Canvas.Pen.Color := FmtOpts.Bevel.UpperLeftColor;
                         Canvas.PolyLine([Point(Left, Top), Point(Left, Bottom)]);
                    end;
                    if goFixedHorzLine in Options then
                    begin
                         Canvas.Pen.Color := FmtOpts.Bevel.UpperLeftColor;
                         Canvas.PolyLine([Point(Left, Top), Point(Right, Top)]);
                    end;
               end;
          end;

          // bug fix by Chris Vleghert:
          if Assigned( OnDrawCell ) then
             OnDrawCell(Self, ACol, ARow, ARect, AState );

     end
     else
         inherited DrawCell(ACol, ARow, ARect, AState);
end;

procedure TSortGrid.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
   Point: TPoint;
   ACol, ARow: LongInt;
   SortOptions: TSortOptions;
   CurrentCursor: TCursor;
begin
     //Make sure we're not sizing and have a header row.
     if Focused and
        ClickSorting and
        (fGridState = gsNormal) and
        (FixedRows >= 1) and
        (Shift = []) then
     begin
          Point.x:=X;
          Point.y:=Y;
          MouseToCell(Point.x, Point.y, ACol, ARow);
          //Make sure they clicked a fixed row.
          if (ARow >= 0) and (ARow <= (FixedRows-1)) then
          begin
               SortOptions.SortStyle:=ssAutomatic;
               if Button = mbRight then
                  SortOptions.SortDirection:=sdDescending
               else
                  SortOptions.SortDirection:=sdAscending;

               { EWE: Set case sensitivity here }
               SortOptions.SortCaseSensitive:=fCaseSensitive;

               SortOptions.SortCompare:=nil;
               if Assigned(fOnClickSort) then
                  fOnClickSort(Self, ACol, ARow, SortOptions);
               CurrentCursor:=Screen.Cursor;
               try
                  Screen.Cursor:=crHourglass;
                  SortByColumn(ACol, SortOptions);
               finally
                  Screen.Cursor:=CurrentCursor;
               end;
          end;
     end;
     inherited MouseUp(Button, Shift, X, Y);
end;

procedure TSortGrid.ColWidthsChanged;
begin
     inherited ColWidthsChanged;
     if Assigned(fOnColumnWidthsChanged) then
        fOnColumnWidthsChanged(Self);
     UpdateScrollPage;
end;

procedure TSortGrid.RowHeightsChanged;
begin
     inherited RowHeightsChanged;
     if Assigned(fOnRowHeightsChanged) then
        fOnRowHeightsChanged(Self);
     UpdateScrollPage;
end;

procedure TSortGrid.SizeChanged(OldColCount, OldRowCount: Longint);
begin
     inherited SizeChanged(OldColCount, OldRowCount);
     if Assigned(fOnSizeChanged) then
        fOnSizeChanged(Self, OldColCount, OldRowCount);
     UpdateScrollPage;
end;

procedure TSortGrid.UpdateScrollPage;
    function LMax(const A, B: Longint): Longint;
    begin
         Result:=B;
         if A > B then Result:=A;
    end;
var
   SI: TScrollInfo;
begin
     {Make the scroll bar(s) proportional.}
     {To do this correctly, I should sum colwidths and rowheights,
     but I just approximate by basing the proportion on visible rows or cols
     divided by row or col count...}
     {Also, I can't really figure out Borland's scroll bar range and position
     scheme.  Thus, sometimes when you click on the end of the scroll bar, you
     still have to scroll farther with the arrows to actually get to the end
     of the grid.  If anyone knows how to fix this, PLEASE let me know...}
     if (ScrollBars = ssVertical) or (ScrollBars = ssBoth) then
     begin
           SI.cbSize:=sizeof(SI);
           SI.fMask:=SIF_PAGE or SIF_POS or SIF_RANGE;
           GetScrollInfo(Handle, SB_VERT, SI);
           SI.fMask:=SIF_PAGE;
           if ProportionalScrollBars then
           begin
                SI.nPage:=LMax(Round(((1.0*(VisibleRowCount+FixedRows))/RowCount)*(SI.nMax-SI.nMin+1)), 1)
           end
           else
               SI.nPage:=0;
           SetScrollInfo(Handle, SB_VERT, SI, True);
     end;
     if (ScrollBars = ssHorizontal) or (ScrollBars = ssBoth) then
     begin
           SI.cbSize:=sizeof(SI);
           SI.fMask:=SIF_PAGE or SIF_POS or SIF_RANGE;
           GetScrollInfo(Handle, SB_HORZ, SI);
           SI.fMask:=SIF_PAGE;
           if ProportionalScrollBars then
           begin
                SI.nPage:=LMax(Round(((1.0*(VisibleColCount+FixedCols))/ColCount)*(SI.nMax-SI.nMin+1)), 1)
           end
           else
               SI.nPage:=0;
           SetScrollInfo(Handle, SB_HORZ, SI, True);
     end;
end;

procedure TSortGrid.KeyDown(var Key: Word; Shift: TShiftState);
begin
     inherited KeyDown(Key, Shift);
     if ExtendedKeys and not EditorMode then
     begin
          if Shift = [ssCtrl] then
          begin
               case Key of
                    VK_INSERT: InsertRow(Row);
                    VK_DELETE: if RowCount > (FixedRows+1) then DeleteRow(Row);
               end;
          end
          else if Shift = [ssCtrl, ssShift] then
          begin
               case Key of
                    VK_INSERT: InsertColumn(Col);
                    VK_DELETE: if ColCount > (FixedCols+1) then DeleteColumn(Col);
               end;
          end;
     end;
end;

procedure TSortGrid.SetEditText(ACol, ARow: Longint; const Value: string);
begin
     try
        if Value <> Cells[ACol, ARow] then Modified:=True;
     finally
            inherited SetEditText(ACol, ARow, Value);
     end;
end;

procedure TSortGrid.Click;
begin
     try
        inherited Click;
     finally
        if fEntered then ValidateCell;
     end;
end;

procedure TSortGrid.DoEnter;
begin
     try
        inherited DoEnter;
        fEntered:=True;
     finally
        InitValidate;
     end;
end;

procedure TSortGrid.DoExit;
begin
     try
        Click;
     finally
        inherited DoExit;
        fEntered:=False;
     end;
end;

procedure TSortGrid.InitValidate;
begin
     fOldCol:=Col;
     fOldRow:=Row;
     fOldCellText:=Cells[fOldCol, fOldRow];
     fOldModifiedValue:=Modified;
end;

{******************************************************************************}
{** Public Members for TSortGrid                                             **}
{******************************************************************************}

constructor TSortGrid.Create(AOwner: TComponent);
begin
     inherited Create(AOwner);
     fSortedList:=TSortedList.Create;
     fCaseSensitive:=False;  { dflt to no case sensitivity }
     fAlignmentHorz:=taLeftJustify;
     fAlignmentVert:=taTopJustify;
     fClickSorting:=True;
     fBevelStyle:=cbNone;
     fProportionalScrollBars:=True;
     fExtendedKeys:=False;
     fSorting:=True;
     fModified:=False;
     fEntered:=False;

     InitValidate;
end;

destructor TSortGrid.Destroy;
begin
     fSortedList.Reset;
     fSortedList.Free;
     inherited Destroy;
end;

procedure TSortGrid.ValidateCell;
var
   Value: String;
   Valid: Boolean;
begin
     if fOldCellText<>Cells[fOldCol, fOldRow] then
     begin
          Value:=Cells[fOldCol, fOldRow];
          Valid:=True;
          if Assigned(fOnCellValidate) then
             fOnCellValidate(Self, fOldCol, fOldRow, Value, Valid);
          //Since Value is also a VAR parameter, we always
          //use it if it was changed in OnCellValidate.
          if not Valid then
          begin
               if Value <> Cells[fOldCol, fOldRow] then
                  Cells[fOldCol, fOldRow]:=Value
               else
                   Cells[fOldCol, fOldRow]:=fOldCellText;
               Modified:=fOldModifiedValue;
          end
          else if Value <> Cells[fOldCol, fOldRow] then
               Cells[fOldCol, fOldRow]:=Value;
     end;
     InitValidate;
end;

//AutoSizes the ACol column.
procedure TSortGrid.AutoSizeCol(const ACol: LongInt);
var
   MaxWidth, TextW, i: Integer;
   FmtOpts: TFormatOptions;
begin
     //Resize the column to display the largest value.
     MaxWidth:=0;
     Canvas.Font:=Font;
     for i:=0 to RowCount-1 do
     begin
          InitializeFormatOptions(FmtOpts);
          if Assigned(fOnGetCellFormat) then
             fOnGetCellFormat(Self, Col, i, GetCellDrawState(ACol, i), FmtOpts);
          Canvas.Font:=FmtOpts.Font;
          TextW:=Canvas.TextWidth(Cells[ACol, i]);
          if TextW > MaxWidth then MaxWidth:=TextW;
     end;
     ColWidths[ACol]:=MaxWidth+Canvas.TextWidth('x');
end;

//AutoSizes ALL the variable columns and optionally the fixed columns.
procedure TSortGrid.AutoSizeColumns(const DoFixedCols: Boolean; const Padding: Integer);
var
   i: Integer;
begin
     if DoFixedCols then
        for i:=0 to FixedCols-1 do
        begin
             AutoSizeCol(i);
             if Padding <> 0 then
                ColWidths[i]:=ColWidths[i]+Padding;
        end;
     for i:=FixedCols to ColCount-1 do
     begin
          AutoSizeCol(i);
          if Padding <> 0 then
             ColWidths[i]:=ColWidths[i]+Padding;
     end;
end;

//Sorts the variable rows using Column ACol as a key
procedure TSortGrid.SortByColumn(const ACol: LongInt; SortOptions: TSortOptions);
begin
     //Don't sort while in edit mode.
     if not EditorMode then
     begin
          //If there's only one row we don't need to do anything.
          if RowCount > (FixedRows+1) then
          begin
               //Now we do the Automatic sorting determination.
               if SortOptions.SortStyle = ssAutomatic then
                  SortOptions.SortStyle:=DetermineSortStyle(ACol);

               //Call the OnBeginSort event.
               if Assigned(fOnBeginSort) then fOnBeginSort(Self, ACol, SortOptions);

               //Quick Sort column ACol.
               ListQuickSort(ACol, SortOptions);

               //Call the OnEndSort event.
               if Assigned(fOnEndSort) then fOnEndSort(Self, ACol);
          end;
     end;
end;

procedure TSortGrid.InsertRow(ARow: Longint);
begin
     RowCount:=RowCount+1;
     MoveRow(RowCount-1, ARow);
     Rows[ARow].Clear;
     Row:=ARow;
     if Assigned(fOnRowInsert) then fOnRowInsert(Self, ARow);
end;

procedure TSortGrid.InsertColumn(ACol: Longint);
begin
     ColCount:=ColCount+1;
     MoveColumn(ColCount-1, ACol);
     Cols[ACol].Clear;
     Col:=ACol;
     if Assigned(fOnColumnInsert) then fOnColumnInsert(Self, ACol);
end;

procedure TSortGrid.DeleteRow(ARow: Longint);
var
   ASE: Boolean;
begin
     Rows[ARow].Clear;
     {If goAlwaysShowEditor is enabled then DeleteRow
      and MoveRow leave the caret past the last row or
      in one of the fixed rows.  So I turn it off before
      the delete and then back on after to get it
      working correctly.}
     ASE:=False;
     if goAlwaysShowEditor in Options then
     begin
          Options:=Options-[goAlwaysShowEditor];
          ASE:=True;
     end;
     inherited DeleteRow(ARow);
     if ASE then Options:=Options+[goAlwaysShowEditor];
     if Assigned(fOnRowDelete) then fOnRowDelete(Self, ARow);
end;

procedure TSortGrid.DeleteColumn(ACol: Longint);
var
   ASE: Boolean;
begin
     Cols[ACol].Clear;
     //See DeleteRow for comments...
     ASE:=False;
     if goAlwaysShowEditor in Options then
     begin
          Options:=Options-[goAlwaysShowEditor];
          ASE:=True;
     end;
     inherited DeleteColumn(ACol);
     if ASE then Options:=Options+[goAlwaysShowEditor];
     if Assigned(fOnColumnDelete) then fOnColumnDelete(Self, ACol);
end;

procedure TSortGrid.MoveRow(FromIndex, ToIndex: Longint);
var
   ASE: Boolean;
begin
     //See DeleteRow for comments...
     ASE:=False;
     if goAlwaysShowEditor in Options then
     begin
          Options:=Options-[goAlwaysShowEditor];
          ASE:=True;
     end;
     inherited MoveRow(FromIndex, ToIndex);
     if ASE then Options:=Options+[goAlwaysShowEditor];
end;

procedure TSortGrid.MoveColumn(FromIndex, ToIndex: Longint);
var
   ASE: Boolean;
begin
     //See DeleteRow for comments...
     ASE:=False;
     if goAlwaysShowEditor in Options then
     begin
          Options:=Options-[goAlwaysShowEditor];
          ASE:=True;
     end;
     inherited MoveColumn(FromIndex, ToIndex);
     if ASE then Options:=Options+[goAlwaysShowEditor];
end;

//The logic gets around a weird case where you swap with the last row.
procedure TSortGrid.SwapRows(ARow1, ARow2: Longint);
begin
     if ARow1 < ARow2 then
     begin
          MoveRow(ARow2, ARow1);
          MoveRow(ARow1+1, ARow2);
     end
     else if ARow2 < ARow1 then
     begin
          MoveRow(ARow1, ARow2);
          MoveRow(ARow2+1, ARow1);
     end;
end;

//The logic gets around a weird case where you swap with the last column.
procedure TSortGrid.SwapColumns(ACol1, ACol2: Longint);
begin
     if ACol1 < ACol2 then
     begin
          MoveColumn(ACol2, ACol1);
          MoveColumn(ACol1+1, ACol2);
     end
     else if ACol2 < ACol1 then
     begin
          MoveColumn(ACol1, ACol2);
          MoveColumn(ACol2+1, ACol1);
     end;
end;

//Moves the selected cell to (ACol, ARow) and makes it visible.
procedure TSortGrid.MoveTo(ACol, ARow: Longint);
begin
     if ACol < FixedCols then ACol:=FixedCols;
     if ARow < FixedRows then ARow:=FixedRows;
     if SelectCell(ACol, ARow) then
     begin
          Col:=ACol;
          Row:=ARow;
          MoveColRow(ACol, ARow, True, True);
     end;
end;

//Clears the grid.
procedure TSortGrid.Clear;
var
  i: Longint;
begin
     for i:= 0 to (ColCount-1) do
     begin
          Cols[i].Clear;
     end;
     Modified:=False;
end;

//Finds a string in the grid.
//It searches by column and returns the first instance it finds.
function TSortGrid.IsCell(const Value: String; var ACol, ARow: Longint): Boolean;
var
  i, Place: Longint;
begin
     Result := False;
     for i := 0 to ColCount-1 do
     begin
          Place:=Cols[i].IndexOf(Value);
          if Place >= 0 then
          begin
               ARow := Place;
               ACol := i;
               Result := True;
               break;
          end;
     end;
end;

procedure TSortGrid.LoadFromFile(const FileName: String; const Delimiter: Char);
var
   r: Longint;
   Lines, Fields: TStringList;
begin
     Lines:=TStringList.Create;
     Fields:=TStringList.Create;
     try
        Clear;

        Lines.LoadFromFile(FileName);
        RowCount:=Lines.Count;
        ColCount:=FixedCols+1;
        for r:=0 to Lines.Count-1 do
        begin
             TokenizeGridString(Lines[r], Delimiter, Fields);
             if Fields.Count > ColCount then ColCount:=Fields.Count;
             Rows[r].Assign(Fields);
        end;
     finally
        Fields.Free;
        Lines.Free;
     end;
end;

procedure TSortGrid.SaveToFile(const FileName: String; const Delimiter: Char);
var
   r, c: Longint;
   BufStr: String;
   Lines: TStringList;
begin
     Lines:=TStringList.Create;
     try
        Lines.Clear;
        for r:=0 to RowCount-1 do
        begin
             BufStr:='';
             for c:=0 to ColCount-1 do
             begin
                  BufStr:=BufStr+Cells[c, r];
                  if c<>(ColCount-1) then BufStr:=BufStr+Delimiter;
             end;
             Lines.Add(BufStr);
        end;
        Lines.SaveToFile(FileName);
     finally
            Lines.Free;
     end;
end;

function TSortGrid.CanUndoSort: Boolean;
begin
     //We can only undo a sort if we still have exactly the
     //same number of rows that we did when we sorted.
     Result:=(fSortedList.Count = (RowCount-FixedRows));
     if Result = False then fSortedList.Reset;
end;

procedure TSortGrid.UndoSort;
var
   BufferGrid: TStringGrid;
   Item: PSortedListEntry;
   i: Integer;
begin
     if CanUndoSort then
     begin
          BufferGrid:=TStringGrid.Create(Self);
          try
             BufferGrid.ColCount:=ColCount;
             BufferGrid.RowCount:=RowCount;
             //Copy the rows to the buffer grid in the current order.
             for i:=FixedRows to RowCount-1 do
             begin
                  BufferGrid.Rows[i].Assign(Rows[i]);
             end;
             //Now put the rows back into the original grid in the old order.
             for i:=0 to fSortedList.Count-1 do
             begin
                  Item:=fSortedList.GetItem(i);
                  Rows[Item^.RowNum].Assign(BufferGrid.Rows[i+FixedRows]);
             end;
          finally
                 BufferGrid.Free;
          end;

          //Now put the selection back on the right row.
          Item:=fSortedList.GetItem(Row-FixedRows);
          MoveTo(Col, Item^.RowNum);

          //Now reset the list.
          fSortedList.Reset;
     end;
end;

function TSortGrid.GetCellDrawState(const ACol, ARow: Longint): TGridDrawState;
    function PointInGridRect(Col, Row: Longint; const Rect: TGridRect): Boolean;
    begin
      Result := (Col >= Rect.Left) and (Col <= Rect.Right) and (Row >= Rect.Top)
        and (Row <= Rect.Bottom);
    end;
var
   DrawState: TGridDrawState;
begin
     DrawState:=[];
     if (ARow < FixedRows) and (ACol < FixedCols) then Include(DrawState, gdFixed);
     if Focused and (ARow = Row) and (ACol = Col) then Include(DrawState, gdFocused);
     if PointInGridRect(ACol, ACol, Selection) then Include(DrawState, gdSelected);
     Result:=DrawState;
end;

function TSortGrid.SelectCell(ACol, ARow: Longint): Boolean;
begin
     Result:=inherited SelectCell(ACol, ARow);
end;

procedure TSortGrid.KeyPress(var Key: Char);
begin
     //I have to do this here because KeyDown doesn't get called
     //when the enter key is pressed in the inplace editor.
     if Key = #13 then ValidateCell;
     inherited KeyPress(Key);
end;

end.