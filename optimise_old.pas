// ===================================================================
//
// (c) Paul Alan Freshney 2013
// www.freshney.org :: paul@freshney.org
//
// Please do not redistribute the source code!
//
//   Started: June 17th 2013
//  Modified: July 17th 2013
//
//
// ===================================================================


unit optimise_old;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons;

type
  TfrmOptimise = class(TForm)
    sbRows: TSpeedButton;
    sbColumns: TSpeedButton;
    Bevel1: TBevel;
    SpeedButton3: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    lBefore: TLabel;
    lAfter: TLabel;
    lbUnique: TListBox;
    Label3: TLabel;
    mMemo: TMemo;
    SpeedButton1: TSpeedButton;
    lUniqueCount: TLabel;
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    MaxFrames : integer;
    HexFormat : boolean;
    ColumnsLSB, RowsLSB : integer;
    ExportFormat : integer;
    ColumnsDirection : integer;
    XType : integer;
    beforeData, afterData : integer;
  end;

var
  frmOptimise: TfrmOptimise;

implementation

uses utility;

{$R *.dfm}

procedure TfrmOptimise.SpeedButton1Click(Sender: TObject);
 begin
  mMemo.CopyToClipboard;
end;

procedure TfrmOptimise.SpeedButton3Click(Sender: TObject);
 var
  matrixData : TStringList;
  x,y,t,i,total : integer;
  s : string;
  ledata : string;
  bpf : integer;

 begin
  matrixData:=TStringList.Create;
  lbUnique.Clear;
 
  HexFormat  :=True;
  ColumnsLSB :=0;
  RowsLSB    :=0;
  total      :=0;

  if sbRows.Down then
    XType := SaveTypeRows
  else
    XType := SaveTypeColumns;

  // ===========================================================================
  // ===========================================================================
  // ===========================================================================

  case MaxHeight of
     0..7  : bpf:=1;
     8..15 : bpf:=2;
    16..23 : bpf:=3;
    24..31 : bpf:=4;
    32..39 : bpf:=5;
    40..47 : bpf:=6;
    48..55 : bpf:=7;
    56..63 : bpf:=8;
  else
    bpf:=0;
  end;

  beforeData:=(bpf * (MaxWidth+1)) * (MaxFrames);

  lBefore.Caption:=IntToStr(beforeData)+' bytes.';

  // ===========================================================================
  // ===========================================================================
  // ===========================================================================

  for t := 1 to MaxFrames do begin

    if xtype = SaveTypeColumns then begin
      for x := 0 to MaxWidth do begin
        ledata:=GetColumnData(HexFormat, ColumnsLSB, t, x);

        s:=HexPrefix+ledata;

        if matrixData.IndexOf(s)=-1 then
          matrixData.Add(s);
      end;
    end
    else if XType = SaveTypeRows then begin
      for y:=0 to MaxHeight do begin
        ledata:=GetRowData(HexFormat, RowsLSB, t, y);

        s:=HexPrefix+ledata;

        if matrixData.IndexOf(s)=-1 then
          matrixData.Add(s);
      end;
    end;
  end;

  // ===========================================================================
  // ===========================================================================
  // ===========================================================================

  if XType = SaveTypeRows then
    y := MaxWidth
  else
    y := MaxHeight;

  case y of
     0..7  : bpf:=1;
     8..15 : bpf:=2;
    16..23 : bpf:=3;
    24..31 : bpf:=4;
    32..39 : bpf:=5;
    40..47 : bpf:=6;
    48..55 : bpf:=7;
    56..63 : bpf:=8;
  else
    bpf:=0;
  end;

  // number of bytes required to store actual unique data
  total:=(matrixData.Count*bpf);

  // number of bytes required to store lookup table, one item per frame
  if XType = SaveTypeRows then begin
    if matrixData.Count<256 then
      total:=total+(MaxFrames*(MaxHeight+1))
    else if MatrixData.Count<65536 then
      total:=total+(2*(MaxFrames*(MaxHeight+1))); // 2 bytes per lookup data index
  end
  else if XType = SaveTypeColumns then begin
    if matrixData.Count<256 then
      total:=total+(MaxFrames*(MaxWidth+1))
    else if MatrixData.Count<65536 then
      total:=total+(2*(MaxFrames*(MaxWidth+1)));  // 2 bytes per lookup data index
  end;

  afterData:=total;

  lAfter.Caption:=IntToStr(total)+' bytes';

  matrixData.Sort;

  for t:=0 to matrixData.Count-1 do
    lbUnique.Items.Add(matrixData[t]);

  lUniqueCount.Caption:='('+IntToStr(matrixData.Count)+')';

  // ===========================================================================
  // ===========================================================================
  // ===========================================================================

  if (afterData<beforeData) then begin

    mMemo.Clear;
    mMemo.Lines.Add('// == data ==================================');
    mMemo.Lines.Add('data[] = {');

    s:='';
    for x:=0 to lbUnique.Count-1 do begin
      if x=lbUnique.Count-1 then
        s:=s+lbUnique.Items[x]
      else
        s:=s+lbUnique.Items[x]+', ';

      if x mod 10 = 9 then begin
        mMemo.Lines.Add(s);
        s:='';
      end;
    end;

    if s<>'' then
      mMemo.Lines.Add(s);

    mMemo.Lines.Add('};');

    mMemo.Lines.Add('');
    mMemo.Lines.Add('// == lookup ================================');
    mMemo.Lines.Add('lookup[] = {');

    // ===========================================================================
    // ===========================================================================
    // ===========================================================================

    for t := 1 to MaxFrames do begin

      if xtype = SaveTypeColumns then begin
        s:='';

        for x := 0 to MaxWidth do begin
          ledata:=GetColumnData(HexFormat, ColumnsLSB, t, x);

          i:=matrixData.IndexOf(HexPrefix+ledata);

          if x = MaxWidth then
            s:=s+IntToStr(i)
          else
            s:=s+IntToStr(i)+', ';
        end;
      end
      else if XType = SaveTypeRows then begin
        s:='';

        for y:=0 to MaxHeight do begin
          ledata:=GetRowData(HexFormat, RowsLSB, t, y);

          i:=matrixData.IndexOf(HexPrefix+ledata);

          if y = MaxHeight then
            s:=s+IntToStr(i)
          else
            s:=s+IntToStr(i)+', ';
        end;
      end;

      mMemo.Lines.Add(s);
    end;

    mMemo.Lines.Add('};');
  end
  else begin
    mMemo.Lines.Add('Unable to optimise!');
  end;

  // ===========================================================================
  // ===========================================================================
  // ===========================================================================

  matrixData.Free;
end;

end.
