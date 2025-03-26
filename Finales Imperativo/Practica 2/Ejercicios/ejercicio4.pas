{4.- Escribir un programa con:
a. Un módulo recursivo que retorne un vector de 20 números enteros “random” mayores a 0 y
menores a 100.
b. Un módulo recursivo que devuelva el máximo valor del vector.
c. Un módulo recursivo que devuelva la suma de los valores contenidos en el vector}

program ejercicioCuatro;
const
	dF = 20;
type
	
	vector= array[1..dF] of integer;
	
procedure cargarVector(var V: vector ; var dimL: integer);
begin
	Randomize;
	if(dimL < dF)then begin
		dimL:= dimL + 1;
		V[dimL]:= random(100);
		cargarVector(V,dimL);
	end;
end;	

var
	V: vector;
	dimL: integer;
begin
	dimL:= 0;
	cargarVector(V,dimL);
end.
