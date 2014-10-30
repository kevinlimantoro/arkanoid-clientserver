object Form1: TForm1
  Left = 181
  Top = 132
  Width = 679
  Height = 480
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Shape1: TShape
    Left = 40
    Top = 160
    Width = 33
    Height = 89
  end
  object Shape2: TShape
    Left = 632
    Top = 16
    Width = 33
    Height = 33
    Shape = stCircle
  end
  object Label1: TLabel
    Left = 48
    Top = 24
    Width = 32
    Height = 13
    Caption = 'Label1'
  end
  object Label2: TLabel
    Left = 48
    Top = 56
    Width = 32
    Height = 13
    Caption = 'Label2'
  end
  object Edit1: TEdit
    Left = 24
    Top = 400
    Width = 113
    Height = 21
    TabOrder = 0
    Text = '127.0.0.1'
  end
  object ClientSocket1: TClientSocket
    Active = False
    ClientType = ctNonBlocking
    Port = 0
    OnRead = ClientSocket1Read
    Left = 16
    Top = 16
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 16
    Top = 64
  end
end
