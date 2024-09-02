program SumNumbers;

function Sum(n: integer): integer;
var
  i, total: integer;
begin
  total := 0;
  i := n;
  while i > 0 do
  begin
    total := total + i;
    i := i - 1;
  end;
  Sum := total;
end;

var 
  res: integer;
begin
  res := Sum(10);
  writeln('Sum: ', res);
end.

{ 
> brew install fpc
> fpc sum.pas
> ./sum
}