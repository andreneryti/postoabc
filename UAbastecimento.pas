unit UAbastecimento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Data.DB;

type
  TfrmAbastecimento = class(TForm)
    Panel1: TPanel;
    BitBtn2: TBitBtn;
    btOk: TBitBtn;
    Label1: TLabel;
    comboBomba: TComboBox;
    Label4: TLabel;
    Label5: TLabel;
    editLitros: TEdit;
    editValorTotal: TEdit;
    editImposto: TEdit;
    Label7: TLabel;
    Label2: TLabel;
    labData: TLabel;
    Label3: TLabel;
    labValor: TLabel;
    Label6: TLabel;
    labImposto: TLabel;
    Bevel1: TBevel;
    dsBombas: TDataSource;
    procedure addBombas;
    procedure FormShow(Sender: TObject);
    procedure btOkClick(Sender: TObject);
    procedure comboBombaSelect(Sender: TObject);
    procedure editLitrosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CalcDadosValorTotal;
    procedure CalcDadosLitros;
    procedure editLitrosExit(Sender: TObject);
    procedure editValorTotalExit(Sender: TObject);
    procedure editValorTotalKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure editLitrosKeyPress(Sender: TObject; var Key: Char);
    procedure editValorTotalKeyPress(Sender: TObject; var Key: Char);
  private
    FvalorImposto: real;
    FvalorCombust: real;
    FbombaId: real;
    FqtdeLitros: real;
    FvalorTotal: real;
    FimpostoPago: real;
    { Private declarations }
  public
    { Public declarations }
  published
     property valorCombust:real read FvalorCombust write FvalorCombust;
     property valorImposto:real read FvalorImposto write FvalorImposto;
     property bombaId:real read FbombaId write FbombaId;
     property qtdeLitros:real read FqtdeLitros write FqtdeLitros;
     property valorTotal:real read FvalorTotal write FvalorTotal;
     property impostoPago:real read FimpostoPago write FimpostoPago;
  end;

var
  frmAbastecimento: TfrmAbastecimento;

implementation

{$R *.dfm}

uses UDados;

procedure TfrmAbastecimento.addBombas;
begin
  if DmDados.ListaBombas = 1 then
  begin
    dsBombas.DataSet.first;
    comboBomba.Clear;
    while not dsBombas.DataSet.eof do
    begin
       comboBomba.Items.Add( dsBombas.DataSet.fieldbyname('Bomba').value);
       dsBombas.DataSet.next;
    end;
  end
  else
    close;
end;

procedure TfrmAbastecimento.btOkClick(Sender: TObject);
begin
  if not dsBombas.DataSet.Locate('bomba', comboBomba.Text,[]) then
  begin
    Application.MessageBox('Selecione a bomba corretamente.', 'Aviso', + MB_ICONWARNING + mb_ok);
    ModalResult := mrnone;
    comboBomba.SetFocus;
    abort;
  end;
  if editLitros.Text = '' then
  begin
    Application.MessageBox('Digite a quantidade corretamente.', 'Aviso', + MB_ICONWARNING + mb_ok);
    ModalResult := mrnone;
    editLitros.SetFocus;
    abort;
  end;
  if editValorTotal.Text = '' then
  begin
    Application.MessageBox('Digite o valor corretamente.', 'Aviso', + MB_ICONWARNING + mb_ok);
    ModalResult := mrnone;
    editValorTotal.SetFocus;
    abort;
  end;
end;

procedure TfrmAbastecimento.CalcDadosLitros;
begin
  if editValorTotal.text<>'' then
  begin
    try
      valortotal := strtofloat(editValorTotal.text);
      qtdelitros:= valortotal / valorCombust;
      impostopago := valortotal * valorImposto;
      editValorTotal.Text := formatfloat(',0.00',valortotal);
      editLitros.Text := formatfloat(',0.00',qtdelitros);
      editImposto.Text := formatfloat(',0.00',impostopago);
    Except
      Application.MessageBox('Digite o valor total corretamente.', 'Aviso', + MB_ICONWARNING + mb_ok);
      editLitros.SetFocus;
    end;
  end;
end;

procedure TfrmAbastecimento.CalcDadosValorTotal;
begin
if editLitros.text<>'' then
    begin
      try
        qtdelitros:= strtofloat(editLitros.text);
        valortotal := qtdelitros * valorCombust;
        impostoPago := valortotal * valorImposto;
        editValorTotal.Text := formatfloat(',0.00',valortotal);
        editLitros.Text := formatfloat(',0.00',qtdelitros);
        editImposto.Text := formatfloat(',0.00',impostoPago);
      Except
        Application.MessageBox('Digite quantidade de litros corretamente .', 'Aviso', + MB_ICONWARNING + mb_ok);
        editLitros.SetFocus;
      end;
    end;
end;

procedure TfrmAbastecimento.comboBombaSelect(Sender: TObject);
begin
  if dsBombas.DataSet.Locate('bomba', comboBomba.Text,[]) then
  begin
    valorCombust := DmDados.retornaValorCombustivel(dsBombas.DataSet.FieldByName('tipocomb_id').value);
    labValor.Caption := 'R$' + FormatFloat(',0.00', valorCombust);
    bombaId := dsBombas.DataSet.FieldByName('bomba_id').value;
    editLitros.Clear;
    editValorTotal.Clear;
    editImposto.Clear;
  end;
end;

procedure TfrmAbastecimento.editLitrosExit(Sender: TObject);
begin
  CalcDadosValorTotal;
end;

procedure TfrmAbastecimento.editLitrosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
    btOk.SetFocus;
end;

procedure TfrmAbastecimento.editLitrosKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9',',']) then
    key :=#0;
end;

procedure TfrmAbastecimento.editValorTotalExit(Sender: TObject);
begin
  CalcDadosLitros;
end;

procedure TfrmAbastecimento.editValorTotalKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = 13 then
    btOk.SetFocus;
end;

procedure TfrmAbastecimento.editValorTotalKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (key in ['0'..'9',',']) then
    key :=#0;
end;

procedure TfrmAbastecimento.FormShow(Sender: TObject);
begin
  addBombas;
  labData.Caption := datetostr(now());
  valorImposto := DmDados.retornaValorImposto;
  labImposto.Caption := floattostr(valorImposto *100) +'%';
end;

end.
