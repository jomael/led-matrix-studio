// ===================================================================
//
// (c) Paul Alan Freshney 2012-2016
// www.freshney.org :: paul@freshney.org :: maximumoctopus.com
//
// www.MaximumOctopus.com/electronics/builder.htm
//
// Please do not redistribute the source code!
//
//   Started: February 5th 2014
//  Modified: June 23rd 2015
//
// ===================================================================

unit export;

interface

uses
  Windows, Messages, System.UITypes, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, utility, xglobal, ComCtrls;

type
  TfrmExport = class(TForm)
    Panel1: TPanel;
    GroupBox4: TGroupBox;
    sbSave: TBitBtn;
    sbOpen: TBitBtn;
    cbProfileList: TComboBox;
    Bevel2: TBevel;
    GroupBox6: TGroupBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    cbAutoPreview: TCheckBox;
    sdExport: TSaveDialog;
    sbDelete: TBitBtn;
    bCopyToClipboard: TBitBtn;
    cdExport: TColorDialog;
    BitBtn3: TBitBtn;
    pcExport: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Memo1: TMemo;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    sbDataRows: TSpeedButton;
    sbDataColumns: TSpeedButton;
    lFrame: TLabel;
    Label2: TLabel;
    cbDirection: TComboBox;
    cbScanDirection: TComboBox;
    eFrameStart: TEdit;
    eFrameEnd: TEdit;
    cbOptimise: TCheckBox;
    GroupBox5: TGroupBox;
    sbLSBLeft: TSpeedButton;
    sbLSBRight: TSpeedButton;
    GroupBox2: TGroupBox;
    cbLanguageFormat: TComboBox;
    groupBoxNumberFormat: TGroupBox;
    sbNumberDecimal: TSpeedButton;
    sbNumberBinary: TSpeedButton;
    sbNumberHex: TSpeedButton;
    groupBoxNumberGrouping: TGroupBox;
    sbNumberSize8bit: TSpeedButton;
    sbNumberSize16bit: TSpeedButton;
    sbNumberSize32bit: TSpeedButton;
    sbNumberSize8bitSwap: TSpeedButton;
    sbNumberSize16bitSwap: TSpeedButton;
    groupBoxEachLine: TGroupBox;
    sbOutputRow: TSpeedButton;
    sbOutputFrame: TSpeedButton;
    sbOutputBytes: TSpeedButton;
    cbLineCount: TComboBox;
    groupBoxRGB: TGroupBox;
    sbRGB: TSpeedButton;
    sbBGR: TSpeedButton;
    sbGRB: TSpeedButton;
    shapeBackgroundPixels: TShape;
    Label1: TLabel;
    cbChangeBackgroundPixels: TCheckBox;
    groupBoxNumberGroupingRGB: TGroupBox;
    sbNumberSizeRGB8bits: TSpeedButton;
    sbNumberSizeRGB32bits: TSpeedButton;
    Panel3: TPanel;
    GroupBox3: TGroupBox;
    sbBinaryDataRows: TSpeedButton;
    sbBinaryDataColumns: TSpeedButton;
    Label3: TLabel;
    Label4: TLabel;
    cbBinaryDirection: TComboBox;
    cbBinaryScanDirection: TComboBox;
    eBinaryFrameStart: TEdit;
    eBinaryFrameEnd: TEdit;
    cbBinaryOptimise: TCheckBox;
    GroupBox7: TGroupBox;
    sbBinaryLSBLeft: TSpeedButton;
    sbBinaryLSBRight: TSpeedButton;
    GroupBox10: TGroupBox;
    sbBinaryNumberSize8bit: TSpeedButton;
    sbBinaryNumberSize8bitSwap: TSpeedButton;
    groupBoxBinaryRGB: TGroupBox;
    sbBinaryRGB: TSpeedButton;
    sbBinaryBGR: TSpeedButton;
    sbBinaryGRB: TSpeedButton;
    shapeBinaryBackgroundPixels: TShape;
    Label5: TLabel;
    cbBinaryChangeBackgroundPixels: TCheckBox;
    groupBoxNumberGroupingBinaryRGB: TGroupBox;
    sbBinaryNumberSizeRGB8bits: TSpeedButton;
    Memo2: TMemo;
    GroupBox8: TGroupBox;
    rbSaveAnimation: TRadioButton;
    rbSaveFrame: TRadioButton;
    sbBinaryNumberSize16bitSwap: TSpeedButton;
    procedure sbDataRowsClick(Sender: TObject);
    procedure Preview;
    procedure PreviewCode;
    procedure PreviewBinary;
    procedure CreateExportOptions;
    procedure CreateBinaryExportOptions;
    procedure FormConstrainedResize(Sender: TObject; var MinWidth, MinHeight, MaxWidth, MaxHeight: Integer);
    procedure FormCreate(Sender: TObject);
    procedure cbDirectionChange(Sender: TObject);
    procedure sbLSBLeftClick(Sender: TObject);
    procedure cbLanguageFormatChange(Sender: TObject);
    procedure sbNumberDecimalClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure sbSaveClick(Sender: TObject);
    procedure GetProfiles;
    procedure SaveProfile(aFileName : string);
    procedure LoadProfile(aFileName : string);
    procedure BuildFromProfile(aEEO : TExportOptions);
    procedure sbOpenClick(Sender: TObject);
    procedure sbNumberSize8bitClick(Sender: TObject);
    function  ValidateNumberEdit(ne : TEdit): boolean;
    procedure eFrameEndExit(Sender: TObject);
    procedure sbDeleteClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bCopyToClipboardClick(Sender: TObject);
    procedure sbRGBClick(Sender: TObject);
    procedure cbOptimiseClick(Sender: TObject);
    procedure shapeBackgroundPixelsMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure sbBinaryDataRowsClick(Sender: TObject);
    procedure pcExportChange(Sender: TObject);
    function  SaveBinaryData(aFileName : string): boolean;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmExport: TfrmExport;

function ExportData(aInputEO : TExportOptions; mode, mtype : integer): TExportOptions; // mode = 0 (animation), 1 = (user memories) TO DO (now .exportopions

implementation

{$R *.dfm}

uses optimisation, exportoutputcode, exportoutputbinary;

var
 eeo : TExportOptions;
 building : boolean;
 MaxFrameValue : integer;
 profileextension : string;

function ExportData(aInputEO : TExportOptions; mode, mtype : integer): TExportOptions; // mode = 0 (animation), 1 = (user memories) TO DO (now .exportopions
 begin
  with TfrmExport.Create(Application) do
    try
      eeo.ExportMode      := mode;
      eeo.IncludePreamble := True;

      case mtype of
        psTypeMono,
        psTypeBiSequential,
        psTypeBiBitPlanes   : profileextension := 'ledsexport';
        psTypeRGB           : begin
                                groupBoxNumberFormat.Visible            := False;
                                groupBoxNumberGrouping.Visible          := False;

                                groupBoxRGB.Visible                     := True;
                                groupBoxBinaryRGB.Visible               := True;
                                groupBoxRGB.Top                         := groupBoxNumberFormat.Top;

                                groupBoxEachLine.Top                    := groupBoxRGB.Top + groupBoxRGB.Height + 8;

                                groupBoxNumberGroupingRGB.Visible       := True;
                                groupBoxNumberGroupingBinaryRGB.Visible := True;
                                groupBoxNumberGroupingRGB.Top           := groupBoxEachLine.Top + groupBoxEachLine.Height + 8;

                                profileextension                        := 'ledsexportrgb' ;
                              end;
      end;

      if mode = 0 then
        MaxFrameValue := MatrixMain.FrameCount // anim
      else
        MaxFrameValue := 10;                   // user memories

      if aInputEO.ExportMode <> -1 then
        BuildFromProfile(aInputEO);

      // =======================================================================

      ShowModal;

      // =======================================================================

      if ModalResult <> mrCancel then begin
        Result.ExportMode      := mode;

        Result.StartFrame      := eeo.StartFrame;
        Result.EndFrame        := eeo.EndFrame;        

        Result.Source          := eeo.Source;
        Result.Orientation     := eeo.Orientation;
        Result.ScanDirection   := eeo.ScanDirection;
        Result.LSB             := eeo.LSB;
        Result.Language        := eeo.Language;
        Result.NumberFormat    := eeo.NumberFormat;
        Result.NumberSize      := eeo.NumberSize;
        Result.LineContent     := eeo.LineContent;
        Result.LineCount       := eeo.LineCount;

        Result.RGBEnabled      := eeo.RGBEnabled;
        Result.RGBMode         := eeo.RGBMode;
        Result.RGBChangePixels := eeo.RGBChangePixels;
        Result.RGBChangeColour := eeo.RGBChangeColour;
      end
      else begin
        Result.ExportMode := -1;
      end;
    finally
      Free;
    end;
end;

procedure TfrmExport.FormCreate(Sender: TObject);
 begin
  if eeo.ExportMode = 1 then
    lFrame.Caption := 'User Memories';

  cbAutoPreview.Checked := False;
  building              := False;

  sbDataRowsClick(Nil);
  sbBinaryDataRowsClick(Nil);

  cbLanguageFormat.Items.Add('Comma separated');
  cbLanguageFormat.Items.Add('PICAXE EEPROM');
  cbLanguageFormat.Items.Add('C-style (1 dimensional)');
  cbLanguageFormat.Items.Add('C-style (2 dimensional)');
  cbLanguageFormat.Items.Add('Python (1 dimensional)');
  cbLanguageFormat.Items.Add('Python (2 dimensional)');
  cbLanguageFormat.Items.Add('Microchip');

  cbLanguageFormat.ItemIndex := 0;

  cbLineCount.Items.Add('8');  
  cbLineCount.Items.Add('10');
  cbLineCount.Items.Add('16');
  cbLineCount.Items.Add('20');
  cbLineCount.Items.Add('32');
  cbLineCount.Items.Add('40');
  cbLineCount.Items.Add('50');
  cbLineCount.Items.Add('64');  
  cbLineCount.Items.Add('100');
  cbLineCount.Items.Add('128');
  cbLineCount.Items.Add('256');      

  cbLineCount.ItemIndex := 1;

  cbAutoPreview.Checked := True;
end;

procedure TfrmExport.FormShow(Sender: TObject);
 begin
  eFrameEnd.Text := IntToStr(MaxFrameValue);

  GetProfiles;

  Preview;
end;

procedure TfrmExport.FormClose(Sender: TObject; var Action: TCloseAction);
 begin
  Action := caFree;
end;

procedure TfrmExport.FormConstrainedResize(Sender: TObject; var MinWidth, MinHeight, MaxWidth, MaxHeight: Integer);
 begin
  MinHeight := 740;
  MinWidth  := 688;
end; 

procedure TfrmExport.Preview;
 begin
  case pcExport.ActivePageIndex of
    0 : PreviewCode;
    1 : PreviewBinary;
  end;
end;

procedure TfrmExport.PreviewCode;
 var
  endframelimit, entrycount : integer;
  lUnique : TStringList;
  lOutput : TStringList;
  t : integer;

  procedure ClearForRetry;
   begin
    eeo.IncludePreamble := True;
    eeo.CleanMode       := False;

    lOutput.Clear;
    lUnique.Clear;
  end;

begin
  if ValidateNumberEdit(eFrameStart) and ValidateNumberEdit(eFrameEnd) then begin

    CreateExportOptions;

    if eeo.ExportMode = 0 then
      endframelimit := MatrixMain.FrameCount
    else
      endframelimit := 9;

    if (eeo.StartFrame <= eeo.EndFrame) and (eeo.EndFrame <= endframelimit) and (eeo.StartFrame >= 1) then begin

      lUnique := TStringList.Create;
      lOutput := TStringList.Create;

      if MatrixMain.SoftwareMode = 0 then
        eeo.FontMode := False
      else
        eeo.FontMode := True;

      if groupBoxRGB.Visible then begin
        if cbOptimise.Checked then begin
          CreateExportAnimationRGB(eeo, lOutput, entrycount, lUnique);

          if not Optimise(eeo, lOutput) then begin
            ClearForRetry;

            CreateExportAnimationRGB(eeo, lOutput, entrycount, lUnique);
          end;
        end
        else
          CreateExportAnimationRGB(eeo, lOutput, entrycount, lUnique);
      end
      else begin
        if cbOptimise.Checked then begin
          CreateExportAnimation(eeo, lOutput, entrycount, lUnique);

          if not Optimise(eeo, lOutput) then begin
            ClearForRetry;

            CreateExportAnimation(eeo, lOutput, entrycount, lUnique);
          end;
        end
        else
          CreateExportAnimation(eeo, lOutput, entrycount, lUnique);
      end;

      // =======================================================================

      Memo1.Lines.Clear;

      Memo1.Lines.BeginUpdate;
      for t:= 0 to lOutput.Count - 1 do
        Memo1.Lines.Add(lOutput[t]);

      Memo1.Lines.EndUpdate;

      // =======================================================================

      lOutput.Free;
      lUnique.Free;
    end
    else begin
      eFrameStart.Color := clFuchsia;
      eFrameEnd.Color   := clFuchsia;
    end;
  end;
end;

procedure TfrmExport.PreviewBinary;
 var
  endframelimit, entrycount : integer;
  lUnique : TStringList;
  lOutput : TStringList;
  t : integer;

  procedure ClearForRetry;
   begin
    eeo.IncludePreamble := True;
    eeo.CleanMode       := False;

    lOutput.Clear;
    lUnique.Clear;
  end;

begin
  if ValidateNumberEdit(eBinaryFrameStart) and ValidateNumberEdit(eBinaryFrameEnd) then begin

    CreateBinaryExportOptions;

    if eeo.ExportMode = 0 then
      endframelimit := MatrixMain.FrameCount
    else
      endframelimit := 9;

    if (eeo.StartFrame <= eeo.EndFrame) and (eeo.EndFrame <= endframelimit) and (eeo.StartFrame >= 1) then begin

      lUnique := TStringList.Create;
      lOutput := TStringList.Create;

      if MatrixMain.SoftwareMode = 0 then
        eeo.FontMode := False
      else
        eeo.FontMode := True;

      if groupBoxRGB.Visible then begin
        if cbBinaryOptimise.Checked then begin
          BinaryCreateExportAnimationRGB(eeo, lOutput, entrycount, lUnique);

          if not Optimise(eeo, lOutput) then begin
            ClearForRetry;

            BinaryCreateExportAnimationRGB(eeo, lOutput, entrycount, lUnique);
          end;
        end
        else
          BinaryCreateExportAnimationRGB(eeo, lOutput, entrycount, lUnique);
      end
      else begin
        if cbOptimise.Checked then begin
          BinaryCreateExportAnimation(eeo, lOutput, entrycount, lUnique);

          if not Optimise(eeo, lOutput) then begin
            ClearForRetry;

            BinaryCreateExportAnimation(eeo, lOutput, entrycount, lUnique);
          end;
        end
        else
          BinaryCreateExportAnimation(eeo, lOutput, entrycount, lUnique);
      end;

      // =======================================================================

      Memo2.Lines.Clear;

      Memo2.Lines.BeginUpdate;
      for t:= 0 to lOutput.Count - 1 do
        Memo2.Lines.Add(lOutput[t]);

      Memo2.Lines.EndUpdate;

      // =======================================================================

      lOutput.Free;
      lUnique.Free;
    end
    else begin
      eFrameStart.Color := clFuchsia;
      eFrameEnd.Color   := clFuchsia;
    end;
  end;
end;

procedure TfrmExport.bCopyToClipboardClick(Sender: TObject);
 begin
  case pcExport.ActivePageIndex of
    0 : begin
          Preview;

          Memo1.SelectAll;
          Memo1.CopyToClipboard;
        end;
    1 : begin
          PreviewBinary;

          Memo2.SelectAll;
          Memo2.CopyToClipboard;
        end;
  end;

end;

procedure TfrmExport.BitBtn2Click(Sender: TObject);
 begin
  case pcExport.ActivePageIndex of
    0 : begin
          sdExport.Filter     := 'C-style header file (.h)|*.h|Include file (.inc)|*.inc|Python file (.py)|*.py';
          sdExport.DefaultExt := '.h';

          if sdExport.Execute then begin
            Preview;

            Memo1.Lines.SaveToFile(sdExport.Filename);

            ModalResult := mrOK;
          end;
        end;
    1 : begin
          sdExport.Filter     := 'Binary file (.bin)|*.bin|Include file (.inc)|*.inc|Data file (.dat)|*.dat';
          sdExport.DefaultExt := '.bin';

          if sdExport.Execute then begin
            PreviewBinary;

            if SaveBinaryData(sdExport.FileName) then begin
              ModalResult := mrOK;
            end
            else
              MessageDlg('Error Saving Binary Data', mtError, [mbOK], 0);
          end;
        end;
  end;
end;

procedure TfrmExport.cbDirectionChange(Sender: TObject);
 begin
  if (cbAutoPreview.Checked) and not(building) then
    Preview;
end;

procedure TfrmExport.cbLanguageFormatChange(Sender: TObject);
 begin
  if (cbAutoPreview.Checked) and not(building) then
    Preview;
end;

procedure TfrmExport.cbOptimiseClick(Sender: TObject);
 begin
  if (cbAutoPreview.Checked) and not(building) then
    Preview;
end;

procedure TfrmExport.CreateExportOptions;
 begin

  // ===========================================================================

  if cbOptimise.Checked then begin
    eeo.IncludePreamble := False;
    eeo.CleanMode       := True;
  end
  else begin
    eeo.IncludePreamble := True;
    eeo.CleanMode       := False;
  end;

  // ===========================================================================

  if eeo.ExportMode = 0 then begin
    eeo.StartFrame := StrToInt(eFrameStart.Text);
    eeo.EndFrame   := StrToInt(eFrameEnd.Text);
  end
  else begin
    eeo.StartFrame := StrToInt(eFrameStart.Text);
    eeo.EndFrame   := StrToInt(eFrameEnd.Text);
  end;

  // ===========================================================================  

  if sbDataRows.Down then
    eeo.Source := sourceRows
  else
    eeo.Source := sourceColumns;

  // ===========================================================================

  eeo.orientation   := cbDirection.ItemIndex;

  // ===========================================================================

  eeo.ScanDirection := cbScanDirection.ItemIndex;

  // ===========================================================================

  if sbLSBLeft.Down then
    eeo.LSB := 0
  else
    eeo.LSB := 1;

  // ===========================================================================

  eeo.Language := cbLanguageFormat.ItemIndex;

  // ===========================================================================

  if groupBoxNumberFormat.Visible then begin
    if sbNumberDecimal.Down then
      eeo.NumberFormat := 0
    else if sbNumberBinary.Down then
      eeo.NumberFormat := 1
    else
      eeo.NumberFormat := 2;
  end
  else
    eeo.NumberFormat := 2;

  // ===========================================================================

  if groupBoxNumberGrouping.Visible then begin
    if sbNumberSize8bit.Down then
      eeo.NumberSize := ns8Bit
    else if sbNumberSize16bit.Down then
      eeo.NumberSize := ns16bit
    else if sbNumberSize32bit.Down then
      eeo.NumberSize := ns32bit
    else if sbNumberSize8bitSwap.Down then
      eeo.NumberSize := ns8bitSwap
    else if sbNumberSize16bitSwap.Down then
      eeo.NumberSize := ns16bitSwap;
  end
  else begin
    if sbNumberSizeRGB8bits.Down then
      eeo.NumberSize := nsRGB8bit
    else if sbNumberSizeRGB32bits.Down then
      eeo.NumberSize := nsRGB32bit
    else
      eeo.NumberSize := nsRGB32bit;
  end;

  // ===========================================================================

  if sbOutputRow.Down then
    eeo.LineContent := 0
  else if sbOutputFrame.Down then
    eeo.LineContent := 1
  else if sbOutputBytes.Down then
    eeo.LineContent := 2;

  // ===========================================================================

  if groupBoxRGB.Visible then begin
    eeo.RGBEnabled := True;

    if sbRGB.Down then
      eeo.RGBMode := rgbConvertToRGB
    else if sbBGR.Down then
      eeo.RGBMode := rgbConvertToBGR
    else if sbGRB.Down then
      eeo.RGBMode := rgbConvertToGRB;

    eeo.RGBChangePixels := cbChangeBackgroundPixels.Checked;
    eeo.RGBChangeColour := shapeBackgroundPixels.Brush.Color;
  end
  else
    eeo.RGBEnabled := False;

  // ===========================================================================

  eeo.LineCount := StrToInt(cbLineCount.Text);
end;

procedure TfrmExport.CreateBinaryExportOptions;
 begin

//  eeo.Language     := -1; // none
  eeo.LineContent  := lineContentFrame;  // process in frames
  eeo.NumberFormat := 2;  // always in hex format  

  // ===========================================================================

  if cbBinaryOptimise.Checked then begin
    eeo.IncludePreamble := False;
    eeo.CleanMode       := True;
  end
  else begin
    eeo.IncludePreamble := True;
    eeo.CleanMode       := False;
  end;

  // ===========================================================================

  if eeo.ExportMode = 0 then begin
    eeo.StartFrame := StrToInt(eFrameStart.Text);
    eeo.EndFrame   := StrToInt(eFrameEnd.Text);
  end
  else begin
    eeo.StartFrame := StrToInt(eFrameStart.Text);
    eeo.EndFrame   := StrToInt(eFrameEnd.Text);
  end;

  // ===========================================================================  

  if sbBinaryDataRows.Down then
    eeo.Source := sourceRows
  else
    eeo.Source := sourceColumns;

  // ===========================================================================

  eeo.orientation   := cbBinaryDirection.ItemIndex;

  // ===========================================================================

  eeo.ScanDirection := cbBinaryScanDirection.ItemIndex;

  // ===========================================================================

  if sbBinaryLSBLeft.Down then
    eeo.LSB := 0
  else
    eeo.LSB := 1;

  // ===========================================================================

  if groupBoxNumberGrouping.Visible then begin
    if sbBinaryNumberSize8bit.Down then
      eeo.NumberSize := ns8Bit
    else if sbBinaryNumberSize8bitSwap.Down then
      eeo.NumberSize := ns8bitSwap
    else if sbBinaryNumberSize16bitSwap.Down then
      eeo.NumberSize := ns16bitSwap;
  end
  else begin
    eeo.NumberSize := nsRGB8bit
  end;

  // ===========================================================================

  if groupBoxRGB.Visible then begin
    eeo.RGBEnabled := True;

    if sbBinaryRGB.Down then
      eeo.RGBMode := rgbConvertToRGB
    else if sbBinaryBGR.Down then
      eeo.RGBMode := rgbConvertToBGR
    else if sbBinaryGRB.Down then
      eeo.RGBMode := rgbConvertToGRB;

    eeo.RGBChangePixels := cbBinaryChangeBackgroundPixels.Checked;
    eeo.RGBChangeColour := shapeBinaryBackgroundPixels.Brush.Color;
  end
  else
    eeo.RGBEnabled := False;
end;

procedure TfrmExport.eFrameEndExit(Sender: TObject);
 begin
  if (cbAutoPreview.Checked) and not(building) then
    Preview;
end;

procedure TfrmExport.BuildFromProfile(aEEO : TExportOptions);
 var
  t : integer;

 begin
  building := True;

  // ===========================================================================

  if aEEO.Source = sourceRows then
    sbDataRows.Down    := True
  else
    sbDataColumns.Down := True;

  sbDataRowsClick(niL);

  cbOptimise.Checked := aEEO.Optimise;

  // ===========================================================================

  cbDirection.ItemIndex     := aEEO.orientation;

  // ===========================================================================

  cbScanDirection.ItemIndex := aEEO.ScanDirection;

  // ===========================================================================

  if aEEO.LSB = 0 then
    sbLSBLeft.Down  := True
  else
    sbLSBRight.Down := True;

  sbLSBLeftClick(Nil);

  // ===========================================================================

  cbLanguageFormat.ItemIndex := aEEO.Language;

  // ===========================================================================

  if groupBoxNumberFormat.Visible then begin
    case aEEO.NumberFormat of
      nfDecimal : sbNumberDecimal.Down := True;
      nfBinary  : sbNumberBinary.Down  := True;
      nfHex     : sbNumberHex.Down     := True;
    end;
  end;

  // ===========================================================================

  if groupBoxNumberGrouping.Visible then begin
    case aEEO.NumberSize of
      ns8Bit      : sbNumberSize8bit.Down      := True;
      ns16bit     : sbNumberSize16bit.Down     := True;
      ns32bit     : sbNumberSize32bit.Down     := True;
      ns8bitSwap  : sbNumberSize8bitSwap.Down  := True;
      ns16bitSwap : sbNumberSize16bitSwap.Down := True;
    end;

    sbNumberSize8bitClick(Nil);
  end;

  // ===========================================================================

  case aEEO.LineContent of
    lineContentRowCol : sbOutputRow.Down   := True;
    lineContentFrame  : sbOutputFrame.Down := True;
    lineContentBytes  : sbOutputBytes.Down := True;
  end;

  sbDataRowsClick(Nil);

  // ===========================================================================

  for t:=0 to cbLineCount.Items.Count - 1 do begin
    if cbLineCount.Items[t] = IntToStr(eeo.LineCount) then
      cbLineCount.ItemIndex := t;
  end;

  // ===========================================================================

  if groupBoxRGB.Visible then begin
    case aEEO.RGBMode of
      rgbConvertToRGB : sbRGB.Down := True;
      rgbConvertToBGR : sbBGR.Down := True;
      rgbConvertToGRB : sbGRB.Down := True;
    end;

    cbChangeBackgroundPixels.Checked  := aEEO.RGBChangePixels;
    shapeBackgroundPixels.Brush.Color := aEEO.RGBChangeColour;    
  end;

  // ===========================================================================

  building := False;

  // ===========================================================================  

  Preview;
end;

procedure TfrmExport.sbBinaryDataRowsClick(Sender: TObject);
begin
  cbBinaryDirection.Clear;
  cbBinaryScanDirection.Clear;

  if sbBinaryDataRows.Down then begin
    cbBinaryDirection.Items.Add('Top to bottom');
    cbBinaryDirection.Items.Add('Bottom to top');

    cbBinaryScanDirection.Items.Add('Left to right');
    cbBinaryScanDirection.Items.Add('Right to left');
    cbBinaryScanDirection.Items.Add('Alternate Left/Right');
    cbBinaryScanDirection.Items.Add('Alternate Right/Left');

    sbBinaryLSBLeft.Caption   := 'Left';
    sbBinaryLSBRight.Caption  := 'Right';
  end
  else begin
    cbBinaryDirection.Items.Add('Left to right');
    cbBinaryDirection.Items.Add('Right to left');
    cbBinaryDirection.Items.Add('Sure 24x16');

    cbBinaryScanDirection.Items.Add('Top to bottom');
    cbBinaryScanDirection.Items.Add('Bottom to top');
    cbBinaryScanDirection.Items.Add('Alternate Down/Up');
    cbBinaryScanDirection.Items.Add('Alternate Up/Down');

    sbBinaryLSBLeft.Caption   := 'Top';
    sbBinaryLSBRight.Caption  := 'Bottom';
  end;

  cbBinaryDirection.ItemIndex     := 0;
  cbBinaryScanDirection.ItemIndex := 0;

  if (cbAutoPreview.Checked) and not(building) then
    PreviewBinary;
end;

procedure TfrmExport.sbDataRowsClick(Sender: TObject);
var
  oldIndexD, oldIndexS : integer;
begin
  oldIndexD := cbDirection.ItemIndex;
  oldIndexS := cbScanDirection.ItemIndex;

  cbDirection.Clear;
  cbScanDirection.Clear;

  if sbDataRows.Down then begin
    cbDirection.Items.Add('Top to bottom');
    cbDirection.Items.Add('Bottom to top');

    cbScanDirection.Items.Add('Left to right');
    cbScanDirection.Items.Add('Right to left');
    cbScanDirection.Items.Add('Alternate Left/Right');
    cbScanDirection.Items.Add('Alternate Right/Left');

    sbLSBLeft.Caption   := 'Left';
    sbLSBRight.Caption  := 'Right';

    sbOutputRow.Caption := 'Row';
  end
  else begin
    cbDirection.Items.Add('Left to right');
    cbDirection.Items.Add('Right to left');
    cbDirection.Items.Add('Sure 24x16');

    cbScanDirection.Items.Add('Top to bottom');
    cbScanDirection.Items.Add('Bottom to top');
    cbScanDirection.Items.Add('Alternate Down/Up');
    cbScanDirection.Items.Add('Alternate Up/Down');

    sbLSBLeft.Caption   := 'Top';
    sbLSBRight.Caption  := 'Bottom';

    sbOutputRow.Caption := 'Column';
  end;

  if (Sender <> Nil) then
  begin
    if (TSpeedButton(Sender).Tag = 1) then begin
      cbDirection.ItemIndex     := oldIndexD;
      cbScanDirection.ItemIndex := oldIndexS;
    end
    else begin
      cbDirection.ItemIndex     := 0;
      cbScanDirection.ItemIndex := 0;
    end;
  end
  else begin
    cbDirection.ItemIndex     := 0;
    cbScanDirection.ItemIndex := 0;
  end;

  if (cbAutoPreview.Checked) and not(building) then
    Preview;
end;

procedure TfrmExport.sbDeleteClick(Sender: TObject);
 begin
  if cbProfileList.Enabled then begin
    if MessageDlg('Really delete this profile?' + #13#13 +
                  '"' + cbProfileList.Text + '"', mtWarning, [mbYes, mbNo], 0) = mrYes then begin
      if not(DeleteFile(ExtractFilePath(Application.ExeName) + 'export\' + cbProfileList.Text + '.' + profileextension)) then
        MessageDlg('Couldn''t delete profile :(', mtError, [mbOK], 0);

      GetProfiles;
    end;
  end;
end;

procedure TfrmExport.sbLSBLeftClick(Sender: TObject);
 begin
  if (cbAutoPreview.Checked) and not(building) then
    Preview;
end;

procedure TfrmExport.sbNumberDecimalClick(Sender: TObject);
 begin
  if (cbAutoPreview.Checked) and not(building) then
    Preview;
end;

procedure TfrmExport.sbNumberSize8bitClick(Sender: TObject);
 begin
  if sbNumberSize8bit.Down then
    sbOutputBytes.Caption := 'Bytes'
  else if sbNumberSize16bit.Down then
    sbOutputBytes.Caption := 'Words'
  else if sbNumberSize32bit.Down then
    sbOutputBytes.Caption := 'LWords'
  else if sbNumberSize8bitSwap.Down then
    sbOutputBytes.Caption := 'Bytes'
  else if sbNumberSize16bitSwap.Down then
    sbOutputBytes.Caption := 'Words';

  if (cbAutoPreview.Checked) and not(building) then
    Preview;
end;

procedure TfrmExport.sbOpenClick(Sender: TObject);
 begin
  if cbProfileList.Enabled then begin
    LoadProfile(cbProfileList.Items[cbProfileList.ItemIndex]);

    Preview;
  end;
end;

procedure TfrmExport.sbRGBClick(Sender: TObject);
 begin
  if (cbAutoPreview.Checked) and not(building) then
    Preview;
end;

procedure TfrmExport.sbSaveClick(Sender: TObject);
 var
  s : string;

 begin
  if InputQuery('Profile Name', '', s) then begin
    SaveProfile(s);

    GetProfiles;
  end;
end;

procedure TfrmExport.shapeBackgroundPixelsMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
 begin
  if cdExport.Execute then begin
    shapeBackgroundPixels.Brush.Color := cdExport.Color;

    if (cbAutoPreview.Checked) and not(building) then
      Preview;
  end;
end;

procedure TfrmExport.GetProfiles;
 var
  s : string;
  searchResult : TSearchRec;

 begin
  cbProfileList.Clear;

  if FindFirst(ExtractFilePath(Application.ExeName) + 'export\*.' + profileextension, faAnyFile, searchResult) = 0 then begin
    repeat
      s := RemoveExtension(searchResult.Name);

      cbProfileList.Items.Add(s);
    until FindNext(searchResult) <> 0;

    // Must free up resources used by these successful finds
    FindClose(searchResult);
  end;

  if cbProfileList.Items.Count = 0 then
    cbProfileList.Enabled   := False
  else begin
    cbProfileList.Enabled   := True;
    cbProfileList.ItemIndex := 0;
  end;
end;

procedure TfrmExport.SaveProfile(aFileName : string);
 var
  tf : TextFile;

 begin
  CreateExportOptions;

  AssignFile(tf, ExtractFilePath(Application.Exename)+'export\' + aFileName + '.' + profileextension);
  Rewrite(tf);

  if groupBoxRGB.Visible then
    writeln(tf, '{RGB')
  else
    writeln(tf, '{');

  writeln(tf, 'a:' + IntToStr(eeo.Source));
  writeln(tf, 'b:' + IntToStr(eeo.orientation));
  writeln(tf, 'c:' + IntToStr(eeo.LSB));
  writeln(tf, 'd:' + IntToStr(eeo.Language));
  writeln(tf, 'e:' + IntToStr(eeo.NumberFormat));
  writeln(tf, 'f:' + IntToStr(eeo.NumberSize));
  writeln(tf, 'g:' + IntToStr(eeo.ScanDirection));
  writeln(tf, 'h:' + IntToStr(eeo.LineContent));
  writeln(tf, 'i:' + IntToStr(eeo.LineCount));
  writeln(tf, 'r:' + IntToStr(eeo.RGBMode));
  writeln(tf, 's:' + BoolToStr(eeo.RGBChangePixels));
  writeln(tf, 't:' + IntToStr(eeo.RGBChangeColour));
  writeln(tf, '}');

  CloseFile(tf);
end;

procedure TfrmExport.LoadProfile(aFileName : string);
 begin
  eeo := LoadProfileFromFile(ExtractFilePath(Application.Exename) + 'export\' + aFileName + '.' + profileextension);

  if eeo.Source <> sourceUnknown then
    BuildFromProfile(eeo)
  else
    showmessage('Error loading profile!');
end;

procedure TfrmExport.pcExportChange(Sender: TObject);
 begin
  if (cbAutoPreview.Checked) and not(building) then
    Preview;
end;

function TfrmExport.ValidateNumberEdit(ne : TEdit): boolean;
 var
  t : integer;

 begin
  Result := True;

  if Length(ne.Text) > 0 then begin
    for t:=1 to length(ne.Text) do begin
      if (ord(ne.Text[t]) < 48) or (ord(ne.Text[t]) > 57) then
        Result := False;
    end;
  end
  else
    Result := False;

  if Result then
    ne.Color := clWindow
  else
    ne.Color := clFuchsia;
end;

function TfrmExport.SaveBinaryData(aFileName : string): boolean;
var
  tf          : File of byte;
  lFilePrefix, lOutputFileName : string;
  lAnimFrame  : integer;
  lTempOutput : string;
  lByte       : byte;
  t,z : integer;
begin
  Result      := True;
  lAnimFrame  := StrToInt(eBinaryFrameStart.Text);
  lFilePrefix := GetFilePrefix(aFileName);

  if rbSaveAnimation.Checked then
    lOutputFileName := aFileName
  else
    lOutputFileName := ExtractFilePath(aFileName) + lFilePrefix + '_' + IntToStr(lAnimFrame) + ExtractFileExt(aFileName);

  AssignFile(tf, lOutputFileName);
  Rewrite(tf);

  for t:= 0 to Memo2.Lines.Count - 1 do begin
    if Memo2.Lines[t] <> '' then begin
      lTempOutput := '';

      for z:= 1 to length(Memo2.Lines[t]) do begin
        if Memo2.Lines[t][z] <> ' ' then begin
          lTempOutput := lTempOutput + Memo2.Lines[t][z];
        end
        else begin
          lByte := HexToByte(lTempOutput);

          write(tf, lByte);

          lTempOutput := '';
        end;
      end;
    end
    else begin
      if (rbSaveFrame.Checked) and (lAnimFrame < StrToInt(eBinaryFrameEnd.Text)) then begin
        CloseFile(tf);

        inc(lAnimFrame);

        lOutputFileName := ExtractFilePath(aFileName) + lFilePrefix + '_' + IntToStr(lAnimFrame) + ExtractFileExt(aFileName);

        AssignFile(tf, lOutputFileName);
        Rewrite(tf);
      end;
    end;
  end;

  CloseFile(tf);
end;

end.
