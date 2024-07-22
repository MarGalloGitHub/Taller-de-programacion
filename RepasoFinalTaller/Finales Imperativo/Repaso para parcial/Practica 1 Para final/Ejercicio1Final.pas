program ejercicio1Final;
const
	dF = 20;
type
	rangoVec = 1..dF;
	rangoCod = 1..15;
	rangoCant = 0..99;
	venta = record
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
	ven.codigo := random(15);
	if(ven.codigo <> 0)then begin
		writeln('escriba la cantidad vendidda');
		readln(ven.cantidad);
	end;
end;

procedure cargarVector(var V: vectorVentas ; var dimL: integer);
var
	ven: venta;
begin
	leerVenta(ven);
	while((ven.codigo <> 0) and (dimL <= (7 - 1)))do begin
		dimL:= dimL + 1;
		V[dimL]:= ven;
		leerVenta(ven);
	end;
end;	
	
procedure mostrarVector(V: vectorVentas ; dimL: integer);
var
	i: rangoVec;
begin
	for i:= 1 to dimL do begin
		writeln('En la posicion  ' , i , '  el vector tiene la venta con codigo:  ', V[i].codigo, '  con una cantidad vendida de:  ' , V[i].cantidad);
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
			V[p]:= v[i];
			V[i]:= item;
		end;
	end;
end;

procedure eliminarEntreRangos(var V: vectorVentas ;var  dimL: integer ; pos1,pos2: integer);
var
	i: integer;
begin
	if(pos2 <= dimL) AND (pos1 >= 1)then begin
		for i:= pos1 to (pos2 - 1) do begin
			V[i]:= V[i+1];
			dimL:= dimL - 1;
		end;
	end;
end;

procedure agregarAtras(var L: lista ; V: venta);
var
	nue: lista;
	ult: lista;
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
begin
	for i:= 1 to dimL do begin
		if((V[i].codigo) MOD 2 = 0 ) then 
			agregarAtras(L,V[i]);
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
	dimL:= 0;
	cargarVector(V,dimL);
	mostrarVector(V,dimL);
	writeln('Ahora el vector ordenado');
	ordenarVectorSeleccion(V,dimL);
	mostrarVector(V,dimL);
	writeln('Ingrese la posicion 1 como limite de busqueda para eliminar');
	readln(pos1);
	writeln('Ingrese la posicion 2 como limite de busqueda para eliminar');
	readln(pos2);
	eliminarEntreRangos(V,dimL,pos1,pos2);
	mostrarVector(V,dimL);
	crearLista(L,V,dimL);
	mostrarLista(L);
end.
