object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 217
  ClientWidth = 393
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object LvotreMot: TLabel
    Left = 24
    Top = 24
    Width = 54
    Height = 13
    Caption = 'Votre mot :'
  end
  object LBulls: TLabel
    Left = 50
    Top = 72
    Width = 28
    Height = 13
    Caption = 'Bulls :'
  end
  object LCows: TLabel
    Left = 45
    Top = 120
    Width = 33
    Height = 13
    Caption = 'Cows :'
  end
  object LaffMotDebug: TLabel
    Left = 185
    Top = 196
    Width = 200
    Height = 13
    Caption = 'label de debug (affiche le mot '#224' chercher)'
    Visible = False
  end
  object LlenMot: TLabel
    Left = 335
    Top = 2
    Width = 52
    Height = 13
    Caption = 'Longueur :'
  end
  object LnbEssai: TLabel
    Left = 335
    Top = 50
    Width = 36
    Height = 13
    Caption = 'Essais :'
  end
  object Emot: TEdit
    Left = 120
    Top = 21
    Width = 169
    Height = 21
    TabOrder = 0
  end
  object Ebulls: TEdit
    Left = 120
    Top = 69
    Width = 41
    Height = 21
    Enabled = False
    TabOrder = 1
    Text = '0'
  end
  object Ecows: TEdit
    Left = 120
    Top = 117
    Width = 41
    Height = 21
    Enabled = False
    TabOrder = 2
    Text = '0'
  end
  object Bgo: TButton
    Left = 24
    Top = 168
    Width = 75
    Height = 25
    Caption = 'GO'
    TabOrder = 3
    OnClick = BgoClick
  end
  object Breset: TButton
    Left = 160
    Top = 168
    Width = 75
    Height = 25
    Caption = 'Reset'
    TabOrder = 4
    OnClick = BresetClick
  end
  object Bquit: TButton
    Left = 296
    Top = 168
    Width = 75
    Height = 25
    Caption = 'Quitter'
    TabOrder = 5
    OnClick = BquitClick
  end
  object EnbEssai: TEdit
    Left = 335
    Top = 69
    Width = 36
    Height = 21
    Enabled = False
    TabOrder = 6
  end
  object EnbChar: TEdit
    Left = 335
    Top = 21
    Width = 36
    Height = 21
    Enabled = False
    TabOrder = 7
  end
  object Mmots: TMemo
    Left = 194
    Top = 69
    Width = 71
    Height = 69
    Enabled = False
    TabOrder = 8
    Visible = False
  end
end
