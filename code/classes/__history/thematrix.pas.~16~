// ===================================================================
//
// (c) Paul Alan Freshney 2012-2016
// www.freshney.org :: paul@freshney.org :: maximumoctopus.com
//
// www.MaximumOctopus.com/electronics/builder.htm
//
// Please do not redistribute the source code!
//
//   Started: October 26th 2014
//  Modified: March 30th 2016
//
// ===================================================================

unit thematrix;

interface

uses ExtCtrls, classes, controls, types, sysutils, graphics, math, xglobal, contnrs;

const
  _MaxWidth            = 127; // 0 to 127
  _MaxHeight           = 127; // 0 to 127

  modeFlipAll          = 0;
  modeMirrorAll        = 1;
  modeInvertAll        = 2;
  modeGradientAll      = 3;

  modeFlip             = 0;
  modeMirror           = 1;
  modeInvert           = 2;

  modeScrollLeft       = 0;
  modeScrollRight      = 1;
  modeScrollUp         = 2;
  modeScrollDown       = 3;

  modeRotateCW         = 0;
  modeRotateACW        = 1;

  drawModeNone         = 0;
  drawModeFilledBox    = 1;
  drawModeEmptyBox     = 2;
  drawModeLine         = 3;
  drawModeFont         = 4;
  drawModeEmptyCircle  = 5;
  drawModeFilledCircle = 6;
  drawModeRandom       = 7;
  drawModeMulti        = 8;
  drawModePicker       = 9;
  drawModeCopy         = 10; // active when user is selecting point 1 and point 2 of the capture square
  drawModePaste        = 11; // active when user is pasting copied section

  LeftOffset           = 70;

type

  TImportData = record
                  Source          : integer;
                  SourceLSB       : integer;
                  SourceDirection : integer;
                  PadMode         : integer;
                  HexFormat       : integer;
                  HexOutput       : integer;
                  Brackets        : integer;
                  MatrixType      : integer;
                  NewWidth        : integer;
                  NewHeight       : integer;
                  NewFrames       : integer;
                  MaxFrames       : integer;
                  ASCIIIndex      : integer;
                  FontMode        : boolean;
                  RGBImport       : boolean;
                end;

  TMouseOverEvent = procedure(const x,y : integer) of object;

  TMatrix = class;
  TMatrixDead = class;

  TDrawData = record
                Mode    : integer;
                Point   : integer;
                Colour  : integer;
                Coords  : array[0..1] of TPoint;
                Special : integer;
              end;

  TTheMatrix = class
  private
    PaintBox         : TPaintBox;
    PreviewBox       : TPaintBox;
    FOnChange        : TNotifyEvent;
    FOnColourChange  : TNotifyEvent;    
    FOnMouseOver     : TMouseOverEvent;

    fFrameCount      : integer;
    fCurrentFrame    : integer;
    fLightBox        : integer;
    fRGBBackground   : integer;
    fRandomCoeff     : integer;
    fDeadPixelsMode  : boolean;
    fMatrixReadOnly  : boolean;
    fSoftwareMode    : integer; // 0 - normal, 1 = font
    fPreviewBoxSize  : integer; // 1...6
    fPreviewActive   : boolean;

    function  LoadDataParameterType(s : string; aHeaderMode, aMatrixMode, aDeadPixelMode : boolean): integer;
    procedure ClickPixel(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Shape1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure Shape1MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

    procedure Shape1MouseUpBiColour(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ClickPixelBiColour(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Shape1MouseMoveBiColour(Sender: TObject; Shift: TShiftState; X, Y: Integer);

    procedure ClickPixelRGB(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Shape1MouseMoveRGB(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure Shape1MouseUpRGB(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

    procedure ClickPixelDeadPixel(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Shape1MouseMoveDeadPixel(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure Shape1MouseUpDeadPixel(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

    function  CurrentFrameCount: integer;
    procedure SetPreviewBoxSize(aSize : integer);
    procedure SetPreviewActive(aActive : boolean);

    procedure pbPreviewPaint(Sender: TObject);
  public
    HaveMatrix       : boolean;

    MatrixComment    : string;

    MatrixWidth      : integer; // actual width of matrix in pixels
    MatrixHeight     : integer; // actual height of matrix in pixels
    MatrixType       : integer; // Mono          = 0;
                                // BiSequential  = 1;
                                // BiBitPlanes   = 2;
                                // RGB           = 3;
    MatrixGradient   : integer; // 0 = off, 1 = on vertical, 2 = on horizontal
    MatrixGrid       : boolean;
    MatrixPixelSize  : integer;
    MatrixPixelSizeZ : integer;
    MatrixPixelShape : integer; // 0 = square, 1 = cirle
    MatrixBrushSize  : integer; // 0 = 1 pixel, 1 = 2x2;
    LastX, LastY     : integer;

    AnimPlaying      : boolean;

    MatrixCopyX      : byte;
    MatrixCopyY      : byte;

    SelectionLMB     : integer;
    SelectionMMB     : integer;
    SelectionRMB     : integer;

    DrawData         : TDrawData;

    LEDColoursSingle : array[0..5] of integer;
    LEDColoursBi     : array[0..5] of integer;
    LEDColours       : array[0..5] of integer; // currently being displayed
    LEDRGBColours    : array[0..3] of integer; // background, rmb, mmb, lmb

    Matrix           : TObjectList;
    MatrixUser       : TObjectList;
    MatrixBackup     : TMatrix;
    MatrixCopy       : TMatrix;
    MatrixDead       : TMatrixDead;

    FontMatrixType   : integer; // mirrors MatrixType, but shows what the font was loaded as
    FontMatrix       : array[0..95, 0..7, 0..7] of integer;
    FontMatrixStart  : array[0..95] of integer;
    FontMatrixEnd    : array[0..95] of integer;

    MatrixGradientIY : array[0.._MaxHeight] of integer;
    MatrixGradientIX : array[0.._MaxWidth] of integer;

    constructor Create(AOwner: TComponent; Zig : TWinControl);
    destructor  Destroy; Override;
    procedure   NewMatrix(aMatrixType, aFrameCount, aTop, aLeft, aWidth, aHeight,
                          aPixelSize, aPixelShape : integer; aGrid, aReadonly, aClearAll : boolean);



    procedure   ConfigurePaintboxDrawing;

    procedure   PaintBoxUpdate(Sender: TObject);
    procedure   PaintBoxUpdateRGB(Sender: TObject);
    procedure   PaintBoxUpdateDeadPixel(Sender: TObject);

    procedure   ChangePixelSize(aNewPixelSize : integer);
    procedure   ChangePixelShape(aNewPixelShape : integer);
    procedure   ChangePixelBrush(aNewBrushSize : integer);
    procedure   ChangeMatrixType(aNewMatrixType : integer);
    procedure   ChangeSoftwareMode(aSoftwareMode : integer);
    procedure   SetMouseButtonColours(aLMB, aMMB, aRMB : integer);

    procedure   BackupMatrix(aFrameIndex : integer);
    procedure   SetDeadPixels(aDeadness : integer);

    procedure   ClearGradients;
    procedure   ClearCurrentFrame;
    procedure   ClearFrame(aFrame : integer);
    procedure   ClearAllFrames;
    procedure   ClearAllFramesGradient(aMode : integer);
    procedure   ClearFont;

    procedure   PerformEffectOnCurrentFrame(aMode : integer);
    procedure   PerformEffectOnAllFrames(aMode : integer);
    procedure   PerformScrollOnCurrentFrame(aMode : integer);
    procedure   RotateCurrentFrame(aMode : integer);
    procedure   RotateFrame(aNewAngle : real; aToFrame : integer);

    procedure   DrawWithBrush(aIndex, x, y : integer);
    procedure   DrawWithBrushMulti(aIndex, x, y : integer);
    procedure   DrawWithBrushPaste(x1, y1 : integer; aTransparent : boolean);

    procedure   CopyCurrentFrame;
    procedure   PasteCurrentFrame;

    procedure   InsertBlankFrameAt(aInsertAt : integer);
    procedure   InsertCopyFrameAt(aInsertAt : integer);
    procedure   AddFrameMultiple(aFrameCount, aFramecurrent : integer);

    procedure   DeleteFrame(aFrame : integer);

    procedure   ChangeCurrentFrame(aFrame : integer);
    procedure   ChangeLightBox(aLightBoxMode : integer);
    procedure   ChangeGrid(aGrid : boolean);
    procedure   ChangeDeadPixelsMode(aMode : boolean);
    procedure   ChangeMatrixReadOnly(aMode : boolean);

    procedure   FadeFirstToLast;

    procedure   CopyShape;
    procedure   UpdateDrawTool(aSetX, aSetY, aSetColour : integer);
    procedure   PlotInBounds(aX, aY, aColour : integer);
    procedure   DrawShape(aRealTime : boolean; aCanvas : TCanvas; aPixelSize, aPixelSizeZ, aColour : integer);

    procedure   DrawFontCharacter(aASCIICode, aFrame : integer);
    procedure   DeleteFontCharacter(aFrame : integer);
    procedure   LoadFont(filename : string);

    procedure   ImportRowData(aHex : boolean; aSourceDirection, aSourceLSB : integer; s : string);
    procedure   ImportColumnData(aHex : boolean; aSourceDirection, aSourceLSB : integer; s : string);
    function    ImportLEDMatrixDataSingleFrame(aFileName : string): TImportData;
    function    ImportFromBMP(aFileName : string; aFCount, aFWidth, aFHeight : integer; aRGBImport, aCreateNew : boolean): TImportData;
    function    ExportToBitmap(aFileName : string): boolean;

    procedure   SaveAnimation(aFilename : string; aTED : TImportData; aEEO : TExportOptions);
    procedure   SaveFont(aFilename : string; aTED : TImportData; aEEO : TExportOptions);
    procedure   SaveAsFont(aFilename : string);
    procedure   SaveAsRGBFont(aFilename : string);
    procedure   SaveSingleFrame(aFilename : string; aTED : TImportData; aFrame : integer);

    procedure   LoadGradient(aFilename : string);

    function    LoadLEDMatrixData(aFileName : widestring; var aEEO : TExportOptions): TImportData;
    function    MergeLEDMatrixData(aFileName : widestring; aStartFrame : integer): TImportData;

    procedure   CopyToUserBuffer(aFrame : integer);
    procedure   RestoreFromUserBuffer(aFrame : integer);
    procedure   CopyFromPrevious(toframe : integer);

    procedure   Undo;
    procedure   Redo;

    function    CanUndo: boolean;
    function    CanRedo: boolean;

    procedure   ChangePixels(aFrom, aTo : integer);
    function    HexToInt(const s : string): integer;
    function    BrightenRGB(aRGB : integer): integer;
    function    RandomColour(aRGB : integer): integer;

    procedure   CopyLEDColours;
    procedure   ChangeSelectionColour(aSelectionLMB, aSelectionMMB, aSelectionRMB : integer);

    function    CalculateMemoryUsage: integer;
    function    DataSizeBytes: integer;

    procedure   Refresh;

    function    GetTotalUndos: integer;
  published
    Property    PreviewBoxSize : integer   Read fPreviewBoxSize Write SetPreviewBoxSize;
    Property    PreviewActive  : boolean   Read fPreviewActive  Write SetPreviewActive;
    Property    FrameCount     : integer   Read CurrentFrameCount;
    Property    CurrentFrame   : integer   Read fCurrentFrame   Write ChangeCurrentFrame;
    Property    LightBox       : integer   Read fLightBox       Write ChangeLightBox;
    Property    RGBBackground  : integer   Read fRGBBackground  Write fRGBBackground;
    Property    RandomCoeff    : integer   Read fRandomCoeff    Write fRandomCoeff;
    Property    DeadPixelsMode : boolean   Read fDeadPixelsMode Write ChangeDeadPixelsMode;
    Property    MatrixReadOnly : boolean   Read fMatrixReadOnly Write ChangeMatrixReadOnly;
    Property    SoftwareMode   : integer   Read fSoftwareMode   Write ChangeSoftwareMode;

    property    OnChange       : TNotifyEvent    Read FOnChange       Write FOnChange;
    property    OnMouseOver    : TMouseOverEvent Read FOnMouseOver    Write FOnMouseOver;
    property    OnColourChange : TNotifyEvent    Read FOnColourChange Write FOnColourChange;
  protected
    procedure   MatrixChange; dynamic;
    procedure   ColourChange; dynamic;
    procedure   MouseOver; dynamic;
  end;

  TMatrix = class(TObject)
              Grid          : array[0.._MaxWidth, 0.._MaxHeight] of integer;

              HistoryOffset : integer;
              History       : TObjectList;
            public
              constructor Create(AOwner: TTheMatrix);
              destructor  Destroy; Override;

              procedure Clear(aMatrixType, aBackground : integer);
              procedure ChangePixels(aFrom, aTo : integer);

              procedure AddToHistory;
              procedure Undo;
              procedure Redo;
            end;

  TMatrixDead = class(TObject)
              Grid : array[0.._MaxWidth, 0.._MaxHeight] of integer;
            public
              constructor Create(AOwner: TTheMatrix);
            end;

  TMatrixHistory = class(TObject)
                     Grid : array[0.._MaxWidth, 0.._MaxHeight] of integer;
                   public
                     constructor Create(AOwner: TMatrix);
                   end;


implementation

uses dialogs;

constructor TTheMatrix.Create(AOwner: TComponent; Zig : TWinControl);
 var
  lMatrix : TMatrix;
  x : integer;
 begin
  PaintBox             := TPaintBox.Create(AOwner);
  PaintBox.Parent      := Zig;
  PaintBox.OnPaint     := PaintBoxUpdate;

  PreviewBox           := TPaintBox.Create(AOwner);
  PreviewBox.Parent    := Zig;
  PreviewBox.Visible   := False;
  PreviewBox.Top       := 102;
  PreviewBox.Left      := 607;

  FPreviewBoxSize      := 1;
  FPreviewActive       := False;

  HaveMatrix           := False;

  fFrameCount          := 1;
  fCurrentFrame        := 1;
  fLightBox            := 0;
  fDeadPixelsMode      := False;

  DrawData.Mode        := drawModeNone;
  DrawData.Point       := 0;
  DrawData.Colour      := 1;
  DrawData.Coords[0].X := -1;
  DrawData.Coords[0].Y := -1;

  fRandomCoeff         := 30;

  MatrixGradient       := 0;

  MatrixBrushSize      := 0;
  MatrixPixelSize      := 1;

  MatrixComment        := '';

  // ===========================================================================

  Matrix           := TObjectList.Create;
  lMatrix          := TMatrix.Create(Self);
  Matrix.Add(lMatrix);

  lMatrix          := TMatrix.Create(Self);
  Matrix.Add(lMatrix);  

  MatrixBackup     := TMatrix.Create(Self);
  MatrixCopy       := TMatrix.Create(Self);
  MatrixDead       := TMatrixDead.Create(Self);

  MatrixUser       := TObjectList.Create;
  for x:= 1 to 10 do begin
    lMatrix          := TMatrix.Create(Self);
    MatrixUser.Add(lMatrix);
  end;

  // ===========================================================================

  with PaintBox do begin
    OnMouseDown := ClickPixel;
    OnMouseMove := Shape1MouseMove;
    OnMouseUp   := Shape1MouseUp;
  end;

  // ===========================================================================

  ClearAllFrames;
end;

destructor TTheMatrix.Destroy;
 begin
  PaintBox.Free;
  PreviewBox.Free;
  Matrix.Free;
  MatrixBackup.Free;
  MatrixCopy.Free;
  MatrixUser.Free;

  inherited Destroy;
end;

procedure TTheMatrix.MatrixChange;
 begin
  if (Assigned(FOnChange)) and (HaveMatrix) then
    FOnChange(Self);
end;

procedure TTheMatrix.ColourChange;
 begin
  if (Assigned(FOnColourChange)) and (HaveMatrix) then
    FOnColourChange(Self);
end;

procedure TTheMatrix.MouseOver;
 begin
//  if Assigned(FOnMouseOver) then
//    FOnMouseOver();
end;

procedure TTheMatrix.SetPreviewBoxSize(aSize : integer);
 begin
  FPreviewBoxSize    := aSize;

  PreviewBox.OnPaint := pbPreviewPaint;

  PreviewBox.Tag     := aSize;

  PreviewBox.Width   := (MatrixWidth) * PreviewBox.Tag;
  PreviewBox.Height  := (MatrixHeight) * PreviewBox.Tag;

  PreviewBox.Left    := LeftOffset + (MatrixPixelSize * (MatrixWidth)) + 20;

  PreviewBox.Invalidate;
end;

procedure TTheMatrix.SetPreviewActive(aActive : boolean);
 begin
  FPreviewActive     := aActive;
  PreviewBox.Visible := aActive;

  PreviewBox.Invalidate;  
end;

function TTheMatrix.CurrentFrameCount: integer;
 begin
  Result := Matrix.Count - 1;
end;

procedure TTheMatrix.PaintBoxUpdate(Sender: TObject);
 var
  x, y : integer;

 begin
  for x:=0 to MatrixWidth - 1 do begin
    for y:=0 to MatrixHeight - 1 do begin
      if MatrixDead.Grid[x, y]  = 0 then begin
        case TMatrix(Matrix[fCurrentFrame]).Grid[x, y] of
          0 : begin
                if (fLightbox = 1) and (fCurrentFrame <> 1) then begin
                  if TMatrix(Matrix[fCurrentFrame - 1]).Grid[x, y] = 1 then
                    PaintBox.Canvas.Brush.Color := LEDColours[5]
                  else
                    PaintBox.Canvas.Brush.Color := LEDColours[0];
                end
                else begin
                  PaintBox.Canvas.Brush.Color := LEDColours[0];
                end;
              end;
          1 : PaintBox.Canvas.Brush.Color := LEDColours[1];
          2 : PaintBox.Canvas.Brush.Color := LEDColours[2];
          3 : PaintBox.Canvas.Brush.Color := LEDColours[3];
        end;
      end
      else
        PaintBox.Canvas.Brush.Color := clBtnFace;

      case MatrixPixelShape of
        pixelSquare : PaintBox.Canvas.FillRect(Rect(x * MatrixPixelSize,
                                                    y * MatrixPixelSize,
                                                    (x * MatrixPixelSize) + MatrixPixelSizeZ,
                                                    (y * MatrixPixelSize) + MatrixPixelSizeZ));
        pixelCircle : PaintBox.Canvas.Ellipse(x * MatrixPixelSize,
                                              y * MatrixPixelSize,
                                              (x * MatrixPixelSize) + MatrixPixelSizeZ,
                                              (y * MatrixPixelSize) + MatrixPixelSizeZ);
      else
        PaintBox.Canvas.FillRect(Rect(x * MatrixPixelSize,
                                      y * MatrixPixelSize,
                                     (x * MatrixPixelSize) + MatrixPixelSizeZ,
                                     (y * MatrixPixelSize) + MatrixPixelSizeZ));
      end;
    end
  end;

  // ===========================================================================
  // ===========================================================================

  if DrawData.Mode <> drawModeNone then begin
    if DrawData.Coords[0].X <> - 1 then begin
      PaintBox.Canvas.Brush.Color := LEDColours[DrawData.Colour];
      DrawShape(True, PaintBox.Canvas, MatrixPixelSize, MatrixPixelSizeZ, 1);

      // =======================================================================

      PaintBox.Canvas.Brush.Color := LEDColours[4];

      case MatrixPixelShape of
        pixelSquare : PaintBox.Canvas.FillRect(Rect(DrawData.Coords[0].X * MatrixPixelSize,
                                                    DrawData.Coords[0].Y * MatrixPixelSize,
                                                    (DrawData.Coords[0].X * MatrixPixelSize) + MatrixPixelSizeZ,
                                                    (DrawData.Coords[0].Y * MatrixPixelSize) + MatrixPixelSizeZ));
        pixelCircle : PaintBox.Canvas.Ellipse(DrawData.Coords[0].X * MatrixPixelSize,
                                              DrawData.Coords[0].Y * MatrixPixelSize,
                                              (DrawData.Coords[0].X * MatrixPixelSize) + MatrixPixelSizeZ,
                                              (DrawData.Coords[0].Y * MatrixPixelSize) + MatrixPixelSizeZ);
      end;
    end;
  end;

  // ===========================================================================
  // ===========================================================================

  if MatrixCopyX <> 0 then begin
    for x:=0 to MatrixCopyX do begin
      for y:=0 to MatrixCopyY do begin
        if (x + lastx >= 0) and (x + lastx <= MatrixWidth - 1) and
          (y + lasty >= 0) and (y + lasty <= MatrixHeight - 1) then begin

           if MatrixDead.Grid[x + lastx, y + lasty] = 0 then
             PaintBox.Canvas.Brush.Color := LEDColours[MatrixCopy.Grid[x, y]]
           else
             PaintBox.Canvas.Brush.Color := clBtnFace;


           case MatrixPixelShape of
             pixelSquare : PaintBox.Canvas.FillRect(Rect((x + lastx) * MatrixPixelSize,
                                                         (y + lasty) * MatrixPixelSize,
                                                         ((x + lastx) * MatrixPixelSize) + MatrixPixelSizeZ,
                                                         ((y + lasty) * MatrixPixelSize) + MatrixPixelSizeZ));
             pixelCircle : PaintBox.Canvas.Ellipse((x + lastx) * MatrixPixelSize,
                                                   (y + lasty) * MatrixPixelSize,
                                                   ((x + lastx) * MatrixPixelSize) + MatrixPixelSizeZ,
                                                   ((y + lasty) * MatrixPixelSize) + MatrixPixelSizeZ);
           end;
        end;
      end;
    end;
  end;

  PreviewBox.Invalidate;
end;

procedure TTheMatrix.PaintBoxUpdateRGB(Sender: TObject);
 var
  x, y : integer;

 begin
  for x := 0 to MatrixWidth - 1 do begin
    for y := 0 to MatrixHeight - 1 do begin
      if MatrixDead.Grid[x, y] = 0 then begin
        if (fLightbox = 1) and (fCurrentFrame <> 1) then begin
          if (TMatrix(Matrix[fCurrentFrame]).Grid[x, y] = RGBBackground) then begin
            if (TMatrix(Matrix[fCurrentFrame - 1]).Grid[x, y] <> RGBBackground) then begin
              PaintBox.Canvas.Brush.Color := BrightenRGB(TMatrix(Matrix[fCurrentFrame - 1]).Grid[x, y])
            end
            else
              PaintBox.Canvas.Brush.Color := RGBBackground;
          end
          else
            PaintBox.Canvas.Brush.Color := TMatrix(Matrix[fCurrentFrame]).Grid[x, y];
        end
        else
          PaintBox.Canvas.Brush.Color := TMatrix(Matrix[fCurrentFrame]).Grid[x, y];
      end
      else
        PaintBox.Canvas.Brush.Color := clBtnFace;

      case MatrixPixelShape of
        pixelSquare : PaintBox.Canvas.FillRect(Rect(x * MatrixPixelSize,
                                                    y * MatrixPixelSize,
                                                    (x * MatrixPixelSize) + MatrixPixelSizeZ,
                                                    (y * MatrixPixelSize) + MatrixPixelSizeZ));
        pixelCircle : PaintBox.Canvas.Ellipse(x * MatrixPixelSize,
                                              y * MatrixPixelSize,
                                              (x * MatrixPixelSize) + MatrixPixelSizeZ,
                                              (y * MatrixPixelSize) + MatrixPixelSizeZ);
      end;
    end;
  end;

  // ===========================================================================
  // ===========================================================================

  if DrawData.Mode <> drawModeNone then begin
    if DrawData.Coords[0].X <> - 1 then begin
      PaintBox.Canvas.Brush.Color := DrawData.Colour;
      DrawShape(True, PaintBox.Canvas, MatrixPixelSize, MatrixPixelSizeZ, 1);

      // =======================================================================

      PaintBox.Canvas.Brush.Color := LEDColours[4];

      case MatrixPixelShape of
        pixelSquare : PaintBox.Canvas.FillRect(Rect(DrawData.Coords[0].X * MatrixPixelSize,
                                                    DrawData.Coords[0].Y * MatrixPixelSize,
                                                    (DrawData.Coords[0].X * MatrixPixelSize) + MatrixPixelSizeZ,
                                                    (DrawData.Coords[0].Y * MatrixPixelSize) + MatrixPixelSizeZ));
        pixelCircle : PaintBox.Canvas.Ellipse(DrawData.Coords[0].X * MatrixPixelSize,
                                              DrawData.Coords[0].Y * MatrixPixelSize,
                                              (DrawData.Coords[0].X * MatrixPixelSize) + MatrixPixelSizeZ,
                                              (DrawData.Coords[0].Y * MatrixPixelSize) + MatrixPixelSizeZ);
      end;
    end;
  end;

  // ===========================================================================
  // ===========================================================================

  if MatrixCopyX <> 0 then begin
    for x:=0 to MatrixCopyX do begin
      for y:=0 to MatrixCopyY do begin
        if (x + lastx >= 0) and (x + lastx <= MatrixWidth - 1) and
          (y + lasty >= 0) and (y + lasty <= MatrixHeight - 1) then begin

           if MatrixDead.Grid[x + lastx, y + lasty] = 0 then
             PaintBox.Canvas.Brush.Color := MatrixCopy.Grid[x, y]
           else
             PaintBox.Canvas.Brush.Color := clBtnFace;

           case MatrixPixelShape of
             pixelSquare : PaintBox.Canvas.FillRect(Rect((x + lastx) * MatrixPixelSize,
                                                         (y + lasty) * MatrixPixelSize,
                                                         ((x + lastx) * MatrixPixelSize) + MatrixPixelSizeZ,
                                                         ((y + lasty) * MatrixPixelSize) + MatrixPixelSizeZ));
             pixelCircle : PaintBox.Canvas.Ellipse((x + lastx) * MatrixPixelSize,
                                                   (y + lasty) * MatrixPixelSize,
                                                   ((x + lastx) * MatrixPixelSize) + MatrixPixelSizeZ,
                                                   ((y + lasty) * MatrixPixelSize) + MatrixPixelSizeZ);
           end;
        end;
      end;
    end;
  end;

  PreviewBox.Invalidate;  
end;

procedure TTheMatrix.PaintBoxUpdateDeadPixel(Sender: TObject);
 var
  x, y : integer;

 begin
  for x:=0 to MatrixWidth - 1 do begin
    for y:=0 to MatrixHeight - 1 do begin
      if MatrixDead.Grid[x, y] = 0 then
        PaintBox.Canvas.Brush.Color := $00000000
      else
        PaintBox.Canvas.Brush.Color := $00FFFFFF;

      case MatrixPixelShape of
        pixelSquare : PaintBox.Canvas.FillRect(Rect(x * MatrixPixelSize,
                                                    y * MatrixPixelSize,
                                                    (x * MatrixPixelSize) + MatrixPixelSizeZ,
                                                    (y * MatrixPixelSize) + MatrixPixelSizeZ));
        pixelCircle : PaintBox.Canvas.Ellipse(x * MatrixPixelSize,
                                              y * MatrixPixelSize,
                                              (x * MatrixPixelSize) + MatrixPixelSizeZ,
                                              (y * MatrixPixelSize) + MatrixPixelSizeZ);
      end;
    end;
  end;
end;

// =============================================================================
// =============================================================================

procedure TTheMatrix.SetDeadPixels(aDeadness : integer);
 var
  x, y : integer;

 begin
  for x:=0 to _MaxWidth do begin
    for y:=0 to _MaxHeight do begin
      MatrixDead.Grid[x, y] := aDeadness;
    end;
  end;
end;

// =============================================================================
// =============================================================================

procedure TTheMatrix.ClearAllFrames;
 begin
  if Matrix.Count > 2 then begin
    while Matrix.Count > 2 do
      Matrix.Delete(Matrix.Count - 1);
  end;

  ClearFrame(0);
  ClearFrame(1);

  TMatrix(Matrix[1]).History.Clear;
  TMatrix(Matrix[1]).AddToHistory;   

  MatrixChange;

  PaintBox.Invalidate;
end;

procedure TTheMatrix.ClearAllFramesGradient(aMode : integer);
 var
  x,y,lFrame : integer;

 begin
  for lFrame:=0 to FrameCount do begin
    for x:=0 to _MaxWidth do begin
      for y:=0 to _MaxHeight do begin
        if aMode = 1 then begin
          if MatrixType = psTypeRGB then
            TMatrix(Matrix[lFrame]).Grid[x, y] := MatrixGradientIY[y]
          else
            TMatrix(Matrix[lFrame]).Grid[x, y] := LEDColours[MatrixGradientIY[y]];
        end
        else begin
          if MatrixType = psTypeRGB then
            TMatrix(Matrix[lFrame]).Grid[x, y] := MatrixGradientIX[y]
          else
            TMatrix(Matrix[lFrame]).Grid[x, y] := LEDColours[MatrixGradientIX[y]];
        end;
      end;
    end;
  end;

  MatrixChange;

  PaintBox.Invalidate;
end;

procedure TTheMatrix.ClearFont;
 var
  i, x, y : integer;

 begin
  for i := 0 to 95 do begin
    for x := 0 to 7 do begin
      for y:= 0 to 7 do begin
        FontMatrix[i, x, y] := -1;
      end;
    end;

    FontMatrixStart[i] := 0;
    FontMatrixEnd[i]   := 0;
  end;
end;

procedure TTheMatrix.SetMouseButtonColours(aLMB, aMMB, aRMB : integer);
 begin
  SelectionLMB := aLMB;
  SelectionMMB := aMMB;
  SelectionRMB := aRMB;
end;

procedure TTheMatrix.ChangePixels(aFrom, aTo : integer);
 var
  lFrame : integer;

 begin
  for lFrame:=0 to FrameCount do begin
    TMatrix(Matrix[lFrame]).ChangePixels(aFrom, aTo);
  end;

  PaintBox.Invalidate;
end;

function TTheMatrix.HexToInt(const s : string): integer;
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

function TTheMatrix.BrightenRGB(aRGB : integer): integer;
 var
  xR : integer;
  xG : integer;
  xB : integer;
 begin
  xR := (aRGB and $0000ff);         // Windows colour structure = BGR
  xB := (aRGB and $ff0000) shr 16;
  xG := (aRGB and $00ff00) shr 8;

  xR := Round(xR * 0.8);
  xG := Round(xG * 0.8);
  xB := Round(xB * 0.8);

{  if xR > 255 then
    xR := 255;
  if xG > 255 then
    xG := 255;
  if xB > 255 then
    xB := 255;}

  Result := (xB shl 16) + (xG shl 8) + xR;
end;

function TTheMatrix.RandomColour(aRGB : integer): integer;
 var
  xR : integer;
  xG : integer;
  xB : integer;
 begin
  xR := (aRGB and $0000ff);         // Windows colour structure = BGR
  xB := (aRGB and $ff0000) shr 16;
  xG := (aRGB and $00ff00) shr 8;

  xR := (xR - RandomCoeff) + (random(2 * RandomCoeff));
  xG := (xG - RandomCoeff) + (random(2 * RandomCoeff));
  xB := (xB - RandomCoeff) + (random(2 * RandomCoeff));

  if xR > 255 then xR := 255;
  if xG > 255 then xG := 255;
  if xB > 255 then xB := 255;

  if xR < 0 then xR := 0;
  if xG < 0 then xG := 0;
  if xB < 0 then xB := 0;

  Result := (xB shl 16) + (xG shl 8) + xR;
end;

procedure TTheMatrix.NewMatrix(aMatrixType, aFrameCount, aTop, aLeft, aWidth, aHeight,
                               aPixelSize, aPixelShape : integer; aGrid, aReadonly, aClearAll : boolean);
 begin
  fCurrentFrame        := 1;
  fLightBox            := 0;
  fDeadPixelsMode      := False;
  fFrameCount          := aFramecount;

  AnimPlaying          := False;

  MatrixCopyX          := 0;
  MatrixCopyY          := 0;

  DrawData.Mode        := drawModeNone;
  DrawData.Point       := 0;
  DrawData.Colour      := 0;
  DrawData.Coords[0].X := -1;
  DrawData.Coords[0].Y := -1;

  LastX                := -1;
  LastY                := -1;

  PaintBox.Top         := aTop;
  PaintBox.Left        := aLeft;
  PaintBox.Width       := aWidth * aPixelSize;
  PaintBox.Height      := aHeight * aPixelSize;

  MatrixWidth          := aWidth;
  MatrixHeight         := aHeight;
  MatrixType           := aMatrixType;
  MatrixGradient       := 0;
  MatrixPixelShape     := aPixelShape;
  MatrixPixelSize      := aPixelSize;
  fMatrixReadOnly      := aReadOnly;

  MatrixGrid           := aGrid;

  if aGrid then
    MatrixPixelSizeZ := MatrixPixelSize - 1
  else
    MatrixPixelSizeZ := MatrixPixelSize;

  // ===========================================================================

  SetDeadPixels(0);

  // ===========================================================================

  ClearGradients;

  // ===========================================================================

  ConfigurePaintboxDrawing;

  // ===========================================================================

  if aClearAll then begin
    ClearAllFrames;

    MatrixComment := '';
  end;

  if aFrameCount <> 1 then begin
    while Matrix.Count <= aFrameCount do
      InsertBlankFrameAt(0);
  end;

  HaveMatrix := True;

  SetPreviewBoxSize(fPreviewBoxSize);

  MatrixChange;
end;

procedure TTheMatrix.ChangePixelSize(aNewPixelSize : integer);
 begin
  MatrixPixelSize := aNewPixelSize;

  PaintBox.Width  := MatrixWidth * MatrixPixelSize;
  PaintBox.Height := MatrixHeight * MatrixPixelSize;

  if MatrixGrid then
    MatrixPixelSizeZ := MatrixPixelSize - 1
  else
    MatrixPixelSizeZ := MatrixPixelSize;

  if PreviewActive then
    PreviewBox.Left := LeftOffset + (MatrixPixelSize * (MatrixWidth)) + 20;

  PaintBox.Invalidate;
end;

procedure TTheMatrix.ChangePixelShape(aNewPixelShape : integer);
 begin
  MatrixPixelShape := aNewPixelShape;

  PaintBox.Invalidate;
end;

procedure TTheMatrix.ChangePixelBrush(aNewBrushSize : integer);
 begin
  MatrixBrushSize := aNewBrushSize;
end;

procedure TTheMatrix.ChangeMatrixType(aNewMatrixType : integer);
 var
  lFrame, x, y : integer;
  
 begin
  if MatrixWidth <> -1 then begin

    MatrixType := aNewMatrixType;

    ConfigurePaintboxDrawing;
  end;

  // if we're moving to single colour matrix
  // make sure the matrix data fits!
  if aNewMatrixType = 0 then begin
    for lFrame:=1 to Matrix.Count - 1 do begin
      for x:=0 to MatrixWidth - 1 do begin
        for y:=0 to MatrixHeight - 1 do begin
          if TMatrix(Matrix[lFrame]).Grid[x, y] > 0 then // TO DO
            TMatrix(Matrix[lFrame]).Grid[x, y] := 1;
        end;
      end;
    end;
  end;

  // ===========================================================================

  ClearGradients;

  // ===========================================================================  

  PaintBox.Invalidate;
end;

procedure TTheMatrix.ChangeSoftwareMode(aSoftwareMode : integer);
 var
  t : integer;
  lMatrix : TMatrix;

 begin
  case aSoftwareMode of
    0 : begin
          ClearAllFrames;
        end;
    1 : begin
          ClearAllFrames;

          for t:= 1 to 95 do begin
            lMatrix := TMatrix.Create(Self);

            Matrix.Add(lMatrix);
          end;
        end;
  end;

  MatrixChange;

  Paintbox.Invalidate;
end;

procedure TTheMatrix.DrawWithBrush(aIndex, x, y : integer);
 var
  a,b : integer;

 begin
  case MatrixBrushSize of
    0 : begin
          TMatrix(Matrix[fCurrentFrame]).Grid[x, y] := aIndex;

          TMatrix(Matrix[fCurrentFrame]).AddToHistory;
        end;
    1 : begin
          TMatrix(Matrix[fCurrentFrame]).Grid[x, y]         := aIndex;
          TMatrix(Matrix[fCurrentFrame]).Grid[x + 1, y]     := aIndex;
          TMatrix(Matrix[fCurrentFrame]).Grid[x, y + 1]     := aIndex;
          TMatrix(Matrix[fCurrentFrame]).Grid[x + 1, y + 1] := aIndex;

          TMatrix(Matrix[fCurrentFrame]).AddToHistory;
        end;
    2 : begin
          for a:=0 to 2 do begin
            for b:=0 to 2 do begin
              TMatrix(Matrix[fCurrentFrame]).Grid[x + a, y + b] := aIndex;
            end;
          end;

          TMatrix(Matrix[fCurrentFrame]).AddToHistory;
        end;
  end;
end;

procedure TTheMatrix.DrawWithBrushMulti(aIndex, x, y : integer);
 var
  a, b, lFrame : integer;

 begin
  for lFrame:=0 to DrawData.Special do begin
    case MatrixBrushSize of
      0 : begin
            TMatrix(Matrix[lFrame]).Grid[x, y] := aIndex;

            TMatrix(Matrix[fCurrentFrame]).AddToHistory;
          end;
      1 : begin
            TMatrix(Matrix[lFrame]).Grid[x, y]         := aIndex;
            TMatrix(Matrix[lFrame]).Grid[x + 1, y]     := aIndex;
            TMatrix(Matrix[lFrame]).Grid[x, y + 1]     := aIndex;
            TMatrix(Matrix[lFrame]).Grid[x + 1, y + 1] := aIndex;

            TMatrix(Matrix[fCurrentFrame]).AddToHistory;
          end;
      2 : begin
            for a:=0 to 2 do begin
              for b:=0 to 2 do begin
                TMatrix(Matrix[lFrame]).Grid[x + a, y + b] := aIndex;
              end;
            end;

            TMatrix(Matrix[fCurrentFrame]).AddToHistory;
          end;
    end;
  end;
end;

procedure TTheMatrix.DrawWithBrushPaste(x1, y1 : integer; aTransparent : boolean);
 var
  x2, y2 : integer;

 begin
  if MatrixType = psTypeRGB then begin
    for x2:=0 to MatrixCopyX do begin
      for y2:=0 to MatrixCopyY do begin
        if (x2 + x1 >= 0) and (x2 + x1 <= MatrixWidth - 1) and
           (y2 + y1 >= 0) and (y2 + y1 <= MatrixHeight - 1) then begin

          if MatrixCopy.Grid[x2, y2] = 1 then begin
            TMatrix(Matrix[fCurrentFrame]).Grid[x2 + x1, y2 + y1] := 1;
          end
          else
            if aTransparent then
              TMatrix(Matrix[fCurrentFrame]).Grid[x2 + x1, y2 + y1] := 0;
        end;
      end;
    end;
  end
  else begin
    for x2:=0 to MatrixCopyX do begin
      for y2:=0 to MatrixCopyY do begin
        if (x2 + x1 >= 0) and (x2 + x1 <= MatrixWidth - 1) and
           (y2 + y1 >= 0) and (y2 + y1 <= MatrixHeight - 1) then begin

          if MatrixCopy.Grid[x2, y2] <> RGBBackground then begin
            TMatrix(Matrix[fCurrentFrame]).Grid[x2 + x1, y2 + y1] := MatrixCopy.Grid[x2, y2];
          end
          else
            if aTransparent then
              TMatrix(Matrix[fCurrentFrame]).Grid[x2 + x1, y2 + y1] := RGBBackground;
        end;
      end;
    end;
  end;

  TMatrix(Matrix[fCurrentFrame]).AddToHistory;
end;

procedure TTheMatrix.ClickPixel(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
 var
  x1, y1 : integer;

 begin
  x1 := Floor(x / MatrixPixelSize);
  y1 := Floor(y / MatrixPixelSize);

  if (x1 < 0) or (y1 < 0) then exit;

  // ===========================================================================

  if ssleft in shift then begin
    case DrawData.Mode of
      drawModeNone  : begin
                        DrawWithBrush(1, x1, y1);

                        LastX := x1;
                        LastY := y1;

                        MatrixChange;
                      end;
      drawModeMulti : begin
                        DrawWithBrushMulti(1, x1, y1);

                        LastX := x1;
                        LastY := y1;

                        MatrixChange;
                      end;
      drawModePaste : begin
                        DrawWithBrushPaste(x1, y1, not(ssShift in shift));

                        MatrixChange;
                      end;
    else
      UpdateDrawTool(x1, y1, 1);
    end;
  end
  else if ssRight in Shift then begin
    case DrawData.Mode of
      drawModeNone  : begin
                        DrawWithBrush(0, x1, y1);

                        LastX := x1;
                        LastY := y1;

                        MatrixChange;
                      end;
      drawModeMulti : begin
                        DrawWithBrushMulti(0, x1, y1);

                        LastX := x1;
                        LastY := y1;

                        MatrixChange;
                      end;
    else
      UpdateDrawTool(x1, y1, 0);
    end;
  end;

  PaintBox.Invalidate;
end;

procedure TTheMatrix.Shape1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
 var
  x1, y1 : integer;

 begin
  x1 := Floor(x / MatrixPixelSize);
  y1 := Floor(y / MatrixPixelSize);

  if (x1 < 0) or (y1 < 0) then exit;

  // ===========================================================================

  if Assigned(FOnMouseOver) then
    FOnMouseOver(x1, y1);

  // ===========================================================================
  // ===========================================================================

  if ssLeft in Shift then begin
    case DrawData.Mode of
      drawModeNone  : begin
                        if not((LastX = x1) and (LastY = y1)) then begin
                          DrawWithBrush(1, x1, y1);
                        end;

                        LastX := x1;
                        LastY := y1;

                        MatrixChange;
                      end;
      drawModeMulti : begin
                        if not((LastX = x1) and (LastY = y1)) then begin
                          DrawWithBrushMulti(1, x1, y1);
                        end;

                        LastX := x1;
                        LastY := y1;

                        MatrixChange;
                      end;
    end;
  end
  else if ssRight in Shift then begin
    case DrawData.Mode of
      drawModeNone  : begin
                        if not((LastX = x1) and (LastY = y1)) then begin
                          DrawWithBrush(0, x1, y1);
                        end;

                        LastX := x1;
                        LastY := y1;

                        MatrixChange;
                      end;
      drawModeMulti : begin
                        if not((LastX = x1) and (LastY = y1)) then begin
                          DrawWithBrushMulti(0, x1, y1);
                        end;

                        LastX := x1;
                        LastY := y1;

                        MatrixChange;
                      end;
    end;
  end;

  LastX := x1;
  LastY := y1;

  PaintBox.Invalidate;
  PreviewBox.Invalidate;
end;

procedure TTheMatrix.Shape1MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
 begin
  {}
end;

procedure TTheMatrix.Shape1MouseUpBiColour(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
 begin
  {}
end;

procedure TTheMatrix.ClickPixelBiColour(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
 var
  x1, y1, i : integer;

 begin
  x1 := Floor(x / MatrixPixelSize);
  y1 := Floor(y / MatrixPixelSize);

  if (x1 < 0) or (y1 < 0) then exit;

  // ===========================================================================

  if ssleft in shift then begin
    case DrawData.Mode of
      drawModeNone   : begin
                         DrawWithBrush(SelectionLMB, x1, y1);

                         LastX := x1;
                         LastY := y1;

                         MatrixChange;
                       end;
      drawModeMulti : begin
                        DrawWithBrushMulti(SelectionLMB, x1, y1);

                        LastX := x1;
                        LastY := y1;

                        MatrixChange;
                      end;
      drawModePaste  : begin
                         DrawWithBrushPaste(x1, y1, not(ssShift in shift));
 
                         MatrixChange;
                       end;
      drawModeRandom : begin
                         i := 1 + random(3);

                         DrawWithBrush(i, x1, y1);

                         MatrixChange;
                       end
    else
      UpdateDrawTool(x1, y1, SelectionLMB);
    end;
  end
  else if ssMiddle in Shift then begin
    case DrawData.Mode of
      drawModeNone  : begin
                        DrawWithBrush(SelectionMMB, x1, y1);

                        LastX := x1;
                        LastY := y1;

                        MatrixChange;
                      end;
      drawModeMulti : begin
                        DrawWithBrushMulti(SelectionMMB, x1, y1);

                        LastX := x1;
                        LastY := y1;

                        MatrixChange;
                      end;
    else
      UpdateDrawTool(x1, y1, SelectionMMB);
    end;
  end
  else if ssRight in Shift then begin
    case DrawData.Mode of
      drawModeNone  : begin
                        DrawWithBrush(SelectionRMB, x1, y1);

                        LastX := x1;
                        LastY := y1;

                        MatrixChange;
                      end;
      drawModeMulti : begin
                        DrawWithBrushMulti(SelectionRMB, x1, y1);

                        LastX := x1;
                        LastY := y1;

                        MatrixChange;
                      end;
    else
      UpdateDrawTool(x1, y1, SelectionRMB);
    end;
  end;

  PaintBox.Invalidate;
end;

procedure TTheMatrix.Shape1MouseMoveBiColour(Sender: TObject; Shift: TShiftState; X, Y: Integer);
 var
  x1, y1{, x2, y2} : integer;

 begin
  x1 := Floor(x / MatrixPixelSize);
  y1 := Floor(y / MatrixPixelSize);

  if (x1 < 0) or (y1 < 0) then exit;

  // ===========================================================================

  if Assigned(FOnMouseOver) then
    FOnMouseOver(x1, y1);

  // ===========================================================================
  // ===========================================================================

  if ssLeft in Shift then begin
    case DrawData.Mode of
      drawModeNone  : begin
                        if (MatrixGradient = 1) and (MatrixGradientIY[y1] <> 0) and (SelectionLMB <> 0) then begin
                          DrawWithBrush(MatrixGradientIY[y1], x1, y1);
                        end
                        else if (MatrixGradient = 2) and (MatrixGradientIX[x1] <> 0) and (SelectionLMB <> 0) then begin
                          DrawWithBrush(MatrixGradientIX[x1], x1, y1);
                        end
                        else begin
                          DrawWithBrush(SelectionLMB, x1, y1);
                        end;

                        LastX := x1;
                        LastY := y1;

                        MatrixChange;
                      end;
      drawModeMulti : begin
                        DrawWithBrushMulti(SelectionLMB, x1, y1);

                        LastX := x1;
                        LastY := y1;

                        MatrixChange;
                      end;
    end;
  end
  else if ssMiddle in Shift then begin
    case DrawData.Mode of
      drawModeNone  : begin
                        if (MatrixGradient = 1) and (MatrixGradientIY[y1] <> 0) and (SelectionMMB <> 0) then begin
                          DrawWithBrush(MatrixGradientIY[y1], x1, y1);
                        end
                        else if (MatrixGradient = 2) and (MatrixGradientIX[x1] <> 0) and (SelectionMMB <> 0) then begin
                          DrawWithBrush(MatrixGradientIX[x1], x1, y1);
                        end
                        else begin
                          DrawWithBrush(SelectionMMB, x1, y1);
                        end;

                        LastX := x1;
                        LastY := y1;

                        MatrixChange;
                      end;
      drawModeMulti : begin
                        DrawWithBrushMulti(SelectionMMB, x1, y1);

                        LastX := x1;
                        LastY := y1;

                        MatrixChange;
                      end;
    end;
  end
  else if ssRight in Shift then begin
    case DrawData.Mode of
      drawModeNone  : begin
                        if (MatrixGradient = 1) and (MatrixGradientIY[y1] <> 0) and (SelectionRMB <> 0) then begin
                          DrawWithBrush(MatrixGradientIY[y1], x1, y1);
                        end
                        else if (MatrixGradient = 2) and (MatrixGradientIX[x1] <> 0) and (SelectionRMB <> 0) then begin
                          DrawWithBrush(MatrixGradientIX[x1], x1, y1);
                        end
                        else begin
                          DrawWithBrush(SelectionRMB, x1, y1);
                        end;

                        LastX := x1;
                        LastY := y1;

                        MatrixChange;
                      end;
      drawModeMulti : begin
                        DrawWithBrushMulti(SelectionRMB, x1, y1);

                        LastX := x1;
                        LastY := y1;

                        MatrixChange;
                      end;
    end;
  end;

  LastX := x1;
  LastY := y1;

  PaintBox.Invalidate;
  PreviewBox.Invalidate;
end;

procedure TTheMatrix.ClickPixelRGB(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
 var
  x1, y1 : integer;

 begin
  x1 := Floor(x / MatrixPixelSize);
  y1 := Floor(y / MatrixPixelSize);

  if (x1 < 0) or (y1 < 0) then exit;

  // ===========================================================================

  if ssleft in shift then begin
    case DrawData.Mode of
      drawModeNone   : begin
                         DrawWithBrush(SelectionLMB, x1, y1);

                         LastX := x1;
                         LastY := y1;

                         MatrixChange;
                       end;
      drawModeRandom : begin
                         DrawWithBrush(RandomColour(SelectionLMB), x1, y1);

                         MatrixChange;
                       end;
      drawModeMulti  : begin
                         DrawWithBrushMulti(SelectionLMB, x1, y1);

                         LastX := x1;
                         LastY := y1;

                         MatrixChange;
                       end;
      drawModePicker : ChangeSelectionColour(TMatrix(Matrix[fCurrentFrame]).Grid[x1, y1], SelectionMMB, SelectionRMB);
      drawModePaste  : begin
                         DrawWithBrushPaste(x1, y1, not(ssShift in shift));
 
                         MatrixChange;
                       end;
    else
      UpdateDrawTool(x1, y1, SelectionLMB);
    end;
  end
  else if ssMiddle in Shift then begin
    case DrawData.Mode of
      drawModeNone   : begin
                         case MatrixGradient of
                           0 : DrawWithBrush(SelectionMMB, x1, y1);
                           1 : DrawWithBrush(MatrixGradientIY[y1], x1, y1);
                           2 : DrawWithBrush(MatrixGradientIX[x1], x1, y1);
                         end;

                         LastX := x1;
                         LastY := y1;

                         MatrixChange;
                       end;
      drawModeRandom : begin
                         DrawWithBrush(RandomColour(SelectionMMB), x1, y1);
                       end;
      drawModeMulti  : begin
                         DrawWithBrushMulti(SelectionMMB, x1, y1);

                         LastX := x1;
                         LastY := y1;

                         MatrixChange;
                       end;
      drawModePicker : ChangeSelectionColour(SelectionLMB, TMatrix(Matrix[fCurrentFrame]).Grid[x1, y1], SelectionRMB);
    else
      UpdateDrawTool(x1, y1, SelectionMMB);
    end;
  end  
  else if ssRight in Shift then begin
    case DrawData.Mode of
      drawModeNone   : begin
                         DrawWithBrush(SelectionRMB, x1, y1);

                         LastX := x1;
                         LastY := y1;

                         MatrixChange;
                       end;
      drawModeRandom : begin
                         DrawWithBrush(RandomColour(SelectionRMB), x1, y1);
                       end;
      drawModeMulti  : begin
                         DrawWithBrushMulti(SelectionRMB, x1, y1);

                         LastX := x1;
                         LastY := y1;

                         MatrixChange;
                       end;                       
      drawModePicker : ChangeSelectionColour(SelectionLMB, SelectionMMB, TMatrix(Matrix[fCurrentFrame]).Grid[x1, y1]);
    else
      UpdateDrawTool(x1, y1, SelectionRMB);
    end;
  end;

  PaintBox.Invalidate;
end;

procedure TTheMatrix.Shape1MouseMoveRGB(Sender: TObject; Shift: TShiftState; X, Y: Integer);
 var
  x1, y1{, x2, y2} : integer;

 begin
  x1 := Floor(x / MatrixPixelSize);
  y1 := Floor(y / MatrixPixelSize);

  if (x1 < 0) or (y1 < 0) then exit;

  // ===========================================================================

  if Assigned(FOnMouseOver) then
    FOnMouseOver(x1, y1);

  // ===========================================================================
  // ===========================================================================

  if ssLeft in Shift then begin
    case DrawData.Mode of
      drawModeNone   : begin
                         if not((LastX = x1) and (LastY = y1)) then begin
                           DrawWithBrush(SelectionLMB, x1, y1);
                         end;

                         LastX := x1;
                         LastY := y1;

                         MatrixChange;
                       end;
      drawModeMulti  : begin
                         if not((LastX = x1) and (LastY = y1)) then begin
                           DrawWithBrushMulti(SelectionLMB, x1, y1);
                         end;

                         LastX := x1;
                         LastY := y1;

                         MatrixChange;
                       end;
      drawModeRandom : begin
                         DrawWithBrush(RandomColour(SelectionLMB), x1, y1);
                       end
    end;
  end
  else if ssMiddle in Shift then begin
    case DrawData.Mode of
      drawModeNone   : begin
                         case MatrixGradient of
                           0 : DrawWithBrush(SelectionMMB, x1, y1);
                           1 : DrawWithBrush(MatrixGradientIY[y1], x1, y1);
                           2 : DrawWithBrush(MatrixGradientIX[x1], x1, y1);
                         end;

                         LastX := x1;
                         LastY := y1;

                         MatrixChange;
                       end;
      drawModeMulti  : begin
                         DrawWithBrushMulti(SelectionMMB, x1, y1);

                         LastX := x1;
                         LastY := y1;

                         MatrixChange;
                       end;
      drawModeRandom : begin
                         DrawWithBrush(RandomColour(SelectionMMB), x1, y1);
                       end
    end;
  end
  else if ssRight in Shift then begin
    case DrawData.Mode of
      drawModeNone   : begin
                         if not((LastX = x1) and (LastY = y1)) then begin
                           DrawWithBrush(SelectionRMB, x1, y1);
                         end;

                         LastX := x1;
                         LastY := y1;

                         MatrixChange;
                       end;
      drawModeMulti  : begin
                         if not((LastX = x1) and (LastY = y1)) then begin
                           DrawWithBrushMulti(SelectionRMB, x1, y1);
                         end;

                         LastX := x1;
                         LastY := y1;

                         MatrixChange;
                       end;
      drawModeRandom : begin
                         DrawWithBrush(RandomColour(SelectionRMB), x1, y1);
                       end
    end;
  end;

  LastX := x1;
  LastY := y1;

  PaintBox.Invalidate;
  PreviewBox.Invalidate;  
end;

procedure TTheMatrix.Shape1MouseUpRGB(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
 begin
  {}
end;

procedure TTheMatrix.ClickPixelDeadPixel(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
 var
  x1, y1 : integer;

 begin
  x1 := Floor(x / MatrixPixelSize);
  y1 := Floor(y / MatrixPixelSize);

  if (x1 < 0) or (y1 < 0) then exit;

  // ===========================================================================

  if ssleft in shift then begin
    MatrixDead.Grid[x1, y1] := not MatrixDead.Grid[x1, y1];

    LastX := x1;
    LastY := y1;
  end;

  PaintBox.Invalidate;
end;

procedure TTheMatrix.Shape1MouseMoveDeadPixel(Sender: TObject; Shift: TShiftState; X, Y: Integer);
 var
  x1, y1 : integer;

 begin
  x1 := Floor(x / MatrixPixelSize);
  y1 := Floor(y / MatrixPixelSize);

  if (x1 < 0) or (y1 < 0) then exit;

  // ===========================================================================

  if Assigned(FOnMouseOver) then
    FOnMouseOver(x1, y1);

  // ===========================================================================
  // ===========================================================================

  if ssLeft in Shift then begin
    if not((LastX = x1) and (LastY = y1)) then
      MatrixDead.Grid[x1, y1] := not MatrixDead.Grid[x1, y1];
  end;

  LastX := x1;
  LastY := y1;

  PaintBox.Invalidate;
end;

procedure TTheMatrix.Shape1MouseUpDeadPixel(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
 begin
  {}
end;

// =============================================================================
// =============================================================================
// =============================================================================

procedure TTheMatrix.BackupMatrix(aFrameIndex : integer);
 var
  x,y : integer;

 begin
  for y := 0 to MatrixHeight - 1 do begin
    for x := 0 to MatrixWidth - 1 do begin
      MatrixBackup.Grid[x, y] := TMatrix(Matrix[aFrameIndex]).Grid[x, y];
    end;
  end;
end;

procedure TTheMatrix.ClearGradients;
 var
  t : integer;

 begin
  for t := 0 to _MaxWidth do begin
    if MatrixType = psTypeRGB then
      MatrixGradientIX[t] := RGBBackground
    else
      MatrixGradientIX[t] := 0;
  end;

  for t := 0 to _MaxHeight do begin
    if MatrixType = psTypeRGB then
      MatrixGradientIY[t] := RGBBackground
    else
      MatrixGradientIY[t] := 0;
  end;
end;

procedure TTheMatrix.ClearCurrentFrame;
 begin
  TMatrix(Matrix[fCurrentFrame]).Clear(MatrixType, FRGBBackground);

  TMatrix(Matrix[fCurrentFrame]).AddToHistory;

  PaintBox.Invalidate;

  MatrixChange;
end;

procedure TTheMatrix.ClearFrame(aFrame : integer);
 begin
  BackupMatrix(fCurrentFrame);

  TMatrix(Matrix[aFrame]).Clear(MatrixType, FRGBBackground);

  PaintBox.Invalidate;

  MatrixChange;
end;

procedure TTheMatrix.PerformEffectOnCurrentFrame(aMode : integer);
 var
  x,y : integer;

 begin
  BackupMatrix(fCurrentFrame);

  case aMode of
    modeFlip      : begin
                      for x := 0 to MatrixWidth - 1 do begin
                        for y := 0 to MatrixHeight - 1 do begin
                          TMatrix(Matrix[fCurrentFrame]).Grid[x, y] := MatrixBackup.Grid[MatrixWidth - x - 1, y];
                        end;
                      end;
                    end;
    modeMirror    : begin
                      for y:=0 to MatrixHeight - 1 do begin
                        for x:=0 to MatrixWidth - 1 do begin
                          TMatrix(Matrix[fCurrentFrame]).Grid[x, y] := MatrixBackup.Grid[x, MatrixHeight - y - 1];
                        end;
                      end;
                    end;
    modeInvert    : begin
                      for x:=0 to MatrixWidth - 1 do begin
                        for y:=0 to MatrixHeight - 1 do begin
                          case MatrixType of
                            psTypeMono         : TMatrix(Matrix[fCurrentFrame]).Grid[x, y] := 1 - TMatrix(Matrix[fCurrentFrame]).Grid[x, y];
                            psTypeBiSequential,
                            psTypeBiBitPlanes  : TMatrix(Matrix[fCurrentFrame]).Grid[x, y] := 3 - TMatrix(Matrix[fCurrentFrame]).Grid[x, y];
                            psTypeRGB          : TMatrix(Matrix[fCurrentFrame]).Grid[x, y] := $FFFFFF - TMatrix(Matrix[fCurrentFrame]).Grid[x, y];
                          end;
                        end;
                      end;
                    end;
  end;

  TMatrix(Matrix[fCurrentFrame]).AddToHistory;

  MatrixChange;

  PaintBox.Invalidate;
end;

procedure TTheMatrix.PerformEffectOnAllFrames(aMode : integer);
 var
  x,y, lFrame : integer;

 begin
  case aMode of
    modeFlip        : begin
                        for lFrame:=1 to Matrix.Count - 1 do begin
                          BackupMatrix(lFrame);

                          for x:=0 to MatrixWidth - 1 do begin
                            for y:=0 to MatrixHeight - 1 do begin
                              TMatrix(Matrix[lFrame]).Grid[x, y] := MatrixBackup.Grid[MatrixWidth - x - 1, y];
                            end;
                          end;
                        end;
                      end;
    modeMirror      : begin
                        for lFrame:=1 to Matrix.Count - 1 do begin
                          BackupMatrix(lFrame);

                          for y:=0 to MatrixHeight - 1 do begin
                            for x:=0 to MatrixWidth - 1 do begin
                              TMatrix(Matrix[lFrame]).Grid[x, y] := MatrixBackup.Grid[x, MatrixHeight - y - 1];
                            end;
                          end;
                        end;
                      end;
    modeInvert      : begin
                        for lFrame:=1 to Matrix.Count - 1 do begin
                          BackupMatrix(lFrame);

                          for x:=0 to MatrixWidth - 1 do begin
                            for y:=0 to MatrixHeight - 1 do begin
                              case MatrixType of
                                psTypeMono         : TMatrix(Matrix[lFrame]).Grid[x, y] := 1 - MatrixBackup.Grid[x, y];
                                psTypeBiSequential,
                                psTypeBiBitPlanes  : TMatrix(Matrix[lFrame]).Grid[x, y] := 3 - MatrixBackup.Grid[x, y];
                                psTypeRGB          : TMatrix(Matrix[lFrame]).Grid[x, y] := $00ffffff - MatrixBackup.Grid[x, y];
                              end;
                            end;
                          end;
                        end;
                      end;
    modeGradientAll : begin
                        for lFrame:=1 to Matrix.Count - 1 do begin
                          for x:=0 to MatrixWidth - 1 do begin
                            for y:=0 to MatrixHeight - 1 do begin
                              if (MatrixGradient = 1) and (MatrixGradientIY[y] <> 0) then begin
                                if TMatrix(Matrix[lFrame]).Grid[x, y] <> 0 then
                                  TMatrix(Matrix[lFrame]).Grid[x, y] := MatrixGradientIY[y];
                              end;
                            end;
                          end;
                        end;
                      end;
  end;

  MatrixChange;

  PaintBox.Invalidate;
end;

procedure TTheMatrix.PerformScrollOnCurrentFrame(aMode : integer);
 var
  x,y : integer;

 begin
  BackupMatrix(fCurrentFrame);

  case aMode of
     modeScrollLeft  : begin
                         for x:=0 to MatrixWidth - 2 do begin
                           for y:=0 to MatrixHeight - 1 do begin
                             TMatrix(Matrix[fCurrentFrame]).Grid[x, y] := MatrixBackup.Grid[x + 1, y];
                           end;
                         end;

                         for y:=0 to MatrixHeight - 1 do begin
                           TMatrix(Matrix[fCurrentFrame]).Grid[MatrixWidth - 1, y] := MatrixBackup.Grid[0, y];
                         end;
                       end;
     modeScrollRight : begin
                         for x:=1 to MatrixWidth - 1 do begin
                           for y:=0 to MatrixHeight - 1 do begin
                             TMatrix(Matrix[fCurrentFrame]).Grid[x, y] := MatrixBackup.Grid[x - 1, y];
                           end;
                         end;

                         for y:=0 to MatrixHeight - 1 do begin
                           TMatrix(Matrix[fCurrentFrame]).Grid[0, y] := MatrixBackup.Grid[MatrixWidth - 1, y];
                         end;
                       end;
     modeScrollUp    : begin
                         for y:=0 to MatrixHeight - 2 do begin
                           for x:=0 to MatrixWidth - 1 do begin
                             TMatrix(Matrix[fCurrentFrame]).Grid[x, y] := MatrixBackup.Grid[x, y + 1];
                           end;
                         end;

                         for x:=0 to MatrixWidth - 1 do begin
                           TMatrix(Matrix[fCurrentFrame]).Grid[x, MatrixHeight - 1] := MatrixBackup.Grid[x, 0];
                         end;
                       end;
     modeScrollDown  : begin
                         for y:=1 to MatrixHeight - 1 do begin
                           for x:=0 to MatrixWidth - 1 do begin
                             TMatrix(Matrix[fCurrentFrame]).Grid[x, y] := MatrixBackup.Grid[x, y - 1];
                           end;
                         end;

                         for x:=0 to MatrixWidth - 1 do begin
                           TMatrix(Matrix[fCurrentFrame]).Grid[x, 0] := MatrixBackup.Grid[x, MatrixHeight - 1];
                         end;
                       end;
  end;

  TMatrix(Matrix[fCurrentFrame]).AddToHistory;

  MatrixChange;

  PaintBox.Invalidate;
end;

procedure TTheMatrix.RotateCurrentFrame(aMode : integer);
 var
  x,y : integer;

 begin
  BackupMatrix(fCurrentFrame);

  case aMode of
    modeRotateCW  : begin
                      for x:=0 to MatrixWidth - 1 do begin
                        for y:=0 to MatrixHeight - 1 do begin
                          TMatrix(Matrix[fCurrentFrame]).Grid[x, y] := MatrixBackup.Grid[y, MatrixWidth - x - 1];
                        end;
                      end;
                    end;
    modeRotateACW : begin
                      for x:=0 to MatrixWidth - 1 do begin
                        for y:=0 to MatrixHeight - 1 do begin
                          TMatrix(Matrix[fCurrentFrame]).Grid[x, y] := MatrixBackup.Grid[MatrixHeight - y - 1, x];
                        end;
                      end;
                    end;
  end;

  TMatrix(Matrix[fCurrentFrame]).AddToHistory;

  MatrixChange;

  PaintBox.Invalidate;
end;

procedure TTheMatrix.RotateFrame(aNewAngle : real; aToFrame : integer);
 var
  newx, newy, x, y, ox, oy, hx, hy: integer;
  myangle : real;

 begin
  TMatrix(Matrix[atoframe]).Clear(MatrixType, FRGBBackground);

  myangle := (pi * aNewAngle) / 180;
  hx      := Round((MatrixWidth - 1) / 2);
  hy      := Round((MatrixHeight - 1) / 2);

  for x:=0 to MatrixWidth - 1 do begin
    for y:=0 to MatrixHeight - 1 do begin
      ox   := x - hx;
      oy   := y - hy;

      newx := hx + Round((ox * cos(myangle)) - (oy * sin(myangle)));
      newy := hy + Round((ox * sin(myangle)) + (oy * cos(myangle)));

      if MatrixType = psTypeRGB then begin
        if ((newx >= 0) and (newx <= MatrixWidth - 1) and (newy >= 0) and (newy <= MatrixHeight - 1)) then
          TMatrix(Matrix[aToFrame]).Grid[newx, newy] := MatrixBackup.Grid[x, y];
      end
      else begin
        if MatrixBackup.Grid[x, y] > 0 then begin
          if ((newx >= 0) and (newx <= MatrixWidth - 1) and (newy >= 0) and (newy <= MatrixHeight - 1)) then
            TMatrix(Matrix[aToFrame]).Grid[newx, newy] := MatrixBackup.Grid[x, y];
        end;
      end;
    end;
  end;
end;

// =============================================================================

procedure TTheMatrix.ChangeCurrentFrame(aFrame : integer);
 begin
  fCurrentFrame := aFrame;

  MatrixChange;

  PaintBox.Invalidate;
end;

procedure TTheMatrix.ChangeLightBox(aLightBoxMode : integer);
 begin
  fLightBox := aLightBoxMode;

  PaintBox.Invalidate;
end;

procedure TTheMatrix.ChangeGrid(aGrid : boolean);
 begin
  MatrixGrid := aGrid;

 if MatrixGrid then
    MatrixPixelSizeZ := MatrixPixelSize - 1
  else
    MatrixPixelSizeZ := MatrixPixelSize;
end;

procedure TTheMatrix.ChangeDeadPixelsMode(aMode : boolean);
 begin
  fDeadPixelsMode := aMode;

  ConfigurePaintboxDrawing;
end;

procedure TTheMatrix.ChangeMatrixReadOnly(aMode : boolean);
 begin
  fMatrixReadOnly := aMode;

  ConfigurePaintboxDrawing;
end;

// =============================================================================

procedure TTheMatrix.CopyCurrentFrame;
 var
  x,y : integer;

 begin
  for y:=0 to MatrixHeight - 1 do begin
    for x:=0 to MatrixWidth - 1 do begin
      MatrixCopy.Grid[x, y] := TMatrix(Matrix[fCurrentFrame]).Grid[x, y];
    end;
  end;
end;

procedure TTheMatrix.PasteCurrentFrame;
 var
  x,y : integer;

 begin
  for y:=0 to MatrixHeight - 1 do begin
    for x:=0 to MatrixWidth - 1 do begin
      TMatrix(Matrix[fCurrentFrame]).Grid[x, y] := MatrixCopy.Grid[x, y];
    end;
  end;

  PaintBoxUpdate(Nil);
end;

procedure TTheMatrix.InsertBlankFrameAt(aInsertAt : integer);
 var
  lMatrix : TMatrix;

 begin
  lMatrix := TMatrix.Create(Self);

  if aInsertAt = Matrix.Count - 1 then
    Matrix.Add(lMatrix)
  else
    Matrix.Insert(aInsertAt + 1, lMatrix);
end;

procedure TTheMatrix.InsertCopyFrameAt(aInsertAt : integer);
 var
  x, y : integer;
  lMatrix : TMatrix;

 begin
  lMatrix := TMatrix.Create(Self);

  for x:=0 to MatrixWidth - 1 do begin
    for y:=0 to MatrixHeight - 1 do begin
      lMatrix.Grid[x, y] := TMatrix(Matrix[fCurrentFrame]).Grid[x, y];
    end;
  end;

  if aInsertAt = Matrix.Count - 1 then
    Matrix.Add(lMatrix)
  else
    Matrix.Insert(aInsertAt + 1, lMatrix);
end;

procedure TTheMatrix.AddFrameMultiple(aFrameCount, aFrameCurrent : integer);
 var
  oldframe, lFrame : integer;

 begin
  oldframe := aFrameCurrent;

  for lFrame := 1 to aFrameCount do begin
    InsertBlankFrameAt(oldframe);

    inc(oldframe);
  end;
end;

procedure TTheMatrix.CopyShape;
 var
  x,y, tc : integer;

 begin
  for x:=0 to _MaxWidth do begin
    for y:=0 to _MaxHeight do begin
      if MatrixType = psTypeRGB then
        MatrixCopy.Grid[x, y] := RGBBackground
      else
        MatrixCopy.Grid[x, y] := 0;
    end;
  end;

  if (DrawData.Coords[0].X > DrawData.Coords[1].X) then begin
    tc := DrawData.Coords[0].X;

    DrawData.Coords[0].X := DrawData.Coords[1].X;
    DrawData.Coords[1].X := tc;
  end;

  if (DrawData.Coords[0].Y > DrawData.Coords[1].Y) then begin
    tc := DrawData.Coords[0].Y;

    DrawData.Coords[0].Y := DrawData.Coords[1].Y;
    DrawData.Coords[1].Y := tc;
  end;

  MatrixCopyX := DrawData.Coords[1].X - DrawData.Coords[0].X;
  MatrixCopyY := DrawData.Coords[1].Y - DrawData.Coords[0].Y;

  for x:=DrawData.Coords[0].X to DrawData.Coords[1].X do begin
    for y:=DrawData.Coords[0].Y to DrawData.Coords[1].Y do begin
      MatrixCopy.Grid[x - DrawData.Coords[0].X, y - DrawData.Coords[0].Y] := TMatrix(Matrix[fCurrentFrame]).Grid[x, y];
    end;
  end;

  DrawData.Point       := 0;
  DrawData.Mode        := drawModePaste;
  DrawData.Coords[0].X := -1;
  DrawData.Coords[0].Y := -1;
end;

procedure TTheMatrix.UpdateDrawTool(aSetX, aSetY, aSetColour : integer);
 begin
  showmessage(inttostr(drawdata.point));

  DrawData.Coords[DrawData.Point].X := aSetX;
  DrawData.Coords[DrawData.Point].Y := aSetY;

  if DrawData.Point = 0 then
    DrawData.Colour := aSetColour;

  BackupMatrix(fCurrentFrame);

  case DrawData.Mode of
    drawModeFilledBox,
    drawModeEmptyBox,
    drawModeLine,
    drawModeEmptyCircle,
    drawModeFilledCircle : begin
                             inc(DrawData.Point);

                             if DrawData.Point = 2  then
                               DrawShape(False, PaintBox.Canvas, MatrixPixelSize, MatrixPixelSizeZ, DrawData.Colour);
                           end;
    drawModeCopy         : begin
                             inc(DrawData.Point);

                             if DrawData.Point = 2  then
                               CopyShape;
                           end;
  end;
end;

procedure TTheMatrix.PlotInBounds(aX, aY, aColour : integer);
 begin
  if (aX >= 0) and (aX <= MatrixWidth - 1) and
     (aY >= 0) and (aY <= MatrixHeight - 1) then
    TMatrix(Matrix[fCurrentFrame]).Grid[aX, aY] := aColour;
end;

procedure TTheMatrix.DrawShape(aRealTime : boolean; aCanvas : TCanvas; aPixelSize, aPixelSizeZ, aColour : integer);
 var
  x,y, tc     : integer;
  a,b         : integer;  // displacements in x and y
  d           : integer;  // decision variable
  diag_inc    : integer;  // d's increment for diagonal steps
  dx_diag     : integer;  // diagonal x step for next pixel
  dx_nondiag  : integer;  // nondiagonal x step for next pixel
  dy_diag     : integer;  // diagonal y step for next pixel
  dy_nondiag  : integer;  // nondiagonal y step for next pixel
  i           : integer;  // loop index
  nondiag_inc : integer;  // d's increment for nondiagonal steps
  x1,y1,x2,y2 : integer;

  procedure SimpleLine(x1,y1,x2,y2 : integer; shape : integer; mode : boolean);
   var
    z : integer;

   begin
    z := x1;

    while z<=x2 do begin
      if Mode then begin
        if shape = pixelSquare then
          aCanvas.FillRect(Rect(z * aPixelSize,
                                y1 * aPixelSize,
                                (z * aPixelSize) + aPixelSizeZ,
                                (y1 * aPixelSize) + aPixelSizeZ))
        else
          aCanvas.Ellipse(z * aPixelSize,
                          y1 * aPixelSize,
                          (z * aPixelSize) + aPixelSizeZ,
                          (y1 * aPixelSize) + aPixelSizeZ);
      end
      else begin
        PlotInBounds(z, y1, aColour);
      end;

      inc(z);
    end;
  end;

 begin
  if not(aRealTime) then
    BackupMatrix(fCurrentFrame)
  else begin
    DrawData.Coords[1].X := lastx;
    DrawData.Coords[1].Y := lasty;
  end;

  x1 := DrawData.Coords[0].X;
  y1 := DrawData.Coords[0].Y;
  x2 := DrawData.Coords[1].X;
  y2 := DrawData.Coords[1].Y;

  // ===========================================================================

  case DrawData.Mode of
    // =========================================================================
    // == Filled Box ===========================================================
    // =========================================================================
    drawModeFilledBox   : begin
                            if (x1 > x2) then begin
                              tc := x1;
                              x1 := x2;
                              x2 := tc;
                            end;

                            if (y1 > y2) then begin
                              tc := y1;
                              y1 := y2;
                              y2 := tc;
                            end;

                            for x:=x1 to x2 do begin
                              for y:=y1 to y2 do begin
                                if aRealTime then begin
                                  case MatrixPixelShape of
                                    pixelSquare : aCanvas.FillRect(Rect(x * aPixelSize,
                                                                        y * aPixelSize,
                                                                        (x * aPixelSize) + aPixelSizeZ,
                                                                        (y * aPixelSize) + aPixelSizeZ));
                                    pixelCircle : aCanvas.Ellipse(x * aPixelSize,
                                                                  y * aPixelSize,
                                                                  (x * aPixelSize) + aPixelSizeZ,
                                                                  (y * aPixelSize) + aPixelSizeZ);
                                  end;
                                end
                                else
                                  TMatrix(Matrix[fCurrentFrame]).Grid[x, y] := aColour
                              end;
                            end;
                          end;
    // =========================================================================
    // == Empty Box ============================================================
    // =========================================================================
    drawModeEmptyBox    : begin
                            if (x1 > x2) then begin
                              tc := x1;
                              x1 := x2;
                              x2 := tc;
                            end;

                            if (y1 > y2) then begin
                              tc := y1;

                              y1 := y2;
                              y2 := tc;
                            end;

                            for x:= x1 to x2 do begin
                              for y:=y1 to y2 do begin
                                if ((x = x1) or (x = x2)) or ((y = y1) or (y = y2))  then begin

                                  if aRealTime then begin
                                    case MatrixPixelShape of
                                      pixelSquare : aCanvas.FillRect(Rect(x * aPixelSize,
                                                                          y * aPixelSize,
                                                                          (x * aPixelSize) + aPixelSizeZ,
                                                                          (y * aPixelSize) + aPixelSizeZ));
                                      pixelCircle : aCanvas.Ellipse(x * aPixelSize,
                                                                    y * aPixelSize,
                                                                    (x * aPixelSize) + aPixelSizeZ,
                                                                    (y * aPixelSize) + aPixelSizeZ);
                                    end;
                                  end
                                  else
                                    TMatrix(Matrix[fCurrentFrame]).Grid[x, y] := aColour
                                end;
                              end;
                            end;
                          end;
    // =========================================================================
    // == Straight Line ========================================================
    // =========================================================================
    drawModeLine        : begin
                            x := x1;              // line starting point
                            y := y1;

                            // Determine drawing direction and step to the next pixel.
                            a := x2 - x1;       // difference in x dimension
                            b := y2 - y1;       // difference in y dimension

                            // Determine whether end point lies to right or left of start point.
                            if   a < 0  then begin
                              a := -a;                // make 'a' positive
                              dx_diag := -1
                            end
                            else
                              dx_diag := 1;

                            // Determine whether end point lies above or below start point.
                            if   b < 0 then begin
                              b := -b;                // make 'a' positive
                              dy_diag := -1
                            end
                            else
                              dy_diag := 1;

                            // Identify octant containing end point.
                            if   a < b then begin
                              tc := a;
                              a := b;
                              b := tc;
                              dx_nondiag := 0;
                              dy_nondiag := dy_diag
                            end
                            else begin
                              dx_nondiag := dx_diag;
                              dy_nondiag := 0
                            end;

                            d := b + b - a;            // initial value for d is 2*b - a
                            nondiag_inc := b + b;      // set initial d increment values
                            diag_inc    := b + b - a - a;

                            for i := 0 to a do begin   // draw the a+1 pixels

                              if aRealTime then begin
                                case MatrixPixelShape of
                                  pixelSquare : aCanvas.FillRect(Rect(x * aPixelSize,
                                                                      y * aPixelSize,
                                                                      (x * aPixelSize) + aPixelSizeZ,
                                                                      (y * aPixelSize) + aPixelSizeZ));
                                  pixelCircle : aCanvas.Ellipse(x * aPixelSize,
                                                                y * aPixelSize,
                                                                (x * aPixelSize) + aPixelSizeZ,
                                                                (y * aPixelSize) + aPixelSizeZ);
                                end;
                               end
                               else
                                 TMatrix(Matrix[fCurrentFrame]).Grid[x, y] := aColour;

                              if d < 0 then begin               // step nondiagonally
                                x := x + dx_nondiag;
                                y := y + dy_nondiag;
                                d := d + nondiag_inc   // update decision variable
                              end
                              else begin               // midpoint is above the line; step diagonally
                                x := x + dx_diag;
                                y := y + dy_diag;
                                d := d + diag_inc
                              end
                            end
                          end;
    // =========================================================================
    // == Empty Circle =========================================================
    // =========================================================================
    drawModeEmptyCircle :  begin
                             // c^2 = a^2 + b^2
                             tc := round(sqrt(sqr(abs(x1 - x2)) + sqr(abs(y1 - y2)))); // radius of circle

                             // midpoint algorithm: http://en.wikipedia.org/wiki/Midpoint_circle_algorithm
                             a := 0;
                             b := 1 - tc;
                             while(tc >= a) do begin
                               if aRealTime then begin
                                 case MatrixPixelShape of
                                   pixelSquare : begin
                                                   aCanvas.FillRect(Rect( (tc + x1) * aPixelSize,   (a + y1) * aPixelSize,  ((tc + x1) * aPixelSize) + aPixelSizeZ,   ((a + y1) * aPixelSize) + aPixelSizeZ));
                                                   aCanvas.FillRect(Rect(  (a + x1) * aPixelSize,  (tc + y1) * aPixelSize,   ((a + x1) * aPixelSize) + aPixelSizeZ,  ((tc + y1) * aPixelSize) + aPixelSizeZ));
                                                   aCanvas.FillRect(Rect((-tc + x1) * aPixelSize,   (a + y1) * aPixelSize, ((-tc + x1) * aPixelSize) + aPixelSizeZ,   ((a + y1) * aPixelSize) + aPixelSizeZ));
                                                   aCanvas.FillRect(Rect( (-a + x1) * aPixelSize,  (tc + y1) * aPixelSize,  ((-a + x1) * aPixelSize) + aPixelSizeZ,  ((tc + y1) * aPixelSize) + aPixelSizeZ));
                                                   aCanvas.FillRect(Rect((-tc + x1) * aPixelSize,  (-a + y1) * aPixelSize, ((-tc + x1) * aPixelSize) + aPixelSizeZ,  ((-a + y1) * aPixelSize) + aPixelSizeZ));
                                                   aCanvas.FillRect(Rect( (-a + x1) * aPixelSize, (-tc + y1) * aPixelSize,  ((-a + x1) * aPixelSize) + aPixelSizeZ, ((-tc + y1) * aPixelSize) + aPixelSizeZ));
                                                   aCanvas.FillRect(Rect( (tc + x1) * aPixelSize,  (-a + y1) * aPixelSize,  ((tc + x1) * aPixelSize) + aPixelSizeZ,  ((-a + y1) * aPixelSize) + aPixelSizeZ));
                                                   aCanvas.FillRect(Rect(  (a + x1) * aPixelSize, (-tc + y1) * aPixelSize,   ((a + x1) * aPixelSize) + aPixelSizeZ, ((-tc + y1) * aPixelSize) + aPixelSizeZ));
                                                 end;
                                   pixelCircle : begin
                                                   aCanvas.Ellipse(Rect( (tc + x1) * aPixelSize,   (a + y1) * aPixelSize,  ((tc + x1) * aPixelSize) + aPixelSizeZ,   ((a + y1) * aPixelSize) + aPixelSizeZ));
                                                   aCanvas.Ellipse(Rect(  (a + x1) * aPixelSize,  (tc + y1) * aPixelSize,   ((a + x1) * aPixelSize) + aPixelSizeZ,  ((tc + y1) * aPixelSize) + aPixelSizeZ));
                                                   aCanvas.Ellipse(Rect((-tc + x1) * aPixelSize,   (a + y1) * aPixelSize, ((-tc + x1) * aPixelSize) + aPixelSizeZ,   ((a + y1) * aPixelSize) + aPixelSizeZ));
                                                   aCanvas.Ellipse(Rect( (-a + x1) * aPixelSize,  (tc + y1) * aPixelSize,  ((-a + x1) * aPixelSize) + aPixelSizeZ,  ((tc + y1) * aPixelSize) + aPixelSizeZ));
                                                   aCanvas.Ellipse(Rect((-tc + x1) * aPixelSize,  (-a + y1) * aPixelSize, ((-tc + x1) * aPixelSize) + aPixelSizeZ,  ((-a + y1) * aPixelSize) + aPixelSizeZ));
                                                   aCanvas.Ellipse(Rect( (-a + x1) * aPixelSize, (-tc + y1) * aPixelSize,  ((-a + x1) * aPixelSize) + aPixelSizeZ, ((-tc + y1) * aPixelSize) + aPixelSizeZ));
                                                   aCanvas.Ellipse(Rect( (tc + x1) * aPixelSize,  (-a + y1) * aPixelSize,  ((tc + x1) * aPixelSize) + aPixelSizeZ,  ((-a + y1) * aPixelSize) + aPixelSizeZ));
                                                   aCanvas.Ellipse(Rect(  (a + x1) * aPixelSize, (-tc + y1) * aPixelSize,   ((a + x1) * aPixelSize) + aPixelSizeZ, ((-tc + y1) *  aPixelSize) + aPixelSizeZ));
                                                 end;
                                 end;
                               end
                               else begin
                                 PlotInBounds( tc + x1,   a + y1, aColour);
                                 PlotInBounds(  a + x1,  tc + y1, aColour);
                                 PlotInBounds(-tc + x1,   a + y1, aColour);
                                 PlotInBounds( -a + x1,  tc + y1, aColour);
                                 PlotInBounds(-tc + x1,  -a + y1, aColour);
                                 PlotInBounds( -a + x1, -tc + y1, aColour);
                                 PlotInBounds( tc + x1,  -a + y1, aColour);
                                 PlotInBounds(  a + x1, -tc + y1, aColour);
                               end;

                               inc(a);

                               if (b < 0) then
                                 b := b+ 2 * a + 1
                               else begin
                                 dec(tc);
                                 b := b + 2 * (a - tc + 1);
                               end;
                             end;

                             { Old algorithm, not as good
                             for d:=1 to 512 do begin                          // higher number = more accurate circle at larger matrix sizes  (512 is good for 64x64)
                               x := Round(x1 + (tc*Cos(((2*pi)*d)/512)));
                               y := Round(y1 - (tc*Sin(((2*pi)*d)/512)));

                               if realtime then begin
                                 case MatrixPixelShape of
                                   0 : PaintBox.Canvas.FillRect(Rect(x*MatrixPixelSize, y*MatrixPixelSize,
                                                                    (x*MatrixPixelSize)+MatrixPixelSizeZ, (y*MatrixPixelSize)+MatrixPixelSizeZ));
                                   1 : PaintBox.Canvas.Ellipse(x*MatrixPixelSize, y*MatrixPixelSize,
                                                              (x*MatrixPixelSize)+MatrixPixelSizeZ, (y*MatrixPixelSize)+MatrixPixelSizeZ);
                                 end;
                               end
                               else
                                 Matrix[fCurrentFrame, x, y] :=1;
                             end;}
                           end;
    // =========================================================================
    // == Filled Circle ========================================================
    // =========================================================================
    drawModeFilledCircle : begin
                            // c^2 = a^2 + b^2
                            tc := round(sqrt(sqr(abs(x1 - x2)) + sqr(abs(y1 - y2)))); // radius of circle

                            // midpoint algorithm: http://en.wikipedia.org/wiki/Midpoint_circle_algorithm
                            a := 0;
                            b := 1 - tc;
                            while(tc >= a) do begin
                              if aRealTime then begin
                                SimpleLine(-tc + x1,   a + y1, tc + x1,   a + y1, MatrixPixelShape, True);
                                SimpleLine( -a + x1,  tc + y1,  a + x1,  tc + y1, MatrixPixelShape, True);
                                SimpleLine(-tc + x1,  -a + y1, tc + x1,  -a + y1, MatrixPixelShape, True);
                                SimpleLine( -a + x1, -tc + y1,  a + x1, -tc + y1, MatrixPixelShape, True);
                              end
                              else begin
                                SimpleLine(-tc + x1,   a + y1, tc + x1,   a + y1, MatrixPixelShape, False);
                                SimpleLine( -a + x1,  tc + y1,  a + x1,  tc + y1, MatrixPixelShape, False);
                                SimpleLine(-tc + x1,  -a + y1, tc + x1,  -a + y1, MatrixPixelShape, False);
                                SimpleLine( -a + x1, -tc + y1,  a + x1, -tc + y1, MatrixPixelShape, False);
                              end;

                              inc(a);

                              if (b < 0) then
                                b := b+ 2 * a + 1
                              else begin
                                dec(tc);
                                b := b + 2 * (a - tc + 1);
                              end;
                            end;
                          end;
    // =========================================================================
    // == Copy Lasso thing =====================================================
    // =========================================================================
    drawModeCopy    : begin
                        if not(aRealTime) then exit;

                        if (x1 > x2) then begin
                          tc := x1;
                          x1 := x2;
                          x2 := tc;
                         end;

                         if (y1 > y2) then begin
                           tc := y1;

                           y1 := y2;
                           y2 := tc;
                         end;

                         PaintBox.Canvas.Brush.Color := LEDColours[4];

                         for x:=x1 to x2 do begin
                           for y:=y1 to y2 do begin
                             if (((x = x1) or (x = x2)) or ((y = y1) or (y = y2))) then begin
                               case MatrixPixelShape of
                                 pixelSquare : aCanvas.FillRect(Rect(x * aPixelSize,
                                                                     y * aPixelSize,
                                                                     (x * aPixelSize) + aPixelSizeZ,
                                                                     (y * aPixelSize) + aPixelSizeZ));
                                 pixelCircle : aCanvas.Ellipse(x * aPixelSize,
                                                               y * aPixelSize,
                                                               (x * aPixelSize) + aPixelSizeZ,
                                                               (y * aPixelSize) + aPixelSizeZ);
                               end;
                             end;
                           end;
                         end;
                       end;
  end;

  if not(aRealTime) then begin
    TMatrix(Matrix[fCurrentFrame]).AddToHistory;

    MatrixChange;

    DrawData.Point       := 0;
    DrawData.Coords[0].X := -1;
    DrawData.Coords[0].Y := -1;

    PaintBox.Invalidate;
  end;
end;

procedure TTheMatrix.DrawFontCharacter(aASCIICode, aFrame : integer);
 var
  x, startY, y : integer;
  ts : string;

 begin
  startY := DrawData.Coords[0].Y;
  ts     := '';

  for x:=FontMatrixStart[aASCIICode] to FontMatrixEnd[aASCIICode] do begin
    for y:=0 to 7 do begin
      if (DrawData.Coords[0].X >= 0) and (DrawData.Coords[0].X <= MatrixWidth - 1) and
         (y >= 0) and (y <= MatrixHeight - 1) then begin

        if MatrixType = psTypeRGB then begin
          case FontMatrixType of
            psTypeMono : if FontMatrix[aASCIICode, x, y] = 1 then
                           TMatrix(Matrix[aFrame]).Grid[DrawData.Coords[0].X, startY - y] := DrawData.Colour;
            psTypeRGB  : if FontMatrix[aASCIICode, x, y] <> -1 then
                           TMatrix(Matrix[aFrame]).Grid[DrawData.Coords[0].X, startY - y] := FontMatrix[aASCIICode, x, y];
          end;
        end
        else begin
          case FontMatrixType of
            psTypeMono : if FontMatrix[aASCIICode, x, y] = 1 then
                           TMatrix(Matrix[aFrame]).Grid[DrawData.Coords[0].X, startY - y] := DrawData.Colour;
            psTypeRGB  : if FontMatrix[aASCIICode, x, y] <> -1 then
                           TMatrix(Matrix[aFrame]).Grid[DrawData.Coords[0].X, startY - y] := DrawData.Colour;
          end;
        end;
      end
    end;

    inc(DrawData.Coords[0].X);
  end;

  inc(DrawData.Coords[0].X); // adds single column spacing between chars

  MatrixChange;

  PaintBox.Invalidate;
end;

procedure TTheMatrix.DeleteFontCharacter(aFrame : integer);
 var
  y : integer;

 begin
  dec(DrawData.Coords[0].X);

  for y:=DrawData.Coords[0].Y downto DrawData.Coords[0].Y - 7 do begin
    if (DrawData.Coords[0].X >= 0) and (DrawData.Coords[0].X <= MatrixWidth - 1) and
       (y >= 0) and (y <= MatrixHeight - 1) then begin

      TMatrix(Matrix[aFrame]).Grid[DrawData.Coords[0].X, y] := 0;
    end;
  end;

  MatrixChange;

  PaintBox.Invalidate;  
end;

procedure TTheMatrix.LoadFont(filename : string);
 var
  tf : TextFile;
  s, lInput : string;
  t,p,lByte, lFrame, rowid, colid, lHeight : integer;
  headermode, haddata : boolean;
  lFirstData, lLastData : integer;

 begin
  ClearFont;

  lFrame     := 0;
  colid      := 0;
  lFirstData := -1;
  lLastData  := -1;  

  // ===========================================================================

  AssignFile(tf, filename);
  Reset(tf);

  Readln(tf, s);

  if s = '{fontRGB' then begin
    FontMatrixType := psTypeRGB;

    headermode := True;

    while not(eof(tf)) do begin
      Readln(tf, s);

      case s[1] of
        '{' : begin
                if headermode then begin
                  headermode := False;
                end
                else begin
                  if pos('char', s) <> 0 then begin
                    inc(lFrame);

                    colid := 0;

                    lFirstData := -1;
                    lLastData := -1;
                  end;
                end;
              end;
        '}' : begin
                if not headermode then begin
                  if lFirstData <> -1 then
                    FontMatrixStart[lFrame] := lFirstData
                  else
                    FontMatrixStart[lFrame] := 0;

                  if lLastData <> -1 then
                    FontMatrixEnd[lFrame] := lLastData
                  else
                    FontMatrixEnd[lFrame] := FontMatrixStart[lFrame];
                end;
              end;
        'c' : begin
                lInput  := '';
                rowid   := lHeight - 1;
                haddata := False;

                for t:=3 to length(s) do begin
                  if s[t] = ' ' then begin
                    if lInput = '-1' then
                      FontMatrix[lFrame, colid, rowid] := -1
                    else begin
                      FontMatrix[lFrame, colid, rowid] := HexToInt(lInput);

                      haddata := True;
                    end;

                    dec(rowid);

                    lInput := '';
                  end
                  else
                    lInput := lInput + s[t];
                end;

                if haddata then begin
                  if lFirstData = -1 then
                    lFirstData := colid
                  else
                    lLastData := colid;
                end;

                inc(colid);
              end;
        'h' : if headermode then begin
                lHeight := StrToInt(Copy(s, 3, length(s) - 2));
              end;

      end;
    end;
  end
  else begin  // could do with seeking to beginning of file
    FontMatrixType := psTypeMono;

    while not(eof(tf)) do begin
      Readln(tf, s);

      if s[1] <> '/' then begin
        lInput := '';
        t      := 1;
        colid  := 0;

        while (s[t] <> '/') and (t <= length(s)) do begin
          if (ord(s[t]) = 32) then begin
            if lInput <> '' then begin
              lByte := StrToInt(lInput);

              for p:=0 to 7 do begin
                if (lByte and powers[p]) = powers[p] then
                  FontMatrix[lFrame, colid, p] := 1;
              end;

              lInput := '';
              inc(colid);
            end;
          end
          else if ((ord(s[t]) >= 48) and (ord(s[t]) <= 57)) then begin
            lInput := lInput + s[t];
          end;

          inc(t);
        end;

        FontMatrixStart[lFrame] := 0;
        FontMatrixEnd[lFrame]   := colid - 1;

        inc(lFrame);
      end;
    end;
  end;

  CloseFile(tf);
end;

// =============================================================================

procedure TTheMatrix.DeleteFrame(aFrame : integer);
 begin
  Matrix.Delete(aFrame);

  if aFrame >= Matrix.Count then
    fCurrentFrame := Matrix.Count;

  MatrixChange;

  PaintBox.Invalidate;
end;

// =============================================================================
// =============================================================================
// == Saving / Loading =========================================================
// =============================================================================
// =============================================================================

procedure TTheMatrix.ImportRowData(aHex : boolean; aSourceDirection, aSourceLSB : integer; s : string);
 var
  t, x, rowindex : integer;
  zig, rowvalue : int64;
  temp : string;

 begin
  if aSourceDirection = 0 then
    rowindex := 0
  else
    rowindex := MatrixHeight - 1;

  temp     := '';

  s := UpperCase(s);
  s := StringReplace(s, '0X', '$', [rfReplaceAll]);
  s := StringReplace(s, ',',  ' ', [rfReplaceAll]);
  s := StringReplace(s, '[',  '',  [rfReplaceAll]);
  s := StringReplace(s, ']',  '',  [rfReplaceAll]);
  s := StringReplace(s, '{',  '',  [rfReplaceAll]);
  s := StringReplace(s, '}',  '',  [rfReplaceAll]);
  s := StringReplace(s, '(',  '',  [rfReplaceAll]);
  s := StringReplace(s, ')',  '',  [rfReplaceAll]);
  s := s + ' ';

  for t:=1 to length(s) do begin
    if s[t] = ' ' then begin
      if temp <> '' then begin

        if aHex then
          rowvalue := StrToInt64('$' + temp)
        else
          rowvalue := StrToInt64(temp);

        if (rowindex >= 0) and (rowindex <= MatrixHeight - 1) then begin
          for x:=0 to MatrixWidth - 1 do begin
            case aSourceLSB of
              lsbLeft  : begin
                           zig := (rowvalue and Powers[x]);

                           if zig = Powers[x] then begin
                             TMatrix(Matrix[fCurrentFrame]).Grid[x, rowindex] := 1;
                           end
                           else begin
                             TMatrix(Matrix[fCurrentFrame]).Grid[x, rowindex] := 0;
                           end;
                         end;
              lsbRight : begin
                           zig:=(rowvalue and Powers[x]);

                           if zig = Powers[x] then begin
                             TMatrix(Matrix[fCurrentFrame]).Grid[MatrixWidth - x - 1, rowindex] := 1;
                           end
                           else begin
                             TMatrix(Matrix[fCurrentFrame]).Grid[MatrixWidth - x - 1, rowindex] := 0;
                           end;
                         end;
            end;
          end;
        end;

        temp := '';

        if aSourceDirection = 0 then
          inc(rowindex)
        else
          dec(rowindex);
      end;
    end
    else if (ord(s[t]) >= 48) and (ord(s[t]) <= 57) then begin
      temp := temp + s[t];
    end
    else if (ord(s[t]) >= 65) and (ord(s[t]) <= 90) then begin
      temp := temp + s[t];
    end
    else if (s[t] = '$') then begin
      aHex := True;
    end;

    MatrixChange;
  end;

  PaintBox.Invalidate;
end;

procedure TTheMatrix.ImportColumnData(aHex : boolean; aSourceDirection, aSourceLSB : integer; s : string);
 var
  t, y, colindex  : integer;
  zig, colvalue : int64;
  temp : string;

 begin
  if aSourceDirection = 0 then
    colindex := 0
  else
    colindex := MatrixWidth - 1;

  temp := '';

  s := UpperCase(s);
  s := StringReplace(s, '0X', '$', [rfReplaceAll]);
  s := StringReplace(s, ',', ' ', [rfReplaceAll]);
  s := StringReplace(s, '[', '', [rfReplaceAll]);
  s := StringReplace(s, ']', '', [rfReplaceAll]);
  s := StringReplace(s, '{', '', [rfReplaceAll]);
  s := StringReplace(s, '}', '', [rfReplaceAll]);
  s := StringReplace(s, '(', '', [rfReplaceAll]);
  s := StringReplace(s, ')', '', [rfReplaceAll]);
  s := s + ' ';

  for t:=1 to length(s) do begin
    if s[t] = ' ' then begin
      if temp <> '' then begin

        if aHex then
          colvalue := StrToInt64('$' + temp)
        else
          colvalue := StrToInt64(temp);

        if (colindex >= 0) and (colindex <= MatrixWidth - 1) then begin
          for y:=0 to MatrixHeight - 1 do begin
            case aSourceLSB of
              lsbLeft  : begin
                           zig := (colvalue and Powers[y]);

                          if zig = Powers[y] then begin
                             TMatrix(Matrix[fCurrentFrame]).Grid[colindex, y] := 1;
                           end
                           else begin
                             TMatrix(Matrix[fCurrentFrame]).Grid[colindex, y] := 0;
                           end;
                         end;
              lsbRight : begin
                           zig := (colvalue and Powers[y]);

                           if zig = Powers[y] then begin
                             TMatrix(Matrix[fCurrentFrame]).Grid[colindex, MatrixHeight - y] := 1;
                           end
                           else begin
                             TMatrix(Matrix[fCurrentFrame]).Grid[colindex, MatrixHeight - y] := 0;
                           end;
                         end;
            end;
          end;
        end;

        temp := '';

        if aSourceDirection = 0 then
          inc(colindex)
        else
          dec(colindex);
      end;
    end
    else if (ord(s[t]) >= 48) and (ord(s[t]) <= 57) then begin
      temp := temp + s[t];
    end
    else if (ord(s[t]) >= 65) and (ord(s[t]) <= 90) then begin
      temp := temp + s[t];
    end
    else if (s[t] = '$') then begin
      aHex := True;
    end;

    MatrixChange;
  end;

  PaintBox.Invalidate;  
end;

function TTheMatrix.LoadDataParameterType(s : string; aHeaderMode, aMatrixMode, aDeadPixelMode : boolean): integer;
 begin
  Result := -1;

  if Pos('header', s) <> 0 then
    Result := 0
  else if Pos('deadpixel', s) <> 0 then
    Result := 1
  else if s[1] = '{' then
    Result := 2
  else if s[1] = '}' then
    Result := 3
  else begin
    if aHeaderMode then begin
      case s[1] of
        'a' : Result := 10;
        'b' : Result := 11;
        'c' : Result := 12;
        '1' : Result := 13;
        '2' : Result := 14;
        '3' : Result := 15;
        '4' : Result := 16;
        'd' : Result := 17;
        'e' : Result := 18;
        'f' : Result := 19;
        'g' : Result := 20;
        'h' : Result := 21;
        'i' : Result := 22;
        'j' : Result := 23;
        'k' : Result := 24;
        'l' : Result := 25;
        'm' : Result := 26;
        'n' : Result := 27;
        'o' : Result := 28;
        'p' : Result := 29;
        'x' : Result := 30;
        'z' : Result := 31;
        'y' : Result := 32;
        '}' : Result := 33;
      end;
    end
    else if aDeadPixelMode then begin
      case s[1] of
        'p' : Result := 70;
      end;
    end
    else if aMatrixMode then begin
      case s[1] of
        'w' : Result := 50;
        'h' : Result := 51;
        'r' : Result := 52;
      end
    end;
  end;
end;

function TTheMatrix.ImportFromBMP(aFileName : string; aFCount, aFWidth, aFHeight : integer; aRGBImport, aCreateNew : boolean): TImportData;
 var
  ibmp : TBitmap;
  lFrame, w, h, wo : integer;
  lFrameStart, lFrameEnd : integer;
  lMatrix : TMatrix;

 begin
  ibmp := TBitmap.Create;
  ibmp.LoadFromFile(aFileName);

  if aCreateNew then begin
    lFrameStart := 1;
    lFrameEnd   := aFCount;

    fFrameCount := aFCount;
  end
  else begin
    lFrameStart := fCurrentFrame;
    lFrameEnd   := fCurrentFrame + aFCount - 1;

    if lFrameEnd > fFrameCount then
      fFrameCount := lFrameEnd;
  end;

  // ===========================================================================

  for lFrame := lFrameStart to lFrameEnd do begin
    wo := (lFrame - lFrameStart) * aFWidth;

    if lFrame > Matrix.Count - 1 then begin
      lMatrix := TMatrix.Create(Self);
      Matrix.Add(lMatrix);
    end;

    for w:=0 to aFWidth - 1 do begin

      for h:=0 to aFHeight - 1 do begin
        if not aRGBImport then begin
          if ibmp.Canvas.Pixels[wo + w, h] = clWhite then
            TMatrix(Matrix[lFrame]).Grid[w, h] := 0
          else
            TMatrix(Matrix[lFrame]).Grid[w, h] := 1;
        end
        else begin
          TMatrix(Matrix[lFrame]).Grid[w, h] := ibmp.Canvas.Pixels[wo + w, h];
        end;
      end;

    end;
  end;

  // ===========================================================================

  Result.NewWidth    := aFWidth;
  Result.NewHeight   := aFHeight;
  Result.NewFrames   := fFrameCount;
  Result.RGBImport   := aRGBImport;

  PaintBox.Invalidate;

  MatrixChange;

  // ===========================================================================

  ibmp.Free;
end;

procedure TTheMatrix.SaveAnimation(aFileName : string; aTED : TImportData; aEEO : TExportOptions);
 var
  s : string;
  tf : TextFile;
  x,y,i : integer;

 begin
  AssignFile(tf, aFileName);

  Rewrite(tf);

  // ===========================================================================

  writeln(tf, '{header');
  writeln(tf, 'a:' + IntToStr(aTED.Source));
  writeln(tf, 'b:' + IntToStr(aTED.SourceLSB));
  writeln(tf, 'c:' + IntToStr(aTED.SourceDirection));
  writeln(tf, '1:' + IntToStr(aTED.PadMode));
  writeln(tf, '2:' + IntToStr(aTED.HexFormat));
  writeln(tf, '3:' + IntToStr(aTED.HexOutput));
  writeln(tf, '4:' + IntToStr(aTED.Brackets));

  if aEEO.ExportMode <> -1 then begin // export options haven't been modified
    writeln(tf, 'd:' + IntToStr(aEEO.Source));
    writeln(tf, 'e:' + IntToStr(aEEO.Orientation));
    writeln(tf, 'f:' + IntToStr(aEEO.ScanDirection));
    writeln(tf, 'g:' + IntToStr(aEEO.LSB));
    writeln(tf, 'h:' + IntToStr(aEEO.Language));
    writeln(tf, 'i:' + IntToStr(aEEO.NumberFormat));
    writeln(tf, 'j:' + IntToStr(aEEO.NumberSize));
    writeln(tf, 'k:' + IntToStr(aEEO.LineContent));
    writeln(tf, 'l:' + IntToStr(aEEO.LineCount));

    writeln(tf, 'm:' + IntToStr(aEEO.RGBMode));
    writeln(tf, 'n:' + BoolToStr(aEEO.RGBChangePixels));
    writeln(tf, 'o:' + IntToStr(aEEO.RGBChangeColour));

    writeln(tf, 'p:' + BoolToStr(aEEO.Optimise));
  end;

  writeln(tf, 'x:' + MatrixComment);
  writeln(tf, 'z:' + IntToStr(RGBBackground));
  writeln(tf, '}');

  // ===========================================================================

  for i:=1 to aTED.MaxFrames do begin
    case aTED.MatrixType of
      psTypeMono         : writeln(tf, '{anim');
      psTypeBiSequential : writeln(tf, '{anim2');
      psTypeBiBitPlanes  : writeln(tf, '{anim3');
      psTypeRGB          : writeln(tf, '{anim4');
    end;

    writeln(tf, 'w:' + IntToStr(MatrixWidth));
    writeln(tf, 'h:' + IntToStr(MatrixHeight));

    for y := 0 to MatrixHeight - 1 do begin
      s := '';

      for x := 0 to MatrixWidth - 1 do begin
        s := s + IntToHex(TMatrix(Matrix[i]).Grid[x, y], 6) + ' ';
      end;

      writeln(tf, 'r:' + s);
    end;

    writeln(tf, '}');
  end;

  // ===========================================================================

  writeln(tf, '{deadpixel');

  for y:=0 to MatrixHeight - 1 do begin
    s := '';

    for x := 0 to MatrixWidth - 1 do begin
      s := s + IntToStr(MatrixDead.Grid[x, y]) + ' ';
    end;

    writeln(tf, 'p:' + s);
  end;

  writeln(tf, '}');

  // ===========================================================================

  CloseFile(tf);
end;

procedure TTheMatrix.SaveFont(aFileName : string; aTED : TImportData; aEEO : TExportOptions);
 var
  s : string;
  tf : TextFile;
  x,y,i : integer;

 begin
  AssignFile(tf, aFileName);

  Rewrite(tf);

  // ===========================================================================

  writeln(tf, '{fontheader');
  writeln(tf, 'a:' + IntToStr(aTED.Source));
  writeln(tf, 'b:' + IntToStr(aTED.SourceLSB));
  writeln(tf, 'c:' + IntToStr(aTED.SourceDirection));

  if aEEO.ExportMode <> -1 then begin // export options haven't been modified
    writeln(tf, 'd:' + IntToStr(aEEO.Source));
    writeln(tf, 'e:' + IntToStr(aEEO.Orientation));
    writeln(tf, 'f:' + IntToStr(aEEO.ScanDirection));
    writeln(tf, 'g:' + IntToStr(aEEO.LSB));
    writeln(tf, 'h:' + IntToStr(aEEO.Language));
    writeln(tf, 'i:' + IntToStr(aEEO.NumberFormat));
    writeln(tf, 'j:' + IntToStr(aEEO.NumberSize));
    writeln(tf, 'k:' + IntToStr(aEEO.LineContent));
    writeln(tf, 'l:' + IntToStr(aEEO.LineCount));

    writeln(tf, 'm:' + IntToStr(aEEO.RGBMode));
    writeln(tf, 'n:' + BoolToStr(aEEO.RGBChangePixels));
    writeln(tf, 'o:' + IntToStr(aEEO.RGBChangeColour));
  end;

  writeln(tf, 'y:' + IntToStr(aTED.ASCIIIndex));
  writeln(tf, 'x:' + MatrixComment);
  writeln(tf, 'z:' + IntToStr(RGBBackground));
  writeln(tf, '}');

  // ===========================================================================

  for i := 1 to 96 do begin
    case aTED.MatrixType of
      psTypeMono         : writeln(tf, '{font');
      psTypeBiSequential : writeln(tf, '{font2');
      psTypeBiBitPlanes  : writeln(tf, '{font3');
      psTypeRGB          : writeln(tf, '{font4');
    end;

    writeln(tf, 'w:' + IntToStr(MatrixWidth));
    writeln(tf, 'h:' + IntToStr(MatrixHeight));

    for y := 0 to MatrixHeight - 1 do begin
      s := '';

      for x := 0 to MatrixWidth - 1 do begin
        s := s + IntToHex(TMatrix(Matrix[i]).Grid[x, y], 4) + ' ';
      end;

      writeln(tf, 'r:' + s);
    end;

    writeln(tf, '}');
  end;

  // ===========================================================================

  writeln(tf, '{deadpixel');

  for y:=0 to MatrixHeight - 1 do begin
    s := '';

    for x := 0 to MatrixWidth - 1 do begin
      s := s + IntToStr(MatrixDead.Grid[x, y]) + ' ';
    end;

    writeln(tf, 'p:' + s);
  end;

  writeln(tf, '}');

  // ===========================================================================

  CloseFile(tf);
end;

procedure TTheMatrix.SaveSingleFrame(aFileName : string; aTED : TImportData; aFrame : integer);
 var
  s : string;
  tf : TextFile;
  x,y : integer;

 begin
  AssignFile(tf, aFileName);

  Rewrite(tf);

  case aTED.MatrixType of
    psTypeMono         : writeln(tf, '{frame');
    psTypeBiSequential : writeln(tf, '{frame2');
    psTypeBiBitPlanes  : writeln(tf, '{frame3');
    psTypeRGB          : writeln(tf, '{frame4');
  end;

  writeln(tf, 'w:' + IntToStr(MatrixWidth));
  writeln(tf, 'h:' + IntToStr(MatrixHeight));
  writeln(tf, 'x:' + MatrixComment);
  writeln(tf, 'z:' + IntToStr(RGBBackground));

  for y:=0 to MatrixHeight - 1 do begin
    s := '';

    for x := 0 to MatrixWidth - 1 do begin
      s := s + IntToHex(TMatrix(Matrix[aFrame]).Grid[x, y], 6) + ' ';
    end;

    writeln(tf, 'r:' + s);
  end;

  writeln(tf, '}');

  // ===========================================================================

  writeln(tf, '{deadpixel');

  for y:=0 to MatrixHeight - 1 do begin
    s := '';

    for x := 0 to MatrixWidth - 1 do begin
      s := s + IntToStr(MatrixDead.Grid[x, y]) + ' ';
    end;

    writeln(tf, 'p:' + s);
  end;

  writeln(tf, '}');

  // ===========================================================================  

  CloseFile(tf);
end;

procedure TTheMatrix.SaveAsFont(aFileName : string);
 var
  tf : textfile;
  t, x, y, mydata : integer;
  s : string;

 begin
  AssignFile(tf, aFileName);
  Rewrite(tf);

  for t:=1 to 96 do begin
    s := '';

    for x:=0 to MatrixWidth - 1 do begin
      mydata := 0;

      for y:=0 to MatrixHeight - 1 do begin
        if TMatrix(Matrix[t]).Grid[x, y] = 1 then
          mydata := mydata + (powers[MatrixHeight - y - 1]);
      end;

      if x <> MatrixWidth - 1 then
        s := s + IntToStr(mydata) + ', '
      else
        s := s + IntToStr(mydata);
    end;

    Writeln(tf, s + ' // ' + Char(32 + t));
  end;

  CloseFile(tf);
end;

procedure TTheMatrix.SaveAsRGBFont(aFileName : string);
 var
  tf : textfile;
  t, x, y  : integer;
  mydata : string;

 begin
  AssignFile(tf, aFileName);
  Rewrite(tf);

  writeln(tf, '{fontRGB');
  writeln(tf, 'w:' + IntToStr(MatrixWidth));
  writeln(tf, 'h:' + IntToStr(MatrixHeight));
  writeln(tf, '}');

  for t:=1 to 96 do begin
    writeln(tf, '{char');

    for x:=0 to MatrixWidth - 1 do begin
      mydata := '';

      for y:=0 to MatrixHeight - 1 do begin
        if TMatrix(Matrix[t]).Grid[x, y] <> fRGBBackground then
          mydata := mydata + IntTohex(TMatrix(Matrix[t]).Grid[x, y], 6) + ' '
        else
          mydata := mydata + '-1 ';
      end;

      writeln(tf, 'c:' + mydata);
    end;

    writeln(tf, '}');
  end;

  CloseFile(tf);
end;

// =============================================================================
// =============================================================================

function TTheMatrix.ExportToBitmap(aFileName : string): boolean;
 var
  ibmp : TBitmap;
  i, x, y : integer;

 begin
  Result := True;

  try
    ibmp := TBitmap.Create;

    ibmp.Width  := fFrameCount * MatrixWidth;
    ibmp.Height := MatrixHeight;

    for i := 1 to fFrameCount do begin
      for x:= 0 to MatrixWidth - 1 do begin
        for y := 0 to MatrixHeight - 1 do begin

          if MatrixType = psTypeRGB then begin
            ibmp.Canvas.Pixels[((i - 1) * MatrixWidth) + x, y] := TMatrix(Matrix[i]).Grid[x, y];
          end
          else begin
            if TMatrix(Matrix[i]).Grid[x, y] = 0 then
              ibmp.Canvas.Pixels[((i - 1) * MatrixWidth) + x, y] := $00000000
            else
              ibmp.Canvas.Pixels[((i - 1) * MatrixWidth) + x, y] := $00ffffff;
          end;
        end;
      end;
    end;

    ibmp.SaveToFile(aFileName);
  finally
    ibmp.Free;
  end;
end;

// =============================================================================
// =============================================================================
// =============================================================================
// =============================================================================

function TTheMatrix.LoadLEDMatrixData(aFileName : widestring; var aEEO : TExportOptions): TImportData;
 var
  tf : TextFile;
  pixel : string;
  x,Row,i,matrixtype, lRGBBackground : integer;
  tempMaxWidth, tempMaxHeight : integer;
  s,v : string;
  headerMode, fontmode, deadpixelmode, matrixMode : boolean;
  lMatrix : TMatrix;

 begin
  ClearAllFrames;

  // ===========================================================================
  // ===========================================================================

  AssignFile(tf, aFileName);
  Reset(tf);

  Row                    := 0;
  headerMode             := False;
  fontmode               := False;
  deadpixelmode          := False;
  matrixMode             := False;
  matrixtype             := 0;
  lRGBBackground         := -1;

  Result.Source          := -1;
  Result.SourceLSB       := -1;
  Result.SourceDirection := -1;
  Result.MatrixType      := -1;
  Result.RGBImport       := False;

  tempMaxWidth           := -1;
  tempMaxHeight          := -1;

  SetDeadPixels(0);

  // ===========================================================================
  // ===========================================================================

  while not(eof(tf)) do begin
    readln(tf, s);

    if s <> '' then begin
      v := Copy(s, 3, length(s) - 2);

      case LoadDataParameterType(LowerCase(s), headermode, matrixmode, deadpixelmode) of
        0 : begin
              if UpperCase(s) = '{FONTHEADER' then
                fontmode := True
              else
                fontmode := False;

              headerMode := True;
            end;
       1 : begin // dead pixel mode
              deadpixelmode := True;
              matrixMode    := False;

              Row := 0;
            end;
        2 : begin
              Row := 0;

              case v[length(v)] of
                '2' : matrixtype := psTypeBiSequential;
                '3' : matrixtype := psTypeBiBitPlanes;
                '4' : matrixtype := psTypeRGB;
              else
                matrixtype := psTypeMono;
              end;

              headerMode := False;
              matrixMode := True;
            end;
        3 : begin
              if matrixmode then begin
                lMatrix := TMatrix.Create(Self);
                Matrix.Add(lMatrix);
              end;
            end;

       // ======================================================================

       10 : Result.Source           := StrToInt(v);
       11 : Result.SourceLSB        := StrToInt(v);
       12 : Result.SourceDirection  := StrToInt(v);
       13 : Result.PadMode          := StrToInt(v);
       14 : Result.HexFormat        := StrToInt(v);
       15 : Result.HexOutput        := StrToInt(v);
       16 : Result.Brackets         := StrToInt(v);

       17 : aEEO.Source             := StrToInt(v);
       18 : aEEO.Orientation        := StrToInt(v);
       19 : aEEO.ScanDirection      := StrToInt(v);
       20 : aEEO.LSB                := StrToInt(v);
       21 : aEEO.Language           := StrToInt(v);
       22 : aEEO.NumberFormat       := StrToInt(v);
       23 : aEEO.NumberSize         := StrToInt(v);
       24 : aEEO.LineContent        := StrToInt(v);
       25 : aEEO.LineCount          := StrToInt(v);
       26 : aEEO.RGBMode            := StrToInt(v);
       27 : aEEO.RGBChangePixels    := StrToBool(v);
       28 : aEEO.RGBChangeColour    := StrToInt(v);

       29 : aEEO.Optimise           := StrToBool(v);

       30 : MatrixComment           := v;
       31 : lRGBBackground          := StrToInt(v);

       32 : Result.ASCIIIndex       := StrToInt(v);

       33 : {};

       // ======================================================================

       50 : tempMaxWidth  := StrToInt(v);
       51 : tempMaxHeight := StrToInt(v);
       52 : begin
              x     := 0;
              pixel := '';

              for i:=1 to length(v) do begin
                if (v[i] = ' ') or (i = length(v)) then begin
                  if Result.RGBImport then begin
                    if lRGBBackground <> -1 then begin
                      if HexToInt(pixel) = lRGBBackground then
                        TMatrix(Matrix.Last).Grid[x, Row] := RGBBackground;
                    end;
                  end
                  else
                    TMatrix(Matrix.Last).Grid[x, Row] := HexToInt(pixel);

                  inc(x);

                  pixel := '';
                end
                else
                  pixel := pixel + v[i];
              end;

              inc(Row);
            end;

       // ======================================================================

       70 : begin
              x     := 0;
              pixel := '';

              for i:=1 to length(v) do begin
                if (v[i] = ' ') or (i = length(v)) then begin
                  MatrixDead.Grid[x, Row] := StrToInt(pixel);

                  inc(x);

                  pixel := '';
                end
                else
                  pixel := pixel + v[i];
              end;

              inc(Row);
            end;
      end;
    end;
  end;

  CloseFile(tf);

  Matrix.Delete(Matrix.Count - 1);  

  Result.MatrixType := matrixtype;
  Result.NewWidth   := tempMaxWidth;
  Result.NewHeight  := tempMaxHeight;
  Result.MaxFrames  := Matrix.Count - 1;
  Result.FontMode   := fontmode;

  aEEO.ExportMode   := 0;

  PaintBox.Invalidate;
end;

function TTheMatrix.ImportLEDMatrixDataSingleFrame(aFileName : string): TImportData;
 var
  tf : TextFile;
  x, Row, MemSlot, i, matrixtype, lRGBBackground : integer;
  s, v, pixel : string;
  addedSingleFrame, headerMode, deadpixelmode, MatrixMode, fontmode : boolean;

 begin
  BackupMatrix(fCurrentFrame);
  
  addedSingleFrame       := False;
  matrixtype             := 0;
  headermode             := False;
  deadpixelmode          := False;
  fontmode               := False;
  MatrixMode             := False;
  lRGBBackground         := -1;

  Result.Source          := -1;
  Result.SourceLSB       := -1;
  Result.SourceDirection := -1;
  Result.MatrixType      := -1;
  Result.RGBImport       := False;

  // ===========================================================================
  // ===========================================================================

  AssignFile(tf, aFileName);
  Reset(tf);

  MemSlot    := fCurrentFrame;
  Row        := 0;

  while not(eof(tf)) and (addedSingleFrame = False) do begin
    readln(tf, s);

    if s<>'' then begin
      v  := Copy(s, 3, length(s) - 2);

      case LoadDataParameterType(s, headermode, MatrixMode, deadpixelmode) of
        0 : begin
              if UpperCase(s) = '{FONTHEADER' then
                fontmode := True
              else
                fontmode := False;

              headerMode := True;
            end;
       1 : begin // dead pixel mode
              deadpixelmode := True;
              matrixMode    := False;

              Row := 0;
            end;
        2 : begin
              Row := 0;

              case v[length(v)] of
                '2' : matrixtype := psTypeBiSequential;
                '3' : matrixtype := psTypeBiBitPlanes;
                '4' : matrixtype := psTypeRGB;
              else
                matrixtype := psTypeMono;
              end;

              headerMode := False;
              matrixMode := True;
            end;
        3 : begin
              if matrixmode then
                inc(MemSlot);
            end;

//       20 : Result.ASCIIIndex := StrToInt(v);

       // ======================================================================

       10 : Result.Source          := StrToInt(v);
       11 : Result.SourceLSB       := StrToInt(v);
       12 : Result.SourceDirection := StrToInt(v);
       13 : Result.PadMode         := StrToInt(v);
       14 : Result.HexFormat       := StrToInt(v);
       15 : Result.HexOutput       := StrToInt(v);
       16 : Result.Brackets        := StrToInt(v);

       {17 : eeo.Source := StrToInt(v);
       18 : eeo.Orientation := StrToInt(v);
       19 : eeo.ScanDirection := StrToInt(v);
       20 : eeo.LSB := StrToInt(v);
       21 : eeo.Language := StrToInt(v);
       22 : eeo.NumberFormat := StrToInt(v);
       23 : eeo.NumberSize := StrToInt(v);
       24 : eeo.LineContent := StrToInt(v);
       25 : eeo.LineCount := StrToInt(v);
       26 : eeo.RGBMode := StrToInt(v);
       27 : eeo.RGBChangePixels := StrToBool(v);
       28 : eeo.RGBChangeColour := StrToInt(v);

       29 : MatrixComment     := v;
       30 : lRGBBackground := StrToInt(v);      }

       32 : {};

       // ======================================================================

//       50 : tempMaxWidth  := StrToInt(v);
//       51 : tempMaxHeight := StrToInt(v);
       52 : begin
              x     := 0;
              pixel := '';

              for i:=1 to length(v) do begin
                if (v[i] = ' ') or (i = length(v)) then begin
                  if Result.RGBImport then begin
                    if lRGBBackground <> -1 then begin
                      if HexToInt(pixel) = lRGBBackground then
                        TMatrix(Matrix[MemSlot]).Grid[x, Row] := RGBBackground;
                    end;
                  end
                  else
                    TMatrix(Matrix[MemSlot]).Grid[x, Row] := HexToInt(pixel);

                  inc(x);

                  pixel := '';
                end
                else
                  pixel := pixel + v[i];
              end;

              inc(Row);
            end;

       // ======================================================================

       70 : begin
              x     := 0;
              pixel := '';

              for i:=1 to length(v) do begin
                if (v[i] = ' ') or (i = length(v)) then begin
                  MatrixDead.Grid[x, Row] := StrToInt(pixel);

                  inc(x);

                  pixel := '';
                end
                else
                  pixel := pixel + v[i];
              end;

              inc(Row);
            end;
      end;
    end;
  end;

  CloseFile(tf);

  Result.MatrixType := matrixtype;

  MatrixChange;

  PaintBox.Invalidate;
end;

function TTheMatrix.MergeLEDMatrixData(aFileName : widestring; aStartFrame : integer): TImportData;
 var
  tf : TextFile;
  pixel : string;
  x,Row,lFrame,i,matrixtype, lRGBBackground : integer;
  tempMaxWidth, tempMaxHeight : integer;
  s,v : string;
  headerMode, fontmode, deadpixelmode, matrixmode: boolean;
  lMatrix : TMatrix;

 begin
  // ===========================================================================
  // ===========================================================================

  AssignFile(tf, aFileName);
  Reset(tf);

  lFrame := aStartFrame;
  if lFrame > Matrix.Count - 1 then begin
    lMatrix := TMatrix.Create(Self);
    Matrix.Add(lMatrix);
  end;

  Row                    := 0;
  headerMode             := False;
  fontmode               := False;
  deadpixelmode          := False;
  matrixmode             := False;
  matrixtype             := 0;
  lRGBBackground         := -1;

  Result.Source          := -1;
  Result.SourceLSB       := -1;
  Result.SourceDirection := -1;
  Result.MatrixType      := -1;

  tempMaxWidth           := -1;
  tempMaxHeight          := -1;

  // ===========================================================================
  // ===========================================================================

  while not(eof(tf)) do begin
    readln(tf, s);

    if s <> '' then begin
      v := Copy(s, 3, length(s) - 2);

      case LoadDataParameterType(LowerCase(s), headermode, matrixmode, deadpixelmode) of
        0 : begin
              if UpperCase(s) = '{FONTHEADER' then
                fontmode := True
              else
                fontmode := False;

              headerMode := True;
            end;
       1 : begin // dead pixel mode
              deadpixelmode := True;
              matrixMode    := False;

              Row := 0;
            end;
        2 : begin
              Row := 0;

              case v[length(v)] of
                '2' : matrixtype := psTypeBiSequential;
                '3' : matrixtype := psTypeBiBitPlanes;
                '4' : matrixtype := psTypeRGB;
              else
                matrixtype := psTypeMono;
              end;

              headerMode := False;
              matrixMode := True;
            end;
        3 : begin
              if matrixmode then begin
                inc(lFrame);

                if lFrame > Matrix.Count - 1 then begin
                  lMatrix := TMatrix.Create(Self);
                  Matrix.Add(lMatrix);
                end;
              end;
            end;

//       20 : Result.ASCIIIndex := StrToInt(v);

       // ======================================================================

       10 : Result.Source  := StrToInt(v);
       11 : Result.SourceLSB  := StrToInt(v);
       12 : Result.SourceDirection  := StrToInt(v);
       13 : Result.PadMode  := StrToInt(v);
       14 : Result.HexFormat  := StrToInt(v);
       15 : Result.HexOutput  := StrToInt(v);
       16 : Result.Brackets  := StrToInt(v);

       {17 : eeo.Source := StrToInt(v);
       18 : eeo.Orientation := StrToInt(v);
       19 : eeo.ScanDirection := StrToInt(v);
       20 : eeo.LSB := StrToInt(v);
       21 : eeo.Language := StrToInt(v);
       22 : eeo.NumberFormat := StrToInt(v);
       23 : eeo.NumberSize := StrToInt(v);
       24 : eeo.LineContent := StrToInt(v);
       25 : eeo.LineCount := StrToInt(v);
       26 : eeo.RGBMode := StrToInt(v);
       27 : eeo.RGBChangePixels := StrToBool(v);
       28 : eeo.RGBChangeColour := StrToInt(v); }

       30 : MatrixComment  := MatrixComment + '{Merged with ' + v + ')';


       33 : {};

       // ======================================================================

       50 : tempMaxWidth  := StrToInt(v);
       51 : tempMaxHeight := StrToInt(v);
       52 : begin
              x     := 0;
              pixel := '';

              for i:=1 to length(v) do begin
                if (v[i] = ' ') or (i = length(v)) then begin
                  if Result.RGBImport then begin
                    if lRGBBackground <> -1 then begin
                      if HexToInt(pixel) = lRGBBackground then
                        TMatrix(Matrix[lFrame]).Grid[x, Row] := RGBBackground;
                    end;
                  end
                  else
                    TMatrix(Matrix[lFrame]).Grid[x, Row] := HexToInt(pixel);

                  inc(x);

                  pixel := '';
                end
                else
                  pixel := pixel + v[i];
              end;

              inc(Row);
            end;

       // ======================================================================

       70 : begin
              x     := 0;
              pixel := '';

              for i:=1 to length(v) do begin
                if (v[i] = ' ') or (i = length(v)) then begin
                  MatrixDead.Grid[x, Row] := StrToInt(pixel);

                  inc(x);

                  pixel := '';
                end
                else
                  pixel := pixel + v[i];
              end;

              inc(Row);
            end;
      end;
    end;
  end;

  CloseFile(tf);

  Matrix.Delete(Matrix.Count - 1);

  Result.MatrixType := matrixtype;
  Result.NewWidth   := tempMaxWidth;
  Result.NewHeight  := tempMaxHeight;
  Result.MaxFrames  := lFrame - 1;
  Result.FontMode   := fontmode;

  fFrameCount       := lFrame - 1;
end;

// =============================================================================
// =============================================================================
// =============================================================================
// =============================================================================
// =============================================================================

procedure TTheMatrix.LoadGradient(aFileName : string);
 var
  tf : TextFile;
  s,v : string;
  t, idx, x, y, slot : integer;

 function parameterType(s : string): integer;
  begin
   if s[1] = '{' then
     Result := 0
   else if s[1] = '}' then
     Result := 1
   else if s[1] = 'g' then
     Result := 2
   else
     Result := -1;
 end;

 begin
  // ===========================================================================

  AssignFile(tf, aFileName);
  Reset(tf);

  while not(eof(tf)) do begin
    readln(tf, s);

    if s <> '' then begin
      v := Copy(s, 3, length(s) - 2);

      case parameterType(s) of
        2 : begin
              idx := 0;

              for t:=1 to length(v) do begin
                if v[t] <> ' ' then begin
                  MatrixGradientIY[idx] := StrToInt(v[t]);

                  inc(idx);
                end;
              end;
            end;
      end;
    end;
  end;

  CloseFile(tf);

  // ===========================================================================

  for slot:=1 to Matrix.Count - 1 do begin
    for x:=0 to MatrixWidth - 1 do begin
      for y:=0 to MatrixHeight - 1 do begin
        if TMatrix(Matrix[slot]).Grid[x, y] <> 0 then
          TMatrix(Matrix[slot]).Grid[x, y] := MatrixGradientIY[y];
      end;
    end;
  end;

  // ===========================================================================

  PaintBox.Invalidate;
end;

// =============================================================================
// =============================================================================
// =============================================================================

procedure TTheMatrix.CopyToUserBuffer(aFrame : integer);
 var
  x, y : integer;

 begin
  for y := 0 to MatrixHeight - 1 do begin
    for x:=0 to MatrixWidth - 1 do begin
      TMatrix(MatrixUser[aFrame]).Grid[x, y] := TMatrix(Matrix[fCurrentFrame]).Grid[x, y];
    end;
  end;
end;

procedure TTheMatrix.RestoreFromUserBuffer(aFrame : integer);
 var
  x, y : integer;

 begin
  for x := 0 to MatrixWidth - 1 do begin
    for y:=0 to MatrixHeight - 1 do begin
      if MatrixType = psTypeRGB then
        TMatrix(Matrix[fCurrentFrame]).Grid[x, y] := TMatrix(MatrixUser[aFrame]).Grid[x, y]
      else begin
        if TMatrix(MatrixUser[aFrame]).Grid[x, y] = 1 then begin
          TMatrix(Matrix[fCurrentFrame]).Grid[x, y] := 1;
        end
        else begin
          TMatrix(Matrix[fCurrentFrame]).Grid[x, y] := 0;
        end;
      end;
    end;
  end;

  MatrixChange;

  PaintBox.Invalidate;
end;

procedure TTheMatrix.CopyFromPrevious(toframe : integer);
 var
  x, y : integer;

 begin
  BackupMatrix(toframe);

  for y:=0 to MatrixHeight - 1 do begin
    for x:=0 to MatrixWidth - 1 do begin
      TMatrix(Matrix[toframe]).Grid[x, y] := TMatrix(Matrix[toframe - 1]).Grid[x, y];
    end;
  end;

  MatrixChange;

  PaintBox.Invalidate;
end;

procedure TTheMatrix.Undo;
 begin
  TMatrix(Matrix[fCurrentFrame]).Undo;

  MatrixChange;

  PaintBox.Invalidate;
end;

procedure TTheMatrix.Redo;
 begin
  TMatrix(Matrix[fCurrentFrame]).Redo;

  MatrixChange;

  PaintBox.Invalidate;
end;

function  TTheMatrix.CanUndo: boolean;
 begin
  Result := TMatrix(Matrix[fCurrentFrame]).HistoryOffset <> 0;
end;

function  TTheMatrix.CanRedo: boolean;
 begin
  Result := TMatrix(Matrix[fCurrentFrame]).HistoryOffset <>  TMatrix(Matrix[fCurrentFrame]).History.Count - 1;
end;

procedure TTheMatrix.ConfigurePaintboxDrawing;
 begin
  if fMatrixReadOnly then begin
    PaintBox.OnMouseDown := Nil;
    PaintBox.OnMouseMove := Nil;
    PaintBox.OnMouseUp   := Nil;

    case MatrixType of
      psTypeMono         : PaintBox.OnPaint := PaintBoxUpdate;
      psTypeBiSequential : PaintBox.OnPaint := PaintBoxUpdate;
      psTypeBiBitPlanes  : PaintBox.OnPaint := PaintBoxUpdate;
      psTypeRGB          : PaintBox.OnPaint := PaintBoxUpdateRGB;
    end;
  end
  else begin
    if fDeadPixelsMode then begin
      PaintBox.OnMouseDown := ClickPixelDeadPixel;
      PaintBox.OnMouseMove := Shape1MouseMoveDeadPixel;
      PaintBox.OnMouseUp   := Shape1MouseUpDeadPixel;

      PaintBox.OnPaint     := PaintBoxUpdateDeadPixel;
    end
    else begin
      case MatrixType of
        psTypeMono         : begin
                               PaintBox.OnMouseDown := ClickPixel;
                               PaintBox.OnMouseMove := Shape1MouseMove;
                               PaintBox.OnMouseUp   := Shape1MouseUp;

                               PaintBox.OnPaint     := PaintBoxUpdate;
                             end;
        psTypeBiSequential : begin
                               PaintBox.OnMouseDown := ClickPixelBiColour;
                               PaintBox.OnMouseMove := Shape1MouseMoveBiColour;
                               PaintBox.OnMouseUp   := Shape1MouseUpBiColour;

                               PaintBox.OnPaint     := PaintBoxUpdate;
                             end;
        psTypeBiBitPlanes  : begin
                               PaintBox.OnMouseDown := ClickPixelBiColour;
                               PaintBox.OnMouseMove := Shape1MouseMoveBiColour;
                               PaintBox.OnMouseUp   := Shape1MouseUpBiColour;

                               PaintBox.OnPaint     := PaintBoxUpdate;
                             end;
        psTypeRGB          : begin
                               PaintBox.OnMouseDown := ClickPixelRGB;
                               PaintBox.OnMouseMove := Shape1MouseMoveRGB;
                               PaintBox.OnMouseUp   := Shape1MouseUpRGB;

                               PaintBox.OnPaint     := PaintBoxUpdateRGB;
                             end;
      end;
    end;
  end;
end;

procedure TTheMatrix.CopyLEDColours;
 var
  t : integer;
 begin
  for t := 0 to 5 do begin
    case MatrixType of
      psTypeMono         : LEDColoursSingle[t] := LEDColours[t];
      psTypeBiSequential,
      psTypeBiBitPlanes  : LEDColoursBi[t]     := LEDColours[t];
    end;
  end;
end;

procedure TTheMatrix.ChangeSelectionColour(aSelectionLMB, aSelectionMMB, aSelectionRMB : integer);
 begin
  SetMouseButtonColours(aSelectionLMB, aSelectionMMB, aSelectionRMB);

  LEDRGBColours[1] := aSelectionLMB;
  LEDRGBColours[2] := aSelectionMMB;
  LEDRGBColours[3] := aSelectionRMB;

  ColourChange;
end; 

function TTheMatrix.CalculateMemoryUsage: integer;
 begin
  if MatrixType = psTypeRGB then begin
    Result := MatrixWidth * MatrixHeight * 4 * FrameCount;
  end
  else begin
    case MatrixHeight - 1 of
       0..7  : Result := 1;
       8..15 : Result := 2;
      16..23 : Result := 4;
      24..31 : Result := 4;
      32..39 : Result := 8;
      40..47 : Result := 8;
      48..55 : Result := 8;
      56..63 : Result := 8;
    else
      Result := 0;
    end;

    if SoftwareMode = 1 then begin
      Result := (Result * (MatrixWidth)) * (96);
    end
    else begin
      Result := (Result * (MatrixWidth)) * (FrameCount);
    end;

    // if using any of the bicolour modes then double requirements
    if (MatrixType > 0) then
      Result := Result * 2;
  end;
end;

function TTheMatrix.DataSizeBytes: integer;
 begin
  if MatrixType = psTypeRGB then begin
    Result := 4;
  end
  else begin
    case MatrixHeight - 1 of
       0..7  : Result := 1;
       8..15 : Result := 2;
      16..23 : Result := 4;
      24..31 : Result := 4;
      32..39 : Result := 8;
      40..47 : Result := 8;
      48..55 : Result := 8;
      56..63 : Result := 8;
    else
      Result := 0;
    end;
  end;
end;

procedure TTheMatrix.FadeFirstToLast;
 var
  x, y, lFrame : integer;
  rdy, gdy, bdy : integer;
  rdx, gdx, bdx : double;
  newr, newg, newb : double;
  colstart, colend : integer;
  gradheight : integer;
  newri, newgi, newbi : integer;

 begin
  for y := 0 to MatrixHeight - 1 do begin
    for x:= 0 to MatrixWidth - 1 do begin

      colstart   := TMatrix(Matrix[1]).Grid[x, y];
      colend     := TMatrix(Matrix[framecount]).Grid[x, y];

      gradheight := FrameCount;

      rdy  := (colend and $0000FF) - (colstart and $0000FF);
      gdy  := ((colend and $00FF00) shr 8) - ((colstart and $00FF00) shr 8);
      bdy  := ((colend and $FF0000) shr 16) - ((colstart and $FF0000) shr 16);

      newr := (colstart and $0000FF);
      newg := (colstart and $00FF00) shr 8;
      newb := (colstart and $FF0000) shr 16;

      rdx  := rdy / gradheight;
      gdx  := gdy / gradheight;
      bdx  := bdy / gradheight;

      for lFrame := 2 to FrameCount do begin
        newr  := newr + rdx;
        newg  := newg + gdx;
        newb  := newb + bdx;

        newri := Floor(newr);
        newgi := Floor(newg);
        newbi := Floor(newb);

        TMatrix(Matrix[lFrame]).Grid[x, y] := (newbi shl 16) + (newgi shl 8) + newri;
      end;
    end;
  end;

  PaintBox.Invalidate;
end;

procedure TTheMatrix.Refresh;
 begin
  PaintBox.Invalidate;
end;

function TTheMatrix.GetTotalUndos: integer;
 var
  t : integer;

 begin
  Result := 0;

  for t:= 1 to Matrix.Count - 1 do begin
    Result := Result + TMatrix(Matrix[t]).History.Count;
  end;
end;

procedure TTheMatrix.pbPreviewPaint(Sender: TObject);
 var
  x,y : integer;

 begin
  for x:=0 to MatrixWidth - 1 do begin
    for y:=0 to MatrixHeight - 1 do begin
      if MatrixType = psTypeRGB then
        PreviewBox.Canvas.Brush.Color := TMatrix(Matrix[fCurrentFrame]).Grid[x, y]
      else begin
        case TMatrix(Matrix[fCurrentFrame]).Grid[x, y] of
          0 : PreviewBox.Canvas.Brush.Color := LEDColours[0];
          1 : PreviewBox.Canvas.Brush.Color := LEDColours[1];
          2 : PreviewBox.Canvas.Brush.Color := LEDColours[2];
          3 : PreviewBox.Canvas.Brush.Color := LEDColours[3];
        end;
      end;

      case MatrixPixelShape of
        pixelSquare : PreviewBox.Canvas.FillRect(Rect(x * PreviewBox.Tag,
                                                      y * PreviewBox.Tag,
                                                      (x * PreviewBox.Tag) + PreviewBox.Tag,
                                                      (y * PreviewBox.Tag) + PreviewBox.Tag));
        pixelCircle : PreviewBox.Canvas.Ellipse(x * PreviewBox.Tag,
                                                y * PreviewBox.Tag,
                                                (x * PreviewBox.Tag) + PreviewBox.Tag,
                                                (y * PreviewBox.Tag) + PreviewBox.Tag);
      end;
    end;
  end;

  // ===========================================================================
  // ===========================================================================
  // ===========================================================================      

  if DrawData.Mode <> drawModeNone then begin
    if DrawData.Coords[0].X <> - 1 then begin
      if MatrixType = psTypeRGB then
        PreviewBox.Canvas.Brush.Color := DrawData.Colour
      else
        PreviewBox.Canvas.Brush.Color := LEDColours[DrawData.Colour];
      DrawShape(True, PreviewBox.Canvas, PreviewBoxSize, PreviewBoxSize, 1);

      // =======================================================================

      PreviewBox.Canvas.Brush.Color := LEDColours[4];

      case MatrixPixelShape of
        pixelSquare : PreviewBox.Canvas.FillRect(Rect(DrawData.Coords[0].X * PreviewBoxSize,
                                                      DrawData.Coords[0].Y * PreviewBoxSize,
                                                      (DrawData.Coords[0].X * PreviewBoxSize) + PreviewBoxSize,
                                                      (DrawData.Coords[0].Y * PreviewBoxSize) + PreviewBoxSize));
        pixelCircle : PreviewBox.Canvas.Ellipse(DrawData.Coords[0].X * PreviewBoxSize,
                                                DrawData.Coords[0].Y * PreviewBoxSize,
                                                (DrawData.Coords[0].X * PreviewBoxSize) + PreviewBoxSize,
                                                (DrawData.Coords[0].Y * PreviewBoxSize) + PreviewBoxSize);
      end;
    end;
  end;

  // ===========================================================================
  // ===========================================================================
  // ===========================================================================

  if MatrixCopyX <> 0 then begin
    for x:=0 to MatrixCopyX do begin
      for y:=0 to MatrixCopyY do begin
        if (x + lastx >= 0) and (x + lastx <= MatrixWidth - 1) and
          (y + lasty >= 0) and (y + lasty <= MatrixHeight - 1) then begin

           if MatrixDead.Grid[x + lastx, y + lasty] = 0 then
             PreviewBox.Canvas.Brush.Color := LEDColours[MatrixCopy.Grid[x, y]]
           else
             PreviewBox.Canvas.Brush.Color := clBtnFace;


           case MatrixPixelShape of
             pixelSquare : PreviewBox.Canvas.FillRect(Rect((x + lastx) * PreviewBoxSize,
                                                         (y + lasty) * PreviewBoxSize,
                                                         ((x + lastx) * PreviewBoxSize) + PreviewBoxSize,
                                                         ((y + lasty) * PreviewBoxSize) + PreviewBoxSize));
             pixelCircle : PreviewBox.Canvas.Ellipse((x + lastx) * PreviewBoxSize,
                                                   (y + lasty) * PreviewBoxSize,
                                                   ((x + lastx) * PreviewBoxSize) + PreviewBoxSize,
                                                   ((y + lasty) * PreviewBoxSize) + PreviewBoxSize);
           end;
        end;
      end;
    end;
  end;
end;

// =============================================================================
// =============================================================================
// =============================================================================
// =============================================================================

constructor TMatrix.Create(AOwner: TTheMatrix);
 var
  x, y : integer;
  tmh : TMatrixHistory;

 begin
  for x:= 0 to _MaxWidth do begin
    for y := 0 to _MaxHeight do begin
      if AOwner.MatrixType = psTypeRGB then
        Grid[x, y] := AOwner.fRGBBackground
      else
        Grid[x, y] := 0;
    end;
  end;

  HistoryOffset := 0;
  History       := TObjectList.Create;

  tmh := TMatrixHistory.Create(Self);
  History.Add(tmh);
end;

destructor TMatrix.Destroy;
 begin
  History.Free;

  inherited Destroy;
end;

procedure TMatrix.Clear(aMatrixType, aBackground : integer);
 var
  x, y : integer;
  
 begin
  for x := 0 to _MaxWidth do begin
    for y := 0 to _MaxHeight do begin

      if aMatrixType = psTypeRGB then
        Grid[x, y] := aBackground
      else
        Grid[x, y] := 0;
    end;
  end;
end;

procedure TMatrix.ChangePixels(aFrom, aTo : integer);
 var
  x, y : integer;

 begin
  for x:=0 to _MaxWidth do begin
    for y:=0 to _MaxHeight do begin
      if Grid[x, y] = aFrom then
        Grid[x, y] := aTo;
    end;
  end;
end;

procedure TMatrix.AddToHistory;
 var
  tmh : TMatrixHistory;
  t : integer;

 begin
  if HistoryOffset <> History.Count - 1 then begin
    for t:= History.Count - 1 downto HistoryOffSet + 1 do begin
      History.Delete(t);
    end;
  end;

  tmh := TMatrixHistory.Create(Self);
  History.Add(tmh);

  HistoryOffset := History.Count - 1;
end;

procedure TMatrix.Undo;
 var
  tmh : TMatrixHistory;
  x, y : integer;

 begin
  if HistoryOffset <> 0 then begin
    dec(HistoryOffset);

    tmh := TMatrixHistory(History[HistoryOffset]);

    for x:=0 to _MaxWidth do begin
      for y:=0 to _MaxHeight do begin
        Grid[x, y] := tmh.Grid[x, y];
      end;
    end;
  end;
end;

procedure TMatrix.Redo;
 var
  tmh : TMatrixHistory;
  x, y : integer;

 begin
  if HistoryOffset <> History.Count - 1 then begin
    inc(HistoryOffset);

    tmh := TMatrixHistory(History[HistoryOffset]);

    for x:=0 to _MaxWidth do begin
      for y:=0 to _MaxHeight do begin
        Grid[x, y] := tmh.Grid[x, y];
      end;
    end;
  end;
end;

// =============================================================================

constructor TMatrixHistory.Create(AOwner: TMatrix);
 var
  x, y : integer;

 begin
  for x:= 0 to _MaxWidth do begin
    for y := 0 to _MaxHeight do begin
      Grid[x, y] := AOwner.Grid[x, y];
    end;
  end;
end;

// =============================================================================
// =============================================================================
// =============================================================================
// =============================================================================

constructor TMatrixDead.Create(AOwner: TTheMatrix);
 var
  x, y : integer;

 begin
  for x:= 0 to _MaxWidth do begin
    for y := 0 to _MaxHeight do begin
      Grid[x, y] := 0;
    end;
  end;
end;

end.
