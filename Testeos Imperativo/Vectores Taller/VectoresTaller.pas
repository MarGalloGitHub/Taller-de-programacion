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

function busquedaDicotomica(vec: vector ; dimL: integer ; num: integer):integer;
var
	encontre: boolean;
	min , max: integer;
	medio: integer;
	retorno: integer;
begin
	retorno:= 0;
	min:= 1;
	max:= dimL;
	medio:= (min + max) div 2;
	encontre:= false;
	while((encontre = false) AND (min <= max))do begin
		if(vec[medio].codigo = num)then begin
			encontre:= true;
			retorno:= medio;
		end
		else
			if(num < vec[medio].codigo)then begin
				max:= medio;
				medio:= (min + medio) div 2;
			end
			else begin
				min:= medio;
				medio:= (medio + max) div 2;
			end;
	end;
	busquedaDicotomica:= retorno;
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
