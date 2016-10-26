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
//  Modified: January 1st 2015 2016
//
//      Code: 14387 lines
//
// ===================================================================

unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ToolWin, ComCtrls, Menus, ImgList,
  AngleLbl, ExtDlgs;

type
  TForm1 = class(TForm)
    MenuMain: TMainMenu;
    File1: TMenuItem;
    Exit1: TMenuItem;
    CoolBar1: TCoolBar;
    Panel1: TPanel;
    sbBuild: TSpeedButton;
    CoolBar2: TCoolBar;
    Panel2: TPanel;
    sbClear: TSpeedButton;
    Bevel1: TBevel;
    sbMirror: TSpeedButton;
    sbFlip: TSpeedButton;
    Bevel2: TBevel;
    sbScrollLeft: TSpeedButton;
    sbScrollRight: TSpeedButton;
    sbScrollUp: TSpeedButton;
    sbScrollDown: TSpeedButton;
    sbInvert: TSpeedButton;
    miHexFormat: TMenuItem;
    Bevel3: TBevel;
    colorDialog: TColorDialog;
    Buffer1: TMenuItem;
    Copycurrentto1: TMenuItem;
    miMemory1: TMenuItem;
    miMemory2: TMenuItem;
    miMemory3: TMenuItem;
    miMemory4: TMenuItem;
    miMemory5: TMenuItem;
    miMemory6: TMenuItem;
    miMemory7: TMenuItem;
    timerAnimate: TTimer;
    miMemory8: TMenuItem;
    miMemory9: TMenuItem;
    miMemory10: TMenuItem;
    Copycurrentto2: TMenuItem;
    miMemoryR10: TMenuItem;
    miMemoryR9: TMenuItem;
    miMemoryR8: TMenuItem;
    miMemoryR7: TMenuItem;
    miMemoryR6: TMenuItem;
    miMemoryR5: TMenuItem;
    miMemoryR4: TMenuItem;
    miMemoryR3: TMenuItem;
    miMemoryR2: TMenuItem;
    miMemoryR1: TMenuItem;
    View1: TMenuItem;
    miShowAnimationToolbar: TMenuItem;
    pAnimationToolbar: TPanel;
    bPlayAnimation: TBitBtn;
    bStopAnimation: TBitBtn;
    bPreviousFrame: TBitBtn;
    bNextFrame: TBitBtn;
    lFrame: TLabel;
    N2: TMenuItem;
    Clearallbuffers1: TMenuItem;
    Bevel5: TBevel;
    Bevel6: TBevel;
    sbRotateL: TSpeedButton;
    sbRotateR: TSpeedButton;
    Hexoutputprefix1: TMenuItem;
    miHexOutputNone: TMenuItem;
    miHexOutputDollar: TMenuItem;
    miHexOutputZeroX: TMenuItem;
    N3: TMenuItem;
    Savebufferstoclipboard1: TMenuItem;
    Edit1: TMenuItem;
    miUndo: TMenuItem;
    Bevel7: TBevel;
    bAddFrame: TBitBtn;
    About1: TMenuItem;
    About2: TMenuItem;
    bLightbox: TBitBtn;
    ilMain: TImageList;
    Bevel8: TBevel;
    N4: TMenuItem;
    miSaveSingleFrame: TMenuItem;
    miSaveAs: TMenuItem;
    N5: TMenuItem;
    Load1: TMenuItem;
    sdMain: TSaveDialog;
    odMain: TOpenDialog;
    ilMenu: TImageList;
    Brackets1: TMenuItem;
    miBracketsNone: TMenuItem;
    miBracketsNormal: TMenuItem;
    miBracketsCurly: TMenuItem;
    miBracketsSquare: TMenuItem;
    N7: TMenuItem;
    Bevel9: TBevel;
    bDeleteFrame: TBitBtn;
    miSave: TMenuItem;
    New1: TMenuItem;
    N8: TMenuItem;
    sbPreset: TSpeedButton;
    puPresets: TPopupMenu;
    Presets1: TMenuItem;
    N9: TMenuItem;
    miLoadPreset: TMenuItem;
    N10: TMenuItem;
    miPresetSaveCurrent: TMenuItem;
    statusMain: TStatusBar;
    sbPixelSize: TSpeedButton;
    puPixelSize: TPopupMenu;
    PixelSize1: TMenuItem;
    N11: TMenuItem;
    miPixelTiny: TMenuItem;
    miPixelSmall: TMenuItem;
    miPixelMedium: TMenuItem;
    miPixelLarge: TMenuItem;
    CoolBar3: TCoolBar;
    Panel4: TPanel;
    sbMouseMode: TSpeedButton;
    sbFilledRectangle: TSpeedButton;
    sbLine: TSpeedButton;
    sbFrame: TSpeedButton;
    puFonts: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    miLoadFont: TMenuItem;
    bAddFrameCopy: TBitBtn;
    Bevel11: TBevel;
    PreviousFrame1: TMenuItem;
    NextFrame1: TMenuItem;
    miShiftLeft: TMenuItem;
    miShiftRight: TMenuItem;
    miShiftUp: TMenuItem;
    miShiftDown: TMenuItem;
    N14: TMenuItem;
    miRotateL: TMenuItem;
    miRotateR: TMenuItem;
    N13: TMenuItem;
    miFlip: TMenuItem;
    miMirror: TMenuItem;
    miInvert: TMenuItem;
    N16: TMenuItem;
    sbCopy: TSpeedButton;
    miPixelVeryLarge: TMenuItem;
    pbFont: TPanel;
    lFont: TLabel;
    sbChangeFont: TSpeedButton;
    fdMain: TFontDialog;
    miFontMode: TMenuItem;
    pASCIICode: TPanel;
    miCopyFromPrevious: TMenuItem;
    N15: TMenuItem;
    miCopy: TMenuItem;
    miPaste: TMenuItem;
    miSaveAsFont: TMenuItem;
    tbFrames: TTrackBar;
    miPixelUltra: TMenuItem;
    bStartFrame: TBitBtn;
    bEndFrame: TBitBtn;
    miColumnRowDataToolbar: TMenuItem;
    N17: TMenuItem;
    Checkforupdates1: TMenuItem;
    N19: TMenuItem;
    Website1: TMenuItem;
    sbRotateAny: TSpeedButton;
    Bevel13: TBevel;
    cbRotateAngle: TComboBox;
    cbRotateCount: TComboBox;
    Bevel14: TBevel;
    puAnimationSpeed: TPopupMenu;
    Playbackspeed1: TMenuItem;
    N20: TMenuItem;
    miPlaybackSpeed1: TMenuItem;
    miPlaybackSpeed2: TMenuItem;
    miPlaybackSpeed3: TMenuItem;
    miPlaybackSpeed4: TMenuItem;
    Help1: TMenuItem;
    N21: TMenuItem;
    miImportInToCurrent: TMenuItem;
    miFlipAllFrames: TMenuItem;
    miMirrorAllFrames: TMenuItem;
    miInvertAllFrames: TMenuItem;
    N22: TMenuItem;
    bAddFrameMultiple: TBitBtn;
    Padoutput1: TMenuItem;
    miPadAuto: TMenuItem;
    miPad8bits: TMenuItem;
    miPad16bits: TMenuItem;
    miPad24bits: TMenuItem;
    miPad32bits: TMenuItem;
    N23: TMenuItem;
    miGridToggle: TMenuItem;
    N24: TMenuItem;
    Project1: TMenuItem;
    miAutoSave: TMenuItem;
    Autosaveinterval1: TMenuItem;
    miAutosave2: TMenuItem;
    miAutosave5: TMenuItem;
    miAutosave10: TMenuItem;
    timerAutosave: TTimer;
    N25: TMenuItem;
    Importfrombitmap1: TMenuItem;
    Bevel15: TBevel;
    sColour3: TShape;
    sColour2: TShape;
    sColour1: TShape;
    sColour0: TShape;
    pColourPaletteNew: TPanel;
    miPad40bits: TMenuItem;
    miPad48bits: TMenuItem;
    miPad56bits: TMenuItem;
    miPad64bits: TMenuItem;
    sSelectionLMB: TShape;
    sSelectionMMB: TShape;
    sSelectionRMB: TShape;
    Bevel12: TBevel;
    lColoursLeft: TLabel;
    lColoursMiddle: TLabel;
    lColoursRight: TLabel;
    Bevel17: TBevel;
    lMemoryUsage: TLabel;
    miPlaybackSpeed5: TMenuItem;
    N27: TMenuItem;
    Examples1: TMenuItem;
    sbGradient: TSpeedButton;
    puGradient: TPopupMenu;
    Colour11: TMenuItem;
    Colour21: TMenuItem;
    Colour31: TMenuItem;
    Colour01: TMenuItem;
    puGradients: TPopupMenu;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    miLoadGradients: TMenuItem;
    MenuItem6: TMenuItem;
    miSaveGradient: TMenuItem;
    miGradientAllFrames: TMenuItem;
    sbRandomDraw: TSpeedButton;
    sbPixelShape: TSpeedButton;
    Bevel19: TBevel;
    puPixelShape: TPopupMenu;
    MenuItem5: TMenuItem;
    MenuItem7: TMenuItem;
    miPixelShapeSquare: TMenuItem;
    miPixelShapeRound: TMenuItem;
    N28: TMenuItem;
    miCombineNibbles: TMenuItem;
    miUseFormatDataFromFiles: TMenuItem;
    miASCIIStartCode: TMenuItem;
    miExport: TMenuItem;
    ColumnRowtoolbarappearance1: TMenuItem;
    N18: TMenuItem;
    N1: TMenuItem;
    miHexOutputAmp: TMenuItem;
    pSourceDisplay: TPanel;
    cbSourceLSB: TComboBox;
    cbSourceDirection: TComboBox;
    bCopySourceData: TBitBtn;
    eSourceData: TEdit;
    cbSource: TComboBox;
    miPreview: TMenuItem;
    N6: TMenuItem;
    PreviewSize1: TMenuItem;
    miPreviewx1: TMenuItem;
    miPreviewx2: TMenuItem;
    miPreviewx3: TMenuItem;
    miPreviewx4: TMenuItem;
    Donate1: TMenuItem;
    N12: TMenuItem;
    N26: TMenuItem;
    miAddComment: TMenuItem;
    sbEmptyCircle: TSpeedButton;
    miPreviewx5: TMenuItem;
    puBrushSize: TPopupMenu;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    Small1: TMenuItem;
    Large1: TMenuItem;
    Large3x3pixels1: TMenuItem;
    FontViewer1: TMenuItem;
    N29: TMenuItem;
    N30: TMenuItem;
    miPixelAuto: TMenuItem;
    sbSave: TSpeedButton;
    sbOpen: TSpeedButton;
    ools1: TMenuItem;
    Clearallframes1: TMenuItem;
    N31: TMenuItem;
    miMerge: TMenuItem;
    miCombine: TMenuItem;
    sbMultiDraw: TSpeedButton;
    N32: TMenuItem;
    Openautosavefolder1: TMenuItem;
    Label1: TLabel;
    lBackground: TLabel;
    Bevel10: TBevel;
    miCodeTemplates: TMenuItem;
    puGradientRGB: TPopupMenu;
    miGradientSelectRGB: TMenuItem;
    N33: TMenuItem;
    miGradFrom: TMenuItem;
    miGradSetRow: TMenuItem;
    miClearAllFramesGradient: TMenuItem;
    puRandom: TPopupMenu;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    miRandomnessTiny: TMenuItem;
    Small2: TMenuItem;
    Medium1: TMenuItem;
    Large2: TMenuItem;
    Massive1: TMenuItem;
    N34: TMenuItem;
    miSetDeadPixels: TMenuItem;
    Label2: TLabel;
    N35: TMenuItem;
    Preferences1: TMenuItem;
    sbPicker: TSpeedButton;
    sbFont: TSpeedButton;
    N36: TMenuItem;
    miFadeFirstLast: TMenuItem;
    lPixelColour: TLabel;
    N37: TMenuItem;
    miExportToBitmap: TMenuItem;
    spdMain: TSavePictureDialog;
    sbFilledCircle: TSpeedButton;
    iMMBGradient: TImage;
    miPreviewx6: TMenuItem;
    miRedo: TMenuItem;
    procedure sbBuildClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbClearClick(Sender: TObject);
    procedure UpdateData;
    procedure cbRowsLSBChange(Sender: TObject);
    procedure sbScrollLeftClick(Sender: TObject);
    procedure sbScrollRightClick(Sender: TObject);
    procedure sbInvertClick(Sender: TObject);
    procedure miHexFormatClick(Sender: TObject);
    procedure sbScrollUpClick(Sender: TObject);
    procedure sbScrollDownClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbUndoClick(Sender: TObject);
    procedure miMemory1Click(Sender: TObject);
    procedure bPlayAnimationClick(Sender: TObject);
    procedure timerAnimateTimer(Sender: TObject);
    procedure miMemoryR1Click(Sender: TObject);
    procedure miShowAnimationToolbarClick(Sender: TObject);
    procedure bPreviousFrameClick(Sender: TObject);
    procedure bNextFrameClick(Sender: TObject);
    procedure Clearallbuffers1Click(Sender: TObject);
    procedure bStopAnimationClick(Sender: TObject);
    procedure sbMirrorClick(Sender: TObject);
    procedure sbFlipClick(Sender: TObject);
    procedure sbRotateLClick(Sender: TObject);
    procedure sbRotateRClick(Sender: TObject);
    procedure miHexOutputNoneClick(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure bAddFrameClick(Sender: TObject);
    procedure About2Click(Sender: TObject);
    procedure SetButtonImage(button : TBitbtn; imageidx : integer);
    procedure bLightboxClick(Sender: TObject);
    procedure miSaveSingleFrameClick(Sender: TObject);
    procedure miSaveAsClick(Sender: TObject);
    procedure Load1Click(Sender: TObject);
    procedure miBracketsNoneClick(Sender: TObject);
    procedure DisplayFrame(frameno: integer);
    procedure miSaveClick(Sender: TObject);
    procedure New1Click(Sender: TObject);
    procedure bDeleteFrameClick(Sender: TObject);
    procedure LoadPreset(filename : string);
    procedure miPresetSaveCurrentClick(Sender: TObject);
    procedure sbPresetClick(Sender: TObject);
    procedure BuildPresetList;
    procedure BuildGradientList;
    procedure BuildFontList;    
    procedure SelectPreset(Sender : TObject);
    procedure SelectFont(Sender : TObject);    
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure miPixelTinyClick(Sender: TObject);
    procedure sbPixelSizeClick(Sender: TObject);
    procedure sbMouseModeClick(Sender: TObject);
    procedure bAddFrameCopyClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure sbChangeFontClick(Sender: TObject);
    procedure miFontModeClick(Sender: TObject);
    procedure SetFrameCaption(i : integer);
    procedure UpdateMemoryUsage;
    procedure miCopyFromPreviousClick(Sender: TObject);
    procedure miCopyClick(Sender: TObject);
    procedure miPasteClick(Sender: TObject);
    procedure miSaveAsFontClick(Sender: TObject);
    procedure tbFramesChange(Sender: TObject);
    procedure bStartFrameClick(Sender: TObject);
    procedure bEndFrameClick(Sender: TObject);
    procedure miColumnRowDataToolbarClick(Sender: TObject);
    procedure Checkforupdates1Click(Sender: TObject);
    procedure sbRotateAnyClick(Sender: TObject);
    procedure Website1Click(Sender: TObject);
    procedure miPlaybackSpeed1Click(Sender: TObject);
    procedure Help1Click(Sender: TObject);
    procedure miImportInToCurrentClick(Sender: TObject);
    procedure miFlipAllFramesClick(Sender: TObject);
    procedure miMirrorAllFramesClick(Sender: TObject);
    procedure miInvertAllFramesClick(Sender: TObject);
    procedure bAddFrameMultipleClick(Sender: TObject);
    procedure miPadAutoClick(Sender: TObject);
    procedure RecalculatePadding;
    procedure miGridToggleClick(Sender: TObject);
    procedure miAutoSaveClick(Sender: TObject);
    procedure miAutosave2Click(Sender: TObject);
    procedure timerAutosaveTimer(Sender: TObject);
    procedure Importfrombitmap1Click(Sender: TObject);
    procedure FormMouseWheelDown(Sender: TObject; Shift: TShiftState;  MousePos: TPoint; var Handled: Boolean);
    procedure FormMouseWheelUp(Sender: TObject; Shift: TShiftState;  MousePos: TPoint; var Handled: Boolean);
    procedure sColour3MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure cbMatrixTypeChange(Sender: TObject);
    procedure SetupMatrixColours;
    procedure Examples1Click(Sender: TObject);
    procedure sbGradientClick(Sender: TObject);
    procedure OnGradientClick(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ToggleGradient(gmode : integer; cleargradient : boolean);
    procedure Colour01Click(Sender: TObject);
    procedure SelectGradient(Sender : TObject);
    procedure miSaveGradientClick(Sender: TObject);
    procedure sbGradientMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure miGradientAllFramesClick(Sender: TObject);
    procedure sbPixelShapeClick(Sender: TObject);
    procedure miPixelShapeSquareClick(Sender: TObject);
    function  GetHexFormat: integer;
    function  GetHexOutput: integer;
    function  GetBrackets: integer;
    procedure SetHexOptions(ohexformat, ohexprefix : integer);
    procedure SetPadFormat(opadmode : integer);
    procedure SetBrackets(obrackets : integer);
    procedure miASCIIStartCodeClick(Sender: TObject);
    procedure miExportClick(Sender: TObject);
    procedure cbSourceChange(Sender: TObject);
    procedure bCopySourceDataClick(Sender: TObject);
    procedure eSourceDataKeyPress(Sender: TObject; var Key: Char);
    procedure Savebufferstoclipboard1Click(Sender: TObject);
    procedure miPreviewClick(Sender: TObject);
    procedure miPreviewx1Click(Sender: TObject);
    procedure Donate1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure miAddCommentClick(Sender: TObject);
    procedure Small1Click(Sender: TObject);
    procedure FontViewer1Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Clearallframes1Click(Sender: TObject);
    procedure miMergeClick(Sender: TObject);
    procedure miCombineClick(Sender: TObject);
    procedure Openautosavefolder1Click(Sender: TObject);
    procedure FormConstrainedResize(Sender: TObject; var MinWidth, MinHeight,
      MaxWidth, MaxHeight: Integer);
    procedure miCodeTemplatesClick(Sender: TObject);
    procedure miGradFromClick(Sender: TObject);
    procedure miGradientSelectRGBClick(Sender: TObject);
    procedure miClearAllFramesGradientClick(Sender: TObject);
    procedure miRandomnessTinyClick(Sender: TObject);
    procedure miSetDeadPixelsClick(Sender: TObject);
    procedure Preferences1Click(Sender: TObject);
    function  GetAutoPixelSize: integer;

    procedure MatrixOnChange(Sender : TObject);
    procedure MatrixOnColourChange(Sender : TObject);
    procedure MatrixOnMouseOver(const x, y : integer);
    function  LoadFromFileName(aFilename : string): boolean;
    procedure LoadRegistrySettings;
    procedure miFadeFirstLastClick(Sender: TObject);
    procedure miExportToBitmapClick(Sender: TObject);

    procedure ManageUIControls;
    procedure UpdateDisplay;
    procedure puGradientShapePopup(Sender: TObject);
    procedure miGradSetRowClick(Sender: TObject);
    procedure miRedoClick(Sender: TObject);
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses registry, about, utility, checkversion, importbitmap, export, thematrix,
     fontviewer, math, newproject, xglobal, exportcode, preferences;

var
 PixelSize  : integer = 20;
 PixelShape : integer = 0;

 OldMatrixType : integer;

 NewGrid : boolean = True;

 BackupCaption  : string;

 FLastTick : cardinal;

 MenuCopyMemory    : array[0..9] of TMenuItem;
 MenuRestoryMemory : array[0..9] of TMenuItem;

 RowLabels : array[0.._MaxHeight] of TAngleLabel;
 ColLabels : array[0.._MaxWidth] of TAngleLabel;

 ColourIndexLMB : integer;
 ColourIndexMMB : integer;
 ColourIndexRMB : integer;

 ProjectSettings : TProjectSettings;  // needs to go!

procedure TForm1.FormCreate(Sender: TObject);
 var
  x : integer;

 begin
  Caption                  := Caption + ' ' + LEDStudioVersion;
  BackupCaption            := Caption;
  AppSettings.DataFilename := '';
  FLastTick                := GetTickCount();
  AppSettings.ASCIIIndex   := 32; // start ascii code (space)

  DoubleBuffered           := True; // stops the preview paintbox from flickering :)

  ClearTExportOptions(False, AppSettings.LastExport);

  // ===========================================================================

  AppSettings.HexPrefix    := '';
  AppSettings.OpenBracket  := '(';
  AppSettings.CloseBracket := ')';

  // ===========================================================================

  MatrixMain := TTheMatrix.Create(Self, Self);
  MatrixMain.OnChange       := MatrixOnChange;
  MatrixMain.OnColourChange := MatrixOnColourChange;
  MatrixMain.OnMouseOver    := MatrixOnMouseOver;

  sbCopy.Tag                := drawModeCopy;
  sbFilledRectangle.Tag     := drawModeFilledBox;
  sbFrame.Tag               := drawModeEmptyBox;
  sbEmptyCircle.Tag         := drawModeEmptyCircle;
  sbFilledCircle.Tag        := drawModeFilledCircle;  
  sbLine.Tag                := drawModeLine;
  sbFont.Tag                := drawModeFont;
  sbRandomDraw.Tag          := drawModeRandom;
  sbMultiDraw.Tag           := drawModeMulti;
  sbPicker.Tag              := drawModePicker;  
  
  // ===========================================================================

  MenuCopyMemory[0]:=miMemory1; MenuCopyMemory[1]:=miMemory2; MenuCopyMemory[2]:=miMemory3; MenuCopyMemory[3]:=miMemory4; MenuCopyMemory[4]:=miMemory5;
  MenuCopyMemory[5]:=miMemory6; MenuCopyMemory[6]:=miMemory7; MenuCopyMemory[7]:=miMemory8; MenuCopyMemory[8]:=miMemory9; MenuCopyMemory[9]:=miMemory10;

  MenuRestoryMemory[0]:=miMemoryR1; MenuRestoryMemory[1]:=miMemoryR2; MenuRestoryMemory[2]:=miMemoryR3; MenuRestoryMemory[3]:=miMemoryR4;
  MenuRestoryMemory[4]:=miMemoryR5; MenuRestoryMemory[5]:=miMemoryR6; MenuRestoryMemory[6]:=miMemoryR7; MenuRestoryMemory[7]:=miMemoryR8;
  MenuRestoryMemory[8]:=miMemoryR9; MenuRestoryMemory[9]:=miMemoryR10;

  // ===========================================================================

  for x:=0 to _MaxHeight do begin
    RowLabels[x] := TAngleLabel.Create(Self);
    with RowLabels[x] do begin
      Parent    := Self;
      AutoSize  := False;
      Alignment := taRightJustify;
      Height    := 12;
      Width     := 64;
      Left      := 4;
      Font.Name := 'Courier New';
      Font.Size := 9;

      Caption   := '0';
    end;

    ColLabels[x] := TAngleLabel.Create(Self);
    with ColLabels[x] do begin
      Parent           := Self;
      Angle            := 90;
      Font.Name        := 'Courier New';
      Font.Size        := 9;
      Width            := 12;
      Height           := 57;
      Caption          := '0';
    end;
  end;

  // ===========================================================================

  cbSource.Items.Add('Rows');
  cbSource.Items.Add('Columns');
  cbSource.ItemIndex := 0;

  cbSourceChange(Nil);

  // ===========================================================================

  cbRotateAngle.Items.Add('5�');
  cbRotateAngle.Items.Add('10�');
  cbRotateAngle.Items.Add('15�');
  cbRotateAngle.Items.Add('18�');
  cbRotateAngle.Items.Add('20�');
  cbRotateAngle.Items.Add('22.5�');
  cbRotateAngle.Items.Add('25�');
  cbRotateAngle.Items.Add('30�');
  cbRotateAngle.Items.Add('35�');
  cbRotateAngle.Items.Add('36�');
  cbRotateAngle.Items.Add('40�');
  cbRotateAngle.Items.Add('45�');
  cbRotateAngle.Items.Add('50�');
  cbRotateAngle.Items.Add('55�');
  cbRotateAngle.Items.Add('60�');
  cbRotateAngle.Items.Add('65�');
  cbRotateAngle.Items.Add('67.5�');
  cbRotateAngle.Items.Add('70�');
  cbRotateAngle.Items.Add('72�');
  cbRotateAngle.Items.Add('75�');
  cbRotateAngle.Items.Add('80�');
  cbRotateAngle.Items.Add('85�');
  cbRotateAngle.Items.Add('90�');
  cbRotateAngle.ItemIndex := 0;

  for x:=1 to 72 do
    cbRotateCount.Items.Add(IntToStr(x));

  cbRotateCount.ItemIndex := 0;

  // ===========================================================================

  LoadRegistrySettings;

  // ===========================================================================
  // ===========================================================================

  SetButtonImage(bLightbox, 0);

  // ===========================================================================
  // ===========================================================================

  BuildPresetList;
  BuildGradientList;

  // ===========================================================================
  // ===========================================================================

  BuildFontList;

  if FileExists((Application.ExeName) + 'fonts\5x7.ledsfont') then
    MatrixMain.LoadFont(ExtractFilePath(Application.ExeName) + 'fonts\5x7.ledsfont');

  AppSettings.TopOffset := 12 + (Coolbar1.Height) + (Coolbar2.Height) + (Coolbar3.Height);

  // ===========================================================================

  if ParamCount > 0 then
    if FileExists(ParamStr(1)) then
      LoadFromFileName(ParamStr(1));
end;

procedure TForm1.FormKeyPress(Sender: TObject; var Key: Char);
 var
  tick : cardinal;

 begin
  tick := GetTickCount();

  if (MatrixMain.DrawData.Mode = drawModeFont) and (key = #8) then begin    // backspace, 1 column
    MatrixMain.DeleteFontCharacter(tbFrames.Position);
  end
  else if (MatrixMain.DrawData.Mode = drawModeFont) and (ord(key) > 31) and (tick - FLastTick >= 400) then begin
    FLastTick := tick;

    MatrixMain.DrawFontCharacter(Ord(Key) - 32, tbFrames.Position);
  end
  else if (Key = #27) then begin
    MatrixMain.DrawData.Mode        := drawModeNone;
    MatrixMain.DrawData.Point       := 0;
    MatrixMain.DrawData.Coords[0].X := -1;
    MatrixMain.DrawData.Coords[0].Y := -1;
    MatrixMain.MatrixCopyX          := 0;
    MatrixMain.MatrixCopyY          := 0;

    sbMouseMode.Down := True;
  end
end;

procedure TForm1.FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
 begin
  statusMain.SimpleText := '(c) Paul Alan Freshney :: ' + LEDStudioDate + ' :: www.freshney.org';
  lPixelColour.Caption  := '';
end;

procedure TForm1.FormMouseWheelDown(Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
 begin
  if (tbFrames.Max <> 1) then begin
    if tbFrames.Position = 1 then
      tbFrames.Position := tbFrames.Max
    else
      tbFrames.Position := tbFrames.Position - 1;

    tbFramesChange(Nil);
  end;
end;

procedure TForm1.FormMouseWheelUp(Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
 begin
  if (tbFrames.Max <> 1) then begin
    if tbFrames.Position = tbFrames.Max then
      tbFrames.Position := 1
    else
      tbFrames.Position := tbFrames.Position + 1;

    tbFramesChange(Nil);
  end;
end;

procedure TForm1.FormResize(Sender: TObject);
 begin
  if (miPixelAuto.Checked) and (MatrixMain.HaveMatrix) then begin
    miPixelTinyClick(miPixelAuto);

    ToggleGradient(sbGradient.Tag, False);
  end;
end;

procedure TForm1.miFadeFirstLastClick(Sender: TObject);
 begin
  MatrixMain.FadeFirstToLast;
end;

procedure TForm1.FontViewer1Click(Sender: TObject);
 begin
  ShowFontViewer;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
 var
  Reg : TRegistry;
  x : integer;

 begin
  OnResize := Nil;       // stops the resize firing after the matrix has been freed!

  // ===========================================================================
  // == Save User Settings =====================================================
  // ===========================================================================

  Reg := TRegistry.Create(KEY_WRITE);

  Reg.RootKey := HKEY_CURRENT_USER;
  Reg.OpenKey('\software\freshney.org\MatrixBuilder', True);

  Reg.WriteInteger('matrixtype',       ProjectSettings.mtype);
  Reg.WriteInteger('gridwidth',        ProjectSettings.width);
  Reg.WriteInteger('gridheight',       ProjectSettings.height);

  Reg.WriteInteger('oncolour',         MatrixMain.LEDColoursSingle[1]);
  Reg.WriteInteger('oncolour2',        MatrixMain.LEDColoursSingle[2]);
  Reg.WriteInteger('oncolour3',        MatrixMain.LEDColoursSingle[3]);
  Reg.WriteInteger('offcolour',        MatrixMain.LEDColoursSingle[0]);
  Reg.WriteInteger('selectcolour',     MatrixMain.LEDColoursSingle[4]);
  Reg.WriteInteger('lightboxcolour',   MatrixMain.LEDColoursSingle[5]);

  Reg.WriteInteger('oncolourbi',       MatrixMain.LEDColoursBi[1]);
  Reg.WriteInteger('oncolour2bi',      MatrixMain.LEDColoursBi[2]);
  Reg.WriteInteger('oncolour3bi',      MatrixMain.LEDColoursBi[3]);
  Reg.WriteInteger('offcolourbi',      MatrixMain.LEDColoursBi[0]);
  Reg.WriteInteger('selectcolourbi',   MatrixMain.LEDColoursBi[4]);
  Reg.WriteInteger('lightboxcolourbi', MatrixMain.LEDColoursBi[5]);

  Reg.WriteInteger('rgbbackground',    MatrixMain.RGBBackground);
  Reg.WriteInteger('LEDRGBColoursLMB', MatrixMain.LEDRGBColours[1]);
  Reg.WriteInteger('LEDRGBColoursMMB', MatrixMain.LEDRGBColours[2]);
  Reg.WriteInteger('LEDRGBColoursRMB', MatrixMain.LEDRGBColours[3]);

  Reg.WriteString('savelocation',      AppSettings.LastSaveLocation);
  Reg.WriteString('loadlocation',      AppSettings.LastLoadLocation);

  if miPixelAuto.Checked then
    Reg.WriteInteger('pixelsize',        0)
  else
    Reg.WriteInteger('pixelsize',        PixelSize);
  Reg.WriteInteger('pixelshape',       PixelShape);

  // ===========================================================================

  Reg.WriteInteger('sSelectionLMB', sSelectionLMB.Tag);
  Reg.WriteInteger('sSelectionMMB', sSelectionMMB.Tag);
  Reg.WriteInteger('sSelectionRMB', sSelectionRMB.Tag);

  // ===========================================================================

  if miShowAnimationToolbar.Checked then
    Reg.WriteInteger('showanimtoolbar', 1)
  else
    Reg.WriteInteger('showanimtoolbar', 0);

  Reg.WriteInteger('animspeed', timerAnimate.Interval);

  // ===========================================================================

//  if miColourPalette.Checked then
//    Reg.WriteInteger('showcolourtoolbar', 1)
//  else
//    Reg.WriteInteger('showcolourtoolbar', 0);

  // ===========================================================================

  if miColumnRowDataToolbar.Checked then
    Reg.WriteInteger('columnrowtoolbar', 1)
  else
    Reg.WriteInteger('columnrowtoolbar', 0);

  // ===========================================================================

  Reg.WriteInteger('hexformat', GetHexFormat);

  // ===========================================================================

  Reg.WriteInteger('hexprefix', GetHexOutput);

  // ===========================================================================

  Reg.WriteInteger('padformat', AppSettings.PadMode);

  // ===========================================================================

  if miAutosave.Checked then
    Reg.WriteInteger('autosave', 1)
  else
    Reg.WriteInteger('autosave', 0);

  if miAutosave2.Checked then
    Reg.WriteInteger('autosaveinterval', 0)
  else if miAutosave5.Checked then
    Reg.WriteInteger('autosaveinterval', 1)
  else
    Reg.WriteInteger('autosaveinterval', 2);

  // ===========================================================================

  Reg.WriteInteger('brackets', GetBrackets);

  // ===========================================================================

  Reg.WriteBool('useformatdata', miUseFormatDataFromFiles.Checked);

  // ===========================================================================

  Reg.WriteBool('previewactive', miPreview.Checked);

  Reg.WriteInteger('previewsize', MatrixMain.PreviewBoxSize);

  // ===========================================================================

  Reg.Free;

  // ===========================================================================
  // ===========================================================================
  // ===========================================================================

  for x:=0 to _MaxHeight do begin
    RowLabels[x].Free;
    ColLabels[x].Free;
  end;

  MatrixMain.Free;
end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
 begin
  if MatrixMain.AnimPlaying then begin
    if timerAnimate.Enabled then
      bStopAnimationClick(Nil);

    CanClose := False;
  end
  else begin
    if sbClear.Enabled then begin
      if MessageDlg('Exit the LED Matrix Studio?' + #13#13 + 'Are you sure?', mtWarning, [mbYes, mbNo], 0)=mrYes then
        CanClose:=True
      else
        CanClose:=False;
    end;
  end;
end;

procedure TForm1.FormConstrainedResize(Sender: TObject; var MinWidth, MinHeight, MaxWidth, MaxHeight: Integer);
 begin
  MinWidth  := 713;
  MinHeight := 310;
end;

function TForm1.GetAutoPixelSize: integer;
 var
  xc, yc, pxc, pyc: integer;

 begin
  if MatrixMain.HaveMatrix then begin
    xc := ClientWidth - 70;
    yc := ClientHeight - AppSettings.Topoffset - 70 - statusMain.Height;

    if MatrixMain.PreviewActive  then xc := xc - (MatrixMain.MatrixWidth * MatrixMain.PreviewBoxSize) - 30;

    if pbFont.Visible            then xc := xc - pbFont.Width - 10;

    if pAnimationToolbar.Visible then yc := yc - pAnimationToolbar.Height;
    if pSourceDisplay.Visible    then yc := yc - pSourceDisplay.Height;

    case sbGradient.Tag of
      0 : begin
            pxc := Floor(xc / MatrixMain.MatrixWidth);
            pyc := Floor(yc / MatrixMain.MatrixHeight);
          end;
      1 : begin
            pxc := Floor(xc / (MatrixMain.MatrixWidth + 2));
            pyc := Floor(yc / MatrixMain.MatrixHeight);
          end;
      2 : begin
            pxc := Floor(xc / MatrixMain.MatrixWidth);
            pyc := Floor(yc / (MatrixMain.MatrixHeight + 2));
          end;
    else
      pxc := 10;
      pyc := 10;
    end;

    if pxc > pyc then   // use the smallest value
      Result := pyc
    else
      Result := pxc;
  end
  else
    Result := 1;
end;

procedure TForm1.UpdateDisplay;
 begin
  tbFrames.Max         := MatrixMain.FrameCount;

  bDeleteFrame.Enabled := (MatrixMain.FrameCount > 2);

  SetFrameCaption(tbFrames.Position);
  
  UpdateMemoryUsage;

  UpdateData;
end;

procedure TForm1.bCopySourceDataClick(Sender: TObject);
 begin
  eSourceData.SelectAll;
  eSourceData.CopyToClipboard;
end;

procedure TForm1.bDeleteFrameClick(Sender: TObject);
 begin
  if (tbFrames.Position = 1) and (tbFrames.Max = 1) then begin
  end
  else begin
    MatrixMain.DeleteFrame(tbFrames.Position);

    if tbFrames.Position = tbFrames.Max then
      tbFrames.Position := tbFrames.Position - 1;

    UpdateDisplay;
  end;
end;

procedure TForm1.bEndFrameClick(Sender: TObject);
 begin
  MatrixMain.CurrentFrame := tbFrames.Max;

  SetFrameCaption(tbFrames.Max);
end;

procedure TForm1.bAddFrameClick(Sender: TObject);
 begin
  MatrixMain.InsertBlankFrameAt(tbFrames.Position);

  tbFrames.Max            := MatrixMain.FrameCount;
  tbFrames.Position       := tbFrames.Position + 1;

  MatrixMain.CurrentFrame := tbFrames.Position;

  UpdateDisplay;
end;

procedure TForm1.bAddFrameCopyClick(Sender: TObject);
 begin
  MatrixMain.InsertCopyFrameAt(tbFrames.Position);

  tbFrames.Position       := tbFrames.Position + 1;

  MatrixMain.CurrentFrame := tbFrames.Position;

  UpdateDisplay;
end;

procedure TForm1.bAddFrameMultipleClick(Sender: TObject);
 var
  s : string;
  sf : integer;

  function ValidIntegerInput(s : string): boolean;
   var
    t : integer;

   begin
    Result:=True;

    for t:=1 to length(s) do begin
      if not((Ord(s[t]) >= 48) and (Ord(s[t]) <= 57)) then
        Result := False;
    end;
  end;

 begin
  s := InputBox('Add blank frames', 'How many frames?', '1');

  if (s <> '') and (ValidIntegerInput(s)) then begin
    sf := StrToInt(s);

    MatrixMain.AddFrameMultiple(sf, tbFrames.Position);

    UpdateDisplay;
  end
  else
    MessageDlg('Invalid number of frames to add!', mtWarning, [mbOK], 0);
end;

procedure TForm1.SetButtonImage(button : TBitbtn; imageidx : integer);
 var
  bmp : TBitmap;

 begin
  bmp := TBitmap.Create;
  bmp.Width  := 16;
  bmp.Height := 16;

  ilMain.GetBitmap(imageidx, bmp);

  button.Glyph.Assign(bmp);

  bmp.Free;
end;

procedure TForm1.miSetDeadPixelsClick(Sender: TObject);
 begin
  MatrixMain.DeadPixelsMode := not MatrixMain.DeadPixelsMode;
end;

procedure TForm1.bPlayAnimationClick(Sender: TObject);
 begin
  bPlayAnimation.Enabled    := False;
  bStartFrame.Enabled       := False;
  bEndFrame.Enabled         := False;
  bNextFrame.Enabled        := False;
  bPreviousFrame.Enabled    := False;
  bStopAnimation.Enabled    := True;
  bAddFrame.Enabled         := False;
  bAddFrameCopy.Enabled     := False;
  bAddFrameMultiple.Enabled := False;
  bDeleteFrame.Enabled      := False;

  timerAnimate.Tag          := 1;
  timerAnimate.Enabled      := True;

  MatrixMain.AnimPlaying    := True;
  MatrixMain.MatrixReadOnly := True;

  ManageUIControls;
end;

procedure TForm1.bPreviousFrameClick(Sender: TObject);
 var
  i : integer;

 begin
  i := tbFrames.Position;

  if i = 1 then
    i := tbFrames.Max
  else
    dec(i);

  SetFrameCaption(i);

  MatrixMain.CurrentFrame := i;
end;

procedure TForm1.bStartFrameClick(Sender: TObject);
 begin
  MatrixMain.CurrentFrame := 1;

  SetFrameCaption(1);
end;

procedure TForm1.bStopAnimationClick(Sender: TObject);
 begin
  timerAnimate.Enabled      := False;

  bPlayAnimation.Enabled    := True;
  bStartFrame.Enabled       := True;
  bEndFrame.Enabled         := True;
  bNextFrame.Enabled        := True;
  bPreviousFrame.Enabled    := True;
  bStopAnimation.Enabled    := False;
  bAddFrame.Enabled         := True;
  bAddFrameCopy.Enabled     := True;
  bAddFrameMultiple.Enabled := True;

  if tbFrames.Max <> 1 then
    bDeleteFrame.Enabled := True;

  bDeleteFrame.Enabled      := True;

  MatrixMain.AnimPlaying    := False;
  MatrixMain.MatrixReadOnly := False;

  ManageUIControls;  
end;

procedure TForm1.bLightboxClick(Sender: TObject);
 begin
  if bLightbox.Tag = 0 then
    bLightbox.Tag := 1
  else
    bLightbox.Tag := 0;

  SetButtonImage(bLightbox, bLightbox.Tag);

  MatrixMain.LightBox := bLightbox.Tag;
end;

procedure TForm1.bNextFrameClick(Sender: TObject);
 var
  i : integer;

 begin
  i := tbFrames.Position;

  if i = tbFrames.Max then
    i := 1
  else
    inc(i);

  SetFrameCaption(i);

  MatrixMain.CurrentFrame := i;
end;

procedure TForm1.DisplayFrame(frameno: integer);
 begin
  SetFrameCaption(frameno);

  MatrixMain.CurrentFrame := frameno;
end;

procedure TForm1.Donate1Click(Sender: TObject);
 begin
  ExecuteFile(0, 'http://www.maximumoctopus.com/donate.htm', '', '');
end;

procedure TForm1.cbMatrixTypeChange(Sender: TObject);
 var
  statusMouseButtonSelect : boolean;
  statusColourSelect0     : boolean;
  statusColourSelect123   : boolean;
  statusBackground        : boolean;

 begin
  case ProjectSettings.mtype of
    psTypeMono         : begin
                           statusBackground        := False;
                           statusMouseButtonSelect := False;
                           statusColourSelect0     := False;
                           statusColourSelect123   := False;
                         end;
    psTypeBiSequential : begin
                           statusBackground        := False;
                           statusMouseButtonSelect := True;
                           statusColourSelect0     := True;
                           statusColourSelect123   := True;
                         end;
    psTypeBiBitPlanes  : begin
                           statusBackground        := False;
                           statusMouseButtonSelect := True;
                           statusColourSelect0     := True;
                           statusColourSelect123   := True;
                         end;
    psTypeRGB          : begin
                           statusBackground        := True;
                           statusMouseButtonSelect := True;
                           statusColourSelect0     := True;
                           statusColourSelect123   := False;
                         end;
  else
    statusBackground        := False;
    statusMouseButtonSelect := False;
    statusColourSelect0     := False;
    statusColourSelect123   := False;

    ProjectSettings.mtype   := 0;
  end;
  
  lBackground.Visible     := statusBackground;
  lPixelColour.Visible    := statusBackground;
  miFadeFirstLast.Enabled := statusBackground;

  sColour0.Visible        := statusColourSelect0;
  sColour1.Visible        := statusColourSelect123;
  sColour2.Visible        := statusColourSelect123;
  sColour3.Visible        := statusColourSelect123;

  sSelectionLMB.Visible   := statusMouseButtonSelect;
  sSelectionMMB.Visible   := statusMouseButtonSelect;
  sSelectionRMB.Visible   := statusMouseButtonSelect;
  lColoursLeft.Visible    := statusMouseButtonSelect;
  lColoursMiddle.Visible  := statusMouseButtonSelect;
  lColoursRight.Visible   := statusMouseButtonSelect;
                        
  // ===========================================================================

  MatrixMain.ChangeMatrixType(ProjectSettings.mtype);

  SetupMatrixColours;

  RecalculatePadding;

  // ===========================================================================  

  case MatrixMain.MatrixType of
     psTypeMono        : begin
                           if sbGradient.Tag = 1 then
                             ToggleGradient(0, True);

                           sbGradient.Enabled               := False;
                           miClearAllFramesGradient.Enabled := False;
                           sbRandomDraw.Enabled             := False;
                           miGradientAllFrames.Enabled      := False;
                           sbPicker.Enabled                 := False;                           
                         end;
    psTypeBiSequential,
    psTypeBiBitPlanes  : begin
                           if sbGradient.Tag = 1 then
                             ToggleGradient(1, False);

                           sbGradient.Enabled               := True;
                           miClearAllFramesGradient.Enabled := True;
                           sbRandomDraw.Enabled             := True;
                           miGradientAllFrames.Enabled      := True;
                           sbPicker.Enabled                 := False;
                         end;
    psTypeRGB          : begin
                           if sbGradient.Tag = 1 then
                             ToggleGradient(1, True);

                           sbPicker.Enabled                 := True;

                           iMMBGradient.Visible             := False;
                         end;
  end;
end;

procedure TForm1.cbRowsLSBChange(Sender: TObject);
 begin
  if sbClear.Enabled then
    UpdateData;
end;

procedure TForm1.Load1Click(Sender: TObject);
 begin
  if timerAnimate.Enabled then
    bStopAnimationClick(Nil);

  // =======================================================================

  if sbClear.Enabled then begin
    if MessageDlg('Opening a new matrix will clear the current project.' + #13#13 +
                  'Do you wish to continue?', mtWarning, [mbYes, mbNo], 0) <> mrYes then Exit;
  end;

  // =======================================================================

  odMain.InitialDir := AppSettings.LastLoadLocation;

  if odMain.Execute then begin
    LoadFromFileName(odMain.FileName);

    FormResize(Nil);
  end;
end;

procedure TForm1.miMemoryR1Click(Sender: TObject);
 begin
  if sbClear.Enabled then
    MatrixMain.RestoreFromUserBuffer((Sender As TMenuItem).Tag);
end;

procedure TForm1.miMergeClick(Sender: TObject);
 var
  ted : TImportData;

 begin
  if timerAnimate.Enabled then
    bStopAnimationClick(Nil);

  // =======================================================================

  odMain.InitialDir := AppSettings.LastLoadLocation;

  if odMain.Execute then begin

    // =======================================================================

    ted := MatrixMain.MergeLEDMatrixData(odMain.FileName, tbFrames.Max + 1);

    // =======================================================================

    UpdateDisplay;

    AppSettings.LastLoadLocation := ExtractFilePath(odMain.Filename);
  end;
end;

procedure TForm1.miAutoSaveClick(Sender: TObject);
 begin
  miAutoSave.Checked    := not(miAutoSave.Checked);

  timerAutoSave.Enabled := miAutoSave.Checked;
end;

procedure TForm1.miBracketsNoneClick(Sender: TObject);
begin
  AppSettings.OpenBracket  := '';
  AppSettings.CloseBracket := '';

  if miBracketsNormal.Checked then begin
    AppSettings.OpenBracket  := '(';
    AppSettings.CloseBracket := ')';
  end
  else if miBracketsCurly.Checked then begin
    AppSettings.OpenBracket  := '{';
    AppSettings.CloseBracket := '}';
  end
  else if miBracketsSquare.Checked then begin
    AppSettings.OpenBracket  := '[';
    AppSettings.CloseBracket := ']';
  end;               

  if sbClear.Enabled then
    UpdateData;
end;

procedure TForm1.miCopyClick(Sender: TObject);
 begin
  MatrixMain.CopyCurrentFrame;
end;

procedure TForm1.miCopyFromPreviousClick(Sender: TObject);
 begin
  if (sbClear.Enabled) and (tbFrames.Position <> 1) then begin
    MatrixMain.CopyFromPrevious(tbFrames.Position);
  end;
end;

procedure TForm1.miFontModeClick(Sender: TObject);
 begin
  pbFont.Visible       := miFontMode.Checked;
  miSaveAsFont.Enabled := miFontMode.Checked;

  if miFontMode.Checked then
    MatrixMain.SoftwareMode := 1
  else
    MatrixMain.SoftwareMode := 0;

  tbFrames.Max := MatrixMain.FrameCount;

  SetFrameCaption(tbFrames.Position);

  UpdateMemoryUsage;

  FormResize(Nil);
end;

procedure TForm1.miHexFormatClick(Sender: TObject);
 begin
  if sbClear.Enabled then
    UpdateData;

  miHexOutputNoneClick(Nil);
end;

procedure TForm1.miHexOutputNoneClick(Sender: TObject);
 begin
  AppSettings.HexPrefix := '';

  if miHexFormat.Checked then begin
    if miHexOutputDollar.Checked then
      AppSettings.HexPrefix := '$'
    else if miHexOutputZeroX.Checked then
      AppSettings.HexPrefix := '0x'
    else if miHexOutputAmp.Checked then
      AppSettings.HexPrefix := '&';
  end;

  if sbClear.Enabled then
    UpdateData;
end;

procedure TForm1.miImportInToCurrentClick(Sender: TObject);
 var
  ted : TImportData;

 begin
  if timerAnimate.Enabled then
    bStopAnimationClick(Nil);

  if odMain.Execute then begin
    ted := MatrixMain.ImportLEDMatrixDataSingleFrame(odMain.FileName);

    if ted.Source <> -1          then cbSource.ItemIndex          := ted.Source;
    if ted.SourceLSB <> -1       then cbSourceLSB.ItemIndex       := ted.SourceLSB;
    if ted.SourceDirection <> -1 then cbSourceDirection.ItemIndex := ted.SourceDirection;
    if ted.MatrixType <> -1      then ProjectSettings.mtype       := ted.MatrixType;

    cbMatrixTypeChange(Nil);
  end;
end;

procedure TForm1.miMemory1Click(Sender: TObject);
 begin
  if sbClear.Enabled then begin
    MatrixMain.CopyToUserBuffer((Sender As TMenuItem).Tag);

    MenuCopyMemory[(Sender As TMenuItem).Tag].ImageIndex    := 6;
    MenuRestoryMemory[(Sender As TMenuItem).Tag].ImageIndex := 6;
  end;
end;

procedure TForm1.miPresetSaveCurrentClick(Sender: TObject);
 var
  s : string;
  tf : TextFile;

 begin
  s := InputBox('Preset Filename', 'Name', IntToStr(MatrixMain.MatrixWidth) + ' x ' + IntToStr(MatrixMain.MatrixHeight));

  if s <> '' then begin
    AssignFile(tf, ExtractFilePath(Application.ExeName) + 'presets\' + s + '.ledspreset');
    Rewrite(tf);

    Writeln(tf, '{preset');
    Writeln(tf, 'w:' + IntToStr(MatrixMain.MatrixWidth));
    Writeln(tf, 'h:' + IntToStr(MatrixMain.MatrixHeight));
    Writeln(tf, 'a:' + IntToStr(cbSource.ItemIndex));
    Writeln(tf, 'b:' + IntToStr(cbSourceLSB.ItemIndex));
    Writeln(tf, 'c:' + IntToStr(cbSourceDirection.ItemIndex));
    Writeln(tf, 'e:' + IntToStr(sbPixelSize.Tag));
    Writeln(tf, 'm:' + IntToStr(MatrixMain.MatrixType));
    Writeln(tf, 's:' + IntToStr(sbPixelShape.Tag));
    Writeln(tf, '}');

    CloseFile(tf);
  end;
end;

procedure TForm1.miPreviewClick(Sender: TObject);
 begin
  MatrixMain.PreviewActive := miPreview.Checked;

  FormResize(Nil);  
end;

procedure TForm1.miRandomnessTinyClick(Sender: TObject);
 begin
  (Sender As TMenuItem).Checked := True;
  
  MatrixMain.RandomCoeff := (Sender As TMenuItem).Tag;
end;

procedure TForm1.BuildFontList;
 var
  searchResult : TSearchRec;
  mi : TMenuItem;
  i : integer;

 begin
  if FindFirst(ExtractFilePath(Application.ExeName) + 'fonts\*.ledsfont', faAnyFile, searchResult) = 0 then begin
    i := 0;

    repeat
      mi := TMenuItem.Create(Self);

      with mi do begin
        Caption   := RemoveExtension(searchResult.Name);
        Tag       := i;

        RadioItem := True;
        Checked   := False;

        OnClick   := SelectFont;
      end;

      miLoadFont.Add(mi);

      if i = 0 then
        SelectFont(mi); // loads first font in list

      inc(i);
    until FindNext(searchResult) <> 0;

    FindClose(searchResult);
  end
  else
    sbFont.Visible := False;
end;

procedure TForm1.BuildPresetList;
 var
  searchResult : TSearchRec;
  mi : TMenuItem;
  i : integer;

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

begin
  // Try to find regular files matching Unit1.d* in the current dir
  if FindFirst(ExtractFilePath(Application.ExeName) + 'presets\*.ledspreset', faAnyFile, searchResult) = 0 then begin
    i := 0;

    repeat
      mi := TMenuItem.Create(Self);

      with mi do begin
        Caption := RemoveExtension(searchResult.Name);
        Tag     := i;

        OnClick := SelectPreset;
      end;

      miLoadPreset.Add(mi);

      inc(i);
    until FindNext(searchResult) <> 0;

    // Must free up resources used by these successful finds
    FindClose(searchResult);
  end;
end;

procedure TForm1.BuildGradientList;
 var
  searchResult : TSearchRec;
  mi : TMenuItem;
  i : integer;

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

begin
  // Try to find regular files matching Unit1.d* in the current dir
  if FindFirst(ExtractFilePath(Application.ExeName) + 'gradients\*.ledsgradient', faAnyFile, searchResult) = 0 then begin
    i:=0;

    repeat
      mi := TMenuItem.Create(Self);
      with mi do begin
        Caption := RemoveExtension(searchResult.Name);
        Tag     := i;

        OnClick := SelectGradient;
      end;

      miLoadGradients.Add(mi);

      inc(i);
    until FindNext(searchResult) <> 0;

    // Must free up resources used by these successful finds
    FindClose(searchResult);
  end;
end;


procedure TForm1.SelectFont(Sender : TObject);
 var
  s,temp : string;
  t : integer;

 begin
  temp := ExtractFilePath(Application.ExeName) + 'fonts\' + TMenuItem(Sender).Caption + '.ledsfont';
  s    := '';

  for t:=1 to length(temp) do
    if temp[t] <> '&' then
      s := s + temp[t];

  if FileExists(s) then begin
    MatrixMain.LoadFont(s);

    TMenuItem(Sender).Checked   := True;
  end
  else
    MessageDlg('Cannot find font!!', mtError, [mbOK], 0);
end;

procedure TForm1.SelectPreset(Sender : TObject);
 var
  s,temp : string;
  t : integer;

 begin
  if MessageDlg('Really load this preset?', mtWarning, [mbYes, mbNo], 0) = mrYes then begin

    temp := ExtractFilePath(Application.ExeName) + 'presets\' + TMenuItem(Sender).Caption + '.ledspreset';
    s    := '';

    for t:=1 to length(temp) do
      if temp[t] <> '&' then
        s := s + temp[t];

    if FileExists(s) then begin
      LoadPreset(s);
    end
    else
      MessageDlg('Cannot find preset file!!', mtError, [mbOK], 0);
  end;
end;

procedure TForm1.LoadPreset(filename : string);
 var
  tf   : TextFile;
  s, v : string;
  mt   : integer;

 begin
  mt := 0; // default matrix type if none specified in file

  // ===========================================================================

  AssignFile(tf, filename);
  Reset(tf);

  while not(eof(tf)) do begin
    readln(tf, s);

    if s <> '' then begin
      v := Copy(s, 3, length(s) - 2);

      case GetPresetParameterType(s) of
        2 : begin
              ProjectSettings.width  := StrToInt(v);
            end;
        3 : begin
              ProjectSettings.height := StrToInt(v);
            end;
        4 : cbSource.ItemIndex          := StrToInt(v);
        5 : cbSourceLSB.ItemIndex       := StrToInt(v);
        6 : cbSourceDirection.ItemIndex := StrToInt(v);
        7 : {};
        8 : case StrToInt(v) of
              0 : miPixelTinyClick(miPixelTiny);
              1 : miPixelTinyClick(miPixelSmall);
              2 : miPixelTinyClick(miPixelMedium);
              3 : miPixelTinyClick(miPixelLarge);
              4 : miPixelTinyClick(miPixelVeryLarge);
            end;
        9 : mt := StrToInt(v);
      end;
    end;
  end;

  CloseFile(tf);

  // ===========================================================================

  ProjectSettings.mtype := mt;
  cbMatrixTypeChange(Nil);

  // ===========================================================================

  sbBuildClick(Load1);
end;

procedure TForm1.Small1Click(Sender: TObject);
 begin
  TMenuItem(Sender).Checked := True;

  puBrushSize.Tag := TMenuItem(Sender).Tag;

  MatrixMain.ChangePixelBrush(puBrushSize.Tag);
end;

procedure TForm1.miPadAutoClick(Sender: TObject);
 begin
  if (Sender <> Nil) then begin
    AppSettings.PadMode := (Sender As TMenuItem).Tag;

    (Sender As TMenuItem).Checked := True;
  end;

  RecalculatePadding;

  if sbClear.Enabled then
    UpdateData;
end;

procedure TForm1.miPixelShapeSquareClick(Sender: TObject);
 begin
  Screen.Cursor := crHourGlass;

  TMenuItem(Sender).Checked:=True;

  sbPixelShape.Caption := TMenuItem(Sender).Caption;
  sbPixelShape.Tag     := TMenuItem(Sender).Tag;
  PixelShape           := TMenuItem(Sender).Tag;

  if sbClear.Enabled then begin
    MatrixMain.ChangePixelShape(PixelShape);
  end;

  Screen.Cursor := crDefault;
end;

procedure TForm1.miPixelTinyClick(Sender: TObject);
 var
  x, y : integer;

 begin
  Screen.Cursor := crHourGlass;

  TMenuItem(Sender).Checked := True;

  case TMenuItem(Sender).Tag of
    0 : PixelSize := 10;
    1 : PixelSize := 15;
    2 : PixelSize := 20;
    3 : PixelSize := 25;
    4 : PixelSize := 30;
    5 : PixelSize := 40;
    6 : PixelSize := GetAutoPixelSize;
  end;

  sbPixelSize.Caption := TMenuItem(Sender).Caption;
  sbPixelSize.Tag     := TMenuItem(Sender).Tag;

  if (sbClear.Enabled) then begin
    for x:=0 to MatrixMain.MatrixWidth-1 do begin
      ColLabels[x].Top     := AppSettings.TopOffset + 4 + ((MatrixMain.MatrixHeight) * PixelSize);
      ColLabels[x].Left    := LeftOffset + Round((PixelSize - 2 - ColLabels[x].Width) / 2) + (x * PixelSize);

      for y:=0 to MatrixMain.MatrixHeight - 1 do begin

        RowLabels[y].Top     := AppSettings.TopOffset + Round((PixelSize - 2 - RowLabels[y].Height) / 2) + (y * PixelSize);
        RowLabels[y].Left    := 4;
      end;
    end;
  end;

  MatrixMain.ChangePixelSize(PixelSize);

  Screen.Cursor := crDefault;
end;

procedure TForm1.sbPresetClick(Sender: TObject);
 begin
  if timerAnimate.Enabled then
    bStopAnimationClick(Nil);

  puPresets.Popup(Left + sbPreset.Left, Top + 80);
end;

procedure TForm1.sbRotateAnyClick(Sender: TObject);
 var
  t,origframe : integer;
  byangle : real;

 begin
  Screen.Cursor := crHourGlass;

  MatrixMain.BackupMatrix(MatrixMain.CurrentFrame);

  byangle   := StrToFloat(Copy(cbRotateAngle.Text, 1, Length(cbRotateAngle.Text) - 1));
  origframe := tbFrames.Position;

  for t:=1 to cbRotateCount.ItemIndex + 1 do begin

    if (t + origframe > MatrixMain.FrameCount) then
      MatrixMain.InsertBlankFrameAt(MatrixMain.FrameCount);

    // =========================================================================

    MatrixMain.RotateFrame(t * byangle, t + origframe);
  end;

  UpdateDisplay;

  Screen.Cursor := crDefault;
end;

procedure TForm1.tbFramesChange(Sender: TObject);
 begin
  MatrixMain.CurrentFrame := tbFrames.Position;

  SetFrameCaption(tbFrames.Position);
end;

procedure TForm1.sbChangeFontClick(Sender: TObject);
 begin
  if fdMain.Execute then begin
    lFont.Font := fdMain.Font;

    sbChangeFont.Caption := fdMain.Font.Name;
  end;
end;

procedure TForm1.sbPixelShapeClick(Sender: TObject);
 begin
  if timerAnimate.Enabled then
    bStopAnimationClick(Nil);

  puPixelShape.Popup(Left + 250, Top + 80);
end;

procedure TForm1.sbPixelSizeClick(Sender: TObject);
 begin
  if timerAnimate.Enabled then
    bStopAnimationClick(Nil);

  puPixelSize.Popup(Left + 200, Top + 80);
end;

procedure TForm1.sbMirrorClick(Sender: TObject);
 begin
  MatrixMain.PerformEffectOnCurrentFrame(modeFlip);
end;

procedure TForm1.miFlipAllFramesClick(Sender: TObject);
 begin
  MatrixMain.PerformEffectOnAllFrames(modeFlipAll);
end;
                    
procedure TForm1.sbMouseModeClick(Sender: TObject);
 begin
  MatrixMain.DrawData.Mode        := TSpeedButton(Sender).Tag;
  MatrixMain.DrawData.Point       := 0;
  MatrixMain.DrawData.Coords[0].X := -1;
  MatrixMain.DrawData.Coords[0].Y := -1;
  MatrixMain.MatrixCopyX          := 0;
  MatrixMain.MatrixCopyY          := 0;
  MatrixMain.DrawData.Special     := tbFrames.Max;

  DisplayFrame(tbFrames.Position);
end;

procedure TForm1.sbRotateLClick(Sender: TObject);
 begin
  MatrixMain.RotateCurrentFrame(modeRotateACW);
end;

procedure TForm1.sbRotateRClick(Sender: TObject);
 begin
  MatrixMain.RotateCurrentFrame(modeRotateCW);
end;

procedure TForm1.miShowAnimationToolbarClick(Sender: TObject);
 begin
  pAnimationToolbar.Visible := miShowAnimationToolbar.Checked;
end;

procedure TForm1.miPlaybackSpeed1Click(Sender: TObject);
 begin
  TMenuItem(Sender).Checked := True;

  case TMenuItem(Sender).Tag of
    0 : begin
          timerAnimate.Interval := 1000;
          bPlayAnimation.Hint   := 'Play animation (1 second)';
        end;
    1 : begin
          timerAnimate.Interval := 500;
          bPlayAnimation.Hint   := 'Play animation (0.5 seconds)';
        end;
    2 : begin
          timerAnimate.Interval := 250;
          bPlayAnimation.Hint   := 'Play animation (0.25 seconds)';
        end;
    3 : begin
          timerAnimate.Interval := 100;
          bPlayAnimation.Hint   := 'Play animation (0.1 seconds)';
        end;
    4 : begin
          timerAnimate.Interval := 50;
          bPlayAnimation.Hint   := 'Play animation (0.05 seconds)';
        end;
  end;
end;

procedure TForm1.miAddCommentClick(Sender: TObject);
 var
  s : string;

 begin
  s:=MatrixMain.MatrixComment;

  if InputQuery('Matrix Comment', 'Add a comment to this matrix', s) then begin
    MatrixMain.MatrixComment := s;
  end;
end;

procedure TForm1.miASCIIStartCodeClick(Sender: TObject);
 var
  s : string;

 begin
  s := IntToStr(AppSettings.ASCIIIndex);

  if InputQuery('ASCII Code', 'Start ASCII code for Font Mode', s) then begin
    AppSettings.ASCIIIndex := StrToInt(s);
  end;
end;

procedure TForm1.miAutosave2Click(Sender: TObject);
 begin
  if (Sender<>Nil) then begin
    (Sender As TMenuItem).Checked := True;

    case (Sender As TMenuItem).Tag of
      0 : timerAutosave.Interval :=  2 * 60 * 1000;
      1 : timerAutosave.Interval :=  5 * 60 * 1000;
      2 : timerAutosave.Interval := 10 * 60 * 1000;
    end;
  end;
end;

procedure TForm1.New1Click(Sender: TObject);
 begin
  if timerAnimate.Enabled then
    bStopAnimationClick(Nil);

  if MessageDlg('Really clear everything?', mtWarning, [mbYes, mbNo], 0)=mrYes then begin
    NewGrid := True;

    sbBuildClick(Nil);
  end;
end;

procedure TForm1.miPasteClick(Sender: TObject);
 begin
  MatrixMain.BackupMatrix(tbFrames.Position);

  MatrixMain.PasteCurrentFrame;
end;

procedure TForm1.sbUndoClick(Sender: TObject);
 begin
  MatrixMain.Undo;

  if sbClear.Enabled then
    UpdateData;
end;

procedure TForm1.miRedoClick(Sender: TObject);
begin
  MatrixMain.Redo;

  if sbClear.Enabled then
    UpdateData;
end;

procedure TForm1.sColour3MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
 var
  old : integer;

 begin
  case MatrixMain.MatrixType of
    psTypeMono, psTypeBiSequential, psTypeBiBitPlanes : begin
                   if button = mbLeft then begin
                     ColourIndexLMB            := (Sender As TShape).Tag;

                     sSelectionLMB.Brush.Color := MatrixMain.LEDColours[ColourIndexLMB];
                     sSelectionLMB.Tag         := (Sender As TShape).Tag;
                   end
                   else if button = mbMiddle then begin
                     ColourIndexMMB            := (Sender As TShape).Tag;

                     sSelectionMMB.Brush.Color := MatrixMain.LEDColours[ColourIndexMMB];
                     sSelectionMMB.Tag         := (Sender As TShape).Tag;
                   end
                   else if button = mbRight then begin
                     ColourIndexRMB            := (Sender As TShape).Tag;

                     sSelectionRMB.Brush.Color := MatrixMain.LEDColours[ColourIndexRMB];
                     sSelectionRMB.Tag         := (Sender As TShape).Tag;
                   end;

                   MatrixMain.SetMouseButtonColours(sSelectionLMB.Tag,
                                                    sSelectionMMB.Tag,
                                                    sSelectionRMB.Tag);
                 end;
    psTypeRGB  : begin // == RGB ===============================================
                   if colorDialog.Execute then begin
                     old := MatrixMain.RGBBackground;

                     (Sender As TShape).Brush.Color := colorDialog.Color;

                     if Sender = sColour0 then
                       MatrixMain.RGBBackground := (Sender As TShape).Brush.Color
                     else if Sender = sSelectionLMB then
                       MatrixMain.LEDRGBColours[1] := colorDialog.Color
                     else if Sender = sSelectionMMB then
                       MatrixMain.LEDRGBColours[2] := colorDialog.Color
                     else if Sender = sSelectionRMB then
                       MatrixMain.LEDRGBColours[3] := colorDialog.Color;

                     if (Sender = sColour0) then begin
                       if old <> colorDialog.Color then begin
                         if MessageDlg('Background colour has changed. ' + #13#13 +
                                       'Change all background pixels?', mtInformation, [mbOK, mbCancel], 0) = mrOK then
                           MatrixMain.ChangePixels(old, colorDialog.Color);
                       end;
                     end;
                   end;

                   MatrixMain.SetMouseButtonColours(sSelectionLMB.Brush.Color,
                                                    sSelectionMMB.Brush.Color,
                                                    sSelectionRMB.Brush.Color);
                 end;
  end;
end;

procedure TForm1.sbBuildClick(Sender: TObject);
 var
  x,y,mw,mh : integer;
  ps : TProjectSettings;

 begin
  if timerAnimate.Enabled then
    bStopAnimationClick(Nil);

  // ===========================================================================
  // ===========================================================================

  if (Sender = Load1) then begin
    ProjectSettings.clear   := False;
    ProjectSettings.special := tbFrames.Max;    // preserve the frame count when coming in from Load/Import etc.

    cbMatrixTypeChange(Nil);    
  end
  else begin
    ps := DoNewProject(ProjectSettings, sbClear.Enabled);

    if ps.mtype = -1 then Exit;

    ProjectSettings.mtype   := ps.mtype;
    ProjectSettings.width   := ps.width;
    ProjectSettings.height  := ps.height;
    ProjectSettings.clear   := ps.clear;
    ProjectSettings.special := ps.special;
    tbFrames.Max            := ps.special;

    if ProjectSettings.mtype = psTypeRGB then
      ClearTExportOptions(True, AppSettings.LastExport)
    else
      ClearTExportOptions(False, AppSettings.LastExport);

    cbMatrixTypeChange(Nil);
  end;

  // ===========================================================================
  // ===========================================================================      

  NewGrid := False;

  // ===========================================================================

  mw := ProjectSettings.width;
  mh := ProjectSettings.height;

  if miPixelAuto.Checked then
    PixelSize := GetAutoPixelSize;

  MatrixMain.NewMatrix(ProjectSettings.mtype, ProjectSettings.special, AppSettings.TopOffSet, LeftOffset, mw, mh,
                       PixelSize, PixelShape, miGridToggle.Checked, False, ProjectSettings.clear);

  // ===========================================================================

  for x:=0 to mw - 1 do begin
    ColLabels[x].Top     := AppSettings.TopOffset + 4 + ((mh) * PixelSize);
    ColLabels[x].Left    := LeftOffset + Round((PixelSize - 2 - ColLabels[x].Width) / 2) + (x * PixelSize);
    ColLabels[x].Caption := '0';

    for y:=0 to mh-1 do begin
      RowLabels[y].Top     := AppSettings.TopOffset + Round((PixelSize - 2 - RowLabels[y].Height) / 2) + (y * PixelSize);
      RowLabels[y].Left    := 4;
      RowLabels[y].Caption := '0';
    end;
  end;

  for x:=0 to _MaxWidth do begin
    if (x <= mw - 1) and (mw <= 32) and (MatrixMain.MatrixType <> psTypeRGB) then
      ColLabels[x].Visible := True
    else
      ColLabels[x].Visible := False;

    if (x <= mh - 1) and (mh <= 32) and (MatrixMain.MatrixType <> psTypeRGB) then
      RowLabels[x].Visible := True
    else
      RowLabels[x].Visible := False;
  end;

  // ===========================================================================

  if (ProjectSettings.clear) then begin
    if miFontMode.Checked then begin
      tbFrames.Max := 96;
    end
    else begin
      tbFrames.Max := MatrixMain.FrameCount;
    end;
  end;

  // ===========================================================================

  ManageUIControls;

  // ===========================================================================

  OldMatrixType := ProjectSettings.mtype;

  AppSettings.DataFilename  := '';
  Caption                   := BackupCaption;

  UpdateDisplay;

  UpdateMemoryUsage;

  MatrixMain.PaintBoxUpdate(Nil);

  Screen.Cursor := crDefault;

  RecalculatePadding;
  MatrixOnChange(Nil);

  FormResize(Nil);
end;

procedure TForm1.sbClearClick(Sender: TObject);
 begin
  MatrixMain.ClearCurrentFrame;
end;

procedure TForm1.sbFlipClick(Sender: TObject);
 begin
  MatrixMain.PerformEffectOnCurrentFrame(modeMirror);
end;

procedure TForm1.sbGradientClick(Sender: TObject);
 begin
  case sbGradient.Tag of
    0 : sbGradient.Tag := 1;
    1 : sbGradient.Tag := 2;
    2 : sbGradient.Tag := 0;
  end;

  ToggleGradient(sbGradient.Tag, False); // inverses display

  FormResize(Nil);
end;

procedure TForm1.sbGradientMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
 begin
  if Button = mbRight then begin
    puGradients.Popup(Left + 200, Top + 140);
  end;
end;

procedure TForm1.miMirrorAllFramesClick(Sender: TObject);
 begin
  MatrixMain.PerformEffectOnAllFrames(modeMirrorAll);
end;

procedure TForm1.sbScrollLeftClick(Sender: TObject);
 begin
  MatrixMain.PerformScrollOnCurrentFrame(modeScrollLeft);
end;

procedure TForm1.sbScrollRightClick(Sender: TObject);
 begin
  MatrixMain.PerformScrollOnCurrentFrame(modeScrollRight);
end;

procedure TForm1.sbScrollUpClick(Sender: TObject);
begin
  MatrixMain.PerformScrollOnCurrentFrame(modeScrollUp);
end;

procedure TForm1.sbScrollDownClick(Sender: TObject);
 begin
  MatrixMain.PerformScrollOnCurrentFrame(modeScrollDown);
end;

procedure TForm1.sbInvertClick(Sender: TObject);
 begin
  MatrixMain.PerformEffectOnCurrentFrame(modeInvert);
end;

procedure TForm1.miInvertAllFramesClick(Sender: TObject);
 begin
  MatrixMain.PerformEffectOnAllFrames(modeInvertAll);
end;

procedure TForm1.timerAnimateTimer(Sender: TObject);
 begin
  SetFrameCaption(timerAnimate.Tag);

  MatrixMain.CurrentFrame := timerAnimate.Tag;

  if timerAnimate.Tag = tbFrames.Max then
    timerAnimate.Tag := 1
  else
    timerAnimate.Tag := timerAnimate.Tag + 1;
end;

procedure TForm1.timerAutosaveTimer(Sender: TObject);
 var
  ted : TImportData;

 begin
  if (sbClear.Enabled) or (MatrixMain.AnimPlaying) then begin
    ted.Source          := cbSource.ItemIndex;
    ted.SourceLSB       := cbSourceLSB.ItemIndex;
    ted.SourceDirection := cbSourceDirection.ItemIndex;
    ted.PadMode         := AppSettings.PadMode;
    ted.HexFormat       := GetHexFormat;
    ted.HexOutput       := GetHexOutput;
    ted.Brackets        := GetBrackets;
    ted.MatrixType      := MatrixMain.MatrixType;

    // =========================================================================

    MatrixMain.SaveAnimation(ExtractFilePath(Application.ExeName) + 'saves\autosave\' + GetAutoSaveName, ted, AppSettings.LastExport);
  end;
end;

procedure TForm1.Clearallbuffers1Click(Sender: TObject);
 var
  x,y,t : integer;

 begin
  if MessageDlg('Are you sure?' + #13#13 +
                'Clear all user matrix buffers?' + #13#13#13 +
                '(Does not clear animation frames)', mtWarning, [mbYes, mbNo], 0) = mrYes then begin

    for t:=0 to 9 do begin
      for x:=0 to _MaxWidth do begin
        for y:=0 to _MaxHeight do begin
          TMatrix(MatrixMain.MatrixUser[t]).Grid[x, y] := 0;
        end;
      end;

      if t <= 9 then begin
        MenuCopyMemory[t].ImageIndex    := -1;
        MenuRestoryMemory[t].ImageIndex := -1;
      end;
    end;
  end; 
end;

procedure TForm1.Clearallframes1Click(Sender: TObject);
 begin
  if MessageDlg('Clear all frames!' + #13#13 + 'Are you sure?', mtWarning, [mbYes, mbNo], 0) = mrYes then
    MatrixMain.ClearAllFrames;  
end;

procedure TForm1.eSourceDataKeyPress(Sender: TObject; var Key: Char);
 begin
  if cbSource.ItemIndex = 0 then begin
    if (Key = #13) and (sbClear.Enabled) then begin
      MatrixMain.ImportRowData(miHexFormat.Checked, cbSourceDirection.ItemIndex, cbSourceLSB.ItemIndex, eSourceData.Text);
    end;
  end
  else begin
    if (Key = #13) and (sbClear.Enabled) then begin
      MatrixMain.ImportColumnData(miHexFormat.Checked, cbSourceDirection.ItemIndex, cbSourceLSB.ItemIndex, eSourceData.Text);
    end;
  end;
end;

procedure TForm1.Importfrombitmap1Click(Sender: TObject);
 var
  ted : TImportData;

 begin
  frmImportBitmap.ShowModal;

  if frmImportBitmap.FrameCount <> -1 then begin
    ted := MatrixMain.ImportFromBMP(frmImportBitmap.ImageFilename,
                                    frmImportBitmap.FrameCount,
                                    frmImportBitmap.FrameWidth,
                                    frmImportBitmap.FrameHeight,
                                    frmImportBitmap.RGBImport,
                                    frmImportBitmap.CreateNew);

    if (frmImportBitmap.CreateNew) or (MatrixMain.HaveMatrix = False) then begin
      ProjectSettings.width   := ted.NewWidth;
      ProjectSettings.height  := ted.NewHeight;

      if ted.RGBImport then
        ProjectSettings.mtype := psTypeRGB
      else
        ProjectSettings.mtype := psTypeMono;

      tbFrames.Max             := ted.NewFrames;        

      NewGrid := True;
      sbBuildClick(Load1);

      AppSettings.DataFilename := '';
      Caption                  := BackupCaption;
    end
    else begin
      tbFrames.Max             := ted.NewFrames;
    end;

    bDeleteFrame.Enabled     := (tbFrames.Max > 1);

    SetFrameCaption(MatrixMain.CurrentFrame);

    FormResize(Nil);
  end;
end;

procedure TForm1.UpdateData;
 var
 mydata  : int64;
 x, y    : integer;
 s, temp : string;
 bitplane : integer;

 function BinToInt(s : string): int64;
  var
   i, t : integer;

  begin
   result:=0;

   i:=0;

   for t:=length(s) downto 1 do begin
     if s[t] = '1' then
       result := result + powers[i];

     inc(i);
   end;
 end;

 begin
  case MatrixMain.MatrixType of
    0 : begin // single colour
          for y:=0 to MatrixMain.MatrixHeight - 1 do begin
            mydata := 0;

            for x:=0 to MatrixMain.MatrixWidth - 1 do begin
              if TMatrix(MatrixMain.Matrix[tbFrames.Position]).Grid[x, y] = 1 then begin
                if cbSourceLSB.ItemIndex = 0 then
                  mydata := mydata + (powers[x])
                else
                  mydata := mydata + (powers[MatrixMain.MatrixWidth - x - 1])
              end;
            end;

            if miHexFormat.Checked then
              s := IntToHex(mydata, AppSettings.PadModeHexRow)
            else
              s := IntToStr(mydata);

            RowLabels[y].Caption := s;
          end;

          for x:=0 to MatrixMain.MatrixWidth - 1 do begin
            mydata := 0;

            for y:=0 to MatrixMain.MatrixHeight - 1 do begin
              if TMatrix(MatrixMain.Matrix[tbFrames.Position]).Grid[x, y] = 1 then begin
                if cbSourceLSB.ItemIndex = 0 then
                  mydata := mydata + (powers[y])
                else
                  mydata := mydata + (powers[MatrixMain.MatrixHeight - y - 1]);
              end;
            end;

            if miHexFormat.Checked then
              s := IntToHex(mydata, AppSettings.PadModeHexCol)
            else
              s := IntToStr(mydata);

            ColLabels[x].Caption := s;
          end;

          // ===========================================================================
          // Need to display anything?
          // ===========================================================================

          if pSourceDisplay.Visible = False then exit;

          s := '';

          if cbSource.ItemIndex = 0 then begin

            // =================================================================
            // Row data
            // =================================================================

            if cbSourceDirection.ItemIndex = 0 then begin
              s := AppSettings.OpenBracket;

              for y:=0 to MatrixMain.MatrixHeight - 2 do begin
                s := s + AppSettings.HexPrefix + RowLabels[y].Caption + ', ';
              end;

              s := s + AppSettings.HexPrefix + RowLabels[MatrixMain.MatrixHeight - 1].Caption + AppSettings.CloseBracket;
            end
            else begin
              s := AppSettings.OpenBracket;

              for y := MatrixMain.MatrixHeight - 1 downto 1 do begin
                s := s + AppSettings.HexPrefix + RowLabels[y].Caption + ', ';
              end;

              s :=s + AppSettings.HexPrefix + RowLabels[0].Caption + AppSettings.CloseBracket;
            end;

            eSourceData.Text := s;
          end
          else begin

            // =================================================================
            // Column data
            // =================================================================

            case cbSourceDirection.ItemIndex of
              0 : begin
                    s := AppSettings.OpenBracket;

                    if miCombineNibbles.Checked then begin
                      x := 0;

                      while x <= MatrixMain.MatrixWidth - 2 do begin
                        s := s + AppSettings.HexPrefix + ColLabels[x].Caption+ColLabels[x + 1].Caption + ', ';

                        inc(x, 2);
                      end;

                      s := Copy(s, 1, length(s) - 2) + AppSettings.CloseBracket;
                    end
                    else begin
                      for x:=0 to MatrixMain.MatrixWidth - 2 do begin
                        s := s + AppSettings.HexPrefix + ColLabels[x].Caption + ', ';
                      end;

                      s := s + AppSettings.HexPrefix + ColLabels[MatrixMain.MatrixWidth - 1].Caption + AppSettings.CloseBracket;
                    end;
                  end;
              1 : begin
                    s := AppSettings.OpenBracket;

                    if miCombineNibbles.Checked then begin
                      x := MatrixMain.MatrixWidth - 1;

                      while x >= 0 do begin
                        s := s + AppSettings.HexPrefix + ColLabels[x].Caption + ColLabels[x - 1].Caption + ', ';

                        dec(x, 2);
                      end;

                      s := Copy(s, 1, length(s ) - 2) + AppSettings.CloseBracket;
                    end
                    else begin
                      for x := MatrixMain.MatrixWidth - 1 downto 1 do begin
                        s := s + AppSettings.HexPrefix + ColLabels[x].Caption + ', ';
                      end;

                      s := s + AppSettings.HexPrefix + ColLabels[0].Caption + AppSettings.CloseBracket;
                    end;
                  end;
              2 : begin
                    s := AppSettings.OpenBracket;

                    for x := 7 downto 0 do begin
                      s := s + AppSettings.HexPrefix + ColLabels[x].Caption + ', ';
                    end;

                    for x := 15 downto 8 do begin
                      s := s + AppSettings.HexPrefix + ColLabels[x].Caption + ', ';
                    end;

                    for x := 23 downto 17 do begin
                      s := s + AppSettings.HexPrefix + ColLabels[x].Caption + ', ';
                    end;

                    s := s + AppSettings.HexPrefix + ColLabels[16].Caption + AppSettings.CloseBracket;
                  end;
            end;

            eSourceData.Text:=s;
          end;
        end;
    1 : begin // bicolour, sequential bits
          for y:=0 to MatrixMain.MatrixHeight - 1 do begin
            temp := '';

            for x:=0 to MatrixMain.MatrixWidth - 1 do begin
              if cbSourceLSB.ItemIndex = 0 then
                temp := temp + BiColoursLSBLeft[TMatrix(MatrixMain.Matrix[tbFrames.Position]).Grid[x, y]]
              else
                temp := temp + BiColoursLSBRight[TMatrix(MatrixMain.Matrix[tbFrames.Position]).Grid[MatrixMain.MatrixWidth - x - 1, y]];
            end;

            if miHexFormat.Checked then
              s := IntToHex(BinToInt(temp), AppSettings.PadModeHexRow)
            else
              s := IntToStr(BinToInt(temp));

            RowLabels[y].Caption := s;
          end;

          for x:=0 to MatrixMain.MatrixWidth - 1 do begin
            temp := '';

            for y:=0 to MatrixMain.MatrixHeight - 1 do begin
              if cbSourceLSB.ItemIndex = 0 then
                temp := temp + BiColoursLSBLeft[TMatrix(MatrixMain.Matrix[tbFrames.Position]).Grid[x, y]]
              else
                temp := temp + BiColoursLSBRight[TMatrix(MatrixMain.Matrix[tbFrames.Position]).Grid[x, MatrixMain.MatrixHeight - y - 1]];
            end;

            if miHexFormat.Checked then
              s := IntToHex(BinToInt(temp), AppSettings.PadModeHexCol)
            else
              s := IntToStr(BinToInt(temp));

            ColLabels[x].Caption := s;
          end;

          // ===========================================================================
          // Need to display anything?
          // ===========================================================================

          if pSourceDisplay.Visible = False then exit;

          s := '';

          if cbSource.ItemIndex = 0 then begin

            // ===========================================================================
            // Row data
            // ===========================================================================

            if cbSourceDirection.ItemIndex = 0 then begin
                s := AppSettings.OpenBracket;

                for y:=0 to MatrixMain.MatrixHeight - 2 do begin
                  s := s + AppSettings.HexPrefix + RowLabels[y].Caption + ', ';
                end;

                s := s + AppSettings.HexPrefix + RowLabels[MatrixMain.MatrixHeight - 1].Caption + AppSettings.CloseBracket;
              end
              else begin
                s := AppSettings.OpenBracket;

              for y := MatrixMain.MatrixHeight - 1 downto 1 do begin
                s := s + AppSettings.HexPrefix + RowLabels[y].Caption + ', ';
              end;

              s := s + AppSettings.HexPrefix + RowLabels[0].Caption + AppSettings.CloseBracket;
            end;

            eSourceData.Text := s;
          end
          else begin

            // ===========================================================================
            // Column data
            // ===========================================================================

            case cbSourceDirection.ItemIndex of
              0 : begin
                    s := AppSettings.OpenBracket;

                    for x:=0 to MatrixMain.MatrixWidth - 2 do begin
                      s := s + AppSettings.HexPrefix + ColLabels[x].Caption + ', ';
                    end;

                    s := s + AppSettings.HexPrefix + ColLabels[MatrixMain.MatrixWidth - 1].Caption + AppSettings.CloseBracket;
                  end;
              1 : begin
                    s := AppSettings.OpenBracket;

                    for x := MatrixMain.MatrixWidth-1 downto 1 do begin
                      s := s + AppSettings.HexPrefix + ColLabels[x].Caption + ', ';
                    end;

                    s :=s + AppSettings.HexPrefix + ColLabels[0].Caption + AppSettings.CloseBracket;
                  end;
              2 : begin
                    s := AppSettings.OpenBracket;

                    for x := 7 downto 0 do begin
                      s := s + AppSettings.HexPrefix + ColLabels[x].Caption + ', ';
                    end;

                    for x := 15 downto 8 do begin
                      s := s + AppSettings.HexPrefix + ColLabels[x].Caption + ', ';
                    end;

                    for x := 23 downto 17 do begin
                      s := s + AppSettings.HexPrefix + ColLabels[x].Caption + ', ';
                    end;

                    s := s + AppSettings.HexPrefix + ColLabels[16].Caption + AppSettings.CloseBracket;
                  end;
            end;

            eSourceData.Text:=s;
          end;
        end;
    2 : begin // bicolour, bitplanes
          for y:=0 to MatrixMain.MatrixHeight - 1 do begin
            bitplane := 0;

            for x:=0 to MatrixMain.MatrixWidth - 1 do begin
              if cbSourceLSB.ItemIndex = 0 then begin
                case TMatrix(MatrixMain.Matrix[tbFrames.Position]).Grid[x, y] of
                  0 : {};
                  1 : bitplane := bitplane + (powers[x]);
                  2 : bitplane := bitplane + (powers[x + (MatrixMain.MatrixWidth - 1)]);
                  3 : begin
                        bitplane := bitplane + (powers[x]);
                        bitplane := bitplane + (powers[x + (MatrixMain.MatrixWidth - 1)]);
                      end;
                end;
              end
              else begin
                case TMatrix(MatrixMain.Matrix[tbFrames.Position]).Grid[x, y] of
                  0 : {};
                  1 : bitplane := bitplane + (powers[MatrixMain.MatrixWidth - x - 1]);
                  2 : bitplane := bitplane + (powers[MatrixMain.MatrixWidth - x - 1 + (MatrixMain.MatrixWidth - 1)]);
                  3 : begin
                        bitplane := bitplane + (powers[MatrixMain.MatrixWidth - x - 1]);
                        bitplane := bitplane + (powers[MatrixMain.MatrixWidth - x - 1 + (MatrixMain.MatrixWidth - 1)]);
                      end;
                end;
              end;
            end;

            if miHexFormat.Checked then
              s := IntToHex(bitplane, AppSettings.PadModeHexRow)
            else
              s := IntToStr(bitplane);

            RowLabels[y].Caption := s;
          end;

          for x:=0 to MatrixMain.MatrixWidth - 1 do begin
            bitplane := 0;

            for y:=0 to MatrixMain.MatrixHeight - 1 do begin
              if cbSourceLSB.ItemIndex = 0 then begin
                case TMatrix(MatrixMain.Matrix[tbFrames.Position]).Grid[x, y] of
                  0 : {};
                  1 : bitplane := bitplane + (powers[y]);
                  2 : bitplane := bitplane + (powers[y + (MatrixMain.MatrixHeight - 1)]);
                  3 : begin
                        bitplane := bitplane + (powers[y]);
                        bitplane := bitplane + (powers[y + (MatrixMain.MatrixHeight - 1)]);
                      end;
                end;
              end
              else begin
                case TMatrix(MatrixMain.Matrix[tbFrames.Position]).Grid[x, y] of
                  0 : {};
                  1 : bitplane := bitplane + (powers[MatrixMain.MatrixHeight - y - 1]);
                  2 : bitplane := bitplane + (powers[MatrixMain.MatrixHeight - y - 1 + (MatrixMain.MatrixHeight - 1)]);
                  3 : begin
                        bitplane := bitplane + (powers[MatrixMain.MatrixHeight - y - 1]);
                        bitplane := bitplane + (powers[MatrixMain.MatrixHeight - y - 1 + (MatrixMain.MatrixHeight - 1)]);
                      end;
                end;
              end;
            end;

            if miHexFormat.Checked then
              s := IntToHex(bitplane, AppSettings.PadModeHexCol)
            else
              s := IntToStr(bitplane);

            ColLabels[x].Caption:=s;
          end;

          // ===========================================================================
          // Need to display anything?
          // ===========================================================================

          if pSourceDisplay.Visible = False then exit;

          s := '';

          if cbSource.ItemIndex = 0 then begin

            // ===========================================================================
            // Row data
            // ===========================================================================

            if cbSourceDirection.ItemIndex=0 then begin
              s := AppSettings.OpenBracket;

              for y:=0 to MatrixMain.MatrixHeight - 2 do begin
                s := s + AppSettings.HexPrefix + RowLabels[y].Caption + ', ';
              end;

              s := s + AppSettings.HexPrefix + RowLabels[MatrixMain.MatrixHeight - 1].Caption + AppSettings.CloseBracket;
            end
            else begin
              s := AppSettings.OpenBracket;

              for y := MatrixMain.MatrixHeight - 1 downto 1 do begin
                s := s + AppSettings.HexPrefix + RowLabels[y].Caption + ', ';
              end;

              s := s + AppSettings.HexPrefix + RowLabels[0].Caption + AppSettings.CloseBracket;
            end;

            eSourceData.Text := s;
          end
          else begin

            // ===========================================================================
            // Column data
            // ===========================================================================

            case cbSourceDirection.ItemIndex of
              0 : begin
                    s := AppSettings.OpenBracket;

                    for x:=0 to MatrixMain.MatrixWidth - 2 do begin
                      s := s + AppSettings.HexPrefix + ColLabels[x].Caption + ', ';
                    end;

                    s := s + AppSettings.HexPrefix + ColLabels[MatrixMain.MatrixWidth - 1].Caption + AppSettings.CloseBracket;
                  end;
              1 : begin
                    s := AppSettings.OpenBracket;

                    for x := MatrixMain.MatrixWidth - 1 downto 1 do begin
                      s := s + AppSettings.HexPrefix + ColLabels[x].Caption + ', ';
                    end;

                    s := s + AppSettings.HexPrefix + ColLabels[0].Caption + AppSettings.CloseBracket;
                  end;
              2 : begin
                    s := AppSettings.OpenBracket;

                    for x := 7 downto 0 do begin
                      s := s + AppSettings.HexPrefix + ColLabels[x].Caption + ', ';
                    end;

                    for x := 15 downto 8 do begin
                      s := s + AppSettings.HexPrefix + ColLabels[x].Caption + ', ';
                    end;

                    for x := 23 downto 17 do begin
                      s := s + AppSettings.HexPrefix + ColLabels[x].Caption + ', ';
                    end;

                    s := s + AppSettings.HexPrefix + ColLabels[16].Caption + AppSettings.CloseBracket;
                  end;
            end;

            eSourceData.Text := s;
          end;
        end;
  end;
end;

procedure TForm1.About2Click(Sender: TObject);
 begin
  frmAbout.ShowModal;
end;

procedure TForm1.Checkforupdates1Click(Sender: TObject);
 begin
  CheckForNewVersion(LEDStudioVersion, LEDStudioDate, 'led.dat', false);
end;

procedure TForm1.miColumnRowDataToolbarClick(Sender: TObject);
 begin
  pSourceDisplay.Visible := miColumnRowDataToolbar.Checked;
end;

procedure TForm1.miClearAllFramesGradientClick(Sender: TObject);
 begin
  MatrixMain.ClearAllFramesGradient(sbGradient.Tag);
end;

procedure TForm1.miCodeTemplatesClick(Sender: TObject);
 begin
  DoExportCode(MatrixMain.MatrixType);
end;

procedure TForm1.Colour01Click(Sender: TObject);
 var
  x : integer;

 begin
  for x:=0 to MatrixMain.MatrixWidth - 1 do begin
    if TMatrix(MatrixMain.Matrix[tbFrames.Position]).Grid[x, puGradient.Tag] <> 0 then begin
      TMatrix(MatrixMain.Matrix[tbFrames.Position]).Grid[x, puGradient.Tag] := (Sender As TMenuItem).Tag;
    end;
  end;

  MatrixGradient[puGradient.Tag].Brush.Color  := MatrixMain.LEDColours[(Sender As TMenuItem).Tag];
  MatrixMain.MatrixGradientIY[puGradient.Tag] := (Sender As TMenuItem).Tag;
end;

procedure TForm1.miCombineClick(Sender: TObject);
 var
  ted : TImportData;

 begin
  if timerAnimate.Enabled then
    bStopAnimationClick(Nil);

  // =======================================================================

  odMain.InitialDir := AppSettings.LastLoadLocation;

  if odMain.Execute then begin

    // =======================================================================

    ted := MatrixMain.MergeLEDMatrixData(odMain.FileName, 1);

    // =======================================================================

    if tbFrames.Max<ted.MaxFrames then begin
      tbFrames.Max := ted.MaxFrames;
    end;

    UpdateDisplay;

    AppSettings.LastLoadLocation     := ExtractFilePath(odMain.Filename);
  end;
end;

procedure TForm1.cbSourceChange(Sender: TObject);
 begin
  cbSourceLSB.Clear;
  cbSourceDirection.Clear;

  if cbSource.ItemIndex=0 then begin
    cbSourceLSB.Items.Add('LSB at Left');
    cbSourceLSB.Items.Add('MSB at Left');

    cbSourceDirection.Items.Add('Top to Bottom');
    cbSourceDirection.Items.Add('Bottom to Top');
  end
  else begin
    cbSourceLSB.Items.Add('LSB at Top');
    cbSourceLSB.Items.Add('MSB at Top');

    cbSourceDirection.Items.Add('Left to Right');
    cbSourceDirection.Items.Add('Right to Left');
    cbSourceDirection.Items.Add('Sure 24x16');
  end;

  cbSourceLSB.ItemIndex       := 0;
  cbSourceDirection.ItemIndex := 0;

  if sbClear.Enabled then
    UpdateData;
end;

procedure TForm1.Examples1Click(Sender: TObject);
 begin
  ExecuteFile(0, '"' + ExtractFilePath(Application.ExeName) + 'example code\' + '"', '', '')
end;

procedure TForm1.Exit1Click(Sender: TObject);
 begin
  Close;
end;

procedure TForm1.miExportToBitmapClick(Sender: TObject);
 begin
  if spdMain.Execute then  
    MatrixMain.ExportToBitmap(spdMain.FileName);
end;

procedure TForm1.miSaveSingleFrameClick(Sender: TObject);
 var
  ted : TImportData;

  function GetFilenameNoExt(s : string): string;
   var
    temp : string;
    i : integer;

   begin
    i    := Length(s);
    temp := '';

    if pos('.', s) <> 0 then begin

      while s[i ]<> '.' do begin
        dec(i);
      end;

      temp := Copy(s, 1, i - 1);
    end;

    Result := temp;
  end;

 begin
  sdMain.InitialDir := AppSettings.LastSaveLocation;
  sdMain.Filter     := 'LED Matrix Studio files (*.leds)|*.leds';
  sdMain.DefaultExt := '.leds';

  if AppSettings.DataFilename = '' then begin
    sdMain.FileName   := 'frame_' + IntToStr(tbFrames.Position);
  end
  else begin
    sdMain.FileName   := GetFilenameNoExt(ExtractFilename(AppSettings.DataFilename)) + '_frame_' + IntToStr(tbFrames.Position);    
    sdMain.InitialDir := ExtractFilePath(AppSettings.DataFilename);
  end;

  if sdMain.Execute then begin
    ted.MatrixType := ProjectSettings.mtype;

    MatrixMain.SaveSingleFrame(sdMain.FileName, ted, tbFrames.Position);
  end;
end;

procedure TForm1.miSaveClick(Sender: TObject);
 var
  ted : TImportData;

 begin
  if AppSettings.DataFilename = '' then
    miSaveAsClick(Nil)
  else begin
    ted.Source          := cbSource.ItemIndex;
    ted.SourceLSB       := cbSourceLSB.ItemIndex;
    ted.SourceDirection := cbSourceDirection.ItemIndex;
    ted.PadMode         := AppSettings.PadMode;
    ted.HexFormat       := GetHexFormat;
    ted.HexOutput       := GetHexOutput;
    ted.Brackets        := GetBrackets;
    ted.MatrixType      := MatrixMain.MatrixType;
    ted.ASCIIIndex      := AppSettings.ASCIIIndex;
    ted.MaxFrames       := tbFrames.Max;

    if MatrixMain.SoftwareMode = 1 then
      MatrixMain.SaveFont(AppSettings.DataFilename, ted, AppSettings.LastExport)
    else
      MatrixMain.SaveAnimation(AppSettings.DataFilename, ted, AppSettings.LastExport);
  end;
end;

procedure TForm1.miSaveGradientClick(Sender: TObject);
 var
  s,g : string;
  t : integer;
  tf : TextFile;

 begin
  s := InputBox('Gradient Filename', 'Name', 'My gradient');

  if s <> '' then begin
    AssignFile(tf, ExtractFilePath(Application.ExeName) + 'gradients\' + s + '.ledsgradient');
    Rewrite(tf);

    Writeln(tf, '{gradient');

    g := '';
    for t:=0 to MatrixMain.MatrixHeight - 1 do
      g := g + IntToStr(MatrixMain.MatrixGradientIY[t]) + ' ';

    Writeln(tf, 'g:' + g);
    Writeln(tf, '}');

    CloseFile(tf);
  end;
end;

procedure TForm1.miSaveAsClick(Sender: TObject);
 var
  ted : TImportData;

 begin
  sdMain.InitialDir := AppSettings.LastSaveLocation;
  sdMain.Filter     := 'LED Matrix Studio files (*.leds)|*.leds';
  sdMain.DefaultExt := '.leds';

  if sdMain.Execute then begin
    ted.Source          := cbSource.ItemIndex;
    ted.SourceLSB       := cbSourceLSB.ItemIndex;
    ted.SourceDirection := cbSourceDirection.ItemIndex;
    ted.PadMode         := AppSettings.PadMode;
    ted.HexFormat       := GetHexFormat;
    ted.HexOutput       := GetHexOutput;
    ted.Brackets        := GetBrackets;
    ted.MatrixType      := MatrixMain.MatrixType;
    ted.ASCIIIndex      := AppSettings.ASCIIIndex;
    ted.MaxFrames       := tbFrames.Max;       

    if MatrixMain.SoftwareMode = 1 then
      MatrixMain.SaveFont(sdMain.Filename, ted, AppSettings.LastExport)
    else
      MatrixMain.SaveAnimation(sdMain.Filename, ted, AppSettings.LastExport);

    AppSettings.DataFilename := sdMain.Filename;

    Caption := BackupCaption + '  [ ' + ExtractFilename(AppSettings.DataFilename) + ' ]';

    AppSettings.LastSaveLocation := ExtractFilePath(sdMain.Filename);
  end;
end;

procedure TForm1.miSaveAsFontClick(Sender: TObject);
 begin
  sdMain.DefaultExt := '.ledsfont';
  sdMain.Filename   := IntToStr(MatrixMain.MatrixWidth) + 'x' + IntToStr(MatrixMain.MatrixHeight);
  sdMain.Filter     := 'LED Matrix Studio font (*.ledsfont)|*.ledsfont';
  sdMain.InitialDir := ExtractFilepath(Application.Exename) + 'fonts\';

  // ===========================================================================

  if sdMain.Execute then begin
    if MatrixMain.MatrixType = psTypeRGB then
      MatrixMain.SaveAsRGBFont(sdMain.Filename)
    else
      MatrixMain.SaveAsFont(sdMain.Filename);
  end;
end;

procedure TForm1.Savebufferstoclipboard1Click(Sender: TObject);
 begin
  ExportData(AppSettings.LastExport, 1, MatrixMain.MatrixType);
end;

procedure TForm1.miGradientAllFramesClick(Sender: TObject);
 begin
  MatrixMain.PerformEffectOnAllFrames(modeGradientAll);
end;

procedure TForm1.miGridToggleClick(Sender: TObject);
 begin
  miGridToggle.Checked := not(miGridToggle.Checked);

  MatrixMain.ChangeGrid(miGridToggle.Checked);
end;

procedure TForm1.Help1Click(Sender: TObject);
 begin
  if FileExists(ExtractFilePath(Application.ExeName) + 'help\en\help.txt') then
    ExecuteFile(0, ExtractFilePath(Application.ExeName) + 'help\en\help.txt', '', '')
  else
    MessageDlg('Help file not found :(', mtWarning, [mbOK], 0);
end;

procedure TForm1.miExportClick(Sender: TObject);
 var
  teo : TExportOptions;

 begin
  teo := ExportData(AppSettings.LastExport, 0, MatrixMain.MatrixType);

  if teo.ExportMode <> -1 then begin
    AppSettings.LastExport.ExportMode      := teo.ExportMode;

    AppSettings.LastExport.StartFrame      := teo.StartFrame;
    AppSettings.LastExport.EndFrame        := teo.EndFrame;
    AppSettings.LastExport.Source          := teo.Source;
    AppSettings.LastExport.Orientation     := teo.Orientation;
    AppSettings.LastExport.ScanDirection   := teo.ScanDirection;
    AppSettings.LastExport.LSB             := teo.LSB;
    AppSettings.LastExport.Language        := teo.Language;
    AppSettings.LastExport.NumberFormat    := teo.NumberFormat;
    AppSettings.LastExport.NumberSize      := teo.NumberSize;
    AppSettings.LastExport.LineContent     := teo.LineContent;
    AppSettings.LastExport.LineCount       := teo.LineCount;
    AppSettings.LastExport.RGBEnabled      := teo.RGBEnabled;
    AppSettings.LastExport.RGBMode         := teo.RGBMode;
    AppSettings.LastExport.RGBChangePixels := teo.RGBChangePixels;
    AppSettings.LastExport.RGBChangeColour := teo.RGBChangeColour;
  end;
end;

procedure TForm1.SetFrameCaption(i : integer);
 begin
  if MatrixMain.SoftwareMode = 1 then begin
    lFrame.Caption     := Char(i + AppSettings.ASCIIIndex - 1);
    lFont.Caption      := Char(i + AppSettings.ASCIIIndex - 1);
    pASCIICode.Caption := 'ASCII: ' + IntToStr(i + AppSettings.ASCIIIndex - 1);
  end
  else begin
    lFrame.Caption     := IntToStr(i) + ' of ' + IntToStr(tbFrames.Max);
  end;

  if tbFrames.Position <> i then
    tbFrames.Position := i;
end;

procedure TForm1.UpdateMemoryUsage;
 begin
  lMemoryUsage.Caption := 'Using ' + IntToStr(MatrixMain.CalculateMemoryUsage) + ' bytes.';
end;

procedure TForm1.Website1Click(Sender: TObject);
 begin
  ExecuteFile(0, 'http://www.maximumoctopus.com/electronics/builder.htm', '', '');
end;

procedure TForm1.miPreviewx1Click(Sender: TObject);
 begin
  (Sender as TMenuitem).Checked := True;
  
  MatrixMain.PreviewBoxSize := (Sender As TMenuItem).Tag;

  FormResize(Nil);  
end;

procedure TForm1.RecalculatePadding;
 begin
  case AppSettings.PadMode of
    0 : begin
          case MatrixMain.MatrixWidth of
            1..8   : AppSettings.PadModeHexRow := 2;
            9..16  : AppSettings.PadModeHexRow := 4;
            17..24 : AppSettings.PadModeHexRow := 6;
            25..32 : AppSettings.PadModeHexRow := 8;
            33..40 : AppSettings.PadModeHexRow := 10;
            41..48 : AppSettings.PadModeHexRow := 12;
            49..56 : AppSettings.PadModeHexRow := 14;
            57..64 : AppSettings.PadModeHexRow := 16;
          end;

          case MatrixMain.MatrixHeight of
            1..8   : AppSettings.PadModeHexCol := 2;
            9..16  : AppSettings.PadModeHexCol := 4;
            17..24 : AppSettings.PadModeHexCol := 6;
            25..32 : AppSettings.PadModeHexCol := 8;
            33..40 : AppSettings.PadModeHexCol := 10;
            41..48 : AppSettings.PadModeHexCol := 12;
            49..56 : AppSettings.PadModeHexCol := 14;
            57..64 : AppSettings.PadModeHexCol := 16;
          end;

          if MatrixMain.MatrixType > 0 then begin
            AppSettings.PadModeHexRow := AppSettings.PadModeHexRow * 2;
            AppSettings.PadModeHexCol := AppSettings.PadModeHexCol * 2;
          end;
        end;
    1 : begin
          AppSettings.PadModeHexRow := 2;
          AppSettings.PadModeHexCol := 2;
        end;
    2 : begin
          AppSettings.PadModeHexRow := 4;
          AppSettings.PadModeHexCol := 4;
        end;
    3 : begin
          AppSettings.PadModeHexRow := 6;
          AppSettings.PadModeHexCol := 6;
        end;
    4 : begin
          AppSettings.PadModeHexRow := 8;
          AppSettings.PadModeHexCol := 8;
        end;
    5 : begin
          AppSettings.PadModeHexRow := 10;
          AppSettings.PadModeHexCol := 10;
        end;
    6 : begin
          AppSettings.PadModeHexRow := 12;
          AppSettings.PadModeHexCol := 12;
        end;
    7 : begin
          AppSettings.PadModeHexRow := 14;
          AppSettings.PadModeHexCol := 14;
        end;
    8 : begin
          AppSettings.PadModeHexRow := 16;
          AppSettings.PadModeHexCol := 16;
        end;
    9 : begin
          AppSettings.PadModeHexRow := 1;
          AppSettings.PadModeHexCol := 1;
        end;
  end;
end;

procedure TForm1.SetupMatrixColours;
 var
  x : integer;

 begin
  for x:=0 to 5 do begin
    if ProjectSettings.mtype = 0 then
      MatrixMain.LEDColours[x] := MatrixMain.LEDColoursSingle[x]
    else
      MatrixMain.LEDColours[x] := MatrixMain.LEDColoursBi[x];
  end;

  if ProjectSettings.mtype = psTypeRGB then begin
    sColour0.Brush.Color      := MatrixMain.RGBBackground;

    sSelectionLMB.Brush.Color := MatrixMain.LEDRGBColours[1];
    sSelectionMMB.Brush.Color := MatrixMain.LEDRGBColours[2];
    sSelectionRMB.Brush.Color := MatrixMain.LEDRGBColours[3];

    MatrixMain.SetMouseButtonColours(MatrixMain.LEDRGBColours[1],
                                     MatrixMain.LEDRGBColours[2],
                                     MatrixMain.LEDRGBColours[3]);                                   
  end
  else begin
    sColour0.Brush.Color      := MatrixMain.LEDColours[0];

    sSelectionLMB.Brush.Color := MatrixMain.LEDRGBColours[sSelectionLMB.Tag];
    sSelectionMMB.Brush.Color := MatrixMain.LEDColours[sSelectionMMB.Tag];
    sSelectionRMB.Brush.Color := MatrixMain.LEDColours[sSelectionRMB.Tag];

    MatrixMain.SetMouseButtonColours(sSelectionLMB.Tag,
                                     sSelectionMMB.Tag,
                                     sSelectionRMB.Tag);
  end;

  sColour1.Brush.Color       := MatrixMain.LEDColours[1];
  sColour2.Brush.Color       := MatrixMain.LEDColours[2];
  sColour3.Brush.Color       := MatrixMain.LEDColours[3];

//  ShapeOff.Brush.Color       := MatrixMain.LEDColours[0];
//  ShapeOn1.Brush.Color       := MatrixMain.LEDColours[1];
//  ShapeOn2.Brush.Color       := MatrixMain.LEDColours[2];
//  ShapeOn3.Brush.Color       := MatrixMain.LEDColours[3];

//  ShapeSelection.Brush.Color := MatrixMain.LEDColours[4];
//  ShapeLightBox.Brush.Color  := MatrixMain.LEDColours[5];
end;

procedure TForm1.OnGradientClick(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
 begin
  if MatrixMain.MatrixType = psTypeRGB then begin
    puGradientRGB.Tag := (Sender As TShape).Tag;

    puGradientRGB.Popup(Left + (Sender As TShape).Left + 5, Top + (Sender As TShape).Top + 20);
  end
  else begin
    puGradient.Tag := (Sender As TShape).Tag;

    puGradient.Popup(Left + (Sender As TShape).Left + 5, Top + (Sender As TShape).Top + 20);
  end;
end;

procedure TForm1.Openautosavefolder1Click(Sender: TObject);
 begin
  ExecuteFile(0, ExtractFilePath(Application.ExeName) + 'saves\autosave\', '', '')
end;

procedure TForm1.ToggleGradient(gmode : integer; cleargradient : boolean);
 var
  t : integer;

 begin
  if MatrixMain.MatrixType = psTypeMono then begin
    iMMBGradient.Visible  := False;
    sSelectionMMB.Visible := False;
  end
  else begin
    case gmode of
      0 : for t:=0 to _MaxHeight do begin
            if MatrixGradient[t] <> Nil then
              MatrixGradient[t].Visible := False;

            iMMBGradient.Visible  := False;
            sSelectionMMB.Visible := True;
          end;
      1 : for t:=0 to MatrixMain.MatrixHeight - 1 do begin
            if MatrixGradient[t] = Nil then begin
              MatrixGradient[t] := TShape.Create(Self);
            end;

            with MatrixGradient[t] do begin
              Parent      := Self;
              Visible     := True;
              Tag         := t;
              OnMouseDown := OnGradientClick;

              Left := LeftOffset + ((MatrixMain.MatrixWidth + 1) * PixelSize);
              Top  := AppSettings.TopOffset + (t * PixelSize);

              if Width <> PixelSize + 1 then
                Width := PixelSize + 1;

              if Height <> PixelSize + 1 then
                Height := PixelSize + 1;

              Brush.Color := MatrixMain.MatrixGradientIY[t];

              if (cleargradient) then begin
                if MatrixMain.MatrixType = psTypeRGB then
                  MatrixMain.MatrixGradientIY[t] := MatrixMain.RGBBackground
                else
                  MatrixMain.MatrixGradientIY[t] := 0;
              end;
            end;

            iMMBGradient.Visible  := True;
            sSelectionMMB.Visible := False
          end;
      2 : for t:=0 to MatrixMain.MatrixWidth - 1 do begin
            if MatrixGradient[t] = Nil then begin
              MatrixGradient[t] := TShape.Create(Self);
            end;

            with MatrixGradient[t] do begin
              Parent      := Self;
              Visible     := True;
              Tag         := t;
              OnMouseDown := OnGradientClick;

              Left := LeftOffset + (t * PixelSize);
              Top  := AppSettings.TopOffset + ((MatrixMain.MatrixHeight + 1) * PixelSize);

              if Width <> PixelSize + 1 then
                Width := PixelSize + 1;

              if Height <> PixelSize + 1 then
                Height := PixelSize + 1;

              Brush.Color := MatrixMain.MatrixGradientIX[t];

              if (cleargradient) then begin
                if MatrixMain.MatrixType = psTypeRGB then
                  MatrixMain.MatrixGradientIX[t] := MatrixMain.RGBBackground
                else
                  MatrixMain.MatrixGradientIX[t] := 0;
              end;
            end;

            iMMBGradient.Visible  := True;
            sSelectionMMB.Visible := False
          end;
    end;
  end;

  sbGradient.Tag := gmode;

  MatrixMain.MatrixGradient := gmode;
end;

procedure TForm1.SelectGradient(Sender : TObject);
 var
  s,temp : string;
  t : integer;

 begin
  if MessageDlg('Really load this gradient?', mtWarning, [mbYes, mbNo], 0) = mrYes then begin

    temp := ExtractFilePath(Application.ExeName) + 'gradients\' + TMenuItem(Sender).Caption + '.ledsgradient';
    s    := '';

    for t:=1 to length(temp) do
      if temp[t] <> '&' then
        s := s + temp[t];

    if FileExists(s) then begin
      MatrixMain.LoadGradient(s);
    end
    else
      MessageDlg('Cannot find gradient file!!', mtError, [mbOK], 0);
  end;
end;


function TForm1.GetHexFormat: integer;
 begin
  if miHexFormat.Checked then
    Result := 1
  else
    Result := 0;
end;

function TForm1.GetHexOutput:integer;
 begin
  if miHexOutputNone.Checked then
    Result := 0
  else if miHexOutputDollar.Checked then
    Result := 1
  else
    Result := 2;
end;

procedure TForm1.miGradientSelectRGBClick(Sender: TObject);
 begin
  if colorDialog.Execute then begin
    MatrixGradient[puGradientRGB.Tag].Brush.Color  := colorDialog.Color;

    if sbGradient.Tag = 1 then    
      MatrixMain.MatrixGradientIY[puGradientRGB.Tag] := colorDialog.Color
    else
      MatrixMain.MatrixGradientIX[puGradientRGB.Tag] := colorDialog.Color;    
  end;
end;

procedure TForm1.miGradFromClick(Sender: TObject);
 var
  rdy, gdy, bdy : integer;
  rdx, gdx, bdx : double;
  newr, newg, newb : double;
  y : integer;
  colstart, colend : integer;
  lEnd : integer;
  newri, newgi, newbi : integer;

 begin
  if sbGradient.Tag = 1 then begin
    colstart   := MatrixMain.MatrixGradientIY[0];
    colend     := MatrixMain.MatrixGradientIY[MatrixMain.MatrixHeight - 1];

    lEnd       := MatrixMain.MatrixHeight - 1;
  end
  else begin
    colstart   := MatrixMain.MatrixGradientIX[0];
    colend     := MatrixMain.MatrixGradientIX[MatrixMain.MatrixWidth - 1];

    lEnd       := MatrixMain.MatrixWidth - 1;
  end;

  rdy  := (colend and $0000FF) - (colstart and $0000FF);
  gdy  := ((colend and $00FF00) shr 8) - ((colstart and $00FF00) shr 8);
  bdy  := ((colend and $FF0000) shr 16) - ((colstart and $FF0000) shr 16);

  newr := (colstart and $0000FF);
  newg := (colstart and $00FF00) shr 8;
  newb := (colstart and $FF0000) shr 16;

  rdx  := rdy / lEnd;
  gdx  := gdy / lEnd;
  bdx  := bdy / lEnd;

  for y:=1 to lEnd - 1 do begin
    newr  := newr + rdx;
    newg  := newg + gdx;
    newb  := newb + bdx;

    newri := Floor(newr);
    newgi := Floor(newg);
    newbi := Floor(newb);

    MatrixGradient[y].Brush.Color  := (newbi shl 16) + (newgi shl 8) + newri;

    if sbGradient.Tag = 1 then
      MatrixMain.MatrixGradientIY[y] := (newbi shl 16) + (newgi shl 8) + newri
    else
      MatrixMain.MatrixGradientIX[y] := (newbi shl 16) + (newgi shl 8) + newri;
  end;
end;

function TForm1.GetBrackets: integer;
 begin
  if miBracketsNone.Checked then
    Result := 0
  else if miBracketsNormal.Checked then
    Result := 1
  else if miBracketsCurly.Checked then
    Result := 2
  else
    Result := 3;
end;

procedure TForm1.SetHexOptions(ohexformat, ohexprefix : integer);
 begin
  case ohexformat of
    0 : miHexFormat.Checked := False;
    1 : miHexFormat.Checked := True;
  end;

  // ===========================================================================

  case ohexprefix of
    0 : miHexOutputNone.Checked   := True;
    1 : miHexOutputDollar.Checked := True;
    2 : miHexOutputZeroX.Checked  := True;
    3 : miHexOutputAmp.Checked    := True;
  end;

  miHexOutputNoneClick(Nil);
end;

procedure TForm1.SetPadFormat(opadmode : integer);
 begin
  case opadmode of
    0 : miPadAuto.Checked   := True;
    1 : miPad8Bits.Checked  := True;
    2 : miPad16Bits.Checked := True;
    3 : miPad24Bits.Checked := True;
    4 : miPad32Bits.Checked := True;
    5 : miPad40Bits.Checked := True;
    6 : miPad48Bits.Checked := True;
    7 : miPad56Bits.Checked := True;
    8 : miPad64Bits.Checked := True;
  end;

  miPadAutoClick(Nil);
end;

procedure TForm1.miGradSetRowClick(Sender: TObject);
 var
  x : integer;

 begin
  if sbGradient.Tag = 1 then begin
    for x:=0 to MatrixMain.MatrixWidth do begin
      TMatrix(MatrixMain.Matrix[tbFrames.Position]).Grid[x, TMenuItem(Sender).Tag] := MatrixMain.MatrixGradientIY[TMenuItem(Sender).Tag];
    end;
  end
  else begin
    for x:=0 to MatrixMain.MatrixHeight do begin
      TMatrix(MatrixMain.Matrix[tbFrames.Position]).Grid[TMenuItem(Sender).Tag, x] := MatrixMain.MatrixGradientIX[TMenuItem(Sender).Tag];
    end;
  end;

  MatrixMain.Refresh;
end;

procedure TForm1.SetBrackets(obrackets : integer);
 begin
  case obrackets of
    0 : miBracketsNone.Checked   := True;
    1 : miBracketsNormal.Checked := True;
    2 : miBracketsCurly.Checked  := True;
    3 : miBracketsSquare.Checked := True;
  end;

  miBracketsNoneClick(Nil);
end;

procedure TForm1.Preferences1Click(Sender: TObject);
 begin
  if DoPrefs = mrOK then begin
     MatrixMain.CurrentFrame := MatrixMain.CurrentFrame;
  end;
end;

procedure TForm1.puGradientShapePopup(Sender: TObject);
 begin
  miGradSetRow.Tag := TShape(Sender).Tag;

  if sbGradient.Tag = 1 then begin
    miGradSetRow.Caption := 'Set row to selected colour';
    miGradFrom.Caption   := 'Gradient from top->bottom';
  end
  else begin
    miGradSetRow.Caption := 'Set column to selected colour';
    miGradFrom.Caption   := 'Gradient from leff->right';
  end;
end;

procedure TForm1.MatrixOnChange(Sender : TObject);
 begin
  UpdateData;

  miUndo.Enabled := MatrixMain.CanUndo;
  miRedo.Enabled := MatrixMain.CanRedo;  

  tbFrames.Max := MatrixMain.FrameCount; // last frame available
end;

procedure TForm1.MatrixOnColourChange(Sender : TObject);
 begin
  sSelectionLMB.Brush.Color := MatrixMain.LEDRGBColours[1];
  sSelectionMMB.Brush.Color := MatrixMain.LEDRGBColours[2];
  sSelectionRMB.Brush.Color := MatrixMain.LEDRGBColours[3];
end;

procedure TForm1.MatrixOnMouseOver(const x, y : integer);
 begin
  statusMain.SimpleText := 'X: ' + IntToStr(x + 1) +
                           '  Y: '+IntToStr(y + 1) +
                           '  Col: ' + ColLabels[x].Caption +
                           '  Row: ' + RowLabels[y].Caption;

  if (lPixelColour.Visible) and (x < 128) and (y < 128) then
    lPixelColour.Caption := '$' + IntToHex(RGBConvertTo(TMatrix(MatrixMain.Matrix[tbFrames.Position]).Grid[x, y], rgbConvertToRGB, 1), 6);
end;

function TForm1.LoadFromFileName(aFilename : string): boolean;
 var
  ted : TImportData;

begin
  Result := True;

  // flushes the message queue, stops the mouse double click from the open dialog
  // causing a pixel to be drawm on the first frame
  Application.ProcessMessages;

  // =======================================================================

  ClearTExportOptions(False, AppSettings.LastExport);

  ted := MatrixMain.LoadLEDMatrixData(aFileName, AppSettings.LastExport);

  // =======================================================================

  ProjectSettings.mtype    := ted.MatrixType;
  cbMatrixTypeChange(Nil);

  ProjectSettings.width    := ted.NewWidth;
  ProjectSettings.height   := ted.NewHeight;

  tbFrames.Max             := ted.MaxFrames;

  NewGrid := True;
  sbBuildClick(Load1);

  bDeleteFrame.Enabled     := (tbFrames.Max > 1);

  SetFrameCaption(1);

  AppSettings.DataFilename := aFileName;
  Caption                  := BackupCaption + '  [ ' + ExtractFilename(AppSettings.DataFilename) + ' ]';

  // =======================================================================

  if miUseFormatDataFromFiles.Checked then begin
    SetHexOptions(ted.HexFormat, ted.HexOutput);
    SetPadFormat(ted.PadMode);
    SetBrackets(ted.Brackets);
  end;

  // =======================================================================

  if ted.FontMode then begin
    if miFontMode.Checked = False then begin
      miFontMode.Checked := True;
      miFontModeClick(Nil);
    end;

    bStartFrameClick(Nil);
  end
  else begin
    if miFontMode.Checked = True then begin
      miFontMode.Checked := False;
      miFontModeClick(Nil);
    end;
  end;

  // =======================================================================

  AppSettings.LastLoadLocation := ExtractFilePath(odMain.Filename);

  UpdateMemoryUsage;
  UpdateData;
end;

procedure TForm1.LoadRegistrySettings;
 var
  x, y : integer;
  Reg : TRegistry;

  function ReadRegistryInteger(keyname : string; defaultval : Integer): Integer;
   begin
    if Reg.ValueExists(keyname) then
      Result := Reg.ReadInteger(keyname)
    else
      Result := defaultval;
  end;

  function ReadRegistryBool(keyname : string; defaultval : boolean): boolean;
   begin
    if Reg.ValueExists(keyname) then
      Result := Reg.ReadBool(keyname)
    else
      Result := defaultval;
  end;

  function ReadRegistryString(keyname : string; defaultval : string): string;
   begin
    if Reg.ValueExists(keyname) then begin
      if Reg.ReadString(keyname) = '' then
        Result := defaultval
      else
        Result := Reg.ReadString(keyname);
    end
    else
      Result := defaultval;
  end;

 begin
  Reg := TRegistry.Create(KEY_READ);

  Reg.RootKey := HKEY_CURRENT_USER;
  Reg.OpenKey('\software\freshney.org\MatrixBuilder', True);

  // ===========================================================================

  ProjectSettings.mtype           := ReadRegistryInteger('matrixtype', 0);
  ProjectSettings.width           := ReadRegistryInteger('gridwidth', 7);
  ProjectSettings.height          := ReadRegistryInteger('gridheight', 7);

  // ===========================================================================

  MatrixMain.LEDColoursSingle[0]  := ReadRegistryInteger('offcolour', clWhite);
  MatrixMain.LEDColoursSingle[1]  := ReadRegistryInteger('oncolour', clBlack);
  MatrixMain.LEDColoursSingle[2]  := ReadRegistryInteger('oncolour2', clBlack);
  MatrixMain.LEDColoursSingle[3]  := ReadRegistryInteger('oncolour3', clBlack);
  MatrixMain.LEDColoursSingle[4]  := ReadRegistryInteger('selectcolour', clBlue);
  MatrixMain.LEDColoursSingle[5]  := ReadRegistryInteger('lightboxcolour', $00DDDDDD);

  MatrixMain.LEDColoursBi[0]      := ReadRegistryInteger('offcolourbi', clWhite);
  MatrixMain.LEDColoursBi[1]      := ReadRegistryInteger('oncolourbi', clRed);
  MatrixMain.LEDColoursBi[2]      := ReadRegistryInteger('oncolour2bi', clGreen);
  MatrixMain.LEDColoursBi[3]      := ReadRegistryInteger('oncolour3bi', clYellow);
  MatrixMain.LEDColoursBi[4]      := ReadRegistryInteger('selectcolourbi', clBlue);
  MatrixMain.LEDColoursBi[5]      := ReadRegistryInteger('lightboxcolourbi', $00DDDDDD);

  MatrixMain.RGBBackground        := ReadRegistryInteger('rgbbackground', clBlack);
  MatrixMain.LEDRGBColours[3]     := ReadRegistryInteger('LEDRGBColoursLMB', clRed);
  MatrixMain.LEDRGBColours[2]     := ReadRegistryInteger('LEDRGBColoursMMB', clBlue);
  MatrixMain.LEDRGBColours[1]     := ReadRegistryInteger('LEDRGBColoursRMB', clYellow);

  // ===========================================================================

  sSelectionLMB.Tag := ReadRegistryInteger('sSelectionLMB', 3);
  sSelectionMMB.Tag := ReadRegistryInteger('sSelectionMMB', 2);
  sSelectionRMB.Tag := ReadRegistryInteger('sSelectionRMB', 0);

  MatrixMain.SetMouseButtonColours(sSelectionLMB.Tag,
                                   sSelectionMMB.Tag,
                                   sSelectionRMB.Tag);

  sSelectionLMB.Brush.Color := MatrixMain.LEDColours[sSelectionLMB.Tag];
  sSelectionMMB.Brush.Color := MatrixMain.LEDColours[sSelectionMMB.Tag];
  sSelectionRMB.Brush.Color := MatrixMain.LEDColours[sSelectionRMB.Tag];

  // ===========================================================================

  SetupMatrixColours;

  // ===========================================================================

  AppSettings.LastSaveLocation     := ReadRegistryString('savelocation', '');
  AppSettings.LastLoadLocation     := ReadRegistryString('loadlocation', '');

  if AppSettings.LastSaveLocation = '' then
    AppSettings.LastSaveLocation := ExtractFilePath(Application.ExeName) + 'saves\';

  if AppSettings.LastLoadLocation = '' then
    AppSettings.LastLoadLocation := ExtractFilePath(Application.ExeName) + 'saves\';

  odMain.InitialDir := AppSettings.LastLoadLocation;
  sdMain.InitialDir := AppSettings.LastSaveLocation;

  // ===========================================================================

  PixelSize         := ReadRegistryInteger('pixelsize', 20);

  case PixelSize of
     0 : miPixelTinyClick(miPixelAuto);
    10 : miPixelTinyClick(miPixelTiny);
    15 : miPixelTinyClick(miPixelSmall);
    25 : miPixelTinyClick(miPixelMedium);
    30 : miPixelTinyClick(miPixelLarge);
    40 : miPixelTinyClick(miPixelVeryLarge);
    50 : miPixelTinyClick(miPixelUltra);
  end;

  // ===========================================================================

  PixelShape := ReadRegistryInteger('pixelshape', 0);

  case PixelShape of
    0 : miPixelShapeSquareClick(miPixelShapeSquare);
    1 : miPixelShapeSquareClick(miPixelShapeRound);
  end;

  // ===========================================================================

  x := ReadRegistryInteger('showanimtoolbar', 0);

  if x = 1 then
    miShowAnimationToolbar.Checked:=True;

  x := ReadRegistryInteger('animspeed', 1000);

  case x of
      50 : miPlaybackSpeed1Click(miPlaybackSpeed5);
     100 : miPlaybackSpeed1Click(miPlaybackSpeed4);
     250 : miPlaybackSpeed1Click(miPlaybackSpeed3);
     500 : miPlaybackSpeed1Click(miPlaybackSpeed2);
    1000 : miPlaybackSpeed1Click(miPlaybackSpeed1);
  end;

  miShowAnimationToolbarClick(Nil);

  // ===========================================================================

//  x:=ReadRegistryInteger('showcolourtoolbar', 0);

//  if x=1 then
//    miColourPalette.Checked:=True;

//  miColourPaletteClick(Nil);

  // ===========================================================================

  x := ReadRegistryInteger('columnrowtoolbar', 0);

  if x = 1 then
    miColumnRowDataToolbar.Checked := True;

  miColumnRowDataToolbarClick(Nil);

  // ===========================================================================

  x := ReadRegistryInteger('hexformat', 0);
  y := ReadRegistryInteger('hexprefix', 0); // default is none

  SetHexOptions(x, y);

  // ===========================================================================

  SetPadFormat(ReadRegistryInteger('padformat', 0)); // default is auto

  // ===========================================================================

  SetBrackets(ReadRegistryInteger('brackets', 1));  // default is ( )

  // ===========================================================================

  miUseFormatDataFromFiles.Checked := ReadRegistryBool('useformatdata', True);

  // ===========================================================================

  if ReadRegistryInteger('autosave', 0) = 1 then begin  // default is ( )
    miAutosave.Checked    := True;
    timerAutosave.Enabled := True;
  end;

  x := ReadRegistryInteger('autosaveinterval', 0);  // default is ( )

  case x of
    autoSave2Mins  : miAutosave2.Checked  := True;
    autoSave5Mins  : miAutosave5.Checked  := True;
    autoSave10Mins : miAutosave10.Checked := True;
  end;

  miAutosave2Click(Nil);

  // ===========================================================================

  miPreview.Checked         := ReadRegistryBool('previewactive', False);

  MatrixMain.PreviewActive  := miPreview.Checked;

  case ReadRegistryInteger('previewsize', 1) of
    1 : miPreviewx1Click(miPreviewx1);
    2 : miPreviewx1Click(miPreviewx2);
    3 : miPreviewx1Click(miPreviewx3);
    4 : miPreviewx1Click(miPreviewx4);
    5 : miPreviewx1Click(miPreviewx5);
    6 : miPreviewx1Click(miPreviewx6);
  end;

  // ===========================================================================

  Reg.Free;
end;

procedure TForm1.ManageUIControls;
 var
  lNormalFalse : boolean;
  lNormalTrue  : boolean;
 begin
  lNormalFalse := False;
  lNormalTrue  := True;

  if MatrixMain.AnimPlaying then begin
    lNormalTrue := False;
  end;

  if MatrixMain.MatrixWidth <> MatrixMain.MatrixHeight then begin
    sbRotateL.Enabled := lNormalFalse;
    sbRotateR.Enabled := lNormalFalse;
    miRotateL.Enabled := lNormalFalse;
    miRotateR.Enabled := lNormalFalse;
  end
  else begin
    sbRotateL.Enabled := lNormalTrue;
    sbRotateR.Enabled := lNormalTrue;
    miRotateL.Enabled := lNormalTrue;
    miRotateR.Enabled := lNormalTrue;
  end;

  sbRotateAny.Enabled         := lNormalTrue;
  cbRotateAngle.Enabled       := lNormalTrue;
  cbRotateCount.Enabled       := lNormalTrue;

  // ===========================================================================

  miUndo.Enabled              := lNormalTrue;
  miCopy.Enabled              := lNormalTrue;
  miCopyFromPrevious.Enabled  := lNormalTrue;
  miPaste.Enabled             := lNormalTrue;

  sbClear.Enabled             := lNormalTrue;
  sbFlip.Enabled              := lNormalTrue;
  sbMirror.Enabled            := lNormalTrue;
  sbInvert.Enabled            := lNormalTrue;
  miFlip.Enabled              := lNormalTrue;
  miMirror.Enabled            := lNormalTrue;
  miInvert.Enabled            := lNormalTrue;
  miFlipAllFrames.Enabled     := lNormalTrue;
  miMirrorAllFrames.Enabled   := lNormalTrue;
  miInvertAllFrames.Enabled   := lNormalTrue;
  sbScrollLeft.Enabled        := lNormalTrue;
  sbScrollRight.Enabled       := lNormalTrue;
  sbScrollUp.Enabled          := lNormalTrue;
  sbScrollDown.Enabled        := lNormalTrue;
  miShiftLeft.Enabled         := lNormalTrue;
  miShiftRight.Enabled        := lNormalTrue;
  miShiftUp.Enabled           := lNormalTrue;
  miShiftDown.Enabled         := lNormalTrue;
  miAddComment.Enabled        := lNormalTrue;

  miSetDeadPixels.Enabled     := lNormalTrue;

  if MatrixMain.AnimPlaying then begin
    bPlayAnimation.Enabled      := False;
    bStopAnimation.Enabled      := True;
  end
  else begin
    bPlayAnimation.Enabled      := True;
    bStopAnimation.Enabled      := False;
  end;

  bPreviousFrame.Enabled      := lNormalTrue;
  bStartFrame.Enabled         := lNormalTrue;
  bEndFrame.Enabled           := lNormalTrue;
  bNextFrame.Enabled          := lNormalTrue;
  bAddFrame.Enabled           := lNormalTrue;
  bAddFrameCopy.Enabled       := lNormalTrue;
  bAddFrameMultiple.Enabled   := lNormalTrue;

  if MatrixMain.AnimPlaying then
    bDeleteFrame.Enabled := False
  else
    bDeleteFrame.Enabled := (MatrixMain.FrameCount > 2);

  bLightBox.Enabled           := lNormalTrue;

  sbMouseMode.Enabled         := lNormalTrue;
  sbCopy.Enabled              := lNormalTrue;
  sbFilledRectangle.Enabled   := lNormalTrue;
  sbFrame.Enabled             := lNormalTrue;
  sbEmptyCircle.Enabled       := lNormalTrue;
  sbFilledCircle.Enabled      := lNormalTrue;
  sbLine.Enabled              := lNormalTrue;
  sbMultiDraw.Enabled         := lNormalTrue;
  sbFont.Enabled              := lNormalTrue;

  miMerge.Enabled             := lNormalTrue;
  miCombine.Enabled           := lNormalTrue;

  miSave.Enabled              := lNormalTrue;
  miSaveAs.Enabled            := lNormalTrue;
  miSaveSingleFrame.Enabled   := lNormalTrue;
  miImportInToCurrent.Enabled := lNormalTrue;
  miExport.Enabled            := lNormalTrue;
  miExportToBitmap.Enabled    := lNormalTrue;
  miCodeTemplates.Enabled     := lNormalTrue;

  sbSave.Enabled              := lNormalTrue;

  tbFrames.Enabled            := lNormalTrue;

  if MatrixMain.MatrixType = 0 then begin
    sbGradient.Enabled               := lNormalFalse;
    miClearAllFramesGradient.Enabled := lNormalFalse;
    sbRandomDraw.Enabled             := lNormalFalse;
    miGradientAllFrames.Enabled      := lNormalFalse;
    sbPicker.Enabled                 := lNormalFalse;
  end
  else begin
    sbGradient.Enabled               := lNormalTrue;
    miClearAllFramesGradient.Enabled := lNormalTrue;
    sbRandomDraw.Enabled             := lNormalTrue;
    miGradientAllFrames.Enabled      := lNormalTrue;

    sbPicker.Enabled                 := MatrixMain.MatrixType = psTypeRGB;
  end;
end;

end.