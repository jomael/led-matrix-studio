object frmExport: TfrmExport
  Left = 0
  Top = 0
  Caption = 'Export Matrix Data'
  ClientHeight = 957
  ClientWidth = 869
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 893
    Width = 869
    Height = 64
    Align = alBottom
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    DesignSize = (
      869
      64)
    object GroupBox4: TGroupBox
      Left = 8
      Top = 2
      Width = 337
      Height = 55
      Caption = 'Profiles'
      TabOrder = 0
      object Bevel2: TBevel
        Left = 260
        Top = 28
        Width = 4
        Height = 12
        Shape = bsLeftLine
      end
      object sbSave: TBitBtn
        Left = 267
        Top = 21
        Width = 57
        Height = 25
        Caption = 'Save'
        TabOrder = 0
        OnClick = sbSaveClick
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000C21E0000C21E00000000000000000000D8AB8ECD9570
          BD7342B76835B56835B46734B26634B06533AE6433AC6332AA6232A96132A860
          31A76132AB693CBC8661C37D4FEBC6ADEAC5ADFEFBF8FEFBF8FEFBF8FEFBF8FE
          FBF8FEFBF8FEFBF8FEFBF8FEFBF8FEFBF8C89A7CC79879AD6B40BA6C38EDCAB3
          E0A27AFEFAF762C08862C08862C08862C08862C08862C08862C08862C088FDF9
          F6CA8D65C99B7CA76132BB6C38EECCB6E1A27AFEFAF7BFDCC2BFDCC2BFDCC2BF
          DCC2BFDCC2BFDCC2BFDCC2BFDCC2FDF9F6CD9068CC9E81A86132BB6B38EFCEB8
          E1A279FEFAF762C08862C08862C08862C08862C08862C08862C08862C088FDF9
          F6CF936ACEA384AA6132BA6A36EFD0BBE2A27AFEFBF8FEFBF8FEFBF8FEFBF8FE
          FBF8FEFBF8FEFBF8FEFBF8FEFBF8FEFBF8D3966DD2A78AAB6232BB6A36F0D2BE
          E2A37AE2A37AE1A37AE2A37BE1A37BE0A178DE9F77DD9F76DC9D74D99B72D899
          71D69970D5AB8EAD6333BB6A36F2D5C2E3A37AE3A37AE2A37BE2A37BE2A47BE1
          A279E0A178DEA077DE9E75DC9D74DA9B73D99B73DAB095AF6433BB6A36F2D8C5
          E3A47BE3A37AE3A47AE2A47BE2A37BE1A37BE1A279DFA077DE9F76DD9E74DB9C
          72DC9D74DDB59AB16534BB6B36F4D9C7E6A67DC88C64C98D65C98E67CB926CCB
          926DCA9069C88C65C88C64C88C64C88C64DA9C74E1BA9FB36634BB6C37F4DCC9
          E7A77DF9ECE1F9ECE1F9EDE3FCF4EEFDFAF7FDF7F3FAEDE5F7E7DBF7E5D9F6E5
          D8DEA077E4BEA4B46734BD6E3AF5DDCCE7A87EFAF0E8FAF0E8C98D66FAF0E9FD
          F8F3FEFAF8FCF4EFF9E9DFF7E7DBF7E5D9E0A278E7C2A9B66835C07442F6DFD0
          E8A87EFCF6F1FCF6F1C88C64FAF1E9FBF4EEFDFAF7FDF9F6FAF0E8F8E8DDF7E6
          DBE1A37AEFD5C3B76A36C68255F6DFD1E9AA80FEFAF6FDFAF6C88C64FBF3EEFB
          F1EAFCF6F2FEFBF8FCF6F1F9ECE2F8E7DBEED0BAECD0BDBD7443D6A585F6E0D1
          F7E0D1FEFBF8FEFBF7FDF9F6FCF5F0FAF0EAFBF2EDFDF9F6FDFAF7FBF1EBF8E9
          DFECD1BECD926AE2C5B1E1BDA6D9AB8DC9895EC07543BD6E3ABB6C37BB6B36BB
          6A36BB6A36BC6C39BD6E3BBB6D3ABF7444C98D65E7CEBCD8AB8E}
      end
      object sbOpen: TBitBtn
        Left = 16
        Top = 21
        Width = 57
        Height = 25
        Caption = 'Open'
        TabOrder = 1
        OnClick = sbOpenClick
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000C21E0000C21E00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA2CAEE
          76B2E63E91DB348CD9348CD9348CD9348CD9348CD9348CD9348CD9348CD9348B
          D9398FDA85B9E9FFFFFFFFFFFF4799DDDEF1FAA8DDF49EDBF496DAF38ED8F386
          D7F37FD4F279D3F272D2F16CD0F169CFF1C2EAF83F95DBFFFFFFFFFFFF3B97DB
          EFFAFEA1E9F991E5F881E1F772DEF663DAF554D7F447D3F339D0F22ECDF126CB
          F0CAF2FB3B97DBFFFFFFFFFFFF3C9DDBF2FAFDB3EDFAA4E9F995E6F885E2F776
          DEF665DBF557D7F449D4F33BD1F230CEF1CCF2FB3B9BDBFFFFFFFFFFFF3BA3DB
          F6FCFEC8F2FCB9EFFBACECFA9CE8F98BE3F77CE0F66CDCF65DD9F54FD6F444D3
          F3D0F3FC3BA2DBFFFFFFFFFFFF3BA8DBFEFFFFF8FDFFF6FDFFF5FCFFF3FCFED8
          F6FC94E6F885E3F776DFF668DBF55CD8F4D7F4FC3BA7DBFFFFFFFFFFFF39ADDB
          E8F6FB94D4EF88CEEE73C1E9C9E9F6F2FCFEF3FCFEF2FCFEF0FCFEEFFBFEEEFB
          FEFEFFFF3CAEDBFFFFFFFFFFFF40AEDCF1FAFD94DEF593DCF481D5F26ACAED6C
          CBEA85D3EF80D2EF7AD0EF76CFEE72CFEEE9F7FB3EB2DCFFFFFFFFFFFF41B4DC
          F7FCFE8EE4F891DEF59FE0F5ACE1F6EFFBFEF4FDFEF3FCFEF1FCFEEFFBFEEEFB
          FEFAFDFF58BCE0FFFFFFFFFFFF3CB5DBFDFEFEFEFFFFFEFEFFFDFEFFFEFFFFEA
          F7FB6EC8E56FC9E46FC9E46FC9E47DCFE784D0E8BAE5F2FFFFFFFFFFFF59C2E0
          61C3E263C4E363C4E363C4E362C4E356C0E0EDF8FCF3FAFDF3FAFDF3FAFDF3FA
          FDF3FBFDFCFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      end
      object cbProfileList: TComboBox
        Left = 75
        Top = 23
        Width = 142
        Height = 21
        Style = csDropDownList
        ItemHeight = 0
        TabOrder = 2
      end
      object sbDelete: TBitBtn
        Left = 223
        Top = 21
        Width = 31
        Height = 25
        Hint = 'delete'
        TabOrder = 3
        OnClick = sbDeleteClick
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000C21E0000C21E00000000000000000000FF00FFFF00FF
          FF00FFCBCBCB7D7D7D8888888D8D8DC3C3C3FF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFA6A6A6A7A7A7DADADAD8D8D8D3D3D367
          67677272727070706C6C6C686868686868757575FF00FFFF00FFFF00FFAFAFAF
          B5B5B5F3F3F3E9E9E9E3E3E3E4E4E4B6B6B6929292E5E5E5E4E4E4DEDEDED4D4
          D4A0A0A0727272FF00FFD9D9D9B5B5B5F4F4F4E5E5E5DBDBDBDADADADADADAF0
          F0F06E6E6ECFCFCFC9C9C9D0D0D08F8F8FB9B9B9666666FF00FFB8B8B8DBDBDB
          E8E8E8B7B7B7A9A9A9CCCCCCDADADAF5F5F5717171BFBFBFCBCBCBD1D1D18C8C
          8CAFAFAF6B6B6BFF00FFB2B2B2E6E6E6BFBFBFD0D0D0D5D5D5DADADAE5E5E5F5
          F5F5787878C6C6C6CDCDCDD3D3D3919191B1B1B16F6F6FFF00FFBDBDBDE2E2E2
          DCDCDCD8D8D8DDDDDDE5E5E5EFEFEFE9E9E9868686D7D7D7CDCDCDD3D3D39797
          97B4B4B4747474FF00FFE4E4E4C1C1C1EFEFEFE5E5E5EBEBEBF1F1F1EEEEEEB6
          B6B6A9A9A9D8D8D8CBCBCBD0D0D09D9D9DB5B5B5797979FF00FFFF00FFC3C3C3
          D7D7D7EEEEEEF3F3F3E3E3E3B6B6B6A9A9A9CCCCCCCDCDCDCACACAC6C6C6B6B6
          B6B6B6B67E7E7EFF00FFFF00FFFF00FFC9C9C9B1B1B1A9A9A9A1A1A1B9B9B9C7
          C7C7BEBEBEBFBFBFBBBBBBC2C2C2BABABAC6C6C6848484FF00FFFF00FFFF00FF
          FF00FFEBEBEBE9E9E9B0B0B0CBCBCBEFEFEFEFEFEFEDEDEDEFEFEFEFEFEFEFEF
          EFA6A6A6898989FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA6A6A6EFEFEFF0
          F0F0E6E6E6EDEDEDEEEEEEF9F9F9DDDDDDDEDEDE8D8D8DFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FF949494C4C4C4DFDFDFEBEBEBE8E8E8F6F6F6F0F0F0E9E9
          E9ABABAB8D8D8DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCCCCCC858585BA
          BABAD8D8D8F4F4F4FDFDFDEAEAEABCBCBC7F7F7FC9C9C9FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFDEDEDEB5B5B5A6A6A6E8E8E8F1F1F1D1D1D1B2B2
          B2DCDCDCFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFE4E4E4E0E0E0FF00FFFF00FFFF00FFFF00FFFF00FF}
      end
    end
    object GroupBox6: TGroupBox
      Left = 560
      Top = 2
      Width = 303
      Height = 55
      Anchors = [akRight, akBottom]
      Caption = 'Output'
      TabOrder = 1
      object BitBtn1: TBitBtn
        Left = 220
        Top = 21
        Width = 75
        Height = 25
        Cancel = True
        Caption = 'Cancel'
        ModalResult = 2
        TabOrder = 0
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
      object BitBtn2: TBitBtn
        Left = 10
        Top = 21
        Width = 75
        Height = 25
        Caption = 'Export'
        ModalResult = 2
        TabOrder = 1
        OnClick = BitBtn2Click
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
      object bCopyToClipboard: TBitBtn
        Left = 86
        Top = 21
        Width = 31
        Height = 25
        Hint = 'copy to clipboard'
        TabOrder = 2
        OnClick = bCopyToClipboardClick
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
      object BitBtn3: TBitBtn
        Left = 140
        Top = 21
        Width = 75
        Height = 25
        Caption = 'Close'
        ModalResult = 1
        TabOrder = 3
      end
    end
    object cbAutoPreview: TCheckBox
      Left = 359
      Top = 24
      Width = 86
      Height = 17
      Caption = 'Auto preview'
      Checked = True
      State = cbChecked
      TabOrder = 2
    end
  end
  object pcExport: TPageControl
    Left = 0
    Top = 0
    Width = 869
    Height = 893
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 1
    OnChange = pcExportChange
    object TabSheet1: TTabSheet
      Caption = 'Code'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Memo1: TMemo
        Left = 206
        Top = 0
        Width = 655
        Height = 865
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 0
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 206
        Height = 865
        Align = alLeft
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 1
        object GroupBox1: TGroupBox
          Left = 10
          Top = 8
          Width = 185
          Height = 201
          Caption = 'Source'
          TabOrder = 0
          object sbDataRows: TSpeedButton
            Left = 16
            Top = 24
            Width = 75
            Height = 25
            GroupIndex = 1
            Down = True
            Caption = 'Rows'
            OnClick = sbDataRowsClick
          end
          object sbDataColumns: TSpeedButton
            Left = 93
            Top = 24
            Width = 75
            Height = 25
            GroupIndex = 1
            Caption = 'Columns'
            OnClick = sbDataRowsClick
          end
          object lFrame: TLabel
            Left = 16
            Top = 120
            Width = 43
            Height = 13
            Caption = 'Frame(s)'
          end
          object Label2: TLabel
            Left = 87
            Top = 142
            Width = 10
            Height = 13
            Caption = 'to'
          end
          object cbDirection: TComboBox
            Left = 16
            Top = 55
            Width = 152
            Height = 21
            Style = csDropDownList
            ItemHeight = 0
            TabOrder = 0
            OnChange = cbDirectionChange
          end
          object cbScanDirection: TComboBox
            Left = 16
            Top = 82
            Width = 152
            Height = 21
            Style = csDropDownList
            ItemHeight = 0
            TabOrder = 1
            OnChange = cbDirectionChange
          end
          object eFrameStart: TEdit
            Left = 16
            Top = 139
            Width = 55
            Height = 21
            TabOrder = 2
            Text = '1'
            OnExit = eFrameEndExit
          end
          object eFrameEnd: TEdit
            Left = 113
            Top = 139
            Width = 55
            Height = 21
            TabOrder = 3
            Text = '1'
            OnExit = eFrameEndExit
          end
          object cbOptimise: TCheckBox
            Left = 16
            Top = 172
            Width = 152
            Height = 17
            Caption = 'Optimise output (if possible)'
            TabOrder = 4
            OnClick = cbOptimiseClick
          end
        end
        object GroupBox5: TGroupBox
          Left = 10
          Top = 215
          Width = 185
          Height = 58
          Caption = 'Least Significant Bit (LSB)'
          TabOrder = 1
          object sbLSBLeft: TSpeedButton
            Left = 16
            Top = 24
            Width = 75
            Height = 25
            GroupIndex = 1
            Down = True
            Caption = 'Left'
            OnClick = sbLSBLeftClick
          end
          object sbLSBRight: TSpeedButton
            Left = 93
            Top = 24
            Width = 75
            Height = 25
            GroupIndex = 1
            Caption = 'Right'
            OnClick = sbLSBLeftClick
          end
        end
        object GroupBox2: TGroupBox
          Left = 10
          Top = 279
          Width = 185
          Height = 57
          Caption = 'Export Format'
          TabOrder = 2
          object cbLanguageFormat: TComboBox
            Left = 16
            Top = 20
            Width = 152
            Height = 21
            Style = csDropDownList
            ItemHeight = 0
            TabOrder = 0
            OnChange = cbLanguageFormatChange
          end
        end
        object groupBoxNumberFormat: TGroupBox
          Left = 10
          Top = 344
          Width = 185
          Height = 57
          Caption = 'Number Format'
          TabOrder = 3
          object sbNumberDecimal: TSpeedButton
            Left = 16
            Top = 24
            Width = 50
            Height = 25
            GroupIndex = 2
            Caption = 'Decimal'
            OnClick = sbNumberDecimalClick
          end
          object sbNumberBinary: TSpeedButton
            Left = 67
            Top = 24
            Width = 50
            Height = 25
            GroupIndex = 2
            Caption = 'Binary'
            OnClick = sbNumberDecimalClick
          end
          object sbNumberHex: TSpeedButton
            Left = 118
            Top = 24
            Width = 50
            Height = 25
            GroupIndex = 2
            Down = True
            Caption = 'Hex'
            OnClick = sbNumberDecimalClick
          end
        end
        object groupBoxNumberGrouping: TGroupBox
          Left = 10
          Top = 407
          Width = 185
          Height = 122
          Caption = 'Number Grouping'
          TabOrder = 4
          object sbNumberSize8bit: TSpeedButton
            Left = 16
            Top = 24
            Width = 50
            Height = 25
            GroupIndex = 2
            Down = True
            Caption = '8 bit'
            OnClick = sbNumberSize8bitClick
          end
          object sbNumberSize16bit: TSpeedButton
            Left = 67
            Top = 24
            Width = 50
            Height = 25
            GroupIndex = 2
            Caption = '16 bit'
            OnClick = sbNumberSize8bitClick
          end
          object sbNumberSize32bit: TSpeedButton
            Left = 118
            Top = 24
            Width = 50
            Height = 25
            GroupIndex = 2
            Caption = '32 bit'
            OnClick = sbNumberSize8bitClick
          end
          object sbNumberSize8bitSwap: TSpeedButton
            Left = 16
            Top = 55
            Width = 152
            Height = 25
            GroupIndex = 2
            Caption = '8 bit (swap nibbles)'
            OnClick = sbNumberSize8bitClick
          end
          object sbNumberSize16bitSwap: TSpeedButton
            Left = 16
            Top = 86
            Width = 152
            Height = 25
            GroupIndex = 2
            Caption = '16 bit (swap bytes)'
            OnClick = sbNumberSize8bitClick
          end
        end
        object groupBoxEachLine: TGroupBox
          Left = 10
          Top = 535
          Width = 185
          Height = 90
          Caption = 'Each Line of Output'
          TabOrder = 5
          object sbOutputRow: TSpeedButton
            Left = 16
            Top = 24
            Width = 75
            Height = 25
            GroupIndex = 1
            Down = True
            Caption = 'Row'
            OnClick = sbDataRowsClick
          end
          object sbOutputFrame: TSpeedButton
            Left = 93
            Top = 24
            Width = 75
            Height = 25
            GroupIndex = 1
            Caption = 'Frame'
            OnClick = sbDataRowsClick
          end
          object sbOutputBytes: TSpeedButton
            Left = 16
            Top = 55
            Width = 75
            Height = 25
            GroupIndex = 1
            Caption = 'Bytes'
            OnClick = sbDataRowsClick
          end
          object cbLineCount: TComboBox
            Left = 93
            Top = 57
            Width = 75
            Height = 21
            Style = csDropDownList
            ItemHeight = 0
            TabOrder = 0
            OnChange = cbDirectionChange
          end
        end
        object groupBoxRGB: TGroupBox
          Left = 10
          Top = 632
          Width = 185
          Height = 125
          Caption = 'RGB Colour Format'
          TabOrder = 6
          Visible = False
          object sbRGB: TSpeedButton
            Left = 16
            Top = 24
            Width = 50
            Height = 25
            GroupIndex = 2
            Down = True
            Caption = 'RGB'
            OnClick = sbRGBClick
          end
          object sbBGR: TSpeedButton
            Left = 67
            Top = 24
            Width = 50
            Height = 25
            GroupIndex = 2
            Caption = 'BGR'
            OnClick = sbRGBClick
          end
          object sbGRB: TSpeedButton
            Left = 118
            Top = 24
            Width = 50
            Height = 25
            GroupIndex = 2
            Caption = 'GRB'
            OnClick = sbRGBClick
          end
          object shapeBackgroundPixels: TShape
            Left = 73
            Top = 90
            Width = 88
            Height = 24
            Brush.Color = clBlack
            OnMouseDown = shapeBackgroundPixelsMouseDown
          end
          object Label1: TLabel
            Left = 40
            Top = 96
            Width = 16
            Height = 13
            Caption = 'To:'
          end
          object cbChangeBackgroundPixels: TCheckBox
            Left = 16
            Top = 64
            Width = 152
            Height = 17
            Caption = 'Change background pixels'
            TabOrder = 0
            OnClick = cbOptimiseClick
          end
        end
        object groupBoxNumberGroupingRGB: TGroupBox
          Left = 10
          Top = 764
          Width = 185
          Height = 90
          Caption = 'Number Grouping'
          TabOrder = 7
          Visible = False
          object sbNumberSizeRGB8bits: TSpeedButton
            Left = 16
            Top = 24
            Width = 152
            Height = 25
            GroupIndex = 2
            Caption = '8 bits (one byte per colour)'
            OnClick = sbNumberSize8bitClick
          end
          object sbNumberSizeRGB32bits: TSpeedButton
            Left = 16
            Top = 55
            Width = 152
            Height = 25
            GroupIndex = 2
            Down = True
            Caption = '32 bits'
            OnClick = sbNumberSize8bitClick
          end
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Binary'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 206
        Height = 865
        Align = alLeft
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 0
        object GroupBox3: TGroupBox
          Left = 10
          Top = 8
          Width = 185
          Height = 201
          Caption = 'Source'
          TabOrder = 0
          object sbBinaryDataRows: TSpeedButton
            Left = 16
            Top = 24
            Width = 75
            Height = 25
            GroupIndex = 1
            Down = True
            Caption = 'Rows'
            OnClick = sbBinaryDataRowsClick
          end
          object sbBinaryDataColumns: TSpeedButton
            Left = 93
            Top = 24
            Width = 75
            Height = 25
            GroupIndex = 1
            Caption = 'Columns'
            OnClick = sbBinaryDataRowsClick
          end
          object Label3: TLabel
            Left = 16
            Top = 120
            Width = 43
            Height = 13
            Caption = 'Frame(s)'
          end
          object Label4: TLabel
            Left = 87
            Top = 142
            Width = 10
            Height = 13
            Caption = 'to'
          end
          object cbBinaryDirection: TComboBox
            Left = 16
            Top = 55
            Width = 152
            Height = 21
            Style = csDropDownList
            ItemHeight = 0
            TabOrder = 0
            OnChange = cbDirectionChange
          end
          object cbBinaryScanDirection: TComboBox
            Left = 16
            Top = 82
            Width = 152
            Height = 21
            Style = csDropDownList
            ItemHeight = 0
            TabOrder = 1
            OnChange = cbDirectionChange
          end
          object eBinaryFrameStart: TEdit
            Left = 16
            Top = 139
            Width = 55
            Height = 21
            TabOrder = 2
            Text = '1'
            OnExit = eFrameEndExit
          end
          object eBinaryFrameEnd: TEdit
            Left = 113
            Top = 139
            Width = 55
            Height = 21
            TabOrder = 3
            Text = '1'
            OnExit = eFrameEndExit
          end
          object cbBinaryOptimise: TCheckBox
            Left = 16
            Top = 172
            Width = 152
            Height = 17
            Caption = 'Optimise output (if possible)'
            TabOrder = 4
            Visible = False
            OnClick = cbOptimiseClick
          end
        end
        object GroupBox7: TGroupBox
          Left = 10
          Top = 215
          Width = 185
          Height = 58
          Caption = 'Least Significant Bit (LSB)'
          TabOrder = 1
          object sbBinaryLSBLeft: TSpeedButton
            Left = 16
            Top = 24
            Width = 75
            Height = 25
            GroupIndex = 1
            Down = True
            Caption = 'Left'
            OnClick = sbLSBLeftClick
          end
          object sbBinaryLSBRight: TSpeedButton
            Left = 93
            Top = 24
            Width = 75
            Height = 25
            GroupIndex = 1
            Caption = 'Right'
            OnClick = sbLSBLeftClick
          end
        end
        object GroupBox10: TGroupBox
          Left = 10
          Top = 278
          Width = 185
          Height = 63
          Caption = 'Number Grouping'
          TabOrder = 2
          object sbBinaryNumberSize8bit: TSpeedButton
            Left = 16
            Top = 24
            Width = 44
            Height = 25
            GroupIndex = 2
            Down = True
            Caption = '8 bit'
            OnClick = sbNumberSize8bitClick
          end
          object sbBinaryNumberSize8bitSwap: TSpeedButton
            Left = 62
            Top = 24
            Width = 106
            Height = 25
            GroupIndex = 2
            Caption = '8 bit (swap nibbles)'
            OnClick = sbNumberSize8bitClick
          end
          object sbBinaryNumberSize16bitSwap: TSpeedButton
            Left = 16
            Top = 86
            Width = 152
            Height = 25
            GroupIndex = 2
            Caption = '16 bit (swap bytes)'
            OnClick = sbNumberSize8bitClick
          end
        end
        object groupBoxBinaryRGB: TGroupBox
          Left = 10
          Top = 436
          Width = 185
          Height = 125
          Caption = 'RGB Colour Format'
          TabOrder = 3
          Visible = False
          object sbBinaryRGB: TSpeedButton
            Left = 16
            Top = 24
            Width = 50
            Height = 25
            GroupIndex = 2
            Down = True
            Caption = 'RGB'
            OnClick = sbRGBClick
          end
          object sbBinaryBGR: TSpeedButton
            Left = 67
            Top = 24
            Width = 50
            Height = 25
            GroupIndex = 2
            Caption = 'BGR'
            OnClick = sbRGBClick
          end
          object sbBinaryGRB: TSpeedButton
            Left = 118
            Top = 24
            Width = 50
            Height = 25
            GroupIndex = 2
            Caption = 'GRB'
            OnClick = sbRGBClick
          end
          object shapeBinaryBackgroundPixels: TShape
            Left = 73
            Top = 90
            Width = 88
            Height = 24
            Brush.Color = clBlack
            OnMouseDown = shapeBackgroundPixelsMouseDown
          end
          object Label5: TLabel
            Left = 40
            Top = 96
            Width = 16
            Height = 13
            Caption = 'To:'
          end
          object cbBinaryChangeBackgroundPixels: TCheckBox
            Left = 16
            Top = 64
            Width = 152
            Height = 17
            Caption = 'Change background pixels'
            TabOrder = 0
            OnClick = cbOptimiseClick
          end
        end
        object groupBoxNumberGroupingBinaryRGB: TGroupBox
          Left = 10
          Top = 566
          Width = 185
          Height = 67
          Caption = 'Number Grouping'
          TabOrder = 4
          Visible = False
          object sbBinaryNumberSizeRGB8bits: TSpeedButton
            Left = 16
            Top = 24
            Width = 152
            Height = 25
            GroupIndex = 2
            Down = True
            Caption = '8 bits (one byte per colour)'
            OnClick = sbNumberSize8bitClick
          end
        end
        object GroupBox8: TGroupBox
          Left = 10
          Top = 349
          Width = 185
          Height = 80
          Caption = 'File contents'
          TabOrder = 5
          object rbSaveAnimation: TRadioButton
            Left = 24
            Top = 26
            Width = 113
            Height = 17
            Caption = 'Entire animation'
            Checked = True
            TabOrder = 0
            TabStop = True
          end
          object rbSaveFrame: TRadioButton
            Left = 24
            Top = 50
            Width = 113
            Height = 17
            Caption = 'Frame (one per file)'
            TabOrder = 1
          end
        end
      end
      object Memo2: TMemo
        Left = 206
        Top = 0
        Width = 655
        Height = 865
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
    end
  end
  object sdExport: TSaveDialog
    DefaultExt = '.h'
    Filter = 'C-style header file (.h)|*.h|Include file (.inc)|*.inc'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 392
    Top = 16
  end
  object cdExport: TColorDialog
    Left = 432
    Top = 16
  end
end
