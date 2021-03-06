// ===================================================================
//
// (c) Paul Alan Freshney 2012-2016
// www.freshney.org :: paul@freshney.org :: maximumoctopus.com
//
// www.MaximumOctopus.com/electronics/builder.htm
//
// Please do not redistribute the source code!
//
//   Started: May 27th 2015
//  Modified: June 3rd 2015
//
// ===================================================================

unit preferences;

interface

uses
  Windows, Messages, System.UITypes, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons;

type
  TfrmPreferences = class(TForm)
    lShapeOn3: TLabel;
    ShapeOn3: TShape;
    lShapeOn2: TLabel;
    ShapeOn2: TShape;
    lShapeOn1: TLabel;
    ShapeOn1: TShape;
    lShapeOff: TLabel;
    ShapeOff: TShape;
    Label6: TLabel;
    ShapeSelection: TShape;
    Label7: TLabel;
    ShapeLightBox: TShape;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Bevel1: TBevel;
    colorDialogPrefs: TColorDialog;
    Image1: TImage;
    procedure ShapeOffMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPreferences: TfrmPreferences;

function DoPrefs: word;

implementation

{$R *.dfm}

uses utility;

function DoPrefs: word;
begin
  with TfrmPreferences.Create(Application) do
    try
      ShapeOff.Brush.Color       := MatrixMain.LEDColours[0];
      ShapeOn1.Brush.Color       := MatrixMain.LEDColours[1];
      ShapeOn2.Brush.Color       := MatrixMain.LEDColours[2];
      ShapeOn3.Brush.Color       := MatrixMain.LEDColours[3];
      ShapeSelection.Brush.Color := MatrixMain.LEDColours[4];
      ShapeLightBox.Brush.Color  := MatrixMain.LEDColours[5];

      ShowModal;

      if ModalResult = mrOK then begin
        MatrixMain.LEDColours[0] := ShapeOff.Brush.Color;
        MatrixMain.LEDColours[1] := ShapeOn1.Brush.Color;
        MatrixMain.LEDColours[2] := ShapeOn2.Brush.Color;
        MatrixMain.LEDColours[3] := ShapeOn3.Brush.Color;
        MatrixMain.LEDColours[4] := ShapeSelection.Brush.Color;
        MatrixMain.LEDColours[5] := ShapeLightBox.Brush.Color;

        MatrixMain.CopyLEDColours;
      end;

      Result := ModalResult;
    finally
      Free;
    end;
end;

procedure TfrmPreferences.ShapeOffMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if colorDialogPrefs.Execute then begin
    TShape(Sender).Brush.Color := colorDialogPrefs.Color;
  end;
end;

end.
