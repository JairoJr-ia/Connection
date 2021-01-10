unit Model.SQL.Interfaces;

interface

type
  iSQL = interface
    ['{249CE8FB-77E6-43A3-A678-D6F9279140AC}']
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

end.
