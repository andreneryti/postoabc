object frmAbastecimento: TfrmAbastecimento
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = '::: Abastecimento'
  ClientHeight = 201
  ClientWidth = 520
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 359
    Top = 8
    Width = 142
    Height = 111
  end
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 43
    Height = 16
    Caption = 'Bomba'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 16
    Top = 72
    Width = 37
    Height = 16
    Caption = 'Litros'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 104
    Top = 72
    Width = 70
    Height = 16
    Caption = 'Valor Total'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label7: TLabel
    Left = 208
    Top = 72
    Width = 103
    Height = 16
    Caption = 'Imposto (Valor)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 367
    Top = 13
    Width = 26
    Height = 16
    Caption = 'Data'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object labData: TLabel
    Left = 369
    Top = 28
    Width = 80
    Height = 16
    Caption = '99/99/9999'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 368
    Top = 48
    Width = 121
    Height = 16
    Caption = 'Valor do Combust'#237'vel'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object labValor: TLabel
    Left = 368
    Top = 64
    Width = 49
    Height = 16
    Caption = 'R$ 0,00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 367
    Top = 83
    Width = 46
    Height = 16
    Caption = 'Imposto'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object labImposto: TLabel
    Left = 368
    Top = 98
    Width = 26
    Height = 16
    Caption = '0 %'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 145
    Width = 520
    Height = 56
    Align = alBottom
    TabOrder = 0
    DesignSize = (
      520
      56)
    object BitBtn2: TBitBtn
      Left = 423
      Top = 6
      Width = 83
      Height = 42
      Anchors = [akRight, akBottom]
      Caption = 'Cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      ModalResult = 2
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 1
    end
    object btOk: TBitBtn
      Left = 335
      Top = 6
      Width = 83
      Height = 42
      Anchors = [akRight, akBottom]
      Caption = 'OK'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      ModalResult = 1
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 0
      OnClick = btOkClick
    end
  end
  object comboBomba: TComboBox
    Left = 16
    Top = 34
    Width = 297
    Height = 21
    Style = csDropDownList
    TabOrder = 1
    OnSelect = comboBombaSelect
  end
  object editLitros: TEdit
    Left = 17
    Top = 88
    Width = 75
    Height = 21
    TabOrder = 2
    OnExit = editLitrosExit
    OnKeyDown = editLitrosKeyDown
    OnKeyPress = editLitrosKeyPress
  end
  object editValorTotal: TEdit
    Left = 105
    Top = 88
    Width = 89
    Height = 21
    TabOrder = 3
    OnExit = editValorTotalExit
    OnKeyDown = editValorTotalKeyDown
    OnKeyPress = editValorTotalKeyPress
  end
  object editImposto: TEdit
    Left = 209
    Top = 88
    Width = 101
    Height = 21
    ReadOnly = True
    TabOrder = 4
  end
  object dsBombas: TDataSource
    DataSet = DmDados.cdsBombasLista
    Left = 624
    Top = 40
  end
end
