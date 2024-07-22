program ejercicioDos;
const
	dF = 300;

type
	oficina = record
		codigo: integer;
		DNI: integer;
		valorExpensa: real;
	end;
	
	VectorOficinas = array[1..300] of oficina;
	
	
procedure leerOficina(var O: oficina);
begin
	writeln('escribi un codigo');
	read(O.codigo);
	if(O.codigo <> -1)then begin
		writeln('escribi un DNI');
		read(O.DNI);
		writeln('escribi un valorExpensa');
		read(O.valorExpensa);
	end;
end;	
	
procedure cargarVector(var V: VectorOficinas ; var dimL: integer);
var
	Ofi: oficina;
begin
	dimL:= 0;
	leerOficina(Ofi);
	while(Ofi.codigo <> -1) AND (dimL < dF) do begin
		dimL:= dimL +1;
		leerOficina(Ofi);
	end;
end;

procedure OrdenarInsercion(var V: VectorOficinas ; dimL: integer);
var
	i,j: integer;
	actual: oficina;
begin
	for i:= 2 to dimL do begin
		actual:= V[i];
		j:= i-1;
		while(j > 0) and (V[i].codigo > actual.codigo) do
			begin
				V[j+1]:= V[j];
				j:= j-1;
			end;
		V[j+1]:= actual;
	end;
end;

procedure OrdenarSeleccion(var V: VectorOficinas ; dimL: integer);
var
	i,j,pos: integer;
	item: oficina;
begin
	for i:= 1 to (dimL -1) do begin
		pos:= i;
		for j:= i+1 to dimL do
			if V[j].codigo < V[pos].codigo then pos:= j;
		item:= V[pos];
		V[pos]:= V[i];
		V[i]:= item;
	end;
end;

var
	V: VectorOficinas;
	dimL: integer;
begin
	cargarVector(V,dimL); {a}
	OrdenarInsercion(V,dimL); {b}
	OrdenarSeleccion(V,dimL); {c}
end.
