object frmCadastroOpcoes: TfrmCadastroOpcoes
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro - Op'#231#245'es'
  ClientHeight = 189
  ClientWidth = 246
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  DesignSize = (
    246
    189)
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 16
    Top = 16
    Width = 209
    Height = 108
    Anchors = [akLeft, akTop, akRight, akBottom]
    ExplicitHeight = 121
  end
  object radBombas: TRadioButton
    Left = 40
    Top = 32
    Width = 86
    Height = 17
    Caption = 'Bombas'
    Checked = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    TabStop = True
  end
  object radTanques: TRadioButton
    Left = 40
    Top = 56
    Width = 86
    Height = 17
    Caption = 'Tanques'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object radCombust: TRadioButton
    Left = 40
    Top = 80
    Width = 166
    Height = 17
    Caption = 'Tipos de Combust'#237'veis'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object Panel1: TPanel
    Left = 0
    Top = 142
    Width = 246
    Height = 47
    Align = alBottom
    TabOrder = 3
    object BitBtn1: TBitBtn
      Left = 80
      Top = 8
      Width = 75
      Height = 33
      Kind = bkOK
      NumGlyphs = 2
      TabOrder = 0
    end
    object BitBtn2: TBitBtn
      Left = 160
      Top = 8
      Width = 75
      Height = 33
      Kind = bkCancel
      NumGlyphs = 2
      TabOrder = 1
    end
  end
end
