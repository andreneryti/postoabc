program ProjPosto;

uses
  Vcl.Forms,
  UPrincipal in 'UPrincipal.pas' {frmPrincipal},
  UDados in 'UDados.pas' {DmDados: TDataModule},
  UCadastroOpcoes in 'UCadastroOpcoes.pas' {frmCadastroOpcoes},
  UCadastro in 'UCadastro.pas' {frmCadastro},
  UAbastecimento in 'UAbastecimento.pas' {frmAbastecimento},
  URelatAbastecimento in 'URelatAbastecimento.pas' {frmRelatAbastecimentos},
  URelatAbastecimentoOpcoes in 'URelatAbastecimentoOpcoes.pas' {frmRelatAbastecimentoOpcoes};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDmDados, DmDados);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
