program Projeto;

uses
  Vcl.Forms,
  View.Projeto.Principal in 'View\View.Projeto.Principal.pas' {Form2},
  Model.Connection.Interfaces in 'Model\Connection\Model.Connection.Interfaces.pas',
  Model.FireDAC in 'Model\Connection\Model.FireDAC.pas',
  Model.Interbase in 'Model\Connection\Model.Interbase.pas',
  Model.DAO.Interfaces in 'Model\DAO\Model.DAO.Interfaces.pas',
  Model.DAO in 'Model\DAO\Model.DAO.pas',
  Model.Connection.Interbase in 'Model\Interbase\Model.Connection.Interbase.pas' {dm: TDataModule},
  Model.SQL.Interfaces in 'Model\SQL\Model.SQL.Interfaces.pas',
  Model.SQL in 'Model\SQL\Model.SQL.pas',
  Model.ClientDataSet.Interfaces in 'Model\ClientDataSet\Model.ClientDataSet.Interfaces.pas',
  Model.ClientDataSet in 'Model\ClientDataSet\Model.ClientDataSet.pas',
  Model.Connection.FireDAC in 'Model\FireDAC\Model.Connection.FireDAC.pas' {FD: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TFD, FD);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
