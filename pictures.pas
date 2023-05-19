unit Pictures;

interface

{
  линкование файла масок картинок
  и вывод одной фигуры на экран
}

procedure LoadPictures;
procedure ShowFigure(left, top, number: word);

implementation

uses
  SysUtils, ptcGraph, Colors24;

var
  pic: array[0..62499] of byte;

procedure LoadPictures;
var
  f: text;
  s: string;
  i, j: integer;
begin
  Assign(f, 'pictures.txt');
  Reset(f);
  i := 0;
  while not Eof(f) do
  begin
    ReadLn(f, s);
    for j := 1 to Length(s) do
    begin
      pic[i] := Ord(s[j]) - Ord('0');
      Inc(i);
    end;
  end;
end;

procedure ShowFigure(left, top, number: word);
const
  sq_width = 50; {клетки доски}
  sq_height = 50;
var
  x, y: word;
  color: longint;
  p: word;
begin
  SetFillStyle(SolidFill, cWhite);
  Bar(left, top, left + 50, top + 50);
  
  if number > 24 then
    Exit;
  
  p := number * sq_width * sq_height;
    
  for x := 0 to sq_width - 1 do
    for y := 0 to sq_height - 1 do
      if pic[p + y * sq_width + x] = 0 then
        PutPixel(left + x, top + y, cBlack);
end;

end.
