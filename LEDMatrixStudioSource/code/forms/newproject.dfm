object frmNewProject: TfrmNewProject
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'New Project'
  ClientHeight = 303
  ClientWidth = 328
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel19: TBevel
    Left = 10
    Top = 260
    Width = 310
    Height = 4
    Shape = bsTopLine
  end
  object BitBtn1: TBitBtn
    Left = 164
    Top = 270
    Width = 75
    Height = 25
    Caption = 'Create'
    TabOrder = 0
    OnClick = BitBtn1Click
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000C21E0000C21E00000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0EEE08FC0913B8D3F25
      7A292577293B853F8FB991E0EBE0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFB5D9B7318F3542A05287CA9A9BD3AB9BD2AB83C7963D974C307C34B5D0
      B6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB5DBBA258F2A6DBE83A8DBB587CC9866
      BC7D64BA7C86CB98A5D9B466B77D247227B5D1B6FFFFFFFFFFFFFFFFFFE1F2E4
      33A14472C287A8DBB260BC775CBA7359B87059B56F58B56F5BB774A5D9B369B8
      7F317F35E1ECE1FFFFFFFFFFFF90D29F4CB064AADDB464C1795FBE7175C585D4
      ECD98ACD9956B66C58B56E5CB774A6DAB4419B4E8EBC90FFFFFFFFFFFF3FB55D
      91D29F8DD49A64C37479C987F2FAF4FFFFFFFDFEFD86CB9657B76D5BB97285CC
      9787C79A3B8B3FFFFFFFFFFFFF27B049A6DCAF70CA7F73CA80F0F9F1FFFFFFEB
      F7EDFFFFFFFBFDFC88CD965BB97167BE7DA0D7AF237F26FFFFFFFFFFFF2EB751
      A7DDB172CC8066C773B0E1B7D2EED663C170B8E3BFFFFFFFFBFDFC8CD09969C1
      7EA1D7AE238426FFFFFFFFFFFF4BC56C95D7A191D79B69C97664C66F61C46E61
      C36F61C26FB9E4C0FFFFFFE3F4E68BD1998BCE9D3C993FFFFFFFFFFFFF9BDFAD
      57BF70AFE1B76DCC7A68C87265C77063C56E62C46E63C471B6E3BE6FC77EACDF
      B548A95E8FC894FFFFFFFFFFFFE5F7E949C5667FCE90AEE1B56DCC7A6ACA7668
      C87268C87468C8756BC979ACDFB476C48933A142E1F1E3FFFFFFFFFFFFFFFFFF
      BFECCB3DC35C7FCE90AFE1B792D89D77CE8377CE8392D89DAEE1B578C88B27A1
      3BB5DFBEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0EDCB4AC86959C27496D7A3A5
      DCAEA5DCAE95D6A150B96A35B355B6E3C1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFE5F8E99FE3B055CB723BC05C37BE5A49C36A97DCAAE1F5E7FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
  end
  object BitBtn2: TBitBtn
    Left = 245
    Top = 270
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 1
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
  object GroupBox3: TGroupBox
    Left = 8
    Top = 143
    Width = 310
    Height = 57
    Caption = 'Animation'
    TabOrder = 2
    object Label3: TLabel
      Left = 16
      Top = 28
      Width = 50
      Height = 13
      Caption = 'Start with '
    end
    object Label5: TLabel
      Left = 140
      Top = 28
      Width = 86
      Height = 13
      Caption = 'animation frames.'
    end
    object GroupBox4: TGroupBox
      Left = 24
      Top = -63
      Width = 273
      Height = 57
      Caption = 'Matrtix Options'
      TabOrder = 0
      object Label4: TLabel
        Left = 203
        Top = 23
        Width = 9
        Height = 18
        Caption = 'X'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object ComboBox7: TComboBox
        Left = 219
        Top = 20
        Width = 41
        Height = 21
        Hint = 'Select matrix height'
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
      end
      object ComboBox8: TComboBox
        Left = 155
        Top = 20
        Width = 42
        Height = 21
        Hint = 'Select matrix width'
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 1
      end
      object ComboBox9: TComboBox
        Left = 15
        Top = 20
        Width = 132
        Height = 21
        Hint = 'Number of frames'
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 2
      end
    end
  end
  object pcNew: TPageControl
    Left = 8
    Top = 8
    Width = 314
    Height = 121
    ActivePage = TabSheet1
    TabOrder = 3
    object TabSheet1: TTabSheet
      Caption = 'Custom'
      object GroupBox1: TGroupBox
        Left = 15
        Top = 16
        Width = 274
        Height = 57
        Caption = 'Matrtix Options'
        TabOrder = 0
        object Label1: TLabel
          Left = 203
          Top = 23
          Width = 9
          Height = 18
          Caption = 'X'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object cbHeight: TComboBox
          Left = 219
          Top = 20
          Width = 41
          Height = 21
          Hint = 'Select matrix height'
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 0
        end
        object cbWidth: TComboBox
          Left = 155
          Top = 20
          Width = 42
          Height = 21
          Hint = 'Select matrix width'
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 1
        end
        object cbMatrixType: TComboBox
          Left = 15
          Top = 20
          Width = 132
          Height = 21
          Hint = 'Number of frames'
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 2
        end
        object GroupBox2: TGroupBox
          Left = 24
          Top = -63
          Width = 273
          Height = 57
          Caption = 'Matrtix Options'
          TabOrder = 3
          object Label2: TLabel
            Left = 203
            Top = 23
            Width = 9
            Height = 18
            Caption = 'X'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object ComboBox1: TComboBox
            Left = 219
            Top = 20
            Width = 41
            Height = 21
            Hint = 'Select matrix height'
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 0
          end
          object ComboBox2: TComboBox
            Left = 155
            Top = 20
            Width = 42
            Height = 21
            Hint = 'Select matrix width'
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 1
          end
          object ComboBox3: TComboBox
            Left = 15
            Top = 20
            Width = 132
            Height = 21
            Hint = 'Number of frames'
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 2
          end
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'From Preset'
      ImageIndex = 1
      object Label6: TLabel
        Left = 16
        Top = 56
        Width = 31
        Height = 13
        Caption = 'Type: '
      end
      object Label7: TLabel
        Left = 185
        Top = 56
        Width = 32
        Height = 13
        Caption = 'Width:'
      end
      object Label9: TLabel
        Left = 185
        Top = 75
        Width = 35
        Height = 13
        Caption = 'Height:'
      end
      object lPresetType: TLabel
        Left = 48
        Top = 56
        Width = 4
        Height = 13
        Caption = '.'
      end
      object lPresetWidth: TLabel
        Left = 224
        Top = 56
        Width = 4
        Height = 13
        Caption = '.'
      end
      object lPresetHeight: TLabel
        Left = 224
        Top = 75
        Width = 4
        Height = 13
        Caption = '.'
      end
      object cbPresets: TComboBox
        Left = 15
        Top = 24
        Width = 274
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
        OnChange = cbPresetsChange
      end
    end
  end
  object GroupBox5: TGroupBox
    Left = 8
    Top = 206
    Width = 310
    Height = 43
    TabOrder = 4
    object GroupBox6: TGroupBox
      Left = 24
      Top = -63
      Width = 273
      Height = 57
      Caption = 'Matrtix Options'
      TabOrder = 0
      object Label8: TLabel
        Left = 203
        Top = 23
        Width = 9
        Height = 18
        Caption = 'X'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object ComboBox5: TComboBox
        Left = 219
        Top = 20
        Width = 41
        Height = 21
        Hint = 'Select matrix height'
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
      end
      object ComboBox6: TComboBox
        Left = 155
        Top = 20
        Width = 42
        Height = 21
        Hint = 'Select matrix width'
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 1
      end
      object ComboBox10: TComboBox
        Left = 15
        Top = 20
        Width = 132
        Height = 21
        Hint = 'Number of frames'
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 2
      end
    end
    object cbClearAll: TCheckBox
      Left = 20
      Top = 16
      Width = 170
      Height = 17
      Caption = 'Clear all animation/matrix data'
      Checked = True
      State = cbChecked
      TabOrder = 1
    end
  end
  object cbFrames: TComboBox
    Left = 83
    Top = 168
    Width = 54
    Height = 21
    ItemHeight = 13
    TabOrder = 5
    Text = '1'
  end
end
