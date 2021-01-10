unit Model.SQL;

interface

uses
  DataSnap.DBClient,
  Model.SQL.Interfaces,
  Model.ClientDataSet;

type
  TSQL = class(TInterfacedObject, iSQL)
    private
      FClientDataSet : TClientDataSet;
      FFields : String;
      FWhere : String;
      FOrderBy : String;
      FGroupBy : String;
      FJoin : String;
    public
      constructor Create(aClientDataSet : TClientDataSet);
      destructor Destroy; override;
      class function New(aClientDataSet : TClientDataSet) : iSQL;
      function Insert (var aSQL : String) : iSQL;
      function Update (var aSQL : String) : iSQL;
      function Delete (var aSQL : String) : iSQL;
      function Select (var aSQL : String) : iSQL;
      function SelectId(var aSQL: String): iSQL;
      function Fields (aSQL : String) : iSQL;
      function Where (aSQL : String) : iSQL;
      function OrderBy (aSQL : String) : iSQL;
      function GroupBy (aSQL : String) : iSQL;
      function Join (aSQL : String) : iSQL;
  end;

implementation

uses
  Vcl.Dialogs;

{ TSQL }

constructor TSQL.Create(aClientDataSet: TClientDataSet);
begin
  FClientDataSet := aClientDataSet;
end;

function TSQL.Delete(var aSQL: String): iSQL;
var
  aClassName, aFields, aParam : String;
begin
  Result := Self;
  TFieldClientDataSet.New(FClientDataSet)
    .TableName(aClassName)
    .FieldsDelete(aFields)
    .ParamDelete(aParam);

  aSQL := aSQL + 'DELETE FROM ' + aClassName;
  aSQL := aSQL + ' WHERE '+ aFields + ' = ';
  aSQL := aSQL + aParam +';';

end;

destructor TSQL.Destroy;
begin

  inherited;
end;

function TSQL.Fields(aSQL: String): iSQL;
begin
  Result := Self;
  FFields := aSQL;
end;

function TSQL.GroupBy(aSQL: String): iSQL;
begin
  Result := Self;
  FGroupBy := aSQL;
end;

function TSQL.Insert(var aSQL: String): iSQL;
var
  aClassName, aFields, aParam : String;
begin
  Result := Self;

  TFieldClientDataSet.New(FClientDataSet)
    .TableName(aClassName)
    .FieldsInsert(aFields)
    .Param(aParam);

  aSQL := aSQL + 'INSERT INTO ' + aClassName;
  aSQL := aSQL + ' (' + aFields + ') ';
  aSQL := aSQL + ' VALUES (' + aParam + ');';
end;

function TSQL.Join(aSQL: String): iSQL;
begin
  Result := Self;
  FJoin := aSQL;
end;

class function TSQL.New(aClientDataSet: TClientDataSet): iSQL;
begin
  Result := Self.Create(aClientDataSet);
end;

function TSQL.OrderBy(aSQL: String): iSQL;
begin
  Result := Self;
  FOrderBy := aSQL;
end;

function TSQL.Select(var aSQL: String): iSQL;
begin

end;

function TSQL.SelectId(var aSQL: String): iSQL;
begin

end;

function TSQL.Update(var aSQL: String): iSQL;
begin

end;

function TSQL.Where(aSQL: String): iSQL;
begin
  Result := Self;
  FWhere := aSQL;
end;

end.
