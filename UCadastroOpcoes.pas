unit UCadastroOpcoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TfrmCadastroOpcoes = class(TForm)
    radBombas: TRadioButton;
    radTanques: TRadioButton;
    radCombust: TRadioButton;
    Panel1: TPanel;
    Bevel1: TBevel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  frmCadastroOpcoes: TfrmCadastroOpcoes;

implementation

{$R *.dfm}

end.
