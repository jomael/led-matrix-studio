object frmImportBitmap: TfrmImportBitmap
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Import from bitmap'
  ClientHeight = 350
  ClientWidth = 616
  Color = clBtnFace
  DefaultMonitor = dmDesktop
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Shape1: TShape
    Left = 8
    Top = 39
    Width = 602
    Height = 66
  end
  object iImport: TImage
    Left = 9
    Top = 40
    Width = 600
    Height = 64
    Proportional = True
    Stretch = True
  end
  object Bevel1: TBevel
    Left = 8
    Top = 304
    Width = 602
    Height = 6
    Shape = bsTopLine
  end
  object lHelpText: TLabel
    Left = 8
    Top = 321
    Width = 249
    Height = 13
    Caption = 'White ($FFFFFF) is "off", every other colour is "on".'
  end
  object lFileName: TLabel
    Left = 88
    Top = 13
    Width = 96
    Height = 13
    Caption = 'No images selected.'
  end
  object BitBtn1: TBitBtn
    Left = 8
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Select'
    TabOrder = 0
    OnClick = BitBtn1Click
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000C21E0000C21E00000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF84B094257341196B
      3725734184B094FFFFFFFFFFFFD1B4A2BF9378AF7650AF744EAF744EAF744EAF
      744EAF744E616F42288C5364BA8D95D2B264BA8D288C5381AE91FFFFFFB27E5E
      EEECEAF7F2F0F8F3F0F8F3EFF7F3EFF7F2EFF7F2EE22703F62BA8B60BA87FFFF
      FF60B98767BC8F20703DFFFFFFAB6D46F6F0ECFDE8D7FEE8D7FEE8D7FEE8D7FE
      E8D7FEE8D7317B4C9CD4B6FFFFFFFFFFFFFFFFFF95D2B2196B37FFFFFFAB6D45
      F7F0EC816242AC8258AC8258AC8258AC8258AC825847875D90D3B192D6B1FFFF
      FF65BC8C67BC8F20703DFFFFFFAD6F46F7F0EBAC8258E5AD75E5AD75E5AD75E5
      AD75E5AD759B9E6E61AB8195D4B4BAE6D06ABB8F2D8F5781AE91FFFFFFAD6F46
      F7F1ECAC8258E5AD75E5AD75E5AD75E5AD75E5AD75E5AD75A1A1725F956E4F8E
      6649896071774DFFFFFFFFFFFFAD6F47F7F2EDA67F56DEAA73DEAA73DDA973DD
      A873DCA772DCA772DCA772DCA772A47D55F6EDE6AF7650FFFFFFFFFFFFAD6F47
      F7F3EE9C966EE6C79DE2C598DFC496C8BD88E4BA82E4BA83E4BA83D3C199A59A
      7BF6EDE6AF7650FFFFFFFFFFFFAD6F47F7F4EFB6A583F5DDB0F6DEB0F4DDAFF1
      DCADF3DAABF3DAACF2D9ABEFDAAEB4A584F4EEE6AF7650FFFFFFFFFFFFAD6F47
      F7F4F1BEAB88FEE5B5FDE4B5FDE4B5FDE4B5FDE4B5FDE4B5FDE4B5FDE4B5BEAB
      88F6EFE7AF7650FFFFFFFFFFFFAD6F47F7F4F3B6A481F2DCADF5DEB0F2DDAFF6
      DEAFF7DFAFF8E0B1FAE1B2FCE3B4BEAB88F7EFE8B07650FFFFFFFFFFFFAD7651
      F3F2F196815CA69E76A4A17DABA07ABAA27ABAA37CBAA47EBBA680BCA8838F80
      65F7F1EAB07650FFFFFFFFFFFFB28566DEDEDCF3F3F2F7F4F3F7F4F2F7F4F1F7
      F4EFF8F4EFF8F3EEF8F2EDF8F2EBF7F2EBF1EEE8AF7955FFFFFFFFFFFFD0B6A4
      B38367AD7651AD6F46AD6F46AD6F46AD6F46AD6F46AD6D46AD6D46AD6D46AD6D
      46AD744ECEB19DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
  end
  object bOK: TBitBtn
    Left = 454
    Top = 316
    Width = 75
    Height = 25
    Caption = 'OK'
    Enabled = False
    ModalResult = 1
    TabOrder = 1
    OnClick = bOKClick
    Glyph.Data = {
      36060000424D3606000000000000360000002800000020000000100000000100
      18000000000000060000C21E0000C21E00000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFE0EEE08FC0913B8D3F257A292577293B853F8FB991E0EBE0FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEBEBEBB7B7B77F7F7F6A
      6A6A686868787878B2B2B2E9E9E9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFB5D9B7318F3542A05287CA9A9BD3AB9BD2AB83C7963D974C307C34B5D0
      B6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3D3D37F7F7F8F8F8FBEBEBEC9
      C9C9C8C8C8BABABA8686866F6F6FCCCCCCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      B5DBBA258F2A6DBE83A8DBB587CC9866BC7D64BA7C86CB98A5D9B466B77D2472
      27B5D1B6FFFFFFFFFFFFFFFFFFFFFFFFD5D5D57D7D7DAFAFAFD1D1D1BFBFBFAD
      ADADABABABBEBEBECFCFCFA9A9A9656565CCCCCCFFFFFFFFFFFFFFFFFFE1F2E4
      33A14472C287A8DBB260BC775CBA7359B87059B56F58B56F5BB774A5D9B369B8
      7F317F35E1ECE1FFFFFFFFFFFFEFEFEF909090B3B3B3D0D0D0ABABABA9A9A9A7
      A7A7A4A4A4A4A4A4A7A7A7CFCFCFAAAAAA727272EAEAEAFFFFFFFFFFFF90D29F
      4CB064AADDB464C1795FBE7175C585D4ECD98ACD9956B66C58B56E5CB774A6DA
      B4419B4E8EBC90FFFFFFFFFFFFC8C8C89F9F9FD2D2D2B0B0B0ACACACB5B5B5E7
      E7E7C0C0C0A5A5A5A4A4A4A7A7A7D0D0D08A8A8AB4B4B4FFFFFFFFFFFF3FB55D
      91D29F8DD49A64C37479C987F2FAF4FFFFFFFDFEFD86CB9657B76D5BB97285CC
      9787C79A3B8B3FFFFFFFFFFFFFA3A3A3C5C5C5C6C6C6B1B1B1B9B9B9F9F9F9FF
      FFFFFEFEFEBEBEBEA6A6A6A8A8A8BFBFBFBBBBBB7D7D7DFFFFFFFFFFFF27B049
      A6DCAF70CA7F73CA80F0F9F1FFFFFFEBF7EDFFFFFFFBFDFC88CD965BB97167BE
      7DA0D7AF237F26FFFFFFFFFFFF9C9C9CD1D1D1B8B8B8B8B8B8F7F7F7FFFFFFF5
      F5F5FFFFFFFDFDFDBFBFBFA8A8A8AEAEAECDCDCD6E6E6EFFFFFFFFFFFF2EB751
      A7DDB172CC8066C773B0E1B7D2EED663C170B8E3BFFFFFFFFBFDFC8CD09969C1
      7EA1D7AE238426FFFFFFFFFFFFA2A2A2D2D2D2BABABAB4B4B4D6D6D6E7E7E7AF
      AFAFDADADAFFFFFFFDFDFDC2C2C2B1B1B1CCCCCC737373FFFFFFFFFFFF4BC56C
      95D7A191D79B69C97664C66F61C46E61C36F61C26FB9E4C0FFFFFFE3F4E68BD1
      998BCE9D3C993FFFFFFFFFFFFFB2B2B2C9C9C9C8C8C8B6B6B6B3B3B3B1B1B1B0
      B0B0AFAFAFDBDBDBFFFFFFF0F0F0C3C3C3C2C2C2898989FFFFFFFFFFFF9BDFAD
      57BF70AFE1B76DCC7A68C87265C77063C56E62C46E63C471B6E3BE6FC77EACDF
      B548A95E8FC894FFFFFFFFFFFFD4D4D4ADADADD6D6D6B9B9B9B5B5B5B4B4B4B2
      B2B2B1B1B1B1B1B1D9D9D9B6B6B6D4D4D4989898BEBEBEFFFFFFFFFFFFE5F7E9
      49C5667FCE90AEE1B56DCC7A6ACA7668C87268C87468C8756BC979ACDFB476C4
      8933A142E1F1E3FFFFFFFFFFFFF4F4F4B1B1B1BFBFBFD6D6D6B9B9B9B7B7B7B5
      B5B5B5B5B5B5B5B5B7B7B7D4D4D4B5B5B58F8F8FEEEEEEFFFFFFFFFFFFFFFFFF
      BFECCB3DC35C7FCE90AFE1B792D89D77CE8377CE8392D89DAEE1B578C88B27A1
      3BB5DFBEFFFFFFFFFFFFFFFFFFFFFFFFE5E5E5AEAEAEBFBFBFD6D6D6CACACABC
      BCBCBCBCBCCACACAD6D6D6B9B9B98E8E8ED9D9D9FFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFC0EDCB4AC86959C27496D7A3A5DCAEA5DCAE95D6A150B96A35B355B6E3
      C1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE6E6E6B4B4B4B0B0B0CACACAD0
      D0D0D0D0D0C9C9C9A6A6A6A0A0A0DCDCDCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFE5F8E99FE3B055CB723BC05C37BE5A49C36A97DCAAE1F5E7FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F5F5D8D8D8B8B8B8AB
      ABABA9A9A9B0B0B0D1D1D1F2F2F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    NumGlyphs = 2
  end
  object bCancel: TBitBtn
    Left = 535
    Top = 316
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
    OnClick = bCancelClick
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
  object GroupBox1: TGroupBox
    Left = 6
    Top = 119
    Width = 602
    Height = 178
    Caption = ' Import Settings '
    TabOrder = 3
    object Label2: TLabel
      Left = 14
      Top = 85
      Width = 81
      Height = 13
      Caption = 'Frames to import'
    end
    object Label3: TLabel
      Left = 59
      Top = 120
      Width = 28
      Height = 13
      Caption = 'Width'
    end
    object Label4: TLabel
      Left = 59
      Top = 153
      Width = 31
      Height = 13
      Caption = 'Height'
    end
    object Label1: TLabel
      Left = 506
      Top = 40
      Width = 28
      Height = 13
      Caption = 'Width'
    end
    object Label6: TLabel
      Left = 506
      Top = 73
      Width = 31
      Height = 13
      Caption = 'Height'
    end
    object lImageHeight: TLabel
      Left = 548
      Top = 73
      Width = 16
      Height = 13
      Caption = 'n/a'
    end
    object lImageWidth: TLabel
      Left = 548
      Top = 40
      Width = 16
      Height = 13
      Caption = 'n/a'
    end
    object Bevel2: TBevel
      Left = 488
      Top = 17
      Width = 4
      Height = 144
      Shape = bsLeftLine
    end
    object cbWidth: TComboBox
      Left = 116
      Top = 115
      Width = 60
      Height = 21
      Hint = 'Select matrix width'
      Style = csDropDownList
      ItemHeight = 0
      TabOrder = 0
    end
    object cbHeight: TComboBox
      Left = 117
      Top = 148
      Width = 59
      Height = 21
      Hint = 'Select matrix height'
      Style = csDropDownList
      ItemHeight = 0
      TabOrder = 1
    end
    object eFrames: TEdit
      Left = 116
      Top = 80
      Width = 60
      Height = 21
      TabOrder = 2
      Text = '1'
    end
    object bAuto: TBitBtn
      Left = 206
      Top = 126
      Width = 75
      Height = 25
      Caption = 'Auto'
      TabOrder = 3
      OnClick = bAutoClick
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C21E0000C21E00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFD8A37AD3996ED19668CE9263CB8E5EC98A5BC7
        8756C38452C38452C38452C38452C38452C38452C18454FF00FFFF00FFD7A175
        F8F2EDF7F0EAF6EDE6F4EAE2F3E7DEF1E4DBF0E2D8F0E2D8F0E2D8F0E2D8F0E2
        D8F0E2D8C58A5DFF00FFFF00FFD9A47AF9F3EEEBD2BEFFFFFFEBD3BFFFFFFFEB
        D3C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0E2D8C68C5FFF00FFFF00FFDDA87E
        F9F3EFEBD0BAEBD0BBEACDB5EACDB5EACDB5EBD1BDEACDB5EACDB5EACDB5EACD
        B5F0E2D8C68A5CFF00FFFF00FFDFAA82F9F3EFEACEB7FFFFFFEACDB5FFFFFFEA
        CDB5FFFFFFEACFBAFFFFFFEACDB5FFFFFFF0E2D8C88D5FFF00FFFF00FFE1AE87
        FAF4F0EACBB2EACCB3EACDB5EACDB5EACDB5EACDB5EACDB5EACDB5EACDB5E8C8
        AEF0E2D8C48654FF00FFFF00FFE3B18CFAF6F1EAC9AEFFFFFFEAC9B0FFFFFFE9
        CBB3FFFFFFEACDB5FFFFFFEACDB5FFFFFFF0E2D8C68655FF00FFFF00FFE5B48F
        FAF6F2E9C6AAE9C6ACEAC7ACE9C7ADE9C9AEE9C9B0EACDB5EACDB5EACDB5E8CC
        B5F0E2D8C88A59FF00FFFF00FFE7B794FBF7F4FFFFFFFFFFFFE8C4A9FFFFFFE9
        C6AAFFFFFFE8C7ACFFFFFFE8C8B0FFFFFFF7F1EBCB8F5FFF00FFFF00FFE9BA98
        FBF7F465A4FF64A3FF62A2FF61A1FF5F9FFF5C9DFF5A9AFF5798FF5495FF5294
        FFFBF7F4CE9364FF00FFFF00FFEBBD9BFBF7F464A4FF79BDFF75BBFF71B9FF6D
        B8FF68B3FF61B0FF5AABFF54A7FF3B7DFFFBF7F4D1976AFF00FFFF00FFECBF9E
        FBF7F465A4FF64A3FF60A0FF5D9EFF5899FF5496FF4D90FF478BFF4284FF3D7F
        FFFBF7F4D49B6FFF00FFFF00FFEEC1A2FBF7F4FBF7F4FBF7F4FBF7F4FBF7F4FB
        F7F4FBF7F4FBF7F4FBF7F4FBF7F4FBF7F4FBF7F4D7A074FF00FFFF00FFF3D2BA
        EFC2A3EDC09FEBBE9DEBBC9AE9BA96E7B793E6B590E4B28CE2AF88E0AC84DDA9
        80DCA57DDCA780FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
    object cbRGBImport: TCheckBox
      Left = 116
      Top = 32
      Width = 73
      Height = 17
      Caption = 'RGB import'
      TabOrder = 4
      OnClick = cbRGBImportClick
    end
  end
  object cbCreateNew: TCheckBox
    Left = 122
    Top = 174
    Width = 199
    Height = 17
    Caption = 'Create new matrix (will clear all data)'
    TabOrder = 4
    OnClick = cbRGBImportClick
  end
  object opdMain: TOpenPictureDialog
    Filter = 'Bitmaps (*.bmp)|*.bmp'
    Left = 272
  end
end
