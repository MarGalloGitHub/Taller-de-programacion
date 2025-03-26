{3.- Netflix ha publicado la lista de películas que estarán disponibles durante el mes de diciembre 
de 2022. De cada película se conoce: código de película, código de género (1: acción, 2: aventura, 
3: drama, 4: suspenso, 5: comedia, 6: bélica, 7: documental y 8: terror) y puntaje promedio 
otorgado por las críticas.                                                                                  preguntar si cuando hago el cargar lista hace falta la condicion de corte mas alla de que se dispone
Implementar un programa modularizado que:
a. Lea los datos de películas y los almacene por orden de llegada y agrupados por código de 
género, en una estructura de datos adecuada. La lectura finaliza cuando se lee el código de la 
película -1. 
b. Una vez almacenada la información, genere un vector que guarde, para cada género, el código 
de película con mayor puntaje obtenido entre todas las críticas.
c. Ordene los elementos del vector generado en b) por puntaje utilizando alguno de los dos 
métodos vistos en la teoría. 
d. Luego de ordenar el vector, muestre el código de película con mayor puntaje y el código de 
película con menor puntaje

}
program ejercicioTres;
type
	RangoGenero = 1..8;
	
	
	pelicula = record
		codigo: integer;
		codGenero: RangoGenero;
		puntajePromedio: real;
	end;

	lista = ^nodo;
	nodo = record
		dato: pelicula;
		sig: lista;
	end;
	
	vector = array[RangoGenero] of lista;
	
procedure leerPelicula(var p: pelicula);
begin
	writeln('escriba el codigo de la pelicula');
	readln(p.codigo);
	if(p.codigo <> -1)then begin
		writeln('escriba el codigo de genero');
		readln(p.codGenero);
		writeln('escriba el puntaje promedio');
		readln(p.puntajePromedio);
	end;
end;

procedure agregarAdelante(var L: lista ; p: pelicula);
var
	nue: lista;
begin
	new(nue);
	nue^.dato:= p;
	nue^.sig:= L;
	L:= nue;
end;
	
procedure cargarLista(var L: lista);
var
	p: pelicula;
begin
	leerPelicula(p);
	while(p.codigo <> -1)do begin
		agregarAdelante(L,p);
		leerPelicula(p);
	end;
end;

procedure agregarAtras(var L1,ult: lista ; L2: lista);
var
	nue: lista;
begin
	new(nue);
	nue^.dato:= L2^.dato;
	nue^.sig:= nil;
	if(L1 = nil)then
		L1:= nue
	else
		ult^.sig:= nue;
end;
	
procedure cargarVector(var V: vector ; L: lista);
var
	ult: lista;
begin
	while(L^.dato.codigo <> -1)do begin
		agregarAtras(V[L^.dato.codGenero],ult,L);
		L:= L^.sig;
	end;
end;
	
procedure leerLista(L: lista);
begin
	while(L <> nil)do begin
		writeln('el codigo de esta pelicula es: ','  ', L^.dato.codigo);
		writeln('el codigo de genero de esta pelicula es: ','  ', L^.dato.codGenero);
		writeln('el puntajePromedio de esta pelicula es: ','  ', L^.dato.puntajePromedio);
		L:= L^.sig;
	end;
end;
	
procedure recorrerVector(V: vector);
var
	i: RangoGenero;
begin
	for i:= 1 to 8 do 
		leerLista(V[i]);
end;
	
var
	L: lista;
	V: vector;
begin
	L:= nil;
	cargarLista(L); {se dispone} 
	cargarVector(V,L);  {a}
	recorrerVector(V);  {para mi}
end.
