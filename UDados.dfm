object DmDados: TDmDados
  OldCreateOrder = False
  Height = 435
  Width = 844
  object FDConexao: TFDConnection
    Params.Strings = (
      'Database=C:\PostoABC\fontes\Win32\Debug\banco\POSTO.FDB'
      'User_Name=sysdba'
      'Password=masterkey'
      'DriverID=FB')
    LoginPrompt = False
    Left = 24
    Top = 16
  end
  object FDQuery: TFDQuery
    Connection = FDConexao
    Left = 32
    Top = 88
  end
  object dspCadastro: TDataSetProvider
    DataSet = FDQuery
    Left = 32
    Top = 144
  end
  object cdsCadastro: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCadastro'
    Left = 32
    Top = 200
  end
  object cdsBombasLista: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCadastro'
    Left = 192
    Top = 208
  end
  object QueryRelatAbastecimento: TFDQuery
    Connection = FDConexao
    SQL.Strings = (
      
        'select  t.tanque_desc "Tanque", b.bomba_desc ||'#39'('#39'|| tp.tipocomb' +
        '_desc||'#39')'#39' "Bomba",a.data "Data", sum(a.valortotal) "Valor", sum' +
        '(a.qtde)"Litros" from abastecimento a'
      'inner join bombas b on b.bomba_id = a.bomba_id'
      'inner join tanque t on t.tanque_id = B.tanque_id'
      'inner join tipo_combustivel tp on tp.tipocomb_id = b.tipocomb_id'
      'where a.data between :dataini and :datafim'
      'group by 1,2,3'
      'order by a.data')
    Left = 496
    Top = 192
    ParamData = <
      item
        Name = 'DATAINI'
        DataType = ftDate
        ParamType = ptInput
        Value = 44197d
      end
      item
        Name = 'DATAFIM'
        DataType = ftDate
        ParamType = ptInput
        Value = 44549d
      end>
    object QueryRelatAbastecimentoTanque: TStringField
      FieldName = 'Tanque'
      Origin = '"Tanque"'
      Size = 30
    end
    object QueryRelatAbastecimentoBomba: TStringField
      FieldName = 'Bomba'
      Origin = '"Bomba"'
      Size = 62
    end
    object QueryRelatAbastecimentoData: TDateField
      FieldName = 'Data'
      Origin = '"Data"'
    end
    object QueryRelatAbastecimentoValor: TFMTBCDField
      FieldName = 'Valor'
      Origin = '"Valor"'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object QueryRelatAbastecimentoLitros: TFMTBCDField
      FieldName = 'Litros'
      Origin = '"Litros"'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
  end
  object dspRelatAbastecimento: TDataSetProvider
    DataSet = QueryRelatAbastecimento
    Left = 496
    Top = 240
  end
  object cdsRelatAbastecimento: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftDate
        Name = 'DATAINI'
        ParamType = ptInput
        Value = 44197d
      end
      item
        DataType = ftDate
        Name = 'DATAFIM'
        ParamType = ptInput
        Value = 44549d
      end>
    ProviderName = 'dspRelatAbastecimento'
    Left = 496
    Top = 296
    object cdsRelatAbastecimentoTanque: TStringField
      FieldName = 'Tanque'
      Origin = '"Tanque"'
      Size = 30
    end
    object cdsRelatAbastecimentoBomba: TStringField
      FieldName = 'Bomba'
      Origin = '"Bomba"'
      Size = 62
    end
    object cdsRelatAbastecimentoData: TDateField
      FieldName = 'Data'
      Origin = '"Data"'
    end
    object cdsRelatAbastecimentoValor: TFMTBCDField
      FieldName = 'Valor'
      Origin = '"Valor"'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object cdsRelatAbastecimentoLitros: TFMTBCDField
      FieldName = 'Litros'
      Origin = '"Litros"'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    VendorLib = 'fbclient.dll'
    Left = 216
    Top = 104
  end
end
