program vectores;
const
	dF = 13;
type
	persona= record
		DNI: integer;
		edad: integer;
		apellidoynombre: string;
		ciudad: string;
	end;
	vector = array[1..dF] of persona;

	
procedure leerPersona(var p: persona);
begin
	writeln('escribi la edad de la persona');
	readln(p.edad);
	if(p.edad <> 13)then begin
		writeln('escribi el dni de la persona');
		readln(p.DNI);
		writeln('escribi el apellido y nombre de la persona');
		readln(p.apellidoynombre);
		writeln('escribi la ciudad de la persona');
		readln(p.ciudad);
	end;
end;	

procedure cargar(var V: vector ; var dimL: integer);  {x}
var
	p: persona;
begin
	leerPersona(p);
	while(p.edad <> 13) do begin
		dimL:= dimL +1;
		V[dimL]:= p;
		leerPersona(p);
	end;
end;

procedure recorrerVectorCheck1(V: vector ; dimL: integer);
var
	i: integer;
begin
	for i:= 1 to dimL do 
		writeln('en la posicion : ',i, '   ', 'esta la persona' ,V[i].apellidoynombre);
end;


procedure agregar(var V: vector ; var dimL: integer ; var ok: boolean; per: persona);   {x}
begin
	ok:= false;
	if((dimL +1) <=  dF) and (per.edad <> 13) then begin
		ok:= true;
		dimL:= dimL +1;
		V[dimL]:= per;
	end;
end;

procedure insertar(var V: vector ; var dimL: integer ; var ok: boolean ; per: persona ; pos: integer);
var
	i: integer;
begin
	ok:= false;
	if((dimL +1)<= dF) and (pos >= 1) and (pos <= dimL) and (per.edad <> 13) then begin
		for i:= dimL downto pos do
			V[i+1]:= V[i];
		ok:= TRUE;
		V[pos]:= per;
		dimL:= diml +1;
	end;
end;

procedure ELIMINAR(var V: vector ;var  dimL: integer ; var ok: boolean ; pos: integer);
var
	i: integer;
begin
	ok:= false;
	if(pos >= 1) and (pos <= dimL)then begin
		for i:= pos to (dimL -1) do 
			V[i]:= V[i+1];
		ok:= true;
		dimL:= dimL -1;
	end;
end;

function busqueda(V: vector ; dimL: integer ; nom: string): boolean;
var
	esta: boolean;
	i: integer;
begin
	esta:= FALSE;
	i:= 0;
	while (i <= dimL) AND (esta= FALSE)do begin
		if(V[i].apellidoynombre = nom)then
			esta:= TRUE
		else
			i:= i +1;
	end;
	busqueda:= esta;
end;
	
var
	V: vector;
	dimL,pos: integer;
	per: persona;
	ok: boolean;
	nom: string;
begin
	dimL:= 0;
	cargar(V,dimL);  {1}
	writeln('la dimension logica del vector es: ', dimL);
	recorrerVectorCheck1(V,dimL);
	writeln('ingrese persona a agregar');
	leerPersona(per);
	agregar(V,dimL,ok,per); {2}
	recorrerVectorCheck1(V,dimL);
	writeln('ahora la dimension logica del vector es: ', dimL);
	writeln('ingrese persona a agregar');
	leerPersona(per);
	writeln('ingrese la posicion donde insertar');
	readln(pos);
	insertar(V,dimL,ok,per,pos); {3}
	recorrerVectorCheck1(V,dimL);
	writeln('ingrese la posicion que se desea eliminar');
	readln(pos);
	ELIMINAR(V,dimL,ok,pos); {4}
	recorrerVectorCheck1(V,dimL);
	writeln('escriba un nombre a buscar');
	readln(nom);
	if(busqueda(V,dimL,nom))then {5}
		writeln('el nombre esta en el vector')
	else
		writeln('cagaste');
end.
