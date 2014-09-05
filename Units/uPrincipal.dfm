object Form_Principal: TForm_Principal
  Left = 392
  Top = 32
  BorderStyle = bsSingle
  ClientHeight = 925
  ClientWidth = 913
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnKeyPress = FormKeyPress
  PixelsPerInch = 120
  TextHeight = 16
  object Label_SQL: TLabel
    Left = 9
    Top = 9
    Width = 36
    Height = 21
    Caption = 'SQL'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -18
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label_Variaveis: TLabel
    Left = 9
    Top = 624
    Width = 72
    Height = 21
    Caption = 'Vari'#225'veis'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -18
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label_Resultado: TLabel
    Left = 464
    Top = 9
    Width = 81
    Height = 21
    Caption = 'Resultado'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -18
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object SpeedButton_Substituir: TSpeedButton
    Left = 282
    Top = 861
    Width = 157
    Height = 45
    Caption = '&Substituir'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    OnClick = SpeedButton_SubstituirClick
  end
  object SpeedButton_Copiar: TSpeedButton
    Left = 474
    Top = 861
    Width = 157
    Height = 45
    Caption = '&Copiar Resultado'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    OnClick = SpeedButton_CopiarClick
  end
  object RichEdit_SQL: TRichEdit
    Left = 9
    Top = 28
    Width = 440
    Height = 581
    BevelKind = bkTile
    BorderStyle = bsNone
    Ctl3D = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -18
    Font.Name = 'Courier'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    PopupMenu = PopupMenu_OpcoesRichText
    ScrollBars = ssBoth
    TabOrder = 0
    Zoom = 100
  end
  object RichEdit_Variaveis: TRichEdit
    Left = 9
    Top = 644
    Width = 896
    Height = 200
    BevelKind = bkTile
    BorderStyle = bsNone
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -18
    Font.Name = 'Courier'
    Font.Style = []
    ParentFont = False
    PopupMenu = PopupMenu_OpcoesRichText
    ScrollBars = ssBoth
    TabOrder = 1
    Zoom = 100
  end
  object RichEdit_Resultado: TRichEdit
    Left = 464
    Top = 28
    Width = 440
    Height = 581
    BevelKind = bkTile
    BorderStyle = bsNone
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -18
    Font.Name = 'Courier'
    Font.Style = []
    ParentFont = False
    PopupMenu = PopupMenu_OpcoesRichText
    ScrollBars = ssBoth
    TabOrder = 2
    Zoom = 100
    OnKeyDown = RichEdit_ResultadoKeyDown
    OnKeyUp = RichEdit_ResultadoKeyUp
  end
  object PopupMenu_OpcoesRichText: TPopupMenu
    OnPopup = PopupMenu_OpcoesRichTextPopup
    Left = 72
    Top = 864
    object Abrir1: TMenuItem
      Caption = 'Abrir'
      Default = True
      OnClick = Abrir1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Carrregararquivo1: TMenuItem
      Caption = 'Carrregar arquivo'
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object Recortar1: TMenuItem
      Caption = 'Recortar'
    end
    object Copiar1: TMenuItem
      Caption = 'Copiar'
    end
    object Colar1: TMenuItem
      Caption = 'Colar'
    end
  end
end
