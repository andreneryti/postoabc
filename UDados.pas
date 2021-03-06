unit UDados;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client, forms,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  Datasnap.DBClient, Datasnap.Provider, FireDAC.Comp.DataSet, windows,
  FireDAC.Phys.IBBase;

type
  TDmDados = class(TDataModule)
    FDConexao: TFDConnection;
    FDQuery: TFDQuery;
    dspCadastro: TDataSetProvider;
    cdsCadastro: TClientDataSet;
    cdsBombasLista: TClientDataSet;
    QueryRelatAbastecimento: TFDQuery;
    QueryRelatAbastecimentoTanque: TStringField;
    QueryRelatAbastecimentoBomba: TStringField;
    QueryRelatAbastecimentoData: TDateField;
    QueryRelatAbastecimentoValor: TFMTBCDField;
    QueryRelatAbastecimentoLitros: TFMTBCDField;
    dspRelatAbastecimento: TDataSetProvider;
    cdsRelatAbastecimento: TClientDataSet;
    cdsRelatAbastecimentoTanque: TStringField;
    cdsRelatAbastecimentoBomba: TStringField;
    cdsRelatAbastecimentoData: TDateField;
    cdsRelatAbastecimentoValor: TFMTBCDField;
    cdsRelatAbastecimentoLitros: TFMTBCDField;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    function AbreConexao:integer;
    function FechaConexao:integer;
    function ListaCadastro(parametro:integer):integer;
    function ExecuteProc(Name: string; parametros: string): integer;
    function ListaBombas:integer;
    function retornaValorImposto:real;
    function retornaValorCombustivel(combust_id:integer):real;
    function novoAbastecimento(bastec_id, bomba_id: integer; qtde,valor, valortotal, impostoaplicado,impostovalor: real):integer;
    function relatorioAbastecimento(dataini, datafim: Tdatetime): integer;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmDados: TDmDados;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

function TDmDados.AbreConexao: integer;
begin
   FDConexao.Connected:=false;
   FDConexao.ConnectionString := 'Database=' +  ExtractFilePath(Application.ExeName)+'Banco\POSTO.fdb' + ';User_Name=sysdba;Password=masterkey;DriverID=FB';
   try
     FDConexao.Connected:=true;
     result :=1;
   Except
     result :=0;
   end;
end;

function TDmDados.ExecuteProc(Name, parametros: string): integer;
var
  retorno: Integer;
begin
    if AbreConexao = 0 then
    begin
       Application.MessageBox('Erro ao executar o comando. ', 'Erro', + mb_iconerror + mb_ok);
       result :=0;
    end
    else
    begin
       FDQuery.Sql.Clear;
       FDQuery.Sql.add('execute procedure ' + name + ' (' + parametros + ')');
       try
         FDQuery.ExecSQL;
         retorno := 1;
       except
         retorno := 0;
       end;
    end;
    FechaConexao;
    result := retorno;
end;

function TDmDados.FechaConexao: integer;
begin
   try
      FDConexao.Connected:=false;
      result :=1;
   except
      result :=0;
   end;
end;

function TDmDados.ListaBombas: integer;
begin
  if AbreConexao = 0 then
  begin
    Application.MessageBox('Erro ao abrir a conex?o.', 'Erro', + mb_iconerror + mb_ok);
    result :=0;
  end
  else
  begin
    FDQuery.Close;
    FdQuery.SQL.Clear;
    cdsBombasLista.Close;
    FdQuery.SQL.add (' select b.bomba_id , b.bomba_desc || '' << '' ||t.tanque_desc  || '' << '' || tp.tipocomb_desc "bomba", tp.tipocomb_id  from bombas b ');
    FdQuery.SQL.add (' inner join tanque t on t.tanque_id = b.tanque_id ');
    FdQuery.SQL.add (' inner join tipo_combustivel tp on tp.tipocomb_id = b.tipocomb_id ');
    FdQuery.SQL.add (' order by b.bomba_desc ' );
    cdsBombasLista.FetchParams;
    cdsBombasLista.Open;
    FechaConexao;
    Result :=1;
  end;

end;

function TDmDados.ListaCadastro(parametro: integer): integer;
begin
    if AbreConexao = 0 then
    begin
       Application.MessageBox('Erro ao abrir a conex?o.', 'Erro', + mb_iconerror + mb_ok);
       result :=0;
    end
    else
    begin
        FDQuery.Close;
        FdQuery.SQL.Clear;
        cdsCadastro.Close;
        if parametro = 1  then  //Bomba
        begin
            FdQuery.SQL.add (' select b.bomba_id "Identifica??o", b.bomba_desc "Descri??o da Bomba", t.tanque_desc "Tanque", tp.tipocomb_desc "Tipo de Combust?vel" from bombas b ');
            FdQuery.SQL.add (' inner join tanque t on t.tanque_id = b.tanque_id ');
            FdQuery.SQL.add (' inner join tipo_combustivel tp on tp.tipocomb_id = b.tipocomb_id ');
            FdQuery.SQL.add (' order by b.bomba_desc ' );
        end
        else
        if parametro = 2  then  //Tanque
        begin
            FdQuery.SQL.add (' select t.tanque_id "tanque_id", t.tanque_desc "Descri??o do Tanque" from tanque t ');
            FdQuery.SQL.add (' order by t.tanque_desc ');
        end
        else
        if parametro = 3  then  //Tanque
        begin
            FdQuery.SQL.add (' select t.tipocomb_id "tipocomb_id" , t.tipocomb_desc "Tipo de Combust?vel" from tipo_combustivel t ');
            FdQuery.SQL.add (' order by t.tipocomb_desc ');
        end;
        cdsCadastro.FetchParams;
        cdsCadastro.Open;
        FechaConexao;
        Result :=1;
    end;
end;

function TDmDados.novoAbastecimento(bastec_id, bomba_id: integer; qtde, valor,
  valortotal, impostoaplicado, impostovalor: real): integer;
var
  retorno: Integer;
  nomeproc, parametros: string;
begin
  if AbreConexao = 0 then
  begin
    Application.MessageBox('Erro ao abrir a conex?o.','Erro', + mb_iconerror + mb_ok);
    result :=0;
  end
  else
  begin
     try
       nomeproc := 'PROC_ABASTECIMENTO_I';
       parametros :=   inttostr(bastec_id) + ',' ;
       parametros := parametros +   inttostr(bomba_id) + ',' ;
       parametros := parametros +   quotedstr(FormatDateTime('YYYY.MM.DD', now())) + ',';
       parametros := parametros +   stringreplace(floattostr(qtde), ',', '.', [rfReplaceAll]) + ', ';
       parametros := parametros +   stringreplace(floattostr(valor), ',', '.', [rfReplaceAll]) + ', ';
       parametros := parametros +   stringreplace(floattostr(valortotal), ',', '.', [rfReplaceAll]) + ', ';
       parametros := parametros +   stringreplace(floattostr(impostoaplicado), ',', '.', [rfReplaceAll]) + ', ';
       parametros := parametros +   stringreplace(floattostr(impostovalor), ',', '.', [rfReplaceAll]) ;
       FDQuery.close;
       FDConexao.StartTransaction;
       FDQuery.Sql.Clear;
       FDQuery.Sql.add('execute procedure ' + nomeproc + ' (' + parametros + ')');
       FDQuery.ExecSQL;
       FDConexao.Commit;
       retorno := 1;
    except
       FDConexao.Rollback;
       retorno := 0;
    end;
    FechaConexao;
    result := retorno;
end;

end;

function TDmDados.relatorioAbastecimento(dataini, datafim: Tdatetime): integer;
begin
  if AbreConexao = 0 then
  begin
    Application.MessageBox('Erro ao abrir a conex?o.', 'Erro', + mb_iconerror + mb_ok);
    result :=-1;
  end
  else
  begin
     cdsRelatAbastecimento.Close;
     cdsRelatAbastecimento.Params.ParamByName('dataini').Value := dataini;
     cdsRelatAbastecimento.Params.ParamByName('datafim').Value := datafim;
     cdsRelatAbastecimento.open;
     FechaConexao;
     result := cdsRelatAbastecimento.RecordCount;
  end;

end;

function TDmDados.retornaValorCombustivel(combust_id: integer): real;
var
  valor:real;
begin
  if AbreConexao = 0 then
  begin
    Application.MessageBox('Erro ao abrir a conex?o.', 'Erro', + mb_iconerror + mb_ok);
    result :=0;
  end
  else
  begin
    FDQuery.Close;
    FdQuery.SQL.Clear;
    FdQuery.SQL.add (' select first 1 v.valor from valor_combustivel v ');
    FdQuery.SQL.add (' where v.tipocomb_id = ' + inttostr(combust_id));
    FdQuery.SQL.add (' order by v.data desc ');
    FdQuery.Open;
    valor := strtofloat( FdQuery.FieldByName('valor').Value);
    FechaConexao;
    Result :=valor;
  end;
end;


function TDmDados.retornaValorImposto: real;
var
  valor:real;
begin
  if AbreConexao = 0 then
  begin
    Application.MessageBox('Erro ao abrir a conex?o.', 'Erro', + mb_iconerror + mb_ok);
    result :=0;
  end
  else
  begin
    FDQuery.Close;
    FdQuery.SQL.Clear;
    FdQuery.SQL.add (' select pa.parametro_valor from parametros pa ');
    FdQuery.SQL.add (' where pa.parametro_desc = ''IMPOSTO_ABASTECIMENTO'' ');
    FdQuery.Open;
    valor := strtofloat( FdQuery.FieldByName('parametro_valor').Value);
    FechaConexao;
    Result :=valor;
  end;
end;

end.
