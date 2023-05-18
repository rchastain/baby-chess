unit mysystem;

interface

function Taxi(N1,N2:integer):integer;
function Distance(N1,N2:integer):integer;

implementation

uses
  Math;

function Taxi(N1,N2:integer):integer;
begin
  Taxi := abs( (N1 and 7) - (N2 and 7) ) +
          abs( (N1 shr 3) - (N2 shr 3) );
end;

function Distance(N1,N2:integer):integer;
begin
  Distance :=
  Max(abs( (N1 and 7) - (N2 and 7) ),
      abs( (N1 shr 3) - (N2 shr 3) ));

end;

end.
