unit Model.DAO.Interfaces;

interface

uses
  Data.DB,
  Datasnap.DBClient,
  System.Generics.Collections;

type
  iDAO = interface
  ['{5DE7852A-93D3-4491-842F-2752556527B3}']
    function Insert(aDataSet : TClientDataSet) : iDAO; overload;
    function Update(aDataSet : TClientDataSet) : iDAO; overload;
    function Delete(aDataSet : TClientDataSet) : iDAO; overload;
    function Delete(aField : String; aValue : String) : iDAO; overload;
    function DataSource( aDataSource : TDataSource) : iDAO;
    function Find(aSQL : String) : TClientDataSet overload;
    function Find(aId : Integer) : TClientDataSet; overload;
  end;

implementation

end.
