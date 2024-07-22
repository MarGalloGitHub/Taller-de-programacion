{4.- Una librería requiere el procesamiento de la información de sus productos. De cada producto 
se conoce el código del producto, código de rubro (del 1 al 8) y precio. 
Implementar un programa modularizado que:
a. Lea los datos de los productos y los almacene ordenados por código de producto y agrupados 
por rubro, en una estructura de datos adecuada. El ingreso de los productos finaliza cuando se 
lee el precio 0.
b. Una vez almacenados, muestre los códigos de los productos pertenecientes a cada rubro.
c. Genere un vector (de a lo sumo 30 elementos) con los productos del rubro 3. Considerar que 
puede haber más o menos de 30 productos del rubro 3. Si la cantidad de productos del rubro 3 
es mayor a 30, almacenar los primeros 30 que están en la lista e ignore el resto. 
d. Ordene, por precio, los elementos del vector generado en b) utilizando alguno de los dos 
métodos vistos en la teoría. 
e. Muestre los precios del vector ordenado}


program ejercicioCuatro;
const
	dF = 30;
type
	RangoRubro= 1..8;
	producto = record
		codigo: integer;
		codRubro: RangoRubro;
		precio: real;
	end;
	
	lista = ^nodo;
	nodo = record
		dato: producto;
		sig: lista;
	end;
	
	vectorRubro = array[RangoRubro] of lista;
	
	vectorC = array[1..dF] of producto;

procedure leerProducto(var p: producto);  {b.3}
begin
	writeln('ingrese un precio');
	readln(p.precio);
	if(p.precio <> 0)then begin
		writeln('ingrese un codigo');
		readln(p.codigo);
		writeln('ingrese un codRubro');
		readln(p.codRubro);
	end;
end;

procedure insertarOrdenado(var L: lista ; p: producto);    {b.2}                  {x}
var
	nue,ant,act: lista;
begin
	new(nue);
	nue^.dato:= p;
	act:= L;   {act y ant al comienzo de la lista}
	ant:= L;
	while(act <> nil) and (L^.dato.codigo < p.codigo)do begin
		ant:= act;
		act:= act^.sig;
	end;
	if(act = ant)then    {al inicio de la lista vacia}
		L:= nue
	else                 {al medio o al final}
		ant^.sig:= nue;
	nue^.sig:= act;
end;
	
procedure cargarVector(var V: vectorRubro); {a.1}
var
	p: producto;
begin
	leerProducto(p);
	while(p.precio <> 0) do begin
		insertarOrdenado(V[p.codRubro],p);
		leerProducto(p);
	end;
end;

procedure ImprimirLista(L: lista); {b.2}
begin
	while(L <> nil) do begin
		writeln('el codigo de este producto es: ',' ', L^.dato.codigo,'que esta en el rubro: ',' ', L^.dato.codRubro);
		L:= L^.sig;
	end;
end;

procedure mostrarCodigos(V: vectorRubro); {b.1}
var
	i: RangoRubro;
begin
	for i:= 1 to 8 do 
		ImprimirLista(V[i]);
end;
	
procedure cargarVectorCC(var Vc: vectorC ; V: vectorRubro ; var dimL: integer); {c. Genere un vector (de a lo sumo 30 elementos) con los productos del rubro 3. Considerar que 
puede haber más o menos de 30 productos del rubro 3. Si la cantidad de productos del rubro 3 
es mayor a 30, almacenar los primeros 30 que están en la lista e ignore el resto. }
begin
	while(V[3] <> nil) AND(dimL <= dF)do begin
		dimL:= dimL +1;
		Vc[dimL]:= V[3]^.dato;
		V[3]:= V[3]^.sig;
	end;
end;	
	
procedure ordenacionSELECCION(var Vc: vectorC ; dimL: integer);
var
	i,j,p: integer;
	item: producto;
begin
	for i:= 1 to dimL -1 do begin
		p:= i;
		for j:= i+1 to dimL do
			if (Vc[j].precio < Vc[p].precio) then
				p:= J;
		item:= Vc[p];
		Vc[p]:= Vc[i];
		Vc[i]:= item;
	end;
end;	
	
procedure mostrarContenidoVectorC(Vc: vectorC ; dimL: integer);
var
	i: integer;
begin
	for i:= 1 to dimL do 
		writeln('el precio de este producto es: ','   ',Vc[i].precio);
end;
	

var
	V: vectorRubro;
	Vc: vectorC;
	dimL: integer;
begin
	dimL:= 0;
	cargarVector(V); {a}
	mostrarCodigos(V); {b}
	cargarVectorCC(Vc,V,dimL); {c}
	ordenacionSELECCION(Vc,dimL); {d}
	mostrarContenidoVectorC(Vc,dimL); {e} {preguntar}
end.
