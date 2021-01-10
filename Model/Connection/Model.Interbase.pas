unit Model.Interbase;

interface

uses
  Model.Connection.Interfaces,
  Data.DB,
  DataSnap.DBClient,
  IBX.IBDatabase,
  IBX.IBCustomDataSet,
  IBX.IBQuery, System.Classes;

type
  TInterbase = class (TInterfacedObject, iConnection)
  private
    FConnection : TIBDatabase;
    FQuery : TIBQuery;
  public
    constructor Create(aConnection : TIBDatabase);
    destructor Destroy; override;
    class function New(aConnection : TIBDatabase) : iConnection;
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

function TInterbase.CommitTransaction: iConnection;
begin
  Result := Self;
  FConnection.DefaultTransaction.CommitRetaining;
end;

constructor TInterbase.Create(aConnection: TIBDatabase);
begin
  FQuery := TIBQuery.Create(nil);
  FConnection := aConnection;
  FQuery.Database := FConnection;
end;

function TInterbase.DataSet: TClientDataSet;
begin
  Result := TClientDataSet(FQuery);
end;

destructor TInterbase.Destroy;
begin
  FreeAndNil(FQuery);
  inherited;
end;

function TInterbase.ExecSQL: iConnection;
begin
  Result := Self;
  FQuery.Prepare;
  FQuery.ExecSQL;
end;

class function TInterbase.New(aConnection: TIBDatabase): iConnection;
begin
  Result := Self.Create(aConnection);
end;

function TInterbase.Open(aSQL: String): iConnection;
begin
  Result := Self;
  FQuery.Close;
  FQuery.SQL.Add(aSQL);
  FQuery.Open;
end;

function TInterbase.Open: iConnection;
begin
  Result := Self;
  FQuery.Close;
  FQuery.Prepare;
  FQuery.Open;
end;

function TInterbase.SQL: TStrings;
begin
  Result := FQuery.SQL;
end;

end.
