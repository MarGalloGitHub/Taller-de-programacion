program final;
type
	rangoDias = 1..5;
	
	producto = record
		codigo:integer;
		cantidad:integer;
		codigoCliente:integer;
	end;
	
	lista = ^nodo;
	nodo = record
		dato: producto;
		sig:lista;
	end;
	
	vector = Array[rangoDias] of lista;

procedure leerProducto(var prod:producto);
begin
	writeln('Ingrese el codigo del producto');
	readln(prod.codigo);
	if(prod.codigo <> (-1))then begin
		writeln('Ingrese el codigo del cliente');
		readln(prod.codigoCliente);
		writeln('Ingrese la cantidad vendida del producto');
		readln(prod.cantidad);
	end;
end;

procedure insertarOrdenado(var L:lista ; prod:producto);
var
	nue,ant,act:lista;
begin
	new(nue);
	nue^.dato:= prod;
	ant:=L;
	act:=L;
	while((act <> nil) and (prod.codigo < act^.dato.codigo))do begin
		ant:= act;
		act:= act^.sig;
	end;
	if(act = ant)then  
		L:= nue
	else
		ant^.sig:= nue;
	nue^.sig:= act;
end;

procedure cargarVector(var v: vector);
var
	prod: producto;
	dia:rangoDias;
begin
	leerProducto(prod);
	while(prod.codigo <> (-1))do begin
		writeln('Ingrese a que dia pertence la venta de este producto - 1..5 -');
		readln(dia);
		insertarOrdenado(v[dia],prod);
		leerProducto(prod);
	end;
end;

procedure inicializarVector(var v:vector);
var
	i:rangoDias;
begin
	for i:= 1 to 5 do begin
		v[i]:= nil;
	end;
end;

procedure mostrarProducto(prod: producto);
begin
	writeln('Codigo de producto : ', '  ' , prod.codigo);
	writeln('Cantidad vendida : ' , '  ' , prod.cantidad);
	writeln('Codigo del cliente : ' , '  ', prod.codigoCliente);
end;

procedure mostrarLista(L:lista);
begin
	while(L <> nil)do begin
		mostrarProducto(L^.dato);
		L:= L^.sig;
	end;
end;

procedure mostrarVector(v:vector);
var
	i: rangoDias;
begin
	for i:= 1 to 5 do begin
		writeln('Lista de productos del dia:  ' , i );
		writeln('  ');
		if(v[i] <> nil) then
			mostrarLista(v[i])
		else
			writeln('No se cargaron productos ese dia');
	end;
end;
	
var
	v:vector;
begin
	inicializarVector(v);
	cargarVector(v);
	mostrarVector(v);
end.
