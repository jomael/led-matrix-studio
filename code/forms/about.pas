// ===================================================================
//
// (c) Paul Alan Freshney 2015
// www.freshney.org :: paul@freshney.org :: maximumoctopus.com
//
// www.MaximumOctopus.com/electronics/builder.htm
//
// Please do not redistribute the source code!
//
//   Started: June 10th 2012
//  Modified: June 3rd 2015
//
// ===================================================================

unit about;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, ExtCtrls;

type
  TfrmAbout = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lVersion: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    lDate: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    lUndos: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Label12Click(Sender: TObject);
    procedure Label13Click(Sender: TObject);
    function  ExecuteFile(bob : THandle; const FileName, Params, DefaultDir: string; ShowCmd: Integer): THandle;
    procedure Image1Click(Sender: TObject);
    procedure Label5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAbout: TfrmAbout;

implementation

{$R *.DFM}

uses ShellApi, utility;

procedure TfrmAbout.FormCreate(Sender: TObject);
 begin
  lDate.Caption    := LEDStudioDate;
  lVersion.Caption := 'LED Matrix Studio';
end;

procedure TfrmAbout.FormShow(Sender: TObject);
 begin
  lUndos.Caption := IntToStr(MatrixMain.GetTotalUndos) + ' undos';
end;

procedure TfrmAbout.Image1Click(Sender: TObject);
 begin
  Close;
end;

function TfrmAbout.ExecuteFile(bob : THandle; const FileName, Params, DefaultDir: string; ShowCmd: Integer): THandle;
 var
  zFileName, zParams, zDir: array[0..254] of Char;

 begin
  Result := ShellExecute(bob, nil, StrPCopy(zFileName, FileName), StrPCopy(zParams, Params), StrPCopy(zDir, DefaultDir), ShowCmd);
end;

procedure TfrmAbout.Label12Click(Sender: TObject);
 begin
  ExecuteFile(0, 'mailto:freeware@freshney.org', '', '', SW_SHOW);
end;

procedure TfrmAbout.Label13Click(Sender: TObject);
 begin
  ExecuteFile(0, LowerCase((Sender As TLabel).Caption), '', '', SW_SHOW);
end;

procedure TfrmAbout.Label5Click(Sender: TObject);
 begin
  ExecuteFile(0, 'http://maximumoctopus.com/electronics/builder.htm', '', '', SW_SHOW);
end;

end.
