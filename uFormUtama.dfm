object Form1: TForm1
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'NEC Room Status --> Emerald'
  ClientHeight = 494
  ClientWidth = 593
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 394
    Width = 38
    Height = 13
    Caption = 'PABX IP'
  end
  object Label2: TLabel
    Left = 354
    Top = 391
    Width = 52
    Height = 13
    Caption = 'DATABASE'
  end
  object Label3: TLabel
    Left = 181
    Top = 394
    Width = 55
    Height = 13
    Caption = 'PABX PORT'
  end
  object Memo1: TMemo
    Left = 8
    Top = 24
    Width = 577
    Height = 361
    TabOrder = 0
  end
  object Button1: TButton
    Left = 8
    Top = 449
    Width = 75
    Height = 25
    Caption = 'START'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 97
    Top = 449
    Width = 75
    Height = 25
    Caption = 'STOP'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = Button2Click
  end
  object Edit1: TEdit
    Left = 8
    Top = 413
    Width = 164
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object Edit2: TEdit
    Left = 354
    Top = 413
    Width = 164
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
  object Edit3: TEdit
    Left = 181
    Top = 413
    Width = 164
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
  end
  object ClientSocket1: TClientSocket
    Active = False
    ClientType = ctNonBlocking
    Port = 0
    OnRead = ClientSocket1Read
    Left = 40
    Top = 40
  end
  object pabxdb: TZConnection
    Protocol = 'mysql-5'
    Left = 360
    Top = 248
  end
  object emeralddb: TZConnection
    Protocol = 'mysql-5'
    Left = 488
    Top = 256
  end
end
