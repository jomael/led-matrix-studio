// ===================================================================
//
// (c) Paul Alan Freshney 2012-2016
// www.freshney.org :: paul@freshney.org :: maximumoctopus.com
//
// www.MaximumOctopus.com/electronics/builder.htm
//
// Please do not redistribute the source code!
//
//   Started: July 13th 2013
//  Modified: June 6th 2015
//
// ===================================================================

unit importbitmap;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtDlgs, ExtCtrls, StdCtrls, Buttons;

type
  TfrmImportBitmap = class(TForm)
    BitBtn1: TBitBtn;
    iImport: TImage;
    opdMain: TOpenPictureDialog;
    bOK: TBitBtn;
    bCancel: TBitBtn;
    Bevel1: TBevel;
    Shape1: TShape;
    lHelpText: TLabel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    cbWidth: TComboBox;
    cbHeight: TComboBox;
    eFrames: TEdit;
    lFileName: TLabel;
    Label1: TLabel;
    Label6: TLabel;
    lImageHeight: TLabel;
    lImageWidth: TLabel;
    Bevel2: TBevel;
    bAuto: TBitBtn;
    cbRGBImport: TCheckBox;
    cbCreateNew: TCheckBox;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bOKClick(Sender: TObject);
    procedure bCancelClick(Sender: TObject);
    procedure bAutoClick(Sender: TObject);
    procedure cbRGBImportClick(Sender: TObject);
  private
    { Private declarations }
  public
    RGBImport     : boolean;
    CreateNew     : boolean;
    ImageFilename : string;
    FrameCount    : integer;
    FrameWidth    : integer;
    FrameHeight   : integer;
  end;

var
  frmImportBitmap: TfrmImportBitmap;

implementation

{$R *.dfm}

procedure TfrmImportBitmap.FormCreate(Sender: TObject);
 var
  x : integer;

 begin
  ImageFilename := '';
  FrameCount    := -1;

  for x:=1 to 64 do begin
    cbWidth.Items.Add(IntToStr(x));
    cbHeight.Items.Add(IntToStr(x));
  end;

  cbWidth.ItemIndex  := 15;
  cbHeight.ItemIndex := 15;
end;

procedure TfrmImportBitmap.bOKClick(Sender: TObject);
 begin
  if ImageFilename <> '' then begin
    FrameCount  := StrToInt(eFrames.Text);
    FrameWidth  := StrToInt(cbWidth.Text);
    FrameHeight := StrToInt(cbHeight.Text);

    RGBImport   := cbRGBImport.Checked;
    CreateNew   := cbCreateNew.Checked;
  end
  else
    FrameCount  := -1;
end;

procedure TfrmImportBitmap.cbRGBImportClick(Sender: TObject);
 begin
  lHelpText.Visible := not cbRGBImport.Checked;
end;

procedure TfrmImportBitmap.bCancelClick(Sender: TObject);
 begin
  FrameCount := -1;
end;

procedure TfrmImportBitmap.BitBtn1Click(Sender: TObject);
 begin
  if opdMain.Execute then begin
    if FileExists(opdMain.Filename) then begin
      iImport.Picture.LoadFromFile(opdMain.Filename);

      ImageFilename        := opdMain.Filename;

      lFileName.Caption    := opdMain.Filename;

      lImageWidth.Caption  := IntToStr(iImport.Picture.Width);
      lImageHeight.Caption := IntToStr(iImport.Picture.Height);

      bOK.Enabled := True;
    end;
  end;
end;

procedure TfrmImportBitmap.bAutoClick(Sender: TObject);
 var
  lAspectRatio : integer;

 begin
  if iImport.Picture.Width = iImport.Picture.Height then begin
    cbWidth.ItemIndex  := iImport.Picture.Width - 1;
    cbHeight.ItemIndex := iImport.Picture.Height - 1;
  end
  else begin
    cbHeight.ItemIndex := iImport.Picture.Height - 1;

    lAspectRatio       := Round(iImport.Picture.Width / iImport.Picture.Height);

    cbWidth.ItemIndex  := Round((iImport.Picture.Width / lAspectRatio) - 1);

    eFrames.Text       := IntToStr(lAspectRatio);
  end;
end;

end.
