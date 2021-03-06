unit UCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls;

type
  TfrmCadastro = class(TForm)
    Panel1: TPanel;
    gridLista: TDBGrid;
    editLocalizar: TEdit;
    labtitulo: TLabel;
    btSair: TBitBtn;
    btNovo: TBitBtn;
    btEditar: TBitBtn;
    btExcluir: TBitBtn;
    DataSource: TDataSource;
    labTotal: TLabel;
    procedure btSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure editLocalizarChange(Sender: TObject);
    procedure AtualizaTotal;
    procedure btNovoClick(Sender: TObject);
    procedure btEditarClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
  private
    FtipoCadastro: integer;
    { Private declarations }
  public
    { Public declarations }

  published
    property tipoCadastro:integer read FtipoCadastro write FtipoCadastro;
  end;

var
  frmCadastro: TfrmCadastro;

implementation

{$R *.dfm}

uses UDados;

procedure TfrmCadastro.AtualizaTotal;
begin
   labTotal.Caption :='Total: ' + inttostr(DataSource.DataSet.RecordCount);
end;

procedure TfrmCadastro.btEditarClick(Sender: TObject);
begin
  Application.MessageBox('Funcionalidade em desenvolvimento.', 'Aviso', + MB_ICONINFORMATION + mb_ok);
end;

procedure TfrmCadastro.btExcluirClick(Sender: TObject);
begin
  Application.MessageBox('Funcionalidade em desenvolvimento.', 'Aviso', + MB_ICONINFORMATION + mb_ok);
end;

procedure TfrmCadastro.btNovoClick(Sender: TObject);
begin
  Application.MessageBox('Funcionalidade em desenvolvimento.', 'Aviso', + MB_ICONINFORMATION + mb_ok);
end;

procedure TfrmCadastro.btSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadastro.editLocalizarChange(Sender: TObject);
begin
    gridLista.DataSource.DataSet.Locate(gridLista.Columns[1].FieldName,editLocalizar.Text,[lopartialkey, loCaseInsensitive]);
end;

procedure TfrmCadastro.FormShow(Sender: TObject);
begin
   gridLista.Columns[0].Visible :=false;
   editLocalizar.SetFocus;
   AtualizaTotal;
end;

end.
