// ===================================================================
//
// (c) Paul Alan Freshney 2012-2016
// www.freshney.org :: paul@freshney.org :: maximumoctopus.com
//
// www.MaximumOctopus.com/electronics/builder.htm
//
// Please do not redistribute the source code!
//
//   Started: November 1st 2014
//  Modified: January 1st 2016
//
// ===================================================================

unit newproject;

interface

uses
  Windows, Messages, System.UITypes, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, utility, ExtCtrls, ComCtrls;

type
  TfrmNewProject = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    Label4: TLabel;
    ComboBox7: TComboBox;
    ComboBox8: TComboBox;
    ComboBox9: TComboBox;
    Label3: TLabel;
    Label5: TLabel;
    Bevel19: TBevel;
    pcNew: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    cbHeight: TComboBox;
    cbWidth: TComboBox;
    cbMatrixType: TComboBox;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    cbPresets: TComboBox;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    Label8: TLabel;
    ComboBox5: TComboBox;
    ComboBox6: TComboBox;
    ComboBox10: TComboBox;
    cbClearAll: TCheckBox;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    lPresetType: TLabel;
    lPresetWidth: TLabel;
    lPresetHeight: TLabel;
    cbFrames: TComboBox;
    rbCommon: TRadioButton;
    rbAll: TRadioButton;
    GroupBox7: TGroupBox;
    GroupBox8: TGroupBox;
    Label10: TLabel;
    ComboBox4: TComboBox;
    ComboBox11: TComboBox;
    ComboBox12: TComboBox;
    shapeSquare: TShape;
    shapeCircle: TShape;
    rbPixelSquare: TRadioButton;
    rbPixelCircle: TRadioButton;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure cbPresetsChange(Sender: TObject);
    procedure rbCommonClick(Sender: TObject);
    procedure shapeSquareMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    FOldWidth  : string;
    FOldHeight : string;

    procedure BuildPresetList;
    procedure LoadPreset(filename : string);
  public
    { Public declarations }
  end;

var
  frmNewProject: TfrmNewProject;

function DoNewProject(oldsettings : TProjectSettings; appstatus : boolean): TProjectSettings;

implementation

{$R *.dfm}

uses xglobal;


const CCommonSizes : array[1..15] of string = ('1', '2', '4', '5', '7', '8', '12', '16', '24', '32', '48', '60', '64', '128', '256');


var
 clearstatus : boolean;


function DoNewProject(oldsettings : TProjectSettings; appstatus : boolean): TProjectSettings;
 begin
  with TfrmNewProject.Create(Application) do begin
    try
      Result.mtype  := -1;
      Result.width  := -1;
      Result.height := -1;
      Result.clear  := False;

      if oldsettings.pixel = 0 then
        rbPixelSquare.Checked := True
      else
        rbPixelCircle.Checked := True;

      clearstatus   := appstatus;

      cbMatrixType.ItemIndex := oldsettings.mtype;

      // ===========================================================================

      FOldWidth  := IntToStr(oldsettings.width);
      FOldHeight := IntToStr(oldsettings.height);

      if Result.sizetype then
        rbCommon.Checked := True
      else
        rbAll.Checked    := True;

      rbCommonClick(Nil);

      // ===========================================================================

      BuildPresetList;

      ShowModal;

      if ModalResult = mrOK then begin
        if pcNew.ActivePageIndex = 0 then begin
          Result.mtype   := cbMatrixType.ItemIndex;
          Result.width   := StrToInt(cbWidth.Text);
          Result.height  := StrToInt(cbHeight.Text);
        end
        else begin
          Result.mtype   := lPresetType.Tag;
          Result.width   := StrToInt(lPresetWidth.Caption);
          Result.height  := StrToInt(lPresetHeight.Caption);
        end;

        Result.clear    := cbClearAll.Checked;
        Result.special  := StrToInt(cbFrames.Text);

        if rbPixelSquare.Checked then
          Result.pixel := 0
        else
          Result.pixel := 1;

        if rbCommon.Checked then
          Result.sizetype := True
        else
          Result.sizetype := False;
      end;
    finally
      Free;
    end;
  end;
end;

procedure TfrmNewProject.BitBtn1Click(Sender: TObject);
 begin
  if ValidateNumber(cbFrames.Text, 1000) then begin
    if clearstatus then begin   
      if cbClearAll.Checked then begin
        if MessageDlg('Are you sure you want to delete the current matrix?', mtWarning, [mbYes, mbNo], 0) = mrYes then
          ModalResult := mrOK;
      end
      else
        ModalResult := mrOK;
    end
    else
      ModalResult := mrOK;
  end
  else begin
    cbFrames.SelectAll;
    cbFrames.SetFocus;
  end;
end;

procedure TfrmNewProject.FormCreate(Sender: TObject);
begin
  cbMatrixType.Items.Add('Single colour');
  cbMatrixType.Items.Add('Bi-colour (sequential)');
  cbMatrixType.Items.Add('Bi-colour (bitplanes)');
  cbMatrixType.Items.Add('RGB :)');
  cbMatrixType.ItemIndex := 0;

  cbFrames.Items.Add('1');
  cbFrames.Items.Add('2');
  cbFrames.Items.Add('4');
  cbFrames.Items.Add('5');
  cbFrames.Items.Add('10');
  cbFrames.Items.Add('16');
  cbFrames.Items.Add('20');
  cbFrames.Items.Add('25');  
  cbFrames.Items.Add('50');
  cbFrames.Items.Add('100');
end;

procedure TfrmNewProject.BuildPresetList;
 var
  searchResult : TSearchRec;

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
    repeat
      cbPresets.Items.Add(RemoveExtension(searchResult.Name));
    until FindNext(searchResult) <> 0;

    // Must free up resources used by these successful finds
    FindClose(searchResult);

    cbPresets.Enabled := True;

    cbPresets.ItemIndex := 0;
    cbPresetsChange(Nil);
  end
  else begin
    cbPresets.Enabled := False;
  end;
end;

procedure TfrmNewProject.cbPresetsChange(Sender: TObject);
 begin
  LoadPreset(ExtractFilePath(Application.ExeName)+'presets\' + cbPresets.Text + '.ledspreset');
end;

procedure TfrmNewProject.LoadPreset(filename : string);
 var
  tf   : TextFile;
  s, v : string;

 begin
  AssignFile(tf, filename);
  Reset(tf);

  while not(eof(tf)) do begin
    readln(tf, s);

    if s <> '' then begin
      v := Copy(s, 3, length(s) - 2);

      case GetPresetParameterType(s) of
        2 : lPresetWidth.Caption  := v;
        3 : lPresetHeight.Caption := v;
        9 : begin
              case StrToInt(v) of
                psTypeMono          : lPresetType.Caption := 'Single colour';
                psTypeBiSequential  : lPresetType.Caption := 'Bi-colour (sequential)';
                psTypeBiBitPlanes   : lPresetType.Caption := 'Bi-colour (bitplanes)';
                psTypeRGB           : lPresetType.Caption := 'RGB';
              end;

              lPresetType.Tag := StrToInt(v);
            end;
      end;
    end;
  end;

  CloseFile(tf);
end;


procedure TfrmNewProject.rbCommonClick(Sender: TObject);
var
  x : integer;

begin
  cbWidth.Clear;
  cbHeight.Clear;

  if rbAll.Checked then begin
    for x:=1 to 256 do begin
      cbWidth.Items.Add(IntToStr(x));
      cbHeight.Items.Add(IntToStr(x));
    end;

    cbWidth.ItemIndex  := cbWidth.Items.IndexOf(FOldWidth);
    cbHeight.ItemIndex := cbHeight.Items.IndexOf(FOldHeight);
  end
  else begin
    for x:=1 to 15 do begin
      cbWidth.Items.Add(CCommonSizes[x]);
      cbHeight.Items.Add(CCommonSizes[x]);
    end;

    cbWidth.ItemIndex  := cbWidth.Items.IndexOf(FOldWidth);
    cbHeight.ItemIndex := cbHeight.Items.IndexOf(FOldHeight);

    if cbWidth.ItemIndex = -1 then
      cbWidth.ItemIndex := 7;

    if cbWidth.ItemIndex = -1 then
      cbWidth.ItemIndex := 7;
  end;

  FOldWidth  := cbWidth.Text;
  FOldHeight := cbHeight.Text;
end;


procedure TfrmNewProject.shapeSquareMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if TShape(Sender).Tag = 0 then
    rbPixelSquare.Checked := True
  else
    rbPixelCircle.Checked := True;
end;

end.
