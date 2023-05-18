
unit Pictures;

(* Warlord Chess Graphics by William H. Rogers *)

interface

uses
  ChessTypes;

procedure LoadPictures;
procedure DrawPicture(left, top: integer; p: TPiece; c: TColor; isBlackSq: boolean);

implementation

uses
  ptcGraph, Colors24;

var
  pict: array[0..5, 0..47, 0..47] of byte;

procedure LoadPictures;
var
  f: text;
  s: string;
  i, x, y: integer;
begin

  AssignFile(f, 'warlord.txt');
  Reset(f);

  for i := 0 to 5 do
    for y := 0 to 47 do
    begin
      ReadLn(f, s);

      for x := 0 to 47 do
        pict[i, x, y] := Ord(s[Succ(x)]) - Ord('0');
    end;

  CloseFile(f);
end;

procedure DrawPicture(left, top: integer; p: TPiece; c: TColor; isBlackSq: boolean);
const
  pictureIndex: array[pawn..king] of integer = (0, 2, 3, 1, 4, 5);
var
  x, y: integer;
  squareColor, lineColor, pieceColor: longint;
  
begin
  if isBlackSq then
    squareColor := cDarkOrange
  else
    squareColor := cOrange;
  
  lineColor := cGray;
  
  if c = ChessTypes.white then
    pieceColor := cWhite
  else
    pieceColor := cBlack;
  
  SetFillStyle(SolidFill, squareColor);
  Bar(left, top, left + 50, top + 50);
  
  if p in [pawn..king] then
    for y := 0 to 47 do
      for x := 0 to 47 do
        case pict[pictureIndex[p], x, y] of
          1: PutPixel(left + x, top + y, lineColor);
          2: PutPixel(left + x, top + y, pieceColor);
        end;
end;

end.
