object frmOption: TfrmOption
  Left = 76
  Top = 150
  BorderStyle = bsDialog
  Caption = 'Options'
  ClientHeight = 546
  ClientWidth = 294
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Shell Dlg 2'
  Font.Style = []
  OldCreateOrder = True
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 8
    Top = 8
    Width = 281
    Height = 497
    ActivePage = TabSheet1
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'General'
      object gbWindow: TGroupBox
        Left = 8
        Top = 88
        Width = 257
        Height = 265
        Caption = 'Window'
        TabOrder = 1
        object lbLanguage: TLabel
          Left = 8
          Top = 186
          Width = 47
          Height = 13
          Caption = 'Language'
          Color = clBtnFace
          ParentColor = False
        end
        object cxLanguage: TComboBox
          Left = 8
          Top = 202
          Width = 153
          Height = 21
          Style = csDropDownList
          Enabled = False
          TabOrder = 4
        end
        object cbWindowOnTop: TCheckBox
          Left = 8
          Top = 34
          Width = 92
          Height = 19
          Caption = 'Window on top'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Shell Dlg 2'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object cbHoldSize: TCheckBox
          Left = 8
          Top = 2
          Width = 101
          Height = 19
          Caption = 'Hold window size'
          TabOrder = 0
        end
        object cbCustomTitle: TCheckBox
          Left = 8
          Top = 142
          Width = 116
          Height = 19
          Caption = 'Custom window title'
          TabOrder = 2
          OnClick = cbCustomTitleClick
        end
        object edtCustomTitle: TEdit
          Left = 8
          Top = 162
          Width = 153
          Height = 21
          TabOrder = 3
          Text = 'ASuite'
        end
        object cbHideSearch: TCheckBox
          Left = 8
          Top = 226
          Width = 96
          Height = 19
          Caption = 'Hide tab Search'
          TabOrder = 5
        end
      end
      object gbTreeView: TGroupBox
        Left = 8
        Top = 362
        Width = 257
        Height = 103
        Caption = 'Treeview'
        TabOrder = 2
        object cbBackground: TCheckBox
          Left = 8
          Top = 16
          Width = 109
          Height = 19
          Caption = 'Active background'
          TabOrder = 1
        end
        object btnFontSettings: TButton
          Left = 72
          Top = 64
          Width = 121
          Height = 17
          Caption = 'Font settings...'
          TabOrder = 4
          OnClick = btnFontSettingsClick
        end
        object edtBackground: TEdit
          Left = 8
          Top = 36
          Width = 177
          Height = 21
          TabOrder = 2
          Text = '$ASuite\'
        end
        object btnBrowseBackground: TButton
          Left = 192
          Top = 36
          Width = 57
          Height = 21
          Caption = 'Browse'
          TabOrder = 3
          OnClick = Browse
        end
        object cbAutoOpClCat: TCheckBox
          Left = 8
          Top = 0
          Width = 204
          Height = 19
          Caption = 'Automatic Opening/Closing Categories'
          TabOrder = 0
        end
      end
      object gbStartup: TGroupBox
        Left = 8
        Top = 0
        Width = 257
        Height = 81
        Caption = 'Startup'
        TabOrder = 0
        object cbWindowsStartup: TCheckBox
          Left = 8
          Top = 2
          Width = 168
          Height = 19
          Caption = 'Start ASuite on system startup'
          TabOrder = 0
        end
        object cbShowPanelStartup: TCheckBox
          Left = 8
          Top = 18
          Width = 138
          Height = 19
          Caption = 'Show window on startup'
          TabOrder = 1
        end
        object cbShowMenuStartup: TCheckBox
          Left = 8
          Top = 34
          Width = 128
          Height = 19
          Caption = 'Show Menu on startup'
          TabOrder = 2
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Advanced'
      ImageIndex = 4
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object gbRecents: TGroupBox
        Left = 8
        Top = 16
        Width = 257
        Height = 81
        Caption = 'Recents'
        TabOrder = 0
        object lbMaxMRU: TLabel
          Left = 8
          Top = 37
          Width = 84
          Height = 13
          Caption = 'Max number MRU'
          Color = clBtnFace
          ParentColor = False
        end
        object lbNumbMRU: TLabel
          Left = 234
          Top = 37
          Width = 12
          Height = 13
          Caption = '10'
          Color = clBtnFace
          ParentColor = False
        end
        object cbMRU: TCheckBox
          Left = 8
          Top = 2
          Width = 75
          Height = 19
          Caption = 'Active MRU'
          TabOrder = 0
        end
        object cbSubMenuMRU: TCheckBox
          Left = 8
          Top = 18
          Width = 145
          Height = 19
          Caption = 'MRU on trayicon submenu'
          TabOrder = 1
        end
        object tbMRU: TTrackBar
          Left = 136
          Top = 34
          Width = 97
          Height = 25
          ShowSelRange = False
          TabOrder = 2
          OnChange = tbMRUChange
        end
      end
      object gbBackup: TGroupBox
        Left = 8
        Top = 190
        Width = 257
        Height = 65
        Caption = 'Backup'
        TabOrder = 1
        object lbMaxBackup: TLabel
          Left = 8
          Top = 23
          Width = 96
          Height = 13
          Caption = 'Max number Backup'
          Color = clBtnFace
          ParentColor = False
        end
        object lbNumbBackup: TLabel
          Left = 234
          Top = 23
          Width = 12
          Height = 13
          Caption = '10'
          Color = clBtnFace
          ParentColor = False
        end
        object cbBackup: TCheckBox
          Left = 8
          Top = 4
          Width = 87
          Height = 19
          Caption = 'Active backup'
          TabOrder = 0
        end
        object tbBackup: TTrackBar
          Left = 136
          Top = 20
          Width = 97
          Height = 25
          ShowSelRange = False
          TabOrder = 1
          OnChange = tbBackupChange
        end
      end
      object gbOtherFunctions: TGroupBox
        Left = 8
        Top = 346
        Width = 257
        Height = 88
        Caption = 'Other functions'
        TabOrder = 3
        object cbCache: TCheckBox
          Left = 8
          Top = 6
          Width = 83
          Height = 19
          Caption = 'Enable cache'
          TabOrder = 0
        end
        object cbAutorun: TCheckBox
          Left = 8
          Top = 30
          Width = 93
          Height = 19
          Caption = 'Enable autorun'
          TabOrder = 1
        end
      end
      object gbClearElements: TGroupBox
        Left = 8
        Top = 261
        Width = 257
        Height = 77
        Caption = 'Clear Elements'
        TabOrder = 2
        object lbClearElements: TLabel
          Left = 8
          Top = 5
          Width = 202
          Height = 13
          Caption = 'Clear all MRU, backups and/or cache icons'
          Color = clBtnFace
          ParentColor = False
        end
        object btnClearElements: TButton
          Left = 72
          Top = 29
          Width = 113
          Height = 17
          Caption = 'Clear elements...'
          TabOrder = 0
          OnClick = btnClearElementsClick
        end
      end
      object gbMFU: TGroupBox
        Left = 8
        Top = 103
        Width = 257
        Height = 81
        Caption = 'Most Frequently Used'
        TabOrder = 4
        object lbMaxMFU: TLabel
          Left = 8
          Top = 38
          Width = 83
          Height = 13
          Caption = 'Max number MFU'
          Color = clBtnFace
          ParentColor = False
        end
        object lbNumbMFU: TLabel
          Left = 234
          Top = 38
          Width = 12
          Height = 13
          Caption = '10'
          Color = clBtnFace
          ParentColor = False
        end
        object cbMFU: TCheckBox
          Left = 8
          Top = 3
          Width = 74
          Height = 19
          Caption = 'Active MFU'
          TabOrder = 0
        end
        object cbSubMenuMFU: TCheckBox
          Left = 8
          Top = 19
          Width = 144
          Height = 19
          Caption = 'MFU on trayicon submenu'
          TabOrder = 1
        end
        object tbMFU: TTrackBar
          Left = 136
          Top = 35
          Width = 97
          Height = 25
          ShowSelRange = False
          TabOrder = 2
          OnChange = tbMFUChange
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Various'
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object gbExecution: TGroupBox
        Left = 8
        Top = 8
        Width = 257
        Height = 132
        Caption = 'Execution'
        TabOrder = 0
        object lbActionOnExe: TLabel
          Left = 8
          Top = 22
          Width = 64
          Height = 13
          Caption = 'On execution'
          Color = clBtnFace
          ParentColor = False
        end
        object lblAutorunOrder: TLabel
          Left = 10
          Top = 65
          Width = 106
          Height = 13
          Caption = 'Autoexecute items list'
          Color = clBtnFace
          ParentColor = False
        end
        object cbRunSingleClick: TCheckBox
          Left = 8
          Top = 2
          Width = 134
          Height = 19
          Caption = 'Execute with single click'
          TabOrder = 0
        end
        object cxActionOnExe: TComboBox
          Left = 8
          Top = 38
          Width = 169
          Height = 21
          Style = csDropDownList
          TabOrder = 1
          Items.Strings = (
            'Just run file'
            'Run and hide ASuite'
            'Run and close ASuite')
        end
        object btnChangeOrder: TButton
          Left = 75
          Top = 83
          Width = 102
          Height = 21
          Caption = 'Change order'
          TabOrder = 2
          OnClick = btnChangeOrderClick
        end
      end
      object gbTrayicon: TGroupBox
        Left = 8
        Top = 146
        Width = 257
        Height = 152
        Caption = 'System Tray'
        TabOrder = 1
        object lbTrayLeftClick: TLabel
          Left = 8
          Top = 48
          Width = 41
          Height = 13
          Caption = 'Left click'
          Color = clBtnFace
          ParentColor = False
        end
        object lbTrayRightClick: TLabel
          Left = 8
          Top = 88
          Width = 47
          Height = 13
          Caption = 'Right click'
          Color = clBtnFace
          ParentColor = False
        end
        object cxLeftClick: TComboBox
          Left = 8
          Top = 63
          Width = 145
          Height = 21
          Style = csDropDownList
          TabOrder = 1
          Items.Strings = (
            'No action'
            'Show window'
            'Show menu')
        end
        object btnTrayCustomIcon: TButton
          Left = 165
          Top = 29
          Width = 89
          Height = 21
          Caption = 'Choose icon'
          TabOrder = 2
          OnClick = Browse
        end
        object cbTrayicon: TCheckBox
          Left = 8
          Top = 8
          Width = 156
          Height = 19
          Caption = 'Enable the System Tray icon'
          TabOrder = 0
          OnClick = cbTrayiconClick
        end
        object cxRightClick: TComboBox
          Left = 8
          Top = 103
          Width = 145
          Height = 21
          Style = csDropDownList
          TabOrder = 3
          Items.Strings = (
            'No action'
            'Show window'
            'Show menu')
        end
        object cbTrayCustomIcon: TCheckBox
          Left = 8
          Top = 31
          Width = 101
          Height = 19
          Caption = 'Custom tray icon'
          TabOrder = 4
        end
      end
      object gbMouse: TGroupBox
        Left = 8
        Top = 306
        Width = 257
        Height = 136
        Caption = 'Mouse sensors'
        TabOrder = 2
        object lbSide: TLabel
          Left = 8
          Top = 0
          Width = 24
          Height = 13
          Caption = 'Side'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Shell Dlg 2'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object lbLeftClick: TLabel
          Left = 56
          Top = 0
          Width = 50
          Height = 13
          Caption = 'Left click'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Shell Dlg 2'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object lbRightClick: TLabel
          Left = 155
          Top = 0
          Width = 58
          Height = 13
          Caption = 'Right click'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Shell Dlg 2'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object lbTop: TLabel
          Left = 8
          Top = 20
          Width = 18
          Height = 13
          Caption = 'Top'
          Color = clBtnFace
          ParentColor = False
        end
        object lbLeft: TLabel
          Left = 8
          Top = 44
          Width = 19
          Height = 13
          Caption = 'Left'
          Color = clBtnFace
          ParentColor = False
        end
        object lbRight: TLabel
          Left = 8
          Top = 68
          Width = 25
          Height = 13
          Caption = 'Right'
          Color = clBtnFace
          ParentColor = False
        end
        object lbBottom: TLabel
          Left = 8
          Top = 92
          Width = 34
          Height = 13
          Caption = 'Bottom'
          Color = clBtnFace
          ParentColor = False
        end
        object cxLCTop: TComboBox
          Left = 56
          Top = 16
          Width = 97
          Height = 21
          Style = csDropDownList
          TabOrder = 0
        end
        object cxLCLeft: TComboBox
          Left = 56
          Top = 40
          Width = 97
          Height = 21
          Style = csDropDownList
          TabOrder = 2
        end
        object cxLCRight: TComboBox
          Left = 56
          Top = 64
          Width = 97
          Height = 21
          Style = csDropDownList
          TabOrder = 4
        end
        object cxLCBottom: TComboBox
          Left = 56
          Top = 88
          Width = 97
          Height = 21
          Style = csDropDownList
          TabOrder = 6
        end
        object cxRCTop: TComboBox
          Left = 155
          Top = 16
          Width = 97
          Height = 21
          Style = csDropDownList
          TabOrder = 1
        end
        object cxRCBottom: TComboBox
          Left = 155
          Top = 88
          Width = 97
          Height = 21
          Style = csDropDownList
          TabOrder = 7
        end
        object cxRCRight: TComboBox
          Left = 155
          Top = 64
          Width = 97
          Height = 21
          Style = csDropDownList
          TabOrder = 5
        end
        object cxRCLeft: TComboBox
          Left = 155
          Top = 40
          Width = 97
          Height = 21
          Style = csDropDownList
          TabOrder = 3
        end
      end
    end
  end
  object btnOk: TButton
    Left = 128
    Top = 512
    Width = 75
    Height = 25
    Caption = 'Ok'
    Default = True
    TabOrder = 1
    OnClick = btnOkClick
  end
  object btnCancel: TButton
    Left = 216
    Top = 512
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 2
    OnClick = btnCancelClick
  end
  object OpenDialog1: TOpenDialog
    Left = 224
    Top = 8
  end
  object FontDialog1: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Left = 192
    Top = 8
  end
end