unit Model.Connection.Interfaces;

interface

uses
  Data.DB,
  DataSnap.DBClient,
  System.Classes;

type
  iConnection = interface
    ['{9CE8EAD7-3FD0-4C43-BED5-9A8B09664377}']
    function ExecSQL : iConnection;
    function DataSet : TClientDataSet;
    function Open(aSQL : String) : iConnection; overload;
    function Open : iConnection; overload;
    function SQL : TStrings;
    function CommitTransaction : iConnection;
  end;

implementation

end.
