unit Model.ClientDataSet;

interface

uses
   Datasnap.DBClient,
   System.Generics.Collections,
   Model.ClientDataSet.Interfaces;

type
  TFieldClientDataSet = class(TInterfacedObject, iClientDataSet)
    private
      FClientDataSet : TClientDataSet;
    public
      constructor Create( aClientDataSet : TClientDataSet );
      destructor Destroy; override;
      class function New( aClientDataSet : TClientDataSet ) : iClientDataSet;
      function TableName(var aTableName: String): iClientDataSet;
      function ListFields (var List : TList<String>) : iClientDataSet;
      function Update (var aUpdate : String) : iClientDataSet;
      function Where (var aWhere : String) : iClientDataSet;
      function FieldsDelete (var aFields : String) : iClientDataSet;
      function FieldsInsert (var aFields : String) : iClientDataSet;
      function Param (var aParam : String) : iClientDataSet;
      function ParamDelete (var aParam : String) : iClientDataSet;
  end;

implementation

uses
  System.SysUtils, Vcl.Dialogs;

{ TFieldClientDataSet }

constructor TFieldClientDataSet.Create(aClientDataSet: TClientDataSet);
begin
  FClientDataSet := aClientDataSet;
end;

destructor TFieldClientDataSet.Destroy;
begin

  inherited;
end;

function TFieldClientDataSet.FieldsDelete(var aFields: String): iClientDataSet;
var
  vCampo : String;
begin
  Result := Self;
  vCampo := FClientDataSet.Fields.Fields[0].FieldName;
  aFields := aFields + vCampo + ', ';
  aFields := Copy(aFields, 0, Length(aFields) - 2) + ' ';
end;

function TFieldClientDataSet.FieldsInsert(var aFields: String): iClientDataSet;
var
  vCampo : String;
  vCont : Integer;
begin
  Result := Self;
  for vCont := 0 to Pred(FClientDataSet.FieldCount) do
  begin
    vCampo := FClientDataSet.Fields.Fields[vCont].FieldName;
    aFields := aFields + vCampo + ', ';
  end;
  aFields := Copy(aFields, 0, Length(aFields) - 2) + ' ';
end;

function TFieldClientDataSet.ListFields(
  var List: TList<String>): iClientDataSet;
var
  vCont : Integer;
begin
  Result := Self;
  if not Assigned(List) then
    List := TList<string>.Create;

  for vCont := 0 to Pred(FClientDataSet.FieldCount) do
  begin
    List.Add( FClientDataSet.Fields[vCont].ToString );
  end;

end;

class function TFieldClientDataSet.New(
  aClientDataSet: TClientDataSet): iClientDataSet;
begin
  Result := Self.Create(aClientDataSet);
end;

function TFieldClientDataSet.Param(var aParam: String): iClientDataSet;
var
  vCampo : String;
  vCont : Integer;
begin
  Result := Self;

  for vCont := 0 to Pred(FClientDataSet.FieldCount) do
  begin
    if vCont = 0 then
    begin
      vCampo := FClientDataSet.CommandText;
      aParam  := '('+ vCampo +'), '
    end
    else
    begin
      vCampo := FClientDataSet.Fields.Fields[vCont].AsString;
      aParam  := aParam + QuotedStr( vCampo ) + ', ';
    end;
  end;

  aParam := Copy(aParam, 0, Length(aParam) - 2) + ' ';

end;

function TFieldClientDataSet.ParamDelete(var aParam: String): iClientDataSet;
var
  vCampo : String;
begin
  Result := Self;
  vCampo := FClientDataSet.Fields[0].AsString;
  aParam  := aParam + QuotedStr( vCampo ) + ', ';
  aParam := Copy(aParam, 0, Length(aParam) - 2) + ' ';
end;

function TFieldClientDataSet.TableName(var aTableName: String): iClientDataSet;
begin
  Result := Self;
  aTableName := Copy(FClientDataSet.Name, 4, Length( FClientDataSet.Name ));
end;

function TFieldClientDataSet.Update(var aUpdate: String): iClientDataSet;
var
  vCampo : String;
  vCont : Integer;
begin
  Result := Self;

  for vCont := 0 to Pred(FClientDataSet.FieldCount) do
  begin
    vCampo := FClientDataSet.Fields[vCont].ToString;

    aUpdate := aUpdate + vCampo + ' = :' + vCampo + ', ';
  end;

  aUpdate := Copy(aUpdate, 0, Length(aUpdate) - 2) + ' ';

end;

function TFieldClientDataSet.Where(var aWhere: String): iClientDataSet;
begin

end;

end.
