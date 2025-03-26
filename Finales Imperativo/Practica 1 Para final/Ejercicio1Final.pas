{1.- Se desea procesar la información de las ventas de productos de un comercio (como máximo
50).
Implementar un programa que invoque los siguientes módulos:
a. Un módulo que retorne la información de las ventas en un vector. De cada venta se conoce el
día de la venta, código del producto (entre 1 y 15) y cantidad vendida (como máximo 99
unidades). El código debe generarse automáticamente (random) y la cantidad se debe leer. El
ingreso de las ventas finaliza con el día de venta 0 (no se procesa).
b. Un módulo que muestre el contenido del vector resultante del punto a).
c. Un módulo que ordene el vector de ventas por código.
d. Un módulo que muestre el contenido del vector resultante del punto c).
e. Un módulo que elimine, del vector ordenado, las ventas con código de producto entre dos
valores que se ingresan como parámetros.
f. Un módulo que muestre el contenido del vector resultante del punto e).
g. Un módulo que retorne la información (ordenada por código de producto de menor a
mayor) de cada código par de producto junto a la cantidad total de productos vendidos.
h. Un módulo que muestre la información obtenida en el punto g).}

program ejercicio1Final;
const
	dF = 5;
type
	rangoVec = 1..dF;
	rangoCod = 1..15;
	rangoCant = 0..99;
	
	venta = record
		dia: integer;
		codigo: rangoCod;
		cantidad: rangoCant;
	end;
	
	lista = ^nodo;
	nodo = record
		dato: venta;
		sig: lista;
	end;
	
	vectorVentas = array[rangoVec] of venta;
	
procedure leerVenta(var ven: venta);
begin
	Randomize;
	ven.codigo := random(15) + 1;
	writeln('escriba el dia de la venta');
	readln(ven.dia);
	if(ven.dia <> 0)then begin
		writeln('escriba la cantidad vendidda');
		readln(ven.cantidad);
	end;
end;

procedure cargarVector(var V: vectorVentas ; var dimL: integer);
var
	ven: venta;
begin
	dimL:= 0;
	leerVenta(ven);
	while((ven.dia <> 0) and (dimL < dF))do begin
		dimL:= dimL + 1;
		V[dimL]:= ven;
		if(dimL < dF) then
			leerVenta(ven);
	end;
end;	
	
procedure mostrarVector(V: vectorVentas ; dimL: integer);
var
	i: rangoVec;
begin
	for i:= 1 to dimL do begin
		writeln('En la posicion  ' , i , 'en el dia: ' , V[i].dia ,   '  se realizo la venta con codigo:  ', V[i].codigo, '  con una cantidad vendida de:  ' , V[i].cantidad);
	end;
	
end;

procedure ordenarVectorSeleccion(var V: vectorVentas ; dimL: integer);
var
	i,j,p: rangoVec;
	item: venta;
begin
	for i:= 1 to (dimL - 1)do begin
		p:= i;
		for j:= i+1 to dimL do begin
			if(V[j].codigo < V[p].codigo)then begin
				p:= j;
			end;
			item:= V[p];
			V[p]:= V[i];
			V[i]:= item;
		end;
	end;
end;

procedure eliminarEntreRangos(var V: vectorVentas ;var  dimL: integer ; pos1,pos2: integer);
var
	i: integer;
begin
	if(pos2 <= dimL) AND (pos1 >= 1)then begin
		for i:= pos1 to (pos2) do begin
			V[i]:= V[i+1];
			dimL:= dimL - 1;
		end;
	end;
end;

procedure agregarAtras(var L , ult : lista ; V: venta);
var
	nue: lista;
begin
	new(nue);
	nue^.dato:= V;
	nue^.sig:= nil;
	if(L = nil)then   {si la lista esta vacia}
		L:= nue
	else
		ult^.sig:= nue;  {enganche}
	ult:= nue;
end;

procedure crearLista(var L: lista ; V: vectorVentas ; dimL: integer);
var
	i: integer;
	ult: lista;
begin
	for i:= 1 to dimL do begin
		agregarAtras(L,ult,V[i]);
	end;
end;

procedure mostrarLista(L: lista);
begin
	while(L <> nil)do begin
		writeln('En esta posicion de la lista, se tiene la venta con codigo: ', L^.dato.codigo, '  y con una cantidad de:   ', L^.dato.cantidad);
		L:= L^.sig;
	end;
end;
	
var
	V: vectorVentas;
	dimL,pos1,pos2: integer;
	L: lista;
begin
	L:= nil;
	cargarVector(V,dimL); {A}
	mostrarVector(V,dimL); {B}
	writeln('');
	writeln('Ahora el vector ordenado');
	writeln('');
	ordenarVectorSeleccion(V,dimL); {c}
	writeln('');
	mostrarVector(V,dimL); {d}
	writeln('');
	writeln('Ingrese la posicion 1 como limite inferior de busqueda para eliminar');
	readln(pos1);
	writeln('Ingrese la posicion 2 como limite superior de busqueda para eliminar');
	readln(pos2);
	eliminarEntreRangos(V,dimL,pos1,pos2); {e}
	writeln('');
	writeln('El vector nuevo despues de eliminar entre rangos');
	mostrarVector(V,dimL); {f}
	writeln('');
	crearLista(L,V,dimL); {g}
	writeln('');
	writeln('La lista formada por el vector eliminado');
	mostrarLista(L); {h}
end.
