object Form_Visualizador: TForm_Visualizador
  Left = 250
  Top = 8
  Width = 1250
  Height = 1000
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
  object RichEdit_Texto: TRichEdit
    Left = 0
    Top = 0
    Width = 1242
    Height = 873
    Align = alTop
    BevelKind = bkTile
    BorderStyle = bsNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Courier'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 0
  end
  object BitBtn_Substituir: TBitBtn
    Left = 446
    Top = 896
    Width = 157
    Height = 57
    Caption = '&Aplicar altera'#231#227'o'
    ModalResult = 1
    TabOrder = 1
    TabStop = False
  end
  object BitBtn1: TBitBtn
    Left = 638
    Top = 896
    Width = 157
    Height = 57
    Caption = '&Fechar'
    ModalResult = 2
    TabOrder = 2
    TabStop = False
    OnClick = BitBtn1Click
  end
end
