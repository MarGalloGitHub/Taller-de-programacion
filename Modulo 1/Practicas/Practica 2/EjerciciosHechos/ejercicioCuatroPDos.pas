{4.- Escribir un programa con:
a. Un módulo recursivo que retorne un vector de 20 números enteros “random” mayores a 0 y
menores a 100.
b. Un módulo recursivo que devuelva el máximo valor del vector.
c. Un módulo recursivo que devuelva la suma de los valores contenidos en el vector.}

program ejercicioCuatro;
const
	dF = 20;
type
	rangoVec = 1..dF;
	vector = array[rangoVec] of integer;
	
procedure cargarVectorRecursivo(var V: vector ; var i: integer);
var
	num: integer;
begin
	Randomize;
	num:= Random(100);
	if(i <= dF)then begin
		i:= i +1;
		V[i]:= num;
		cargarVectorRecursivo(V,i);
	end;	
end;

procedure recorrerVector(V: vector);
var
	il: rangoVec;
begin
	for il:= 1 to 20 do 
		writeln(V[il]);
end;


procedure buscarMaxRecursivo(V: vector ; var max: integer ; i2: integer);
begin
	if(i2 < dF)then begin
		i2:= i2 +1;
		if(V[i2] > max) then
			max:= V[i2];
		buscarMaxRecursivo(V,max,i2);
	end;
end;

procedure sumatodo(V: vector ; var total: integer; i: integer);

begin
	if(i < dF) then begin
		i:= i +1;
		total:= total + V[i];
		sumatodo(V,total,i);
	end;
end;

var
	V: vector;
	dimL,i2: integer;
	max,total: integer;
begin
	dimL:= 0;
	i2:= 0;
	max:= -1;
	total:= 0;
	cargarVectorRecursivo(V,dimL);  {preguntar siempre da lo mismo} {a}
	recorrerVector(V); {para mi}
	buscarMaxRecursivo(V,max,i2);	{b}
	writeln('el valor maximo es: ', ' ', max);		{para mi}
	sumatodo(V,total,i2); {c}
	writeln('la suma de todos los elementos es', ' ',	total	);
end.

