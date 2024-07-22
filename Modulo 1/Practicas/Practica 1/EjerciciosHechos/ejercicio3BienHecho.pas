{Netflix ha publicado la lista de películas que estarán disponibles durante el mes de diciembre 
de 2022. De cada película se conoce: código de película, código de género (1: acción, 2: aventura, 
3: drama, 4: suspenso, 5: comedia, 6: bélica, 7: documental y 8: terror) y puntaje promedio 
otorgado por las críticas. 
Implementar un programa modularizado que:
a. Lea los datos de películas y los almacene por orden de llegada y agrupados por código de 
género, en una estructura de datos adecuada. La lectura finaliza cuando se lee el código de la 
película -1. 
b. Una vez almacenada la información, genere un vector que guarde, para cada género, el código 
de película con mayor puntaje obtenido entre todas las críticas
* c. Ordene los elementos del vector generado en b) por puntaje utilizando alguno de los dos 
métodos vistos en la teoría. 
d. Luego de ordenar el vector, muestre el código de película con mayor puntaje y el código de 
película con menor puntaje}


program ejercicioTresPracticaUnoNuevo;

type

	rangoGen = 1..8;
	
	pelicula = record
		codigo: integer;
		codGen:	rangoGen;
		puntaje: real;
	end;
	
	listaPelis = ^nodo;
	nodo = record
		dato: pelicula;
		sig: ListaPelis;
	end;
	
	VectorCosas = record
		codigo: integer;
		puntaje: real;
	end;
	
	VectorPelis = array[rangoGen] of ListaPelis;
	
	VectorPuntaje= array[rangoGen] of VectorCosas;
	

procedure agregarAtras(var Lp: ListaPelis ; P: pelicula ; var ult: ListaPelis);
var
	nue: ListaPelis;
begin
	new(nue);
	nue^.dato:= P;
	nue^.sig:= nil;
	if(Lp = nil)then
		Lp:= nue
	else
		ult^.sig:= nue;
	ult:= nue;
end;	
	
procedure leerPelicula(var P: pelicula);
begin
	writeln('manda un codigo');
	read(P.codigo);
	if(P.codigo <> -1)then begin
		writeln('manda un codigoGen');
		read(P.codGen);
		writeln('manda un puntaje');
		read(P.puntaje);
	end;
end;	

procedure cargarLista(var Lp: ListaPelis);
var
	P: pelicula;
	ult: ListaPelis;
begin
	leerPelicula(P);
	while(P.codigo <> -1) do begin
		agregarAtras(Lp,P,ult);
		leerPelicula(P);
	end;
end;
	
procedure cargarListaNueva(var L2: ListaPelis ; Lp: pelicula);
var
	ult: listaPelis;
begin
	agregarAtras(L2,Lp,ult);	
end;
	
procedure cargarVector(var V: VectorPelis ; Lp: ListaPelis);	
var
	i: RangoGen;
begin
	for i:= 1 to 8 do begin
		V[i]:= nil;
	end;
end;

procedure recorrerVector(V: VectorPelis ; var V2: VectorPuntaje);
var
	maxPuntaje: real;
	codMax: integer;
	i: rangoGen;
begin
	for i:= 1 to 8 do begin
		maxPuntaje:= -1;
		while(V[i] <> nil) do begin
			if((V[i]^.dato.puntaje) > maxPuntaje)then begin
				maxPuntaje:= V[i]^.dato.puntaje;
				codMax:= V[i]^.dato.codigo;
			end;
			V[i]:= V[i]^.sig;
		end;
		V2[i].codigo:= codMax;
		V2[i].puntaje:= maxPuntaje;
	end;
end;

procedure ordenarSeleccion(var V2: VectorPuntaje ; diml: rangoGen);
var
	i,j,pos : rangoGen; item: real;
begin
	for i:= 1 to (diml -1)do begin
		pos:= i;
		for j:= i +1 to diml do
			if(V2[j].puntaje < V2[pos].puntaje) then 
				pos:= j;
		item:= V2[pos].puntaje;
		V2[pos].puntaje:= V2[i].puntaje;
		V2[i].puntaje:= item;
	end;
end;

procedure chequearMax(v2C: integer; v2P: real ; var Cd: integer ; var Pm: real);
begin
	if(v2p > Pm)then begin
		Pm:= v2p;
		Cd:= v2C;
	end;		
end;

procedure chequearMin(v2C: integer; v2P: real ; var Cm: integer ; var Pmin: real);
begin
	if(v2p < Pmin)then begin
		Pmin:= v2p;
		Cm:= v2C;
	end;		
end;

procedure mostrarCodigos( v2: VectorPuntaje);
var
	i: rangoGen;
	codMax,codMin: integer;
	Pmax,Pmin: real;
begin
	Pmax:= -1;
	Pmin:= 999;
	for i:= 1 to 8 do begin
		chequearMax(v2[i].codigo,v2[i].puntaje,codMax,Pmax);
		chequearMin(v2[i].codigo,v2[i].puntaje,codMin,Pmin);
	end;
	writeln(codMin,codMax);
end;

var
	Lp: ListaPelis;
	V: VectorPelis;
	V2: VectorPuntaje;
	diml: rangoGen;
begin
	diml:= 8;
	Lp:= nil;
	cargarLista(Lp);
	cargarVector(V,Lp);			{A}
	recorrerVector(V,V2);		{B}
	ordenarSeleccion(V2,diml);	{C}
	mostrarCodigos(V2);		{D}
	
end.
