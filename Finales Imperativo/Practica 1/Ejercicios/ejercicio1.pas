{1.- Implementar un programa que procese la información de las ventas de productos de un 
comercio (como máximo 20). 
De cada venta se conoce código del producto (entre 1 y 15) y cantidad vendida (como máximo 
99 unidades). El ingreso de las ventas finaliza con el código 0 (no se procesa).
a. Almacenar la información de las ventas en un vector. El código debe generarse 
automáticamente (random) y la cantidad se debe leer. 
b. Mostrar el contenido del vector resultante.
c. Ordenar el vector de ventas por código.
d. Mostrar el contenido del vector resultante.
e. Eliminar del vector ordenado las ventas con código de producto entre dos valores que se 
ingresan como parámetros. 
f. Mostrar el contenido del vector resultante.
g. Generar una lista ordenada por código de producto de menor a mayor a partir del vector 
resultante del inciso e., sólo para los códigos pares.
h. Mostrar la lista resultante
}
program ejercicio1;
const
	dF = 20;
type
	rangoCod = 0..15;
	rangoCantidad = 1..99;
	venta = record
		codigo: rangoCod;
		cantidad: rangoCantidad;
	end;
	
	vector = array[1..dF] of venta;
	
	lista = ^nodo;
	nodo = record
		dato: venta;
		sig: lista;
	end;
	
procedure leerVenta(var ven: venta);
begin
	Randomize;
	ven.codigo:= random(15);      {preguntar por random}
	writeln(ven.codigo);
	if(ven.codigo <> 0)then begin
		writeln('ingrese una cantidad');
		readln(ven.cantidad);
	end;
end;

procedure cargar(var V: vector ; var dimL: integer);
var
	ven: venta;
begin
	leerVenta(ven);
	while(ven.codigo <> 0)do begin
		dimL:= dimL +1;
		V[dimL]:= ven;
		leerVenta(ven);
	end;
end;

procedure mostrarContenido(V: vector ; dimL: integer);
var
	i: integer;
begin
	for i:= 1 to dimL do 
		writeln('en la posicion:','  ',i,'el vector tiene la venta con codigo:','   ',V[i].codigo,'   ', ' con una cantidad de: ',V[i].cantidad);
end;
	
procedure ordenarXcodigo(var V: vector ; var dimL: integer);
var
	i,j,p: integer;
	item: venta;
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


procedure eliminar(var V: vector ;var  dimL: integer ; pos1,pos2: integer);
var
	i,j: integer;
begin
	for j:= pos1 to pos2 do begin
		if(pos2 <= dimL -1) AND (pos1 >= 1)then
			if(V[j].codigo >= pos1) and (V[j].codigo <= pos2 )then begin
				for i:= pos1 to pos2 do 
					V[i]:= V[i+1];
				dimL:= dimL -1;
			end;
	end;
end;

function cumple(codigo: integer): boolean;
begin
	if((codigo MOD 2)= 0)then
		cumple:= TRUE
	else
		cumple:= FALSE;
end;

procedure insertarOrdenado(var L: lista ; v: venta);
var
	nue,act,ant: lista;
begin
	new(nue);
	nue^.dato:= v;
	act:= L;
	ant:= L;
	while(act <> nil) and (v.codigo < L^.dato.codigo)do begin
		ant:= act;
		act:= act^.sig;
	end;
	if(act = ant)then
		L:= nue
	else
		ant^.sig:= nue;
	nue^.sig:= act;
end;

procedure cargarLista(var L: lista ; v: vector ; dimL: integer);
var
	i: integer;
begin
	for i:= 1 to dimL do 
		if(cumple(v[i].codigo))then
			insertarOrdenado(L,v[i]);
		
end;

procedure leerContenido(L: lista);
begin
	
	writeln('el codigo es: ',L^.dato.codigo);
	writeln('la cantidad es: ',L^.dato.cantidad);
end;

procedure mostrarLista(L: lista);
begin
	while(L <> nil) do begin
		writeln('los elementos de este nodo son: ');
		leerContenido(L);
		L:= L^.sig;
	end;
end;

var
	V: vector;
	dimL: integer;
	codigo1,codigo2: rangoCod;
	L: lista;
begin
	L:= nil;
	dimL:= 0;
	cargar(V,dimL);  {a}
	mostrarContenido(V,dimL); {b}
	ordenarXcodigo(V,dimL); {c}
	mostrarContenido(V,dimL);    {para mi, para ver si funciona}   {d}
	writeln('ingrese un codigo para limite inf:');
	readln(codigo1);
	writeln('ingrese un codigo para limite sup:');
	readln(codigo2);
	eliminar(V,dimL,codigo1,codigo2); {e}   {preguntar}
	mostrarContenido(V,dimL);  {f}
	cargarLista(L,V,dimL); {g}
	mostrarLista(L); {h}
end.
