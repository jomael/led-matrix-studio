// ===================================================================
//
// (c) Paul Alan Freshney 2012-2016
// www.freshney.org :: paul@freshney.org :: maximumoctopus.com
//
// www.MaximumOctopus.com/electronics/builder.htm
//
// Please do not redistribute the source code!
//
//   Started: June 10th 2012
//  Modified: May 28th 2018
//
// ===================================================================

unit utility;

interface

uses ExtCtrls, shellapi, SysUtils, Windows, classes, dialogs, thematrix, xglobal;

type
  TDataOut = record
               count : integer;
               data  : array[0..7] of string;
             end;

  TProjectSettings = record
                       mtype    : integer;
                       width    : integer;
                       height   : integer;
                       clear    : boolean;
                       special  : integer;
                       sizetype : boolean;
                       pixel    : integer; // 0 = square, 1 = circle
                     end;

const
  LEDStudioDate      = 'August 5th 2018';
  LEDStudioVersion   = 'v0.8.13 BETA';

  LeftOffset         = 70;

  BiColoursLSBLeft   : array[0..3] of string = ('00', '01', '10', '11');
  BiColoursLSBRight  : array[0..3] of string = ('00', '10', '01', '11');

  NumberSizes        : array[0..4] of integer = (7, 15, 31, 7, 15);
  NumberPadding      : array[0..4] of integer = (2, 4, 8, 2, 4);

function  ValidateNumber(s : string; max : integer): boolean;
function  HexToInt(const s : string): Int64;
function  HexToByte(const s : string): byte;
function  RGBConvertTo(rgb, convertmode, lsblocation : LongWord ): LongWord ;
function  RGBConvertToSplit(rgb, convertmode, lsblocation : LongWord; aPrefix, aSpacer : string): string;
function  IntegerToBinary(ns : integer; anumber : int64): string;
function  PadString(aChar : char; aCount : integer): string;
function  CreatedDate: string;
function  GetFilePrefix(aFileName : string): string;

procedure ClearTExportOptions(aIsRGB : boolean; var aEEO : TExportOptions);

function  RemoveExtension(s : string): string;

function  ExecuteFile(bob : THandle; const FileName, Params, DefaultDir: string): THandle;

function  GetAutoSaveName: string;

function  GetPresetParameterType(s : string): integer;

function  LoadProfileFromFile(fn : string): TExportOptions;


var
 MatrixMain     : TTheMatrix;

 AppSettings    : TAppSettings;

 MatrixGradient : array[0.._MaxHeight] of TShape;

implementation

function PadString(aChar : char; aCount : integer): string;
 begin
  Result := '';

  while Length(Result) < aCount do
    Result := Result + aChar;
end;

function ValidateNumber(s : string; max : integer): boolean;
 var
  t : integer;

 begin
  Result := True;

  for t:=1 to length(s) do begin
    if not((Ord(s[t]) >= 48) and (Ord(s[t]) <= 57)) then
      Result := False;
  end;

  if Result then begin
    if max <> -1 then begin
      if StrToInt(s) > max then
        Result := False;
    end;
  end;
end;

function CreatedDate: string;
 var
  mm,dd,yy : word;

 begin
  DecodeDate(Now, yy, mm, dd);

  if dd < 10 then
    Result := 'Date : 0' + IntToStr(dd) + '/'
  else
    Result := 'Date : ' + Result + IntToStr(dd) + '/';

  if mm < 10 then
    Result := Result + '0' + IntToStr(mm) + '/'
  else
    Result := Result + IntToStr(mm) + '/';

  Result := Result + IntToStr(yy);
end;

function HexToInt(const s : string): Int64;
 var
  i : integer;
  digit : integer;

 begin
  Result := 0;

  for i:=1 to length(s) do begin
    case Ord(s[i]) of
      48..57 : digit := StrToInt(s[i]);
      65..70 : digit := Ord(s[i]) - 55;
    else
      showmessage('ERROR: ' + s[i]);
      digit := 0;
    end;

    Result := Result + (digit * powers16[length(s) - i]);
  end;
end;

function HexToByte(const s : string): byte;
 var
  i : integer;
  digit : integer;

 begin
  Result := 0;

  for i:=1 to length(s) do begin
    case Ord(s[i]) of
      48..57 : digit := StrToInt(s[i]);
      65..70 : digit := Ord(s[i]) - 55;
    else
      showmessage('ERROR: ' + s[i]);
      digit := 0;
    end;

    Result := Result + (digit * powers16[length(s) - i]);
  end;
end;

function RGBConvertTo(rgb, convertmode, lsblocation : LongWord ): LongWord;
 var
  xR : LongWord ;
  xG : LongWord ;
  xB : LongWord ;
  xT : LongWord ;
  t : integer;

 begin
  xR := (rgb and $0000ff);         // Windows colour structure = BGR
  xB := (rgb and $ff0000) shr 16;
  xG := (rgb and $00ff00) shr 8;

  case convertmode of
    rgbConvertToRGB : xT := (xR shl 16) + (xG shl 8) + xB;
    rgbConvertToBGR : xT := (xB shl 16) + (xG shl 8) + xR;
    rgbConvertToGRB : xT := (xG shl 16) + (xR shl 8) + xB;
  else
    xT := 0;
  end;

  if lsblocation = 0 then begin // flip bit order
    Result := 0;

    for t:=0 to 31 do
      if (xT and powers[t]) = powers[t] then
        Result := Result + powers[31 - t];
  end
  else
    Result := xT;
end;

function RGBConvertToSplit(rgb, convertmode, lsblocation : LongWord; aPrefix, aSpacer : string): string;
 var
  xR : LongWord;
  xG : LongWord;
  xB : LongWord;

 begin
  xR := (rgb and $0000ff);         // Windows colour structure = BGR
  xB := (rgb and $ff0000) shr 16;
  xG := (rgb and $00ff00) shr 8;

  case convertmode of
    rgbConvertToRGB : Result := aPrefix + IntToHex(xR, 2) + aSpacer +
                                aPrefix + IntToHex(xG, 2) + aSpacer +
                                aPrefix + IntToHex(xB, 2) + aSpacer;
    rgbConvertToBGR : Result := aPrefix + IntToHex(xB, 2) + aSpacer +
                                aPrefix + IntToHex(xG, 2) + aSpacer +
                                aPrefix + IntToHex(xR, 2) + aSpacer;
    rgbConvertToGRB : Result := aPrefix + IntToHex(xG, 2) + aSpacer +
                                aPrefix + IntToHex(xR, 2) + aSpacer +
                                aPrefix + IntToHex(xB, 2) + aSpacer;
  else
    Result := '$00' + aSpacer + '$00' + aSpacer + '$00' + aSpacer;
  end;
end;

function IntegerToBinary(ns : integer; anumber : int64): string;
 var
  i : integer;

 begin
  Result:='';

  for i:=1 to ns + 1 do
    Result := Result + '0';

  for i:=0 to ns do begin
    if (anumber and powers[i]) = powers[i] then
      Result[(ns - i) + 1] := '1';
  end;
end;

function RemoveExtension(s : string): string;
 var
  idx,t : integer;

 begin
  idx    := -1;
  Result := s;

  for t:=1 to length(s) do
    if s[t] = '.' then idx := t;

  if idx <> -1 then
    Result := Copy(s, 1, idx - 1);
end;

procedure ClearTExportOptions(aIsRGB : boolean; var aEEO : TExportOptions);
 begin
  aEEO.IncludePreamble := True;              //
  aEEO.CleanMode       := False;             // True = exclude everything from data output except the data!
  aEEO.ExportMode      := -1;                 // 0 = anim, 1 = user memories
  aEEO.StartFrame      := 1;
  aEEO.EndFrame        := 1;
  aEEO.Source          := sourceRows;        // 0 = columns, 1 = rows
  aEEO.Orientation     := RowsTopToBottom;   // 0 = top to bottom/left right, 1 = bottom to top/right left
  aEEO.ScanDirection   := scanRowLeftToRight;
  aEEO.LSB             := lsbRight;          // 0 = top/left, 1 = bottom/right
  aEEO.Language        := langCSV;           // 0 = CSV, 1 = PICAXE, 2 = C[], 3 = C[][], 4 = Python[], 5 = Python[][], 6 = microchip
  aEEO.NumberFormat    := nfHex;             // 0 = decimal, 1 = binary, 2 = hex
  aEEO.NumberSize      := ns8Bit;            //
  aEEO.LineContent     := LineContentRowCol;
  aEEO.LineCount       := 10;
  aEEO.FontMode        := False;
  aEEO.Optimise        := False;
  aEEO.MinWidth        := -1;
  aEEO.MaxWidth        := -1;
  aEEO.MinHeight       := -1;
  aEEO.MaxHeight       := -1;

  if aIsRGB then begin
    aEEO.RGBEnabled      := True;
    aEEO.RGBMode         := 0;
    aEEO.RGBChangePixels := False;
    aEEO.RGBChangeColour := $00000000;
  end
  else begin
    aEEO.RGBEnabled      := False;
    aEEO.RGBMode         := 0;
    aEEO.RGBChangePixels := False;
    aEEO.RGBChangeColour := $00000000;
  end;

  aEEO.cdescription    := '';
  aEEO.DataPadding     := '';
end;

function ExecuteFile(bob : THandle; const FileName, Params, DefaultDir: string): THandle;
 var
  zFileName, zParams, zDir: array[0..254] of Char;

 begin
  Result := ShellExecute(bob, nil, StrPCopy(zFileName, FileName), StrPCopy(zParams, Params), StrPCopy(zDir, DefaultDir), SW_SHOW);
end;

function GetAutoSaveName: string;
 var
  lYear, lMonth, lDay : word;
  lHour, lMin, lSec, lMSec : word;

 begin
  DecodeDate(Now, lYear, lMonth, lDay);
  DecodeTime(Now, lHour, lMin, lSec, lMSec);

  Result := 'autosave_' + IntToStr(lYear);

  if lMonth < 10 then
    Result := Result + '0' + IntToStr(lMonth)
  else
    Result := Result + IntToStr(lMonth);

  if lDay < 10 then
    Result := Result + '0' + IntToStr(lDay) + '_'
  else
    Result := Result + IntToStr(lDay) + '_';

  if lHour < 10 then
    Result := Result + '0' + IntToStr(lHour)
  else
    Result := Result + IntToStr(lHour);

  if lMin < 10 then
    Result := Result + '0' + IntToStr(lMin)
  else
    Result := Result + IntToStr(lMin);

  Result := Result + '.leds';
end;

function GetPresetParameterType(s : string): integer;
 begin
  if s[1] = '{' then
    Result := 0
  else if s[1] = '}' then
    Result := 1
  else if s[1] = 'w' then
    Result := 2
  else if s[1] = 'h' then
    Result := 3
  else if s[1] = 'a' then
    Result := 4
  else if s[1] = 'b' then
    Result := 5
  else if s[1] = 'c' then
    Result := 6
  else if s[1] = 'd' then
    Result := 7
  else if s[1] = 'e' then
    Result := 8
  else if s[1] = 'm' then
    Result := 9
  else
    Result := -1;
end;

function LoadProfileFromFile(fn : string): TExportOptions;
 var
  tf : TextFile;
  s, v : string;

 function parameterType(s : string): integer;
  begin
   if s[1] = '{' then
     Result := 0
   else if s[1] = '}' then
     Result := 1
   else if s[1] = 'a' then
     Result := 2
   else if s[1] = 'b' then
     Result := 3
   else if s[1] = 'c' then
     Result := 4
   else if s[1] = 'd' then
     Result := 5
   else if s[1] = 'e' then
     Result := 6
   else if s[1] = 'f' then
     Result := 7
   else if s[1] = 'g' then
     Result := 8
   else if s[1] = 'h' then
     Result := 9
   else if s[1] = 'i' then
     Result := 10
   else if s[1] = 'r' then
     Result := 11
   else if s[1] = 's' then
     Result := 12
   else if s[1] = 't' then
     Result := 13
   else if s[1] = 'v' then
     Result := 30
   else if s[1] = 'w' then
     Result := 31
   else if s[1] = 'y' then
     Result := 32
   else if s[1] = 'z' then
     Result := 33
   else
     Result := -1;
 end;

 begin
  if FileExists(fn) then begin
    AssignFile(tf, fn);
    Reset(tf);

    while not(eof(tf)) do begin
      readln(tf, s);

      if s<>'' then begin
        v := Copy(s, 3, length(s) - 2);

        case parameterType(s) of
            0 : if pos('RGB', UpperCase(s)) <> 0 then
                  Result.RGBEnabled := True
                else
                  Result.RGBEnabled := False;  
            1 : {};
            2 : Result.Source          := StrToInt(v);
            3 : Result.orientation     := StrToInt(v);
            4 : Result.LSB             := StrToInt(v);
            5 : Result.Language        := StrToInt(v);
            6 : Result.NumberFormat    := StrToInt(v);
            7 : Result.NumberSize      := StrToInt(v);
            8 : Result.ScanDirection   := StrToInt(v);
            9 : Result.LineContent     := StrToInt(v);
           10 : Result.LineCount       := StrToInt(v);
           11 : Result.RGBMode         := StrToInt(v);
           12 : Result.RGBChangePixels := StrToBool(v);
           13 : Result.RGBChangeColour := StrToInt(v);
           30 : Result.MinWidth        := StrToInt(v);
           31 : Result.MaxWidth        := StrToInt(v);
           32 : Result.MinHeight       := StrToInt(v);
           33 : Result.MaxHeight       := StrToInt(v);
        else
          Result.Source := -1; // error
        end;
      end;
    end;

    CloseFile(tf);
  end;
end;

function GetFilePrefix(aFileName : string): string;
 var
  lFileName : string;
  t,idx : integer;

 begin
  lFileName := ExtractFileName(aFileName);

  idx := -1;

  for t:=length(lFileName) downto 1 do
    if lFileName[t] = '.' then
      idx := t;

  if idx <> -1 then
    Result := Copy(lFileName, 1, idx - 1)
  else
    Result := aFileName;
end;

end.
