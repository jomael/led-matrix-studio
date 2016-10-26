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
//  Modified: June 3rd 2015
//
// ===================================================================

program LEDMatrixStudio;

uses
  Forms,
  main,
  about,
  checkversion,
  checkupdatesplash,
  importbitmap,
  exportcode;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TfrmAbout, frmAbout);
  Application.CreateForm(TfrmCheckVersion, frmCheckVersion);
  Application.CreateForm(TfrmUpdateSplash, frmUpdateSplash);
  Application.CreateForm(TfrmImportBitmap, frmImportBitmap);
  Application.CreateForm(TfrmExportCode, frmExportCode);
  Application.Run;
end.
