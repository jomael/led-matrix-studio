object frmExportCode: TfrmExportCode
  Left = 0
  Top = 0
  Caption = 'Export Code'
  ClientHeight = 676
  ClientWidth = 946
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnConstrainedResize = FormConstrainedResize
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 225
    Height = 676
    Align = alLeft
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 10
      Top = 8
      Width = 201
      Height = 57
      Caption = 'Platforms'
      TabOrder = 0
      object cbPlatforms: TComboBox
        Left = 16
        Top = 20
        Width = 169
        Height = 21
        Style = csDropDownList
        ItemHeight = 0
        TabOrder = 0
        OnChange = cbPlatformsChange
      end
    end
    object GroupBox2: TGroupBox
      Left = 10
      Top = 71
      Width = 201
      Height = 57
      Caption = 'Code Template'
      TabOrder = 1
      object cbCode: TComboBox
        Left = 16
        Top = 20
        Width = 169
        Height = 21
        Style = csDropDownList
        ItemHeight = 0
        TabOrder = 0
        OnChange = cbCodeChange
      end
    end
    object GroupBox3: TGroupBox
      Left = 15
      Top = 134
      Width = 196
      Height = 283
      Caption = 'Settings'
      TabOrder = 2
      object Label1: TLabel
        Left = 8
        Top = 24
        Width = 39
        Height = 13
        Caption = 'Source'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lSource: TLabel
        Left = 78
        Top = 24
        Width = 4
        Height = 13
        Caption = '.'
      end
      object Label3: TLabel
        Left = 8
        Top = 83
        Width = 20
        Height = 13
        Caption = 'LSB'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lLSB: TLabel
        Left = 78
        Top = 83
        Width = 4
        Height = 13
        Caption = '.'
      end
      object Label5: TLabel
        Left = 8
        Top = 102
        Width = 41
        Height = 13
        Caption = 'Format'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lFormat: TLabel
        Left = 78
        Top = 102
        Width = 4
        Height = 13
        Caption = '.'
      end
      object lNumbers: TLabel
        Left = 78
        Top = 121
        Width = 4
        Height = 13
        Caption = '.'
      end
      object Label8: TLabel
        Left = 8
        Top = 121
        Width = 50
        Height = 13
        Caption = 'Numbers'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lGrouping: TLabel
        Left = 78
        Top = 140
        Width = 4
        Height = 13
        Caption = '.'
      end
      object Label10: TLabel
        Left = 8
        Top = 140
        Width = 51
        Height = 13
        Caption = 'Grouping'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lOutput: TLabel
        Left = 78
        Top = 159
        Width = 4
        Height = 13
        Caption = '.'
      end
      object Label12: TLabel
        Left = 8
        Top = 159
        Width = 39
        Height = 13
        Caption = 'Output'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lRGB: TLabel
        Left = 78
        Top = 178
        Width = 4
        Height = 13
        Caption = '.'
      end
      object Label14: TLabel
        Left = 8
        Top = 178
        Width = 23
        Height = 13
        Caption = 'RGB'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 8
        Top = 45
        Width = 51
        Height = 13
        Caption = 'Direction'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 8
        Top = 64
        Width = 27
        Height = 13
        Caption = 'Scan'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lDirection: TLabel
        Left = 78
        Top = 45
        Width = 4
        Height = 13
        Caption = '.'
      end
      object lScan: TLabel
        Left = 78
        Top = 64
        Width = 4
        Height = 13
        Caption = '.'
      end
      object Label6: TLabel
        Left = 8
        Top = 209
        Width = 56
        Height = 13
        Caption = 'Min Width'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 8
        Top = 228
        Width = 60
        Height = 13
        Caption = 'Max Width'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label9: TLabel
        Left = 8
        Top = 247
        Width = 60
        Height = 13
        Caption = 'Min Height'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label11: TLabel
        Left = 8
        Top = 266
        Width = 64
        Height = 13
        Caption = 'Max Height'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lMinWidth: TLabel
        Left = 78
        Top = 209
        Width = 4
        Height = 13
        Caption = '.'
      end
      object lMaxWidth: TLabel
        Left = 78
        Top = 228
        Width = 4
        Height = 13
        Caption = '.'
      end
      object lMinHeight: TLabel
        Left = 78
        Top = 247
        Width = 4
        Height = 13
        Caption = '.'
      end
      object lMaxHeight: TLabel
        Left = 78
        Top = 266
        Width = 4
        Height = 13
        Caption = '.'
      end
    end
    object sbSave: TBitBtn
      Left = 15
      Top = 431
      Width = 196
      Height = 25
      Caption = 'Save'
      TabOrder = 3
      OnClick = sbSaveClick
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        18000000000000060000C21E0000C21E00000000000000000000D8AB8ECD9570
        BD7342B76835B56835B46734B26634B06533AE6433AC6332AA6232A96132A860
        31A76132AB693CBC8661A8A8A893939371717167676766666666666665656564
        64646363636262626161616060605F5F5F606060676767838383C37D4FEBC6AD
        EAC5ADFEFBF8FEFBF8FEFBF8FEFBF8FEFBF8FEFBF8FEFBF8FEFBF8FEFBF8FEFB
        F8C89A7CC79879AD6B407B7B7BC4C4C4C3C3C3FBFBFBFBFBFBFBFBFBFBFBFBFB
        FBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFB989898969696696969BA6C38EDCAB3
        E0A27AFEFAF762C08862C08862C08862C08862C08862C08862C08862C088FDF9
        F6CA8D65C99B7CA761326A6A6AC8C8C89F9F9FFAFAFAB1B1B1B1B1B1B1B1B1B1
        B1B1B1B1B1B1B1B1B1B1B1B1B1B1F9F9F98A8A8A989898606060BB6C38EECCB6
        E1A27AFEFAF7BFDCC2BFDCC2BFDCC2BFDCC2BFDCC2BFDCC2BFDCC2BFDCC2FDF9
        F6CD9068CC9E81A861326B6B6BCACACA9F9F9FFAFAFAD6D6D6D6D6D6D6D6D6D6
        D6D6D6D6D6D6D6D6D6D6D6D6D6D6F9F9F98D8D8D9C9C9C606060BB6B38EFCEB8
        E1A279FEFAF762C08862C08862C08862C08862C08862C08862C08862C088FDF9
        F6CF936ACEA384AA61326A6A6ACCCCCC9F9F9FFAFAFAB1B1B1B1B1B1B1B1B1B1
        B1B1B1B1B1B1B1B1B1B1B1B1B1B1F9F9F9909090A0A0A0606060BA6A36EFD0BB
        E2A27AFEFBF8FEFBF8FEFBF8FEFBF8FEFBF8FEFBF8FEFBF8FEFBF8FEFBF8FEFB
        F8D3966DD2A78AAB6232696969CECECE9F9F9FFBFBFBFBFBFBFBFBFBFBFBFBFB
        FBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFB939393A4A4A4616161BB6A36F0D2BE
        E2A37AE2A37AE1A37AE2A37BE1A37BE0A178DE9F77DD9F76DC9D74D99B72D899
        71D69970D5AB8EAD6333696969D0D0D0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A09E
        9E9E9C9C9C9C9C9C9A9A9A989898979797969696A8A8A8626262BB6A36F2D5C2
        E3A37AE3A37AE2A37BE2A37BE2A47BE1A279E0A178DEA077DE9E75DC9D74DA9B
        73D99B73DAB095AF6433696969D3D3D3A0A0A0A0A0A0A0A0A0A0A0A0A1A1A19F
        9F9F9E9E9E9D9D9D9B9B9B9A9A9A999999989898AEAEAE636363BB6A36F2D8C5
        E3A47BE3A37AE3A47AE2A47BE2A37BE1A37BE1A279DFA077DE9F76DD9E74DB9C
        72DC9D74DDB59AB16534696969D6D6D6A1A1A1A0A0A0A1A1A1A1A1A1A0A0A0A0
        A0A09F9F9F9D9D9D9C9C9C9B9B9B9999999A9A9AB2B2B2646464BB6B36F4D9C7
        E6A67DC88C64C98D65C98E67CB926CCB926DCA9069C88C65C88C64C88C64C88C
        64DA9C74E1BA9FB366346A6A6AD7D7D7A3A3A38989898A8A8A8B8B8B8F8F8F90
        90908D8D8D8A8A8A898989898989898989999999B7B7B7656565BB6C37F4DCC9
        E7A77DF9ECE1F9ECE1F9EDE3FCF4EEFDFAF7FDF7F3FAEDE5F7E7DBF7E5D9F6E5
        D8DEA077E4BEA4B467346B6B6BDADADAA4A4A4EBEBEBEBEBEBECECECF4F4F4FA
        FAFAF7F7F7EDEDEDE6E6E6E4E4E4E4E4E49D9D9DBBBBBB666666BD6E3AF5DDCC
        E7A87EFAF0E8FAF0E8C98D66FAF0E9FDF8F3FEFAF8FCF4EFF9E9DFF7E7DBF7E5
        D9E0A278E7C2A9B668356C6C6CDBDBDBA5A5A5EFEFEFEFEFEF8B8B8BF0F0F0F8
        F8F8FAFAFAF4F4F4E8E8E8E6E6E6E4E4E49F9F9FC0C0C0676767C07442F6DFD0
        E8A87EFCF6F1FCF6F1C88C64FAF1E9FBF4EEFDFAF7FDF9F6FAF0E8F8E8DDF7E6
        DBE1A37AEFD5C3B76A36727272DDDDDDA5A5A5F6F6F6F6F6F6898989F0F0F0F4
        F4F4FAFAFAF9F9F9EFEFEFE7E7E7E5E5E5A0A0A0D3D3D3686868C68255F6DFD1
        E9AA80FEFAF6FDFAF6C88C64FBF3EEFBF1EAFCF6F2FEFBF8FCF6F1F9ECE2F8E7
        DBEED0BAECD0BDBD7443808080DEDEDEA7A7A7FAFAFAFAFAFA898989F3F3F3F1
        F1F1F6F6F6FBFBFBF6F6F6EBEBEBE6E6E6CDCDCDCECECE727272D6A585F6E0D1
        F7E0D1FEFBF8FEFBF7FDF9F6FCF5F0FAF0EAFBF2EDFDF9F6FDFAF7FBF1EBF8E9
        DFECD1BECD926AE2C5B1A3A3A3DEDEDEDEDEDEFBFBFBFBFBFBF9F9F9F5F5F5F0
        F0F0F2F2F2F9F9F9FAFAFAF1F1F1E8E8E8CFCFCF8F8F8FC3C3C3E1BDA6D9AB8D
        C9895EC07543BD6E3ABB6C37BB6B36BB6A36BB6A36BC6C39BD6E3BBB6D3ABF74
        44C98D65E7CEBCFFFFFFBBBBBBA8A8A88686867373736C6C6C6B6B6B6A6A6A69
        69696969696B6B6B6D6D6D6B6B6B7373738A8A8ACCCCCCFFFFFF}
      NumGlyphs = 2
    end
    object sbCopyToClipboard: TBitBtn
      Left = 15
      Top = 462
      Width = 196
      Height = 25
      Caption = 'Copy to Clipboard'
      TabOrder = 4
      OnClick = sbCopyToClipboardClick
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C21E0000C21E00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFD39570CC8357C87646CA7B4ECB7B4ECA7B4ECA7B
        4ECA7B4ECA8155CD865CFF00FF4A80AB206398206398206398206398C98F67FC
        F3ECFAF1E8FAF0E7FBF1E9FBF2EAFBF2EAFBF2EBFDF4EECB83585588B174ADD8
        7BB2DD78AEDC75AADA74A9DADAA97DEFF1E7FFE9D9FFEADBFFE9D9FFE7D7FFE5
        D2FFE2CBEFF2E8CE815620639880B9E15395D15092D04E8ECE4D8CCDD6A97DFB
        F5EEFFE9D9FFEADBFFE9D9FFE7D7FFE5D2FFE2CBFBF6EFCC835620639884BFE2
        569AD35397D15092CF5091CFD6A97DFFF7F1FFE9D9FFEADBFFE9D9FFE7D7FFE5
        D2FFE2CBFFF7F1CB855620639888C4E6599FD6569BD35397D15395D1D7AC7FFF
        F7F0FFE7D5FDE7D6FDE6D4FCE4D0FBE3CBFADCC2FEF3E8CC86572063988BC9E7
        5CA5D759A0D5579CD3569AD3D7AC7FFFF7F2FEE7D5FEE7D5FDE5D1FAE0CAF9DE
        C4F7D9BCFDF2E7CC875820639891CDE95FA9D95DA5D85AA0D6599FD6D8AD81FE
        F7F1FCE5D2FCE4D1FBE2CCF9DDC4F6D7BBF3D1AFFAEFE4CC875920639898D2EB
        65AEDA60AAD95DA6D85CA5D7D9AF84FEF6F0FCE2CDFCE3CDFADFC8F7D9BCF5E9
        DDFAF3EBFBF8F3CA83542063989ED6ED6BB2DC66AFDC60AADA5FA9D9D9AF84FE
        F5EDFCDEC5FBE0C7F9DCC2F5D3B4FEF9F3FAE2C4ECC193D2986E206398A5DAEF
        6FB5DE68B0DC60A9D95FA9D9D7AD81FFFFFEFDF3E9FDF3EAFCF2E8FAEFE3FAF2
        E7EABB88D39469FF00FF206398AADDF174B9E070B6DF6CB3DD6BB2DCD9AF84D7
        AE81D7AC7FD7AC7FCCA070CD9F71B38F67D39B71FF00FFFF00FF206398B0E1F2
        79BDE24498DD4497DC4396DC4296DC4295DC4195DB539ED489C6E6206398FF00
        FFFF00FFFF00FFFF00FF3B76A595C9E0AEE2F24E9DDFB5EEFD75D4F075D4F0B5
        EEFD4B9BDE8ECBE993CDE92A6A9DFF00FFFF00FFFF00FFFF00FFFF00FF6392B7
        2063983775A4B6EFFE80DBF380DBF3B6EFFE2E6EA12063986F9ABCFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF20639820639820639820639820
        63982D6C9EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
    object BitBtn1: TBitBtn
      Left = 15
      Top = 509
      Width = 196
      Height = 25
      Cancel = True
      Caption = 'Close'
      TabOrder = 5
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C21E0000C21E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1313F20000F10000F100
        00F10000EF0000EF0000ED1212EEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF1313F61A20F53C4CF93A49F83847F83545F83443F73242F7141BF11717
        EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1313F81D23F94453FA2429F91212F70F
        0FF60C0CF50909F5161BF53343F7141BF11717EFFFFFFFFFFFFFFFFFFF1313F9
        1F25FA4A58FB4247FBC9C9FD3B3BF91313F71010F63333F7C5C5FD3035F73444
        F7141BF21717EFFFFFFFFFFFFF0000FB4F5DFD3237FBCBCBFEF2F2FFEBEBFE3B
        3BF93939F8EAEAFEF1F1FEC5C5FD181DF63343F70000EFFFFFFFFFFFFF0000FD
        525FFD2828FC4747FCECECFFF2F2FFECECFFECECFEF1F1FFEAEAFE3434F70B0B
        F53545F80000EFFFFFFFFFFFFF0000FD5562FE2C2CFD2929FC4848FCEDEDFFF2
        F2FFF2F2FFECECFE3A3AF91212F70F0FF63848F80000F1FFFFFFFFFFFF0000FD
        5764FE3030FD2D2DFD4B4BFCEDEDFFF2F2FFF2F2FFECECFF3D3DF91616F81313
        F73C4BF80000F1FFFFFFFFFFFF0000FF5A67FE3333FE5050FDEDEDFFF3F3FFED
        EDFFEDEDFFF2F2FFECECFE3E3EFA1717F83F4EF90000F1FFFFFFFFFFFF0000FF
        5B68FF4347FECFCFFFF3F3FFEDEDFF4C4CFC4A4AFCECECFFF2F2FFCACAFE2A2F
        FA4251FA0000F3FFFFFFFFFFFF1414FF262BFF5D6AFF585BFFCFCFFF5252FE2F
        2FFD2C2CFD4B4BFCCCCCFE484CFB4957FB1D23F91414F6FFFFFFFFFFFFFFFFFF
        1414FF262BFF5D6AFF4347FF3434FE3232FE3030FD2D2DFD383CFC4F5DFC1F25
        FA1414F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1414FF262BFF5C69FF5B68FF5A
        67FE5865FE5663FE5461FE2227FC0D0DFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF1313FF0000FF0000FF0000FF0000FD0000FD0000FD1313FDFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    end
  end
  object Memo1: TMemo
    Left = 225
    Top = 0
    Width = 721
    Height = 676
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object sdExportCode: TSaveDialog
    Left = 224
    Top = 16
  end
end
