unit View.Projeto.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Datasnap.DBClient,
  Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Model.DAO.Interfaces, Model.DAO,
  Model.Connection.Interbase, Model.Interbase, Model.FireDAC,
  Model.Connection.FireDAC, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, cxGridCustomPopupMenu, cxGridPopupMenu, Vcl.ExtCtrls, Vcl.Grids,
  Vcl.DBGrids, cxContainer, cxTextEdit, cxDBEdit, cxLabel;

type
  TForm2 = class(TForm)
    cdsGRUPO: TClientDataSet;
    dsGrupo: TDataSource;
    cdsGRUPOCODIGO: TIntegerField;
    cdsGRUPONOME: TStringField;
    Button1: TButton;
    RadioGroup1: TRadioGroup;
    cxGridPopupMenu1: TcxGridPopupMenu;
    cxStylePrincipal: TcxStyleRepository;
    cxStyleHeader: TcxStyle;
    cxStyleRow: TcxStyle;
    cxStyleRowOdd: TcxStyle;
    cxStyleGroupByBox: TcxStyle;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1DBTableView1Column1: TcxGridDBColumn;
    cxGrid1DBTableView1Column2: TcxGridDBColumn;
    dsPesqGrupo: TDataSource;
    cdsPesqGrupo: TClientDataSet;
    cdsPesqGrupoCODIGO: TIntegerField;
    cdsPesqGrupoNOME: TStringField;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    edNome: TcxDBTextEdit;
    Button2: TButton;
    Button3: TButton;
    procedure FormCreate(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
    FDAO : iDAO;
    FDAOConsulta : iDAO;
    procedure escolherConexao;
    procedure pesquisar;
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.FormCreate(Sender: TObject);
begin
  cdsGRUPO.CreateDataSet;
  cdsPesqGrupo.CreateDataSet;
  ReportMemoryLeaksOnShutdown := True;
  escolherConexao;
  pesquisar;
end;

procedure TForm2.RadioGroup1Click(Sender: TObject);
begin
  escolherConexao;
  pesquisar;
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
  FDAO.Insert( cdsGRUPO );
  pesquisar;
  cdsGRUPO.EmptyDataSet;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  pesquisar;
end;

procedure TForm2.Button3Click(Sender: TObject);
begin
  FDAOConsulta.Delete( cdsGRUPO );
  pesquisar;

end;

procedure TForm2.escolherConexao;
begin
  if RadioGroup1.ItemIndex = 0 then
  begin
    FDAO := TDAO.New( TFireDAC.New( fd.FDConnection1 ) );
    FDAOConsulta := TDAO.New( TFireDAC.New( fd.FDConnection1 ) );
  end
  else
  begin
    FDAO := TDAO.New( TInterbase.New( dm.IBDatabase1 ) );
    FDAOConsulta := TDAO.New( TInterbase.New( dm.IBDatabase1 ) );
  end;
  pesquisar;
end;

procedure TForm2.pesquisar;
begin
  dsPesqGrupo.DataSet := FDAOConsulta.Find('select * from GRUPO order by CODIGO desc');
end;

end.
