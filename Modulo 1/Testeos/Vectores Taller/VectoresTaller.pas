program vectoresTaller;
const
	dF = 6;
type

	persona = record
		dni: integer;
		genero: string;
		edad: integer;
		nombre: string;
	end;
	
vector = array[1..dF] of persona;

procedure leerP(var p: persona);
begin
	writeln('escriba un genero real');
	readln(p.genero);
	if(p.genero <> 'helicoptero')then begin
		writeln('escrbaa un nombre');
		readln(p.nombre);
		writeln('escriba una edad');
		readln(p.edad);
		writeln('escriba un dni');
		readln(p.dni);
	end;
end;

procedure cargar(var V: vector ; var dimL: integer);
var
	p: persona;
begin
	leerP(p);
	while(p.genero <> 'helicoptero') do begin
		dimL:= dimL +1;
		V[dimL]:= p;
		leerP(p);
	end;
end;

procedure ordenacionSELECCION(var V: vector ; dimL: integer);
var
	i,j,p: integer;
	item: persona;
begin
	for i:= 1 to dimL -1 do begin
		p:= i;
		for j:= i+1 to dimL do
			if V[j].edad < V[p].edad then
				p:= J;
		item:= V[p];
		V[p]:= V[i];
		V[i]:= item;
	end;
end;

procedure ordenacionINSERCION(var V: vector ; dimL: integer);
var
	i,j: integer;
	actual: persona;
begin
	for i:= 2 to dimL do begin
		actual:= V[i];
		j:= i-1;
		while(j > 0) and (V[j].edad > actual.edad) do begin
			V[j+1]:= V[j];
			j:= j-1;
			end;
		V[j+1]:= actual;
	end;
end;

procedure recorrervectoryverqueonda(V: vector ; dimL: integer);
var
	i: integer;
begin
	for i:= 1 to dimL DO 
		writeln('la persona en la posicion:','',i,'','es ',V[i].nombre);
end;

var
	V: vector;
	dimL: integer;
begin
	dimL:= 0;
	cargar(V,dimL);
	ordenacionSELECCION(V,dimL);
	recorrervectoryverqueonda(V,dimL);
	ordenacionINSERCION(V,dimL);
	recorrervectoryverqueonda(V,dimL);
end.
