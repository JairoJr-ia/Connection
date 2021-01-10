unit Model.DAO;

interface

uses
  Data.DB,
  System.Generics.Collections,
  Datasnap.DBClient,
  Model.DAO.Interfaces,
  Model.Connection.Interfaces,
  Model.SQL;

type
  TDAO = class(TInterfacedObject, iDAO)
    private
      FConnection : iConnection;
      FDataSource : TDataSource;
    public
      constructor Create(aConnection : iConnection);
      destructor Destroy; override;
      class function New(aConnection : iConnection) : iDAO; overload;
      function Insert(aDataSet : TClientDataSet) : iDAO; overload;
      function Update(aDataSet : TClientDataSet) : iDAO; overload;
      function Delete(aDataSet : TClientDataSet) : iDAO; overload;
      function Delete(aField : String; aValue : String) : iDAO; overload;
      function DataSource( aDataSource : TDataSource) : iDAO;
      function Find(aSQL : String) : TClientDataSet overload;
      function Find(aId : Integer) : TClientDataSet; overload;
  end;

implementation

uses
  System.SysUtils;

{ TDAO<T> }


{ TDAO }

constructor TDAO.Create(aConnection: iConnection);
begin
  FConnection := aConnection;
end;

function TDAO.DataSource(aDataSource: TDataSource): iDAO;
begin
  Result := Self;
  FDataSource := aDataSource;
  FDataSource.DataSet := FConnection.DataSet;
end;

function TDAO.Delete(aDataSet: TClientDataSet): iDAO;
var
  aSQL : String;
  aTableName: string;
begin
  Result := Self;

  TSQL.New(aDataSet).Delete(aSQL);

//  aSQL := 'DELETE FROM ' + aTableName + ' WHERE ' + aField + ' = ' + aValue;

  FConnection.SQL.Clear;
  FConnection.SQL.Add(aSQL);
  FConnection.ExecSQL;

end;

function TDAO.Delete(aField, aValue: String): iDAO;
begin

end;

destructor TDAO.Destroy;
begin

  inherited;
end;

function TDAO.Find(aSQL  : String): TClientDataSet;
begin
  FConnection.SQL.Clear;
  FConnection.Open(aSQL);
  Result := FConnection.DataSet;
end;

function TDAO.Find(aId: Integer): TClientDataSet;
begin

end;

function TDAO.Insert(aDataSet: TClientDataSet): iDAO;
var
  aSQL : String;
begin
  Result := Self;
  TSQL.New(aDataSet).Insert(aSQL);
  FConnection.SQL.Clear;
  FConnection.SQL.Add(aSQL);
  FConnection.ExecSQL.CommitTransaction;
end;

class function TDAO.New(aConnection: iConnection): iDAO;
begin
  Result := Self.Create(aConnection);
end;

function TDAO.Update(aDataSet: TClientDataSet): iDAO;
begin

end;

end.
