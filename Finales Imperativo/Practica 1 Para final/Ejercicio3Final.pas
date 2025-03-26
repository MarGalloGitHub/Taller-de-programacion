
{3.- Netflix ha publicado la lista de películas que estarán disponibles durante el mes de
diciembre de 2022. De cada película se conoce: código de película, código de género (1: acción,
2: aventura, 3: drama, 4: suspenso, 5: comedia, 6: bélico, 7: documental y 8: terror) y puntaje
promedio otorgado por las críticas.

Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:
a. Lea los datos de películas, los almacene por orden de llegada y agrupados por código de
género, y retorne en una estructura de datos adecuada. La lectura finaliza cuando se lee el
código de la película -1.

b. Genere y retorne en un vector, para cada género, el código de película con mayor puntaje
obtenido entre todas las críticas, a partir de la estructura generada en a)..
c. Ordene los elementos del vector generado en b) por puntaje utilizando alguno de los dos
métodos vistos en la teoría.
d. Muestre el código de película con mayor puntaje y el código de película con menor puntaje,  
del vector obtenido en el punto c).}  {preguntar si esto es una inconsistencia, pide que busque en base al puntaje, pero en el c no se guarda}

program Ejercicio3Final;
type
	rangoCod = 1..8;
	pelicula = record
		codigo: integer;
		codGen: rangoCod;
		puntaje: real;
	end;
	
	miniPeli = record
		codigo: integer;
		puntaje: real;
	end;
	
	lista = ^nodo;
	nodo = record
		dato: minipeli;
		sig: lista;
	end;
	
	vector = array[rangoCod] of lista;
	
	vectorMax= array[rangoCod] of miniPeli;

procedure leerPelicula(var peli: pelicula);
begin
	writeln('Ingrese el codigo de la pelicula');
	readln(peli.codigo);
	if(peli.codigo <> (-1))then begin
		writeln('Ingrese el genero de la pelicula (integer del 1 al 8)');
		readln(peli.codGen);
		writeln('Ingrese el puntaje de la pelicula (real)');
		readln(peli.puntaje);
	end;
end;

procedure inicializarVector(var vec: vector);
var
	i: rangoCod;
begin
	for i:= 1 to 8 do begin
		vec[i]:= nil;
	end;
end;

procedure agregarAdelante(var list: lista; peli: pelicula);
var
	nue: lista;
begin
	new(nue);
	nue^.dato.codigo:= peli.codigo;
	nue^.dato.puntaje:= peli.puntaje;
	nue^.sig:= list;
	list:= nue;
end;


procedure cargarVector(var vec: vector);
var
	peli: pelicula;
begin
	inicializarVector(vec);
	leerPelicula(peli);
	while(peli.codigo <> (-1))do begin
		agregarAdelante(vec[peli.codGen], peli);
		leerPelicula(peli);
	end;
end;

procedure mostrarVector(vec: vector);
var
	i:rangoCod;
begin
	for i:= 1 to 8 do begin
		writeln('');
		if(vec[i] = nil)then
			writeln('No hay peliculas con el genero  ' , i)
		else
			while(vec[i] <> nil)do begin
				writeln('Codigo ' , vec[i]^.dato.codigo , ', puntaje:  ' , vec[i]^.dato.puntaje:2:1);
				vec[i]:= vec[i]^.sig;
			end;
	end;
end;

procedure InicializarVec2(var vecMax: vectorMax);
var
	i: rangoCod;
begin
	for i:= 1 to 8 do 
		vecMax[i].puntaje:= 0;
end;

procedure generarVectorMaximos(vec: vector ; var vecMax: vectorMax);
var
	i: rangoCod;
	codeMax: integer;
	puntajeMax: real;
begin
	InicializarVec2(vecMax);
	for i:= 1 to 8 do begin
		codeMax:= 0;
		puntajeMax:= 0;
		while(vec[i] <> nil)do begin
			if(vec[i]^.dato.puntaje > puntajeMax)then begin
				puntajeMax:= vec[i]^.dato.puntaje;
				codeMax:= vec[i]^.dato.codigo;
			end;
			vec[i]:= vec[i]^.sig;
		end;
		vecMax[i].codigo:= codeMax;
		vecMax[i].puntaje:= puntajeMax;
	end;			
end;

procedure mostrarVectorMax(vecMax: vectorMax);
var
	i: rangoCod;
begin
	for i:= 1 to 8 do begin
		if(vecMax[i].codigo <> 0)then
			writeln('El codigo de la pelicula con mayor puntaje, en el genero ' , i , ' es ' , vecMax[i].codigo)
		else
			writeln('No se registraron peliculas de ese genero');
	end;
end;

procedure mostrarVectorMaxNuevo(vecMax: vectorMax);
var
	i: rangoCod;
begin
	for i:= 1 to 8 do begin
		if(vecMax[i].codigo <> 0)then
			writeln('El codigo de la pelicula con mayor puntaje, en su genero fue ' , vecMax[i].codigo , ' con un puntaje de : ' , vecMax[i].puntaje:2:1)
		else
			writeln('No se registraron peliculas de ese genero');
	end;
end;

procedure ordenarVectorSeleccion(var vecMax: vectorMax ; num: rangoCod);
var
	i,j,p: rangoCod;
	item: miniPeli;
begin
	for i:= 1 to num -1 do begin
		p:= i;
		for j:= i + 1 to num do begin
			if(vecMax[j].puntaje >= vecMax[p].puntaje) then begin
				p:= j;
			end;
		end;
		item:= vecMax[p];
		vecMax[p]:= vecMax[i];
		vecMax[i]:= item;
	end;
end;

var
	vec: vector;
	vecMax: vectorMax;
begin
	cargarVector(vec);{A}
	mostrarVector(vec);
	writeln('');
	writeln('');
	writeln('Ahora el vector de maximos');
	writeln('');
	generarVectorMaximos(vec,vecMax); {b}
	mostrarVectorMax(vecMax);
	ordenarVectorSeleccion(vecMax , 8); {c}
	writeln('');
	writeln('Ahora el vector de maximos ordenado por puntaje');
	mostrarVectorMaxNuevo(vecMax); {d}
end.
