unit UPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, Vcl.Imaging.jpeg, midaslib;

type
  TfrmPrincipal = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    imgLogo: TImage;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    BitBtn2: TBitBtn;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure BitBtn2Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Image3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses UDados, UCadastroOpcoes, UCadastro, UAbastecimento, URelatAbastecimento,
  URelatAbastecimentoOpcoes;

procedure TfrmPrincipal.BitBtn2Click(Sender: TObject);
begin
   Application.Terminate;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  imglogo.Picture.LoadFromFile('logo.jpg');
end;

procedure TfrmPrincipal.Image1Click(Sender: TObject);
var
   texto:string;
   parametro:integer;
begin
   try
     Application.CreateForm(TfrmCadastroOpcoes,frmCadastroOpcoes);
     if frmCadastroOpcoes.ShowModal = mrok then
     begin
         try
             Application.CreateForm(TfrmCadastro,frmCadastro);
          
             if frmCadastroOpcoes.radBombas.Checked = true then
             begin
                texto:='Bomba';
                parametro :=1;               
             end
             else
             if frmCadastroOpcoes.radTanques.Checked = true then
             begin
                texto:='Tanque';
                parametro :=2;               
             end
             else
             if frmCadastroOpcoes.radCombust.Checked = true then
             begin
                texto:='Tipo de Combustível';
                parametro :=3;
             end;
             frmCadastro.Caption:=  frmCadastro.Caption +texto;
             frmCadastro.labtitulo.caption:= frmCadastro.labtitulo.caption + texto;
             frmCadastro.tipoCadastro :=parametro;
             if Dmdados.ListaCadastro(parametro) = 1 then
                frmCadastro.ShowModal;
         finally
             frmCadastro.free;
         end;
     end
     else
        Exit;
   Finally

   end;
end;

procedure TfrmPrincipal.Image2Click(Sender: TObject);
begin
  try
     Application.CreateForm(tfrmAbastecimento,frmAbastecimento);
     if frmAbastecimento.ShowModal = mrok then
     begin
       if (DmDados.novoAbastecimento( 0,
                                        frmAbastecimento.dsBombas.DataSet.fieldbyname('bomba_id').value,
                                        frmAbastecimento.qtdeLitros,
                                        frmAbastecimento.valorCombust,
                                        frmAbastecimento.valorTotal,
                                        frmAbastecimento.valorImposto,
                                        frmAbastecimento.impostoPago ) ) = 1 then
           Application.MessageBox('Abastecimento registrado com sucesso.','Aviso', + MB_ICONINFORMATION + mb_ok)
       else
           Application.MessageBox('Erro ao registrar o Abastecimento.','Erro', + MB_ICONERROR + mb_ok);
     end;
  finally
    frmAbastecimento.free;
  end;

end;

procedure TfrmPrincipal.Image3Click(Sender: TObject);
var
   data1, data2:TDatetime;
begin
  try
    Application.CreateForm(TfrmRelatAbastecimentoOpcoes,frmRelatAbastecimentoOpcoes);
    if frmRelatAbastecimentoOpcoes.showmodal = mrok then
    begin
      data1 := strtodate(frmRelatAbastecimentoOpcoes.editDataIni.text);
      data2 := strtodate(frmRelatAbastecimentoOpcoes.editDataFim.text);    
      if DmDados.RelatorioAbastecimento(data1, data2) = 0 then
         Application.MessageBox('Não há abastecimento registrado no período informado.','Aviso', + MB_ICONINFORMATION + mb_ok)
      else
      begin
        try
          Application.CreateForm(TfrmRelatAbastecimentos, frmRelatAbastecimentos);
          frmRelatAbastecimentos.labPeriodo.Caption := frmRelatAbastecimentos.labPeriodo.Caption+ ' ' + datetostr(data1) +  ' a ' +  datetostr(data2); 
          frmRelatAbastecimentos.RLReport1.Preview;
        finally
          frmRelatAbastecimentos.free;
        end;
       end;
    end;
  finally
      frmRelatAbastecimentoOpcoes.free;
  end;

end;

end.
