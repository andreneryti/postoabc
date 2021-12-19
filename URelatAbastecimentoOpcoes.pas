unit URelatAbastecimentoOpcoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls,
  Vcl.Buttons;

type
  TfrmRelatAbastecimentoOpcoes = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Bevel1: TBevel;
    Label1: TLabel;
    editDataIni: TMaskEdit;
    editDataFim: TMaskEdit;
    Label2: TLabel;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatAbastecimentoOpcoes: TfrmRelatAbastecimentoOpcoes;

implementation

{$R *.dfm}

procedure TfrmRelatAbastecimentoOpcoes.BitBtn1Click(Sender: TObject);
begin
   try
     strtodate(editDataIni.Text)
   except
     Application.MessageBox('Digita a data inicial corretamente.', 'Erro', + mb_iconerror + mb_ok);
     editDataIni.SetFocus;
     ModalResult := mrnone;
   end;

   try
     strtodate(editDataFim.Text)
   except
     Application.MessageBox('Digita a data final corretamente.', 'Erro', + mb_iconerror + mb_ok);
     editDataFim.SetFocus;
     ModalResult := mrnone;
   end;
end;

procedure TfrmRelatAbastecimentoOpcoes.FormShow(Sender: TObject);
begin
  editDataIni.Text := '01/' + FormatDateTime('MM', now())+'/' +FormatDateTime('YYYY', now());
  editDataFim.Text :=  datetostr(now());
end;

end.
