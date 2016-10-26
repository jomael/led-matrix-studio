// ===================================================================
//
// (c) Paul Alan Freshney 2012-2016
// www.freshney.org :: paul@freshney.org :: maximumoctopus.com
//
// www.MaximumOctopus.com/electronics/builder.htm
//
// Please do not redistribute the source code!
//
//   Started: May 1st 2005
//  Modified: June 3rd 2015
//
// ===================================================================

unit checkversion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, StdCtrls, Buttons;

type
  TfrmCheckVersion = class(TForm)
    httpMain: TIdHTTP;
    BitBtn1: TBitBtn;
    bHistory: TBitBtn;
    mHistory: TMemo;
    bDownload: TBitBtn;
    Shape1: TShape;
    Label5: TLabel;
    bWebsite: TBitBtn;
    GroupBox2: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    GroupBox3: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    lIVDate: TLabel;
    lIVVersion: TLabel;
    lLADate: TLabel;
    lLAVersion: TLabel;
    GroupBox1: TGroupBox;
    lWhat: TLabel;
    procedure FormShow(Sender: TObject);
    procedure bHistoryClick(Sender: TObject);
    procedure bDownloadClick(Sender: TObject);
    procedure bWebsiteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCheckVersion: TfrmCheckVersion;

function CheckForNewVersion(cv,cd,appdat : string; autoclosemode : boolean): word;
function CheckForNewVersionSilent(cv,cd,appdat : string): word;

implementation

{$R *.dfm}

uses utility, Registry, checkupdatesplash;

var
 ApplicationVersionFile : string;
 AutoClose : boolean;

function CheckForNewVersion(cv,cd,appdat : string; autoclosemode : boolean): word;
 begin
  with TfrmCheckVersion.Create(Application) do
    try
      Result                 := mrOK;

      ApplicationVersionFile := appdat;

      autoclose              := autoclosemode;

      lIVDate.Caption        := cd;
      lIVVersion.Caption     := cv;

      ShowModal;

      Result := ModalResult;
    finally
      Free;
    end;
end;

function CheckForNewVersionSilent(cv,cd,appdat : string): word;
 var
  s : string;
  x : TStringList;
  doautocheck : boolean;
  Reg: TRegistry;

 begin
  with TfrmCheckVersion.Create(Application) do
    try
      Result := mrOK;

      Reg    := TRegistry.Create(KEY_READ);

      try
        Reg.RootKey := HKEY_CURRENT_USER;
        Reg.OpenKey('\software\freshney.org\MatrixBuilder', False);

        if Reg.ValueExists('Prefs_AutoCheckUpdate') then
          doautocheck := Reg.ReadBool('Prefs_AutoCheckUpdate')
        else
          doautocheck := False;
      finally
        Reg.Free;
      end;

      if doautocheck then begin

        frmUpdateSplash.Show;
        frmUpdateSplash.Refresh;

        ApplicationVersionFile := appdat;

        lIVDate.Caption    := cd;
        lIVVersion.Caption := cv;

        x := TStringList.Create;

        bHistory.Enabled := False;

        try
          s := httpMain.Get('http://www.maximumoctopus.com/versions/d' + ApplicationVersionFile);

          x.Text := s;

          if x.Count > 0 then begin
            lLADate.Caption    := x.Strings[0];
            lLAVersion.Caption := x.Strings[1];

            if (lLADate.Caption <> lIVDate.Caption) or
               (lLAVersion.Caption <> lIVVersion.Caption) then begin
              lWhat.Caption := 'A new version is available!';

              bDownload.Enabled  := True;

              frmUpdateSplash.Hide;

              ShowModal;

              Result:=ModalResult;
            end;
          end;
        except
        end;

        x.Free;

        frmUpdateSplash.Hide;        
      end;
  finally
    Free;
  end;
end;

procedure TfrmCheckVersion.FormShow(Sender: TObject);
 var
  s : string;
  x : TStringList;

 begin
  x := TStringList.Create;

  try
    s := httpMain.Get('http://www.maximumoctopus.com/versions/d' + ApplicationVersionFile);

    x.Text := s;

    lLADate.Caption    := x.Strings[0];
    lLAVersion.Caption := x.Strings[1];

    if (lLADate.Caption <> lIVDate.Caption) or
       (lLAVersion.Caption <> lIVVersion.Caption) then begin
      lWhat.Caption := 'A new version is available! :)';

      s := httpMain.Get('http://www.maximumoctopus.com/versions/h' + ApplicationVersionFile);

      mHistory.Text      := s;

      bDownload.Enabled  := True;
      bHistory.Enabled   := True;
    end
    else begin
      lWhat.Caption := 'No new version is available!';

      Close;
    end;
  except
    lLADate.Caption    := 'Error';
    lLAVersion.Caption := 'Error';

    lWhat.Caption      := 'Unable to connect to maximumoctopus.com :(';
  end;

  x.Free;
end;

procedure TfrmCheckVersion.bHistoryClick(Sender: TObject);
 begin
  if bHistory.Tag = 0 then begin
    bHistory.Tag     := 1;
    bHistory.Caption := 'History <<';
    ClientHeight     := 494;
  end
  else begin
    bHistory.Tag     := 0;
    bHistory.Caption := 'History >>';
    ClientHeight     := 271;
  end;
end;

procedure TfrmCheckVersion.bDownloadClick(Sender: TObject);
 begin
  ExecuteFile(0, 'http://www.maximumoctopus.com/electronics/downloads/LEDMatrixStudio.zip', '', '');
end;

procedure TfrmCheckVersion.bWebsiteClick(Sender: TObject);
 begin
  ExecuteFile(0, 'http://www.maximumoctopus.com/electronics/builder.htm', '', '');
end;

end.
