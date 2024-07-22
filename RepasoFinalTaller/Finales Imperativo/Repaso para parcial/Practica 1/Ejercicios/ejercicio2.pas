{2.- El administrador de un edificio de oficinas cuenta, en papel, con la información del pago de 
las expensas de dichas oficinas. 
Implementar un programa modularizado que:
a. Genere un vector, sin orden, con a lo sumo las 300 oficinas que administra. De cada oficina se 
ingresa el código de identificación, DNI del propietario y valor de la expensa. La lectura finaliza 
cuando se ingresa el código de identificación -1, el cual no se procesa.
b. Ordene el vector, aplicando el método de inserción, por código de identificación de la oficina.
c. Ordene el vector aplicando el método de selección, por código de identificación de la oficina.
}

program ejercicio2;
const
	dF = 300;
type
	oficina = record
		codigo: integer;
		DNI: integer;
		expensa: real;
	end;
	
	vector= array[1..dF] of oficina;
	
procedure leerOficina(var ofi: oficina);
begin
	writeln('ingrese un codigo');
	readln(ofi.codigo);
	if(ofi.codigo <> -1)then begin
		writeln('ingrese un DNI');
		readln(ofi.DNI);
		writeln('ingrese expensas');
		readln(ofi.expensa);
	end;	
end;
	
procedure cargarVector(var V: vector ; var dimL: integer);  {se dispone}
var
	ofi: oficina;
begin
	leerOficina(ofi);
	while(ofi.codigo <> -1)do begin
		dimL:= dimL +1;
		V[dimL]:= ofi;
		leerOficina(ofi);
	end;
end;	

procedure recorrerYmostrar(V: vector ; dimL: integer);
var
	i: integer;
begin
	for i:= 1 to dimL do begin
		writeln('en la oficina: ',i,'   ', ' tenemos: ');
		writeln('su codigo es: ',V[i].codigo);
		writeln('DNI DEL PROPIETARIO',V[i].DNI);
		writeln('CUANTO VA A DOLER',V[i].expensa);
	end;
end;

procedure ordenarSELECCION(var V: vector ; dimL: integer);
var
	i,j,p: integer;
	item: oficina;
begin
	for i:= 1 to dimL -1 do begin
		p:= i;
		for j:= i+1 to dimL do
			if V[j].codigo < V[p].codigo then
				p:= J;
		item:= V[p];
		V[p]:= V[i];
		V[i]:= item;
	end;
end;

procedure ordenarINSERCION(var V: vector ; dimL: integer);
var
	i,j: integer;
	actual: oficina;
begin
	for i:= 2 to dimL do begin
		actual:= V[i];
		j:= i-1;
		while(j > 0) and (V[j].codigo> actual.codigo) do begin
			V[j+1]:= V[j];
			j:= j-1;
			end;
		V[j+1]:= actual;
	end;
end;


var
	V: vector;
	dimL: integer;
begin
	dimL:= 0;
	cargarVector(V,dimL); {a}
	recorrerYmostrar(V,dimL); {para mi}
	ordenarINSERCION(V,dimL); {b}
	recorrerYmostrar(V,dimL); {para mi}
	ordenarSELECCION(V,dimL); {c}
	recorrerYmostrar(V,dimL); {para mi}
end.
