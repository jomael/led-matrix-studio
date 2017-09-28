// ===================================================================
//
// (c) Paul Alan Freshney 2012-2016
// www.freshney.org :: paul@freshney.org :: maximumoctopus.com
//
// www.MaximumOctopus.com/electronics/builder.htm
//
// Please do not redistribute the source code!
//
//   Started: October 31st 2014
//  Modified: June 7th 2015
//
// ===================================================================

unit fontviewer;

interface

uses
  Windows, Messages, System.UITypes, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, thematrix, StdCtrls, ComCtrls, ExtCtrls;

type
  TfrmFontViewer = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    tbFont: TTrackBar;
    cbFonts: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    CheckBox1: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BuildFontList;
    procedure FormShow(Sender: TObject);
    procedure cbFontsChange(Sender: TObject);
    procedure tbFontChange(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    fLastFrame : integer;
  end;

var
 frmFontViewer: TfrmFontViewer;
 FontMatrix : TTheMatrix;

function ShowFontViewer: word;

implementation

{$R *.dfm}

uses utility, xglobal;

function ShowFontViewer: word;
 begin
  with TfrmFontViewer.Create(Application) do begin
    fLastFrame := -1;

    Show;

    Result := ModalResult;
  end;
end;

procedure TfrmFontViewer.FormCreate(Sender: TObject);
 begin
  DoubleBuffered := True;

  FontMatrix := TTheMatrix.Create(Self, Self);

  FontMatrix.NewMatrix(0, 1, 6, 150, 8, 8, 25, 0, True, True, True);

  FontMatrix.LEDColours[0]   := $00ffffff;
  FontMatrix.LEDColours[1]   := $00000000;

  FontMatrix.DrawData.Colour := 1;
  FontMatrix.RGBBackground   := $00FFFFFF;
end;

procedure TfrmFontViewer.FormShow(Sender: TObject);
 begin
  BuildFontList;

  cbFontsChange(Nil);
end;

procedure TfrmFontViewer.tbFontChange(Sender: TObject);
 begin
  if (tbFont.Position <> fLastFrame) then begin
    FontMatrix.ClearCurrentFrame;

    FontMatrix.DrawData.Coords[0].X := 0;
    FontMatrix.DrawData.Coords[0].Y := 7;

    FontMatrix.DrawFontCharacter(tbFont.Position - 32, 1);

    fLastFrame := tbFont.Position;
  end;
end;

procedure TfrmFontViewer.cbFontsChange(Sender: TObject);
 var
  s,temp : string;
  t : integer;

 begin
  temp := ExtractFilePath(Application.ExeName) + 'fonts\' + cbFonts.Items[cbFonts.ItemIndex] + '.ledsfont';
  s    := '';

  for t:=1 to length(temp) do
    if temp[t] <> '&' then
      s := s + temp[t];

  if FileExists(s) then begin
    FontMatrix.LoadFont(s);
  end
  else
    MessageDlg('Cannot find font!!', mtError, [mbOK], 0);

  fLastFrame := -1;

  tbFontChange(Nil);
end;

procedure TfrmFontViewer.CheckBox1Click(Sender: TObject);
 begin
  if CheckBox1.Checked then
    FontMatrix.NewMatrix(psTypeRGB, 1, 6, 150, 8, 8, 25, 0, True, True, True)
  else
    FontMatrix.NewMatrix(psTypeMono, 1, 6, 150, 8, 8, 25, 0, True, True, True);

  FontMatrix.DrawData.Colour    := 1;

  cbFontsChange(Nil);  
end;

procedure TfrmFontViewer.FormClose(Sender: TObject; var Action: TCloseAction);
 begin
  fontmatrix.Free;

  Action := caFree;
end;

procedure TfrmFontViewer.BuildFontList;
 var
  searchResult : TSearchRec;

 begin
  if FindFirst(ExtractFilePath(Application.ExeName) + 'fonts\*.ledsfont', faAnyFile, searchResult) = 0 then begin
    cbFonts.Clear;

    repeat
      cbFonts.Items.Add(RemoveExtension(searchResult.Name));
    until FindNext(searchResult) <> 0;

    FindClose(searchResult);
  end;

  cbFonts.ItemIndex := 0;  
end;

end.
