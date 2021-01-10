unit Model.ClientDataSet.Interfaces;

interface

uses
  System.Generics.Collections;

type
  iClientDataSet = interface
    ['{DAEF1A0F-4DD5-4A0C-9243-BFBC77D9BA05}']
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

end.
