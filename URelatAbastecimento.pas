unit URelatAbastecimento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, Data.DB;

type
  TfrmRelatAbastecimentos = class(TForm)
    RLReport1: TRLReport;
    dsRelatorio: TDataSource;
    RLBand1: TRLBand;
    RLBand2: TRLBand;
    RLBand3: TRLBand;
    RLBand4: TRLBand;
    RLBand5: TRLBand;
    RLLabel1: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    labPeriodo: TRLLabel;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLSystemInfo3: TRLSystemInfo;
    RLSystemInfo4: TRLSystemInfo;
    RLLabel6: TRLLabel;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLLabel7: TRLLabel;
    RLDBResult1: TRLDBResult;
    RLLabel8: TRLLabel;
    procedure RLDBResult1Compute(Sender: TObject; var Value: Variant;
      var AText: string; var ComputeIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatAbastecimentos: TfrmRelatAbastecimentos;

implementation

{$R *.dfm}

uses UDados;

procedure TfrmRelatAbastecimentos.RLDBResult1Compute(Sender: TObject;
  var Value: Variant; var AText: string; var ComputeIt: Boolean);
begin
   Value := dsRelatorio.dataset.FieldByName('valor').AsCurrency;
end;

end.
