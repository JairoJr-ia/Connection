unit Model.FireDAC;

interface

uses
  Model.Connection.Interfaces,
  Data.DB,
  DataSnap.DBClient,
  FireDAC.Comp.Client, System.Classes,
  FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TFireDAC = class (TInterfacedObject, iConnection)
  private
    FConnection : TFDConnection;
    FQuery : TFDQuery;
  public
    constructor Create(aConnection : TFDConnection);
    destructor Destroy; override;
    class function New(aConnection : TFDConnection) : iConnection;
    function ExecSQL : iConnection;
    function DataSet : TClientDataSet;
    function Open(aSQL : String) : iConnection; overload;
    function Open : iConnection; overload;
    function SQL : TStrings;
    function CommitTransaction : iConnection;
  end;

implementation

uses
  System.SysUtils;

{ TInterbase }

function TFireDAC.CommitTransaction: iConnection;
begin
  Result := Self;
  FConnection.CommitRetaining;
end;

constructor TFireDAC.Create(aConnection: TFDConnection);
begin
  FQuery := TFDQuery.Create(nil);
  FConnection := aConnection;
  FQuery.Connection := FConnection;
end;

function TFireDAC.DataSet: TClientDataSet;
begin
  Result := TClientDataSet(FQuery);
end;

destructor TFireDAC.Destroy;
begin
  FreeAndNil(FQuery);
  inherited;
end;

function TFireDAC.ExecSQL: iConnection;
begin
  Result := Self;

  FQuery.Prepare;
  FQuery.ExecSQL;

end;

class function TFireDAC.New(aConnection: TFDConnection): iConnection;
begin
  Result := Self.Create(aConnection);
end;

function TFireDAC.Open(aSQL: String): iConnection;
begin
  Result := Self;
  FQuery.Close;
  FQuery.Open(aSQL);
  FQuery.RecordCount;
end;

function TFireDAC.Open: iConnection;
begin
  Result := Self;
  FQuery.Close;

  FQuery.Prepare;
  FQuery.Open;
end;

function TFireDAC.SQL: TStrings;
begin
  Result := FQuery.SQL;
end;



end.

