// ===================================================================
//
// (c) Paul Alan Freshney 2012-2016
// www.freshney.org :: paul@freshney.org :: maximumoctopus.com
//
// www.MaximumOctopus.com/electronics/builder.htm
//
// Please do not redistribute the source code!
//
//   Started: December 30th 2015
//  Modified: January 1st 2016
//
// ===================================================================

unit exportoutputcode;

interface


uses classes, System.Contnrs,

     utility, xglobal;


function  CreateExportAnimation(teo : TExportOptions; var aOutput : TStringList; var entrycount : integer; var aUniqueItems : TStringList): boolean;
function  CreateExportAnimationRGB(teo : TExportOptions; var aOutput : TStringList; var entrycount : integer; var aUniqueItems : TStringList): boolean;

function  ExportRowData(teo : TExportOptions; aFrame, rowid : integer; spacingchar : string): TDataOut;
function  ExportRowDataRGB(prefix : string; teo : TExportOptions; aFrame, rowid : integer; spacingchar : string): TDataOut;

function  ExportColumnData(teo : TExportOptions; aFrame, colid : integer; spacingchar : string): TDataOut;
function  ExportColumnDataRGB(prefix : string; teo : TExportOptions; aFrame, colid : integer; spacingchar : string): TDataOut;

function  GetRowData(hexmode : boolean; direction, aFrame, rowid : integer): string;
function  GetColumnData(hexmode : boolean; direction, aFrame, colid : integer): string;
procedure AddContentByFrame(teo : TExportOptions; s : string; frame : integer; var aOutput : TStringList);
procedure AddContentByRowCol(teo : TExportOptions; s : string; var aOutput : TStringList);
function  GetVariableType(aLanguage, aNumberSize : integer): string;
function  GetVariableID(aLanguage : integer): string;
function  GetLineContent(teo : TExportOptions; aIncludeComment : boolean): string;
function  GetLSB(teo : TExportOptions; aIncludeComment : boolean): string;
function  GetOrientation(teo : TExportOptions; aIncludeComment : boolean): string;
function  GetScanDirection(teo : TExportOptions; aIncludeComment : boolean): string;
function  GetNumberSize(aLanguage : integer; aNumberSize : integer; aIncludeComment : boolean): string;
function  GetNumberFormat(aLanguage, aNumberFormat: integer): string;
function  GetSource(aLanguage : integer; aSaveType : integer): string;
function  GetCommentCharacter(aLanguage : integer): string;
function  GetRGBMode(teo : TExportOptions; aIncludeComment : boolean): string;
function  GetLanguage(teo : TExportOptions; aIncludeComment : boolean): string;
procedure GetSpacerLine(aLanguage : integer; var aOutput : TStringList);
procedure GetPreamble(teo : TExportOptions; var aOutput : TStringList);


implementation

uses thematrix, SysUtils;


function CreateExportAnimation(teo : TExportOptions; var aOutput : TStringList; var entrycount : integer; var aUniqueItems : TStringList): boolean;
 var
  vartype, spacingstring : string;
  x,y,t,i,lc,rc,z : integer;
  prefix, op, cdescription : string;
  tdo : TDataOut;
  matrixdata : array[0.._MaxHeight] of TStringList;
  zStart, zInc : integer;

  procedure AddContentBySize(s : string; frame, rowcount : integer);
   var
    m : string;

   begin
    m := Copy(s, 1, length(s) - 2);

    case teo.Language of
      langCSV          : aOutput.Add(AppSettings.OpenBracket + m + AppSettings.CloseBracket + ';');
      langPICAXE       : aOutput.Add('EEPROM (' + m + ')');
      langCOneDim      : aOutput.Add(teo.DataPadding + s);
      langCTwoDim      : if (rowcount = 0) then
                           aOutput.Add(teo.DataPadding + '{' + m + ',  // ' + cdescription + ' ' + IntToStr(frame))
                         else if (rowcount = -1) then
                           aOutput.Add(teo.DataPadding + ' ' + m + '},')
                         else
                           aOutput.Add(teo.DataPadding + ' ' + s);
      langPythonOneDim : aOutput.Add(teo.DataPadding + s + '');
      langPythonTwoDim : if (rowcount = 0) then
                           aOutput.Add(teo.DataPadding + '[' + s + '  # ' + cdescription + ' ' + IntToStr(frame))
                         else if (rowcount = -1) then
                           aOutput.Add(teo.DataPadding + ' ' + m + '],')
                         else
                           aOutput.Add(' ' + s);
      langMicrochip    : aOutput.Add('dt ' + m);
      langSpecial      : aOutput.Add(s);
    end;
  end;

  function ProcessUnique(s : string): string;
   var
    t : integer;

   begin
    if aUniqueItems.Count = 0 then
      Result := s
    else begin
      for t:= 0 to aUniqueItems.Count - 1 do begin
        s := StringReplace(s, aUniqueItems[t], IntToStr(t), [rfReplaceAll]);
      end;

      Result := s;
    end;
  end;


 begin
  Result := True;

  for t:=0 to _MaxHeight do
    matrixdata[t] := TStringList.Create;

  entrycount := 0; // total of all entries added to data variable in output    

  // ===========================================================================

  prefix := GetNumberFormat(teo.Language, teo.NumberFormat);

  if teo.CleanMode then begin
    spacingstring := ' ';

    teo.Language  := langSpecial;
  end
  else
    spacingstring := ', ';

  // ===========================================================================

  if teo.IncludePreamble then begin

    if teo.ExportMode = 0 then
      cdescription := 'frame'
    else
      cdescription := 'memory';

    // =========================================================================

    GetPreamble(teo, aOutput);

    GetSpacerLine(teo.Language, aOutput);
    aOutput.Add('');
  end;

  // =========================================================================
  // =========================================================================
  // =========================================================================

  op := '';
  lc := 0;
  rc := 0;

  vartype := GetVariableType(teo.Language, teo.NumberSize) +
             GetVariableID(teo.Language);

  if vartype <> '' then begin
    aOutput.Add(vartype);
  end;

  teo.DataPadding := PadString(' ', length(vartype));

  entrycount := 0; // total of all entries added to data variable in output

  // =========================================================================
  // =========================================================================

  for t:=teo.StartFrame to teo.EndFrame do begin
    for i:=0 to _MaxHeight do
      matrixdata[i].Clear;


    if teo.Source = SaveTypeRows then begin
      for y:=0 to MatrixMain.MatrixHeight - 1 do begin
        tdo := ExportRowData(teo, t, y, spacingstring);

        for i:=0 to 7 do begin
          if tdo.data[i] <> '' then begin
            matrixdata[y].Add(ProcessUnique(prefix + tdo.data[i]) + spacingstring)
          end;
        end;

        inc(entrycount, tdo.count);
      end;
    end;

    if teo.Source = SaveTypeColumns then begin
      for x := 0 to MatrixMain.MatrixWidth - 1 do begin
        tdo := ExportColumnData(teo, t, x, spacingstring);

        for i:=0 to 7 do begin
          if tdo.data[i] <> '' then begin
            matrixdata[x].Add(ProcessUnique(prefix + tdo.data[i]) + spacingstring)
          end;
        end;

        inc(entrycount, tdo.count);        
      end;
    end;

    // ===========================================================================
    // ===========================================================================
    // row data
    // ===========================================================================
    // ===========================================================================

    if (teo.LineContent) <> lineContentBytes then // maintain data when saving in blocks
      op := '';

    if teo.Source = SaveTypeRows then begin
      if teo.orientation = RowsTopToBottom then begin
        zStart := 0;
        zInc   := 1;
      end
      else begin
        zStart := MatrixMain.MatrixHeight - 1;
        zInc   := -1;
      end;

      y := zStart;

      while y <> 99 do begin
        if teo.LineContent = lineContentRowCol then
          op := '';

        for z:=0 to matrixdata[y].Count - 1 do begin
          op := op + matrixdata[y][z];

          if teo.LineContent = lineContentBytes then begin
            inc(lc);

            if lc = teo.LineCount then begin
              AddContentBySize(op, t, rc);

              lc := 0;
              op := '';
              inc(rc);
            end;
          end;
        end;

        if teo.LineContent = lineContentRowCol then begin
          AddContentByRowCol(teo, op, aOutput);
        end;

        inc(y, zInc);

        if (y > MatrixMain.MatrixHeight - 1) or (y < 0) then
          y := 99;
      end;

      case teo.LineContent of
        lineContentFrame : AddContentByFrame(teo, op, t, aOutput);
        lineContentBytes : begin
                             case teo.Language of
                               langCTwoDim,
                               langPythonTwoDim : begin
                                                    AddContentBySize(op, t, -1);

                                                    op := '';
                                                    lc := 0;
                                                    rc := 0;
                                                  end;
                             end;
                           end;
      end;
    end;

    // ===========================================================================
    // col data
    // ===========================================================================

    if teo.Source = SaveTypeColumns then begin
      case teo.orientation of
        0,1 : begin
                if teo.orientation = RowsTopToBottom then begin
                  zStart:= 0;
                  zInc  := 1;
                end
                else begin
                  zStart := MatrixMain.MatrixWidth - 1;
                  zInc   := -1;
                end;

                y := zStart;

                while y <> 99 do begin
                  if teo.LineContent = lineContentRowCol then
                    op := '';

                  for z:=0 to matrixdata[y].Count - 1 do begin
                    op := op + matrixdata[y][z];

                    if teo.LineContent = lineContentBytes then begin
                      inc(lc);

                      if lc = teo.LineCount then begin
                        AddContentBySize(op, t, rc);

                        lc := 0;
                        op := '';
                        inc(rc);
                      end;
                    end;
                  end;

                  if teo.LineContent = lineContentRowCol then begin
                    AddContentByRowCol(teo, op, aOutput);
                  end;

                  inc(y, zInc);

                  if (y > MatrixMain.MatrixWidth - 1) or (y < 0) then
                    y := 99;
                end;
              end;
        2 : begin
              for y := 7 downto 0 do begin
                for z:=0 to matrixdata[y].Count - 1 do
                  op := op + matrixdata[y][z] + spacingstring;
              end;

              for y := 15 downto 8 do begin
                for z:=0 to matrixdata[y].Count - 1 do
                  op := op + matrixdata[y][z] + spacingstring;
              end;

              for y := 23 downto 16 do begin
                for z:=0 to matrixdata[y].Count - 1 do
                  op := op + matrixdata[y][z] + spacingstring;
              end;
            end;
      end;

      case teo.LineContent of
        lineContentFrame : AddContentByFrame(teo, op, t, aOutput);
        lineContentBytes : begin
                             case teo.Language of
                               langCTwoDim,
                               langPythonTwoDim : begin
                                                    AddContentBySize(op, t, -1);

                                                    op := '';
                                                    lc := 0;
                                                    rc := 0;
                                                  end;
                             end;
                           end;
      end;
    end;
  end;

  case teo.LineContent of
    lineContentBytes : if op <> '' then AddContentBySize(op, 0, rc);
  end;

  case teo.language of
    langCOneDim,
    langCTwoDim       : aOutput.Add(teo.DataPadding + '};');
    langPythonOneDim,
    langPythonTwoDim  : aOutput.Add(teo.DataPadding + ']');
  end;

  for t:=0 to _MaxHeight do
    matrixdata[t].Free;

  if teo.IncludePreamble then begin
    GetSpacerLine(teo.Language, aOutput);
  end;
end;

function CreateExportAnimationRGB(teo : TExportOptions; var aOutput : TStringList; var entrycount : integer; var aUniqueItems : TStringList): boolean;
 var
  s, vartype, spacingstring  : string;
  x, y, t, i : integer;
  prefix, cdescription : string;
  tdo : TDataOut;
  matrixdata : array[0.._MaxHeight] of string;

  procedure AddContentByRowCol(s : string);
   var
    m : string;

   begin
    m := Copy(s, 1, length(s) - 2);

    case teo.Language of
      langCSV          : aOutput.Add(AppSettings.OpenBracket + m + AppSettings.CloseBracket + ';');
      langPICAXE       : aOutput.Add('EEPROM (' + m + ')');
      langCOneDim      : aOutput.Add(teo.DataPadding + s);
      langCTwoDim      : aOutput.Add(teo.DataPadding + '{' + m + '},');
      langPythonOneDim : aOutput.Add(teo.DataPadding + s);
      langPythonTwoDim : aOutput.Add(teo.DataPadding + '[' + m + '],');
      langMicrochip    : aOutput.Add('dt ' + m);
      langSpecial      : aOutput.Add(s);
    end;
  end;

  function ProcessUnique(s : string): string;
   var
    t : integer;

   begin
    if aUniqueItems.Count = 0 then
      Result := s
    else begin
      for t:= 0 to aUniqueItems.Count - 1 do begin
        s := StringReplace(s, aUniqueItems[t], IntToStr(t), [rfReplaceAll]);
      end;

      Result := s;
    end;
  end;


 begin
  Result := True;

  for t:=0 to _MaxHeight do
    matrixdata[t] := '';

  entrycount := 0; // total of all entries added to data variable in output

  // ===========================================================================

  prefix := GetNumberFormat(teo.Language, teo.NumberFormat);

  if teo.CleanMode then begin
    spacingstring := ' ';

    teo.Language  := langSpecial;
  end
  else
    spacingstring := ', ';

  // ===========================================================================

  if teo.IncludePreamble then begin

    if teo.ExportMode = 0 then
      cdescription := 'frame'
    else
      cdescription := 'memory';

    // =========================================================================

    GetPreamble(teo, aOutput);

    GetSpacerLine(teo.Language, aOutput);
    aOutput.Add('');
  end;

  // =========================================================================
  // =========================================================================
  // =========================================================================

  vartype := GetVariableType(teo.Language, teo.NumberSize) +
             GetVariableID(teo.Language);

  if vartype <> '' then begin
    aOutput.Add(vartype);
  end;

  teo.DataPadding := PadString(' ', length(vartype));

  // =========================================================================
  // =========================================================================

  for t:=teo.StartFrame to teo.EndFrame do begin
    for i:=0 to _MaxHeight do
      matrixdata[i] := '';

    if teo.Source = SaveTypeRows then begin
      for y:=0 to MatrixMain.MatrixHeight - 1 do begin
        tdo := ExportRowDataRGB(prefix, teo, t, y, spacingstring);

        matrixdata[y] := ProcessUnique(tdo.data[0]);

        inc(entrycount, tdo.count);
      end;
    end;

    if teo.Source = SaveTypeColumns then begin
      for x := 0 to MatrixMain.MatrixWidth - 1 do begin
        tdo := ExportColumnDataRGB(prefix, teo, t, x, spacingstring);

        matrixdata[x] := ProcessUnique(tdo.data[0]);

        inc(entrycount, tdo.count);
      end;
    end;

    // ===========================================================================
    // ===========================================================================
    // row data
    // ===========================================================================
    // ===========================================================================

    if teo.Source = SaveTypeRows then begin
      if teo.orientation = RowsTopToBottom then begin
        s := '';

        for y := 0 to MatrixMain.MatrixHeight - 1 do begin
          case teo.LineContent of
            LineContentRowCol : AddContentByRowCol(matrixdata[y]);
            LineContentFrame  : s := s + matrixdata[y] + spacingstring;
          end;
        end;

        if teo.LineContent = LineContentFrame then
           AddContentByFrame(teo, s, t, aOutput);
         end
      else begin
        s := '';

        for y := MatrixMain.MatrixHeight - 1 to 0 do begin
          case teo.LineContent of
            LineContentRowCol : AddContentByRowCol(matrixdata[y]);
            LineContentFrame  : s := s + matrixdata[y] + spacingstring;
          end;
        end;

        if teo.LineContent = LineContentFrame then
           AddContentByFrame(teo, s, t, aOutput);
      end;
    end;

    // ===========================================================================
    // col data
    // ===========================================================================

    if teo.Source = SaveTypeColumns then begin
      case teo.orientation of
        0,1 : begin
                if teo.orientation = ColsLeftToRight then begin
                  s := '';

                  for x := 0 to MatrixMain.MatrixWidth - 1 do begin
                    case teo.LineContent of
                      LineContentRowCol : AddContentByRowCol(matrixdata[x]);
                      LineContentFrame  : s := s + matrixdata[x] + spacingstring;
                    end;
                  end;

                  if teo.LineContent = LineContentFrame then
                    AddContentByFrame(teo, s, t, aOutput);
                end
                else begin
                  s := '';

                  for x := MatrixMain.MatrixWidth - 1 to 0 do begin
                    case teo.LineContent of
                       LineContentRowCol : AddContentByRowCol(matrixdata[x]);
                       LineContentFrame  : s := s + matrixdata[x] + spacingstring;
                    end;
                  end;

                  if teo.LineContent = LineContentFrame then
                    AddContentByFrame(teo, s, t, aOutput);
                end;
              end;
        2 : begin
              // sure 2416 not available in RGB!!
            end;
      end;
    end;
  end;

  case teo.language of
    langCOneDim,
    langCTwoDim       : aOutput.Add(teo.DataPadding + '};');
    langPythonOneDim,
    langPythonTwoDim  : aOutput.Add(teo.DataPadding + ']');
  end;

  if teo.IncludePreamble then begin
    GetSpacerLine(teo.Language, aOutput);
  end;
end;


function ExportRowData(teo : TExportOptions; aFrame, rowid : integer; spacingchar : string): TDataOut;
 var
  s : string;
  nsbits, nspads : integer;
  bitcounter, dataindex, x, lScanDirection : integer;
  internalnumber : array[0..7] of Int64;
  lMatrixData : TMatrix;

 begin
  Result.count := 0;

  for x:=0 to 7 do begin
    internalnumber[x] := -1;
    Result.data[x]    := '';
  end;

  nsbits := NumberSizes[teo.NumberSize];
  nspads := NumberPadding[teo.NumberSize];

  lScanDirection := teo.ScanDirection;

  // ===========================================================================

  if teo.ExportMode = 0 then
    lMatrixData := TMatrix(MatrixMain.Matrix[aFrame])
  else
    lMatrixData := TMatrix(MatrixMain.MatrixUser[aFrame]);

  // ===========================================================================

  bitcounter := 0;
  dataindex  := 0;
  internalnumber[dataindex] := 0;

  if teo.Orientation = 0 then begin
    case lScanDirection of
      scanRowAltLeftRight : if odd(rowid) then
                                lScanDirection := scanRowRightToLeft
                              else
                                lScanDirection := scanRowLeftToRight;
      scanRowAltRightLeft : if odd(rowid) then
                                lScanDirection := scanRowLeftToRight
                              else
                                lScanDirection := scanRowRightToLeft;
    end;
  end
  else if teo.Orientation = 1 then begin
    case lScanDirection of
      scanRowAltLeftRight : if odd(MatrixMain.MatrixHeight - rowid - 1) then
                                lScanDirection := scanRowRightToLeft
                              else
                                lScanDirection := scanRowLeftToRight;
      scanRowAltRightLeft : if odd(MatrixMain.MatrixHeight - rowid - 1) then
                                lScanDirection := scanRowLeftToRight
                              else
                                lScanDirection := scanRowRightToLeft;
    end;
  end;

  // ===========================================================================

  if lScanDirection = scanRowLeftToRight then begin // left to right
    for x:=0 to MatrixMain.MatrixWidth - 1 do begin
      if MatrixMain.MatrixDead.Grid[x, rowid] = 0 then begin
        if lMatrixData.Grid[x, rowid] = 1 then begin
          if teo.LSB = 0 then
            internalnumber[dataindex] := internalnumber[dataindex] + (powers[bitcounter])
          else
            internalnumber[dataindex] := internalnumber[dataindex] + (powers[nsbits - bitcounter]);
        end;

        if bitcounter = nsbits then begin
          bitcounter := 0;
          inc(dataindex);

          if (x <> MatrixMain.MatrixWidth - 1) then
            internalnumber[dataindex] := 0;

          inc(Result.Count);
        end
        else
          inc(bitcounter);
      end;
    end;
  end
  else if lScanDirection = scanRowRightToLeft then begin                  // right to left
    for x:=MatrixMain.MatrixWidth - 1 downto 0 do begin
      if MatrixMain.MatrixDead.Grid[x, rowid] = 0 then begin
        if lMatrixData.Grid[x, rowid] = 1 then begin
          if teo.LSB = 0 then
            internalnumber[dataindex] := internalnumber[dataindex] + (powers[bitcounter])
          else
            internalnumber[dataindex] := internalnumber[dataindex] + (powers[nsbits - bitcounter]);
        end;

        if bitcounter=nsbits then begin
          bitcounter := 0;
          inc(dataindex);

          if (x <> 0) then
            internalnumber[dataindex] := 0;

          inc(Result.Count);
        end
        else
          inc(bitcounter);
      end;
    end;
  end;

  // ===========================================================================

  for x:=0 to 7 do begin
    if internalnumber[x] <> -1 then begin
      case teo.NumberSize of
        ns8bitSwap  : begin // swap nybbles
                        s := IntToHex(internalnumber[x], 2);

                        internalnumber[x] := HexToInt(s[2] + s[1]);
                      end;
        ns16bitSwap : begin // swap bytes
                        s := IntToHex(internalnumber[x], 4);

                        internalnumber[x] := HexToInt(s[3] + s[4] + s[1] + s[2]);
                      end;
      end;

      case teo.NumberFormat of
        nfDecimal : Result.data[x] := IntToStr(internalnumber[x]);
        nfBinary  : Result.data[x] := IntegerToBinary(nsbits, internalnumber[x]);
        nfHex     : Result.data[x] := IntToHex(internalnumber[x], nspads);
      end;
    end;
  end;
end;

function ExportRowDataRGB(prefix : string; teo : TExportOptions; aFrame, rowid : integer; spacingchar : string): TDataOut;
 var
  lOutput : string;
  lScanDirection : integer;
  x : integer;
  lMatrixData : TMatrix;

 begin
  Result.count   := 0;
  lOutput        := '';
  lScanDirection := teo.ScanDirection;

  // ===========================================================================

  if teo.ExportMode = 0 then
    lMatrixData := TMatrix(MatrixMain.Matrix[aFrame])
  else
    lMatrixData := TMatrix(MatrixMain.MatrixUser[aFrame]);

  // ===========================================================================

  if teo.Orientation = 0 then begin
    case lScanDirection of
      scanRowAltLeftRight : if odd(rowid) then
                                lScanDirection := scanRowRightToLeft
                              else
                                lScanDirection := scanRowLeftToRight;
      scanRowAltRightLeft : if odd(rowid) then
                                lScanDirection := scanRowLeftToRight
                              else
                                lScanDirection := scanRowRightToLeft;
    end;
  end
  else if teo.Orientation = 1 then begin
    case lScanDirection of
      scanRowAltLeftRight : if odd(MatrixMain.MatrixHeight - rowid - 1) then
                                lScanDirection := scanRowRightToLeft
                              else
                                lScanDirection := scanRowLeftToRight;
      scanRowAltRightLeft : if odd(MatrixMain.MatrixHeight - rowid - 1) then
                                lScanDirection := scanRowLeftToRight
                              else
                                lScanDirection := scanRowRightToLeft;
    end;
  end;

  // ===========================================================================

  if lScanDirection = scanRowLeftToRight then begin        // left to right
    for x:=0 to MatrixMain.MatrixWidth - 1 do begin
      if MatrixMain.MatrixDead.Grid[x, rowid] = 0 then begin
        if teo.NumberSize = nsRGB8bit then begin
          if (teo.RGBChangePixels) and (lMatrixData.Grid[x, rowid] = MatrixMain.RGBBackground) then
            lOutput := lOutput + RGBConvertToSplit(teo.RGBChangeColour, teo.RGBMode, teo.LSB, prefix, spacingchar)
          else
            lOutput := lOutput + RGBConvertToSplit(lMatrixData.Grid[x, rowid], teo.RGBMode, teo.LSB, prefix, spacingchar);

          inc(Result.Count, 3);
        end
        else if teo.NumberSize = nsRGB32bit then begin
          if (teo.RGBChangePixels) and (lMatrixData.Grid[x, rowid] = MatrixMain.RGBBackground) then
            lOutput := lOutput + prefix + IntToHex(RGBConvertTo(teo.RGBChangeColour, teo.RGBMode, teo.LSB), 8)
          else
            lOutput := lOutput + prefix + IntToHex(RGBConvertTo(lMatrixData.Grid[x, rowid], teo.RGBMode, teo.LSB), 8);

//          if x <> MatrixMain.MatrixWidth - 1 then
            lOutput := lOutput + spacingchar;

          inc(Result.Count);
        end;
      end;
    end;
  end
  else if lScanDirection = scanRowRightToLeft then begin        // right to left
    for x := MatrixMain.MatrixWidth - 1 downto 0 do begin
      if MatrixMain.MatrixDead.Grid[x, rowid] = 0 then begin
        if teo.NumberSize = nsRGB8bit then begin
          if (teo.RGBChangePixels) and (lMatrixData.Grid[x, rowid] = MatrixMain.RGBBackground) then
            lOutput := lOutput + RGBConvertToSplit(teo.RGBChangeColour, teo.RGBMode, teo.LSB, prefix, spacingchar)
          else
            lOutput := lOutput + RGBConvertToSplit(lMatrixData.Grid[x, rowid], teo.RGBMode, teo.LSB, prefix, spacingchar);

          inc(Result.Count, 3);
        end
        else if teo.NumberSize = nsRGB32bit then begin
          if (teo.RGBChangePixels) and (lMatrixData.Grid[x, rowid] = MatrixMain.RGBBackground) then
            lOutput := lOutput + prefix + IntToHex(RGBConvertTo(teo.RGBChangeColour, teo.RGBMode, teo.LSB), 8)
          else
            lOutput := lOutput + prefix + IntToHex(RGBConvertTo(lMatrixData.Grid[x, rowid], teo.RGBMode, teo.LSB), 8);

  //        if x <> 0 then
            lOutput := lOutput + spacingchar;

          inc(Result.Count);
        end;
      end;
    end;
  end;

  // ===========================================================================

  Result.data[0] := lOutput;
end;

function ExportColumnData(teo : TExportOptions; aFrame, colid : integer; spacingchar : string): TDataOut;
 var
  s : string;
  nsbits, nspads : integer;
  bitcounter, dataindex, y, lScanDirection : integer;
  internalnumber : array[0..7] of Int64;
  lMatrixData : TMatrix;

 begin
  Result.count := 0;

  for y:=0 to 7 do begin
    internalnumber[y] := -1;
    Result.data[y] := '';
  end;

  nsbits := NumberSizes[teo.NumberSize];
  nspads := NumberPadding[teo.NumberSize];

  lScanDirection := teo.ScanDirection;

  // ===========================================================================

  if teo.ExportMode = 0 then
    lMatrixData := TMatrix(MatrixMain.Matrix[aFrame])
  else
    lMatrixData := TMatrix(MatrixMain.MatrixUser[aFrame]);

  // ===========================================================================

  bitcounter := 0;
  dataindex  := 0;
  internalnumber[dataindex] := 0;

  if teo.Orientation = 0 then begin
    case lScanDirection of
      scanColAltDownUp : if odd(colid) then
                           lScanDirection := scanColBottomToTop
                         else
                           lScanDirection := scanColTopToBottom;
      scanColAltUpDown : if odd(colid) then
                           lScanDirection := scanColTopToBottom
                         else
                           lScanDirection := scanColBottomToTop;
    end;
  end
  else if teo.Orientation = 1 then begin
    case lScanDirection of
      scanColAltDownUp : if odd(MatrixMain.MatrixWidth - colid - 1) then
                           lScanDirection := scanColBottomToTop
                         else
                           lScanDirection := scanColTopToBottom;
      scanColAltUpDown : if odd(MatrixMain.MatrixWidth - colid - 1) then
                           lScanDirection := scanColTopToBottom
                         else
                           lScanDirection := scanColBottomToTop;
    end;
  end;

  // ===========================================================================

  if lScanDirection = scanColTopToBottom then begin
    for y:=0 to MatrixMain.MatrixHeight - 1 do begin
      if MatrixMain.MatrixDead.Grid[colid, y] = 0 then begin
        if lMatrixData.Grid[colid, y] = 1 then begin
          if teo.LSB = 0 then
            internalnumber[dataindex] := internalnumber[dataindex] + (powers[bitcounter])
          else
            internalnumber[dataindex] := internalnumber[dataindex] + (powers[nsbits - bitcounter]);
        end;

        if bitcounter = nsbits then begin
          bitcounter := 0;
          inc(dataindex);

          if (y <> MatrixMain.MatrixHeight - 1) then
            internalnumber[dataindex] := 0;

          inc(Result.Count);
        end
        else
          inc(bitcounter);
      end;
    end;
  end
  else if lScanDirection = scanColBottomToTop then begin
    for y:=MatrixMain.MatrixHeight - 1 downto 0 do begin
      if MatrixMain.MatrixDead.Grid[colid, y] = 0 then begin
        if lMatrixData.Grid[colid, y] = 1 then begin
          if teo.LSB = 0 then
            internalnumber[dataindex] := internalnumber[dataindex] + (powers[bitcounter])
          else
            internalnumber[dataindex] := internalnumber[dataindex] + (powers[nsbits - bitcounter]);
        end;

        if bitcounter = nsbits then begin
          bitcounter := 0;
          inc(dataindex);

          if (y <> 0) then
            internalnumber[dataindex] := 0;

          inc(Result.Count);
        end
        else
          inc(bitcounter);
      end;
    end;
  end;

  // ===========================================================================

  for y:=0 to 7 do begin
    if internalnumber[y]<>-1 then begin
      case teo.NumberSize of
        ns8bitSwap  : begin // swap nybbles
                        s := IntToHex(internalnumber[y], 2);

                        internalnumber[y] := HexToInt(s[2] + s[1]);
                      end;
        ns16bitSwap : begin // swap bytes
                        s := IntToHex(internalnumber[y], 4);

                        internalnumber[y] := HexToInt(s[3] + s[4] + s[1] + s[2]);
                      end;
      end;

      case teo.NumberFormat of
        nfDecimal : Result.data[y]:=IntToStr(internalnumber[y]);
        nfBinary  : Result.data[y]:=IntegerToBinary(nsbits, internalnumber[y]);
        nfHex     : Result.data[y]:=IntToHex(internalnumber[y], nspads);
      end;
    end;
  end;
end;

function ExportColumnDataRGB(prefix : string; teo : TExportOptions; aFrame, colid : integer; spacingchar : string): TDataOut;
 var
  output : string;
  lScanDirection : integer;
  y : integer;
  lMatrixData : TMatrix;

 begin
  Result.count   := 0;
  lScanDirection := teo.ScanDirection;

  // ===========================================================================

  if teo.ExportMode = 0 then
    lMatrixData := TMatrix(MatrixMain.Matrix[aFrame])
  else
    lMatrixData := TMatrix(MatrixMain.MatrixUser[aFrame]);

  // ===========================================================================

  if teo.Orientation = 0 then begin
    case lScanDirection of
      scanColAltDownUp : if odd(colid) then
                           lScanDirection := scanColBottomToTop
                         else
                           lScanDirection := scanColTopToBottom;
      scanColAltUpDown : if odd(colid) then
                           lScanDirection := scanColTopToBottom
                         else
                           lScanDirection := scanColBottomToTop;
    end;
  end
  else if teo.Orientation = 1 then begin
    case lScanDirection of
      scanColAltDownUp : if odd(MatrixMain.MatrixWidth - colid - 1) then
                           lScanDirection := scanColBottomToTop
                         else
                           lScanDirection := scanColTopToBottom;
      scanColAltUpDown : if odd(MatrixMain.MatrixWidth - colid - 1) then
                           lScanDirection := scanColTopToBottom
                         else
                           lScanDirection := scanColBottomToTop;
    end;
  end;

  // ===========================================================================

  if lScanDirection = scanColTopToBottom then begin             // top to bottom
    for y:=0 to MatrixMain.MatrixHeight - 1 do begin
      if MatrixMain.MatrixDead.Grid[colid, y] = 0 then begin
        if teo.NumberSize = nsRGB8bit then begin
          if (teo.RGBChangePixels) and (lMatrixData.Grid[colid, y] = MatrixMain.RGBBackground) then
            output := output + prefix + RGBConvertToSplit(teo.RGBChangeColour, teo.RGBMode, teo.LSB, prefix, spacingchar)
          else
            output := output + prefix + RGBConvertToSplit(lMatrixData.Grid[colid, y], teo.RGBMode, teo.LSB, prefix, spacingchar);

          inc(Result.Count, 3);
        end
        else if teo.NumberSize = nsRGB32bit then begin
          if (teo.RGBChangePixels) and (lMatrixData.Grid[colid, y] = MatrixMain.RGBBackground) then
            output := output + prefix + IntToHex(RGBConvertTo(teo.RGBChangeColour, teo.RGBMode, teo.LSB), 8)
          else
            output := output + prefix + IntToHex(RGBConvertTo(lMatrixData.Grid[colid, y], teo.RGBMode, teo.LSB), 8);

          output := output + spacingchar;

          inc(Result.Count);
        end;
      end;
    end;
  end
  else if lScanDirection = scanColBottomToTop then begin        // bottom to top
    for y:=MatrixMain.MatrixHeight - 1 downto 0 do begin
      if MatrixMain.MatrixDead.Grid[colid, y] = 0 then begin
        if teo.NumberSize = nsRGB8bit then begin
          if (teo.RGBChangePixels) and (lMatrixData.Grid[colid, y] = MatrixMain.RGBBackground) then
            output := output + RGBConvertToSplit(teo.RGBChangeColour, teo.RGBMode, teo.LSB, prefix, spacingchar)
          else
            output := output + RGBConvertToSplit(lMatrixData.Grid[colid, y], teo.RGBMode, teo.LSB, prefix, spacingchar);

          inc(Result.Count, 3);
        end
        else if teo.NumberSize = nsRGB32bit then begin
          if (teo.RGBChangePixels) and (lMatrixData.Grid[colid, y] = MatrixMain.RGBBackground) then
            output := output + prefix + IntToHex(RGBConvertTo(teo.RGBChangeColour, teo.RGBMode, teo.LSB), 8)
          else
            output := output + prefix + IntToHex(RGBConvertTo(lMatrixData.Grid[colid, y], teo.RGBMode, teo.LSB), 8);

          output := output + spacingchar;

          inc(Result.Count);
        end;
      end;
    end;
  end;

  // ===========================================================================

  Result.data[0] := output;
end;

function GetRowData(hexmode : boolean; direction, aFrame, rowid : integer): string;
 var
  x : integer;
  mydata : int64;

 begin
  Result := '';
  mydata := 0;

  for x:=0 to MatrixMain.MatrixWidth - 1 do begin
    if TMatrix(MatrixMain.Matrix[aFrame]).Grid[x, rowid] = 1 then begin
      if direction = 0 then
        mydata := mydata + (powers[x])
      else
        mydata := mydata + (powers[MatrixMain.MatrixWidth - x]);
    end;
  end;

  if hexmode then
    Result := IntToHex(mydata, AppSettings.PadModeHexRow)
  else
    Result := IntToStr(mydata);
end;

function GetColumnData(hexmode : boolean; direction, aFrame, colid : integer): string;
 var
  y : integer;
  mydata : int64;

 begin
  Result := '';
  mydata := 0;

  for y:=0 to MatrixMain.MatrixHeight - 1 do begin
    if TMatrix(MatrixMain.Matrix[aFrame]).Grid[colid, y] = 1 then begin
      if direction = 0 then
        mydata := mydata + (powers[y])
      else
        mydata := mydata + (powers[MatrixMain.MatrixHeight - y]);
    end;
  end;

  if hexmode then
    Result := IntToHex(mydata, AppSettings.PadModeHexCol)
  else
    Result := IntToStr(mydata);
end;

procedure AddContentByFrame(teo : TExportOptions; s : string; frame : integer; var aOutput : TStringList);
 var
  m : string;

 begin
  m := Copy(s, 1, length(s) - 2);

  if teo.FontMode then begin
    case teo.Language of
      langCSV          : aOutput.Add(AppSettings.OpenBracket + m + AppSettings.CloseBracket + ';  // ' + Chr(frame + teo.StartFrame - 1) + ' ASCII ' + IntToStr(frame + teo.StartFrame-1));
      langPICAXE       : aOutput.Add('EEPROM (' + m + ')  ; ' + Chr(frame + teo.StartFrame - 1) + ' ASCII ' + IntToStr(frame + teo.StartFrame - 1));
      langCOneDim      : aOutput.Add(teo.DataPadding + s + '  // ' + Chr(frame + teo.StartFrame - 1) + ' ASCII ' + IntToStr(frame + teo.StartFrame - 1));
      langCTwoDim      : aOutput.Add(teo.DataPadding + '{' + m + '},  // ' + Chr(frame + teo.StartFrame - 1) + ' ASCII ' + IntToStr(frame + teo.StartFrame - 1));
      langPythonOneDim : aOutput.Add(teo.DataPadding + s + '  # ' + Chr(frame + teo.StartFrame - 1) + ' ASCII ' + IntToStr(frame + teo.StartFrame - 1));
      langPythonTwoDim : aOutput.Add(teo.DataPadding + '[' + m + '],  # ' + Chr(frame + teo.StartFrame - 1) + ' ASCII ' + IntToStr(frame + teo.StartFrame - 1));
      langMicrochip    : aOutput.Add('dt ' + m + ' ; ' + Chr(frame + teo.StartFrame - 1) + ' ASCII ' + IntToStr(frame + teo.StartFrame - 1));
      langSpecial      : aOutput.Add(s);
    end;
  end
  else begin
    case teo.Language of
      langCSV          : aOutput.Add(AppSettings.OpenBracket + m + AppSettings.CloseBracket + ';  // ' + teo.cdescription + ' ' + IntToStr(frame));
      langPICAXE       : aOutput.Add('EEPROM (' + m + ')  ; ' + teo.cdescription + ' ' + IntToStr(frame));
      langCOneDim      : aOutput.Add(teo.DataPadding + s + '  // ' + teo.cdescription + ' ' + IntToStr(frame));
      langCTwoDim      : aOutput.Add(teo.DataPadding + '{' + m + '},  // ' + teo.cdescription + ' ' + IntToStr(frame));
      langPythonOneDim : aOutput.Add(teo.DataPadding + s + '  # ' + teo.cdescription + ' ' + IntToStr(frame));
      langPythonTwoDim : aOutput.Add(teo.DataPadding + '[' + m + '],  # ' + teo.cdescription + ' ' + IntToStr(frame));
      langMicrochip    : aOutput.Add('dt ' + m + ' ; ' + teo.cdescription + ' ' + IntToStr(frame));
      langSpecial      : aOutput.Add(s);
    end;
  end;
end;

procedure AddContentByRowCol(teo : TExportOptions; s : string; var aOutput : TStringList);
 var
  m : string;

 begin
  m := Copy(s, 1, length(s) - 2);

  case teo.Language of
    langCSV          : aOutput.Add(AppSettings.OpenBracket + m + AppSettings.CloseBracket + ';');
    langPICAXE       : aOutput.Add('EEPROM (' + m + ')');
    langCOneDim      : aOutput.Add(teo.DataPadding + s);
    langCTwoDim      : aOutput.Add(teo.DataPadding + '{' + m + '},');
    langPythonOneDim : aOutput.Add(teo.DataPadding + s);
    langPythonTwoDim : aOutput.Add(teo.DataPadding + '[' + m + '],');
    langMicrochip    : aOutput.Add('dt ' + m);
    langSpecial      : aOutput.Add(s);
  end;
end;

function GetVariableType(aLanguage, aNumberSize : integer): string;
 begin
  case aLanguage of
    langCSV,
    langPICAXE        : Result := '';
    langCOneDim,
    langCTwoDim       : case aNumberSize of
                          ns8Bit      : Result := 'byte ';
                          ns16bit     : Result := 'word ';
                          ns32bit     : Result := 'uint32_t ';
                          ns8bitSwap  : Result := 'byte';
                          ns16bitSwap : Result := 'word';
                          ns64bit     : Result := 'uint64_t ';
                          nsRGB8bit   : Result := 'byte ';
                          nsRGB32bit  : Result := 'uint32_t ';
                        end;
    langPythonOneDim,
    langPythonTwoDim  : Result := '';
    langMicrochip     : Result := '';
    langSpecial       : Result := '';
  else
    Result := '';
  end;
end;

function GetVariableID(aLanguage : integer): string;
 begin
  case aLanguage of
    langCSV,
    langPICAXE       : Result := '';
    langCOneDim      : Result := 'ledarray[] = {';
    langCTwoDim      : Result := 'ledarray[][] = {';
    langPythonOneDim : Result := 'ledarray[] = [';
    langPythonTwoDim : Result := 'ledarray[][] = [';
    langSpecial      : Result := '';
  else
    Result := '';
  end
end;

function GetLineContent(teo : TExportOptions; aIncludeComment : boolean): string;
 var
  cc : string;

 begin
  if aIncludeComment then
    cc := GetCommentCharacter(teo.Language) + 'Line   : '
  else
    cc := '';

  case teo.LineContent of
    lineContentRowCol : case teo.Source of
                          0 : Result := cc + 'Column';
                          1 : Result := cc + 'Row';
                        end;
    lineContentFrame  : Result := cc + 'Anim Frame';
    lineContentBytes  : Result := cc + IntToStr(teo.LineCount) + ' bytes';
  else
    Result := '';
  end;
end;

function GetLSB(teo : TExportOptions; aIncludeComment : boolean): string;
 var
  cc : string;

 begin
  cc := GetCommentCharacter(teo.Language) + 'Bits   : ';

  case teo.Source of
    0 : case teo.LSB of
          lsbLeft  : Result := cc + 'LSB at top';
          lsbRight : Result := cc + 'MSB at top';
        end;
    1 : case teo.LSB of
          lsbLeft  : Result := cc + 'LSB at left';
          lsbRight : Result := cc + 'MSB at right';
        end;
  else
    Result := '';
  end;
end;

function GetOrientation(teo : TExportOptions; aIncludeComment : boolean): string;
 var
  cc : string;

 begin
  if aIncludeComment then
    cc := GetCommentCharacter(teo.Language) + 'Order  : '
  else
   cc := '';

  case teo.Source of
    SaveTypeColumns : case teo.Orientation of
                        0 : Result := cc + 'Left to right';
                        1 : Result := cc + 'Right to left';
                        2 : Result := cc + 'Sure 24x16';
                      else
                        Result := '';
                      end;
    SaveTypeRows    : case teo.Orientation of
                        0 : Result := cc + 'Top to bottom';
                        1 : Result := cc + 'Bottom to top';
                      else
                        Result := '';
                      end;
  end;
end;

function GetScanDirection(teo : TExportOptions; aIncludeComment : boolean): string;
 var
  cc : string;

 begin
  if aIncludeComment then
    cc := GetCommentCharacter(teo.Language) + 'Scan   : '
  else
    cc := '';

  case teo.Source of
    SaveTypeColumns : case teo.ScanDirection of
                        scanColTopToBottom : Result := cc + 'Top to bottom';
                        scanColBottomToTop : Result := cc + 'Bottom to top';
                        scanColAltDownUp   : Result := cc + 'Alternate (Down/Up)';
                        scanColAltUpDown   : Result := cc + 'Alternate (Up/Down)';
                      else
                        Result := '';
                      end;
    SaveTypeRows    : case teo.ScanDirection of
                        scanRowLeftToRight  : Result := cc + 'Left to right';
                        scanRowRightToLeft  : Result := cc + 'Right to left';
                        scanRowAltLeftRight : Result := cc + 'Alternate (Left/Right)';
                        scanRowAltRightLeft : Result := cc + 'Alternate (Right/Left)';
                      else
                        Result := '';
                      end;
  end;
end;

function GetNumberSize(aLanguage : integer; aNumberSize : integer; aIncludeComment : boolean): string;
 var
  cc : string;

 begin
  if aIncludeComment then
    cc := GetCommentCharacter(aLanguage) + 'Size   : '
  else
    cc := '';

  case aNumberSize of
    ns8Bit      : Result := cc + '8 bits';
    ns16bit     : Result := cc + '16 bits';
    ns32bit     : Result := cc + '32 bits';
    ns8bitSwap  : Result := cc + '8 bits (nibbles swapped)';
    ns16bitSwap : Result := cc + '16 bits (bytes swapped)';
    ns64bit     : Result := cc + '64 bits';
    nsRGB8bit   : Result := cc + '8 bits';
    nsRGB32bit  : Result := cc + '32 bits';
  else
    Result := '';
  end;
end;

function GetNumberFormat(aLanguage, aNumberFormat: integer): string;
 begin
  case aLanguage of
    langCSV          : case aNumberFormat of
                         nfBinary : Result := '%';
                         nfHex    : Result := '$';
                       end;
    langPICAXE       : case aNumberFormat of
                         nfBinary : Result := '%';
                         nfHex    : Result := '$';
                       end;
    langCOneDim,
    langCTwoDim      : case aNumberFormat of
                         nfBinary : Result := 'B';
                         nfHex    : Result := '0x';
                       end;
    langPythonOneDim,
    langPythonTwoDim : case aNumberFormat of
                         nfBinary : Result := '0B';
                         nfHex    : Result := '0x';
                       end;
    langMicrochip    : case aNumberFormat of
                         nfBinary : Result := '%';
                         nfHex    : Result := '0x';
                       end;
  else
    Result := '';
  end;
end;

function GetSource(aLanguage : integer; aSaveType : integer): string;
 var
  cc : string;

 begin
  cc := GetCommentCharacter(aLanguage) + 'Source : ';

  case aSaveType of
    SaveTypeColumns : Result := cc + 'Columns';
    SaveTypeRows    : Result := cc + 'Rows';
  end;
end;

function GetCommentCharacter(aLanguage : integer): string;
 begin
  case aLanguage of
    langCSV          : Result := '// ';
    langPICAXE       : Result := '; ';
    langCOneDim,
    langCTwoDim      : Result := '// ';
    langPythonOneDim,
    langPythonTwoDim : Result := '# ';
    langMicrochip    : Result := '; ';
  else
    Result := '';
  end;
end;

function GetRGBMode(teo : TExportOptions; aIncludeComment : boolean): string;
 var
  cc : string;

 begin
  if aIncludeComment then
    cc := GetCommentCharacter(teo.Language) + 'Colour Format: '
  else
    cc := '';

  case teo.RGBMode of
    rgbConvertToRGB : Result := cc + 'RGB';
    rgbConvertToBGR : Result := cc + 'BGR';
    rgbConvertToGRB : Result := cc + 'GRB';
  end;
end;

function GetLanguage(teo : TExportOptions; aIncludeComment : boolean): string;
 var
  cc : string;

 begin
  if aIncludeComment then  
    cc := GetCommentCharacter(teo.Language) + 'Language : '
  else
    cc := '';

  case teo.Language of
    0 : Result := cc + 'Comma separated';
    1 : Result := cc + 'PICAXE EEPROM';
    2 : Result := cc + 'C-style (1 dimensional)';
    3 : Result := cc + 'C-style (2 dimensional)';
    4 : Result := cc + 'Python (1 dimensional)';
    5 : Result := cc + 'Python (2 dimensional)';
    6 : Result := cc + 'Microchip';
  end;
end;

procedure GetSpacerLine(aLanguage : integer; var aOutput : TStringList);
 var
  cc : string;
 begin
  cc := GetCommentCharacter(aLanguage);

  aOutput.Add(cc);
  aOutput.Add(cc + '=================================================================');
  aOutput.Add(cc);
end;

procedure GetPreamble(teo : TExportOptions; var aOutput : TStringList);
 var
  cc : string;

 begin
  cc := GetCommentCharacter(teo.Language);

  aOutput.Add(cc + '=================================================================');
  aOutput.Add(cc + 'LED Matrix Studio - (c) Paul A Freshney 2016');
  aOutput.Add(cc);
  aOutput.Add(cc + 'www.MaximumOctopus.com');
  aOutput.Add(cc + 'www.MaximumOctopus.com/electronics/builder.htm');
  aOutput.Add(cc);
  aOutput.Add(cc + CreatedDate);
  if MatrixMain.MatrixComment <> '' then begin
    aOutput.Add(cc);
    aOutput.Add(cc + '-----------------------------------------------------------------');
    aOutput.Add(cc + 'Comment:');
    aOutput.Add(cc + ' ' + MatrixMain.MatrixComment);
  end;
  if AppSettings.DataFilename <> '' then begin
    aOutput.Add(cc);
    aOutput.Add(cc + '-----------------------------------------------------------------');
    aOutput.Add(cc + 'Original file:');
    aOutput.Add(cc + ' ' + AppSettings.DataFilename);
  end;
  aOutput.Add(cc);
  aOutput.Add(cc + '=================================================================');
  aOutput.Add(cc);

  if teo.ExportMode=0 then begin
    if teo.FontMode then
      aOutput.Add(cc + 'Font Characters ' + IntToStr(teo.StartFrame) + ' to ' + IntToStr(teo.StartFrame + 95))
    else begin
      if teo.StartFrame=teo.EndFrame then
        aOutput.Add(cc + 'Animation Frame #' + IntToStr(teo.StartFrame))
      else
        aOutput.Add(cc + 'Animation Frames #' + IntToStr(teo.StartFrame) + ' to #' + IntToStr(teo.EndFrame));
    end;
  end
  else begin
    aOutput.Add(cc + 'Memory Buffers #' + IntToStr(teo.StartFrame + 1) + ' to #' + IntToStr(teo.EndFrame + 1));
  end;

  aOutput.Add(cc);
  aOutput.Add(cc + '=================================================================');
  aOutput.Add(cc);

  aOutput.Add(GetSource(teo.Language, teo.Source));
  aOutput.Add(GetLineContent(teo, True));
  aOutput.Add(GetLSB(teo, True));
  aOutput.Add(GetOrientation(teo, True));
  aOutput.Add(GetScanDirection(teo, True));
  
  if teo.RGBEnabled then
    aOutput.Add(GetRGBMode(teo, True))
  else
    aOutput.Add(GetNumberSize(teo.Language, teo.NumberSize, True));
end;

end.
