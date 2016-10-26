object frmOptimise: TfrmOptimise
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Optimise (BETA)'
  ClientHeight = 422
  ClientWidth = 829
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object sbRows: TSpeedButton
    Left = 96
    Top = 8
    Width = 65
    Height = 22
    GroupIndex = 1
    Caption = 'Rows'
  end
  object sbColumns: TSpeedButton
    Left = 167
    Top = 8
    Width = 65
    Height = 22
    GroupIndex = 1
    Down = True
    Caption = 'Columns'
  end
  object Bevel1: TBevel
    Left = 8
    Top = 36
    Width = 803
    Height = 4
    Shape = bsTopLine
  end
  object SpeedButton3: TSpeedButton
    Left = 8
    Top = 8
    Width = 65
    Height = 22
    Caption = 'Optimise'
    OnClick = SpeedButton3Click
  end
  object Label1: TLabel
    Left = 8
    Top = 54
    Width = 80
    Height = 13
    Caption = 'Before Optimise:'
  end
  object Label2: TLabel
    Left = 8
    Top = 73
    Width = 73
    Height = 13
    Caption = 'After Optimise:'
  end
  object lBefore: TLabel
    Left = 104
    Top = 54
    Width = 4
    Height = 13
    Caption = '.'
  end
  object lAfter: TLabel
    Left = 104
    Top = 73
    Width = 4
    Height = 13
    Caption = '.'
  end
  object Label3: TLabel
    Left = 8
    Top = 109
    Width = 63
    Height = 13
    Caption = 'Unique Items'
  end
  object SpeedButton1: TSpeedButton
    Left = 280
    Top = 8
    Width = 81
    Height = 22
    Caption = 'Copy Output'
    OnClick = SpeedButton1Click
  end
  object lUniqueCount: TLabel
    Left = 86
    Top = 109
    Width = 4
    Height = 13
    Caption = '.'
  end
  object lbUnique: TListBox
    Left = 8
    Top = 128
    Width = 137
    Height = 276
    ItemHeight = 13
    Sorted = True
    TabOrder = 0
  end
  object mMemo: TMemo
    Left = 167
    Top = 46
    Width = 644
    Height = 358
    TabOrder = 1
  end
end
