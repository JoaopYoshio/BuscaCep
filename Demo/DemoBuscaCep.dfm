object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 373
  ClientWidth = 307
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Label1: TLabel
    Left = 8
    Top = 115
    Width = 20
    Height = 15
    Caption = 'CEP'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 88
    Top = 32
    Width = 120
    Height = 37
    Caption = 'Busca CEP'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 187
    Width = 27
    Height = 15
    Caption = 'CEP :'
  end
  object Label4: TLabel
    Left = 8
    Top = 226
    Width = 68
    Height = 15
    Caption = 'Logradouro :'
  end
  object Label5: TLabel
    Left = 8
    Top = 261
    Width = 37
    Height = 15
    Caption = 'Bairro :'
  end
  object Label6: TLabel
    Left = 8
    Top = 292
    Width = 43
    Height = 15
    Caption = 'Cidade :'
  end
  object Label7: TLabel
    Left = 8
    Top = 323
    Width = 20
    Height = 15
    Caption = 'UF :'
  end
  object Button1: TButton
    Left = 231
    Top = 111
    Width = 75
    Height = 25
    Caption = 'Buscar'
    TabOrder = 0
    OnClick = Button1Click
  end
  object EditCep: TEdit
    Left = 88
    Top = 112
    Width = 137
    Height = 23
    NumbersOnly = True
    TabOrder = 1
  end
  object MemoCep: TMemo
    Left = 88
    Top = 184
    Width = 211
    Height = 25
    ReadOnly = True
    TabOrder = 2
  end
  object MemoLogradouro: TMemo
    Left = 88
    Top = 223
    Width = 211
    Height = 25
    Cursor = crNoDrop
    ReadOnly = True
    TabOrder = 3
  end
  object MemoBairro: TMemo
    Left = 88
    Top = 258
    Width = 211
    Height = 25
    ReadOnly = True
    TabOrder = 4
  end
  object MemoCidade: TMemo
    Left = 88
    Top = 289
    Width = 211
    Height = 25
    ReadOnly = True
    TabOrder = 5
  end
  object MemoUF: TMemo
    Left = 88
    Top = 320
    Width = 211
    Height = 25
    Lines.Strings = (
      '')
    ReadOnly = True
    TabOrder = 6
  end
  object NetHTTPClient1: TNetHTTPClient
    UserAgent = 'Embarcadero URI Client/1.0'
    Left = 272
    Top = 64
  end
end
