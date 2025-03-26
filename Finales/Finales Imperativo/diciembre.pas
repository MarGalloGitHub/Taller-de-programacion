program finalDiciembre;
type
	vehiculo = record
		patente: string;
		marca: string;
		anioFabricacion:integer;
		colorPintura:string;
		dni:integer;
	end;
	
	arbol = ^nodo;
	nodo = record
		dato:vehiculo;
		HI:arbol;
		HD:arbol;
	end;
	
	lista = ^nodo2;
	nodo2 = record
		dato:vehiculo;
		sig:lista;
	end;
	
procedure leerVehiculo(var vec: vehiculo);
begin
	writeln('Ingrese la patente del auto - corta con ZZZ');
	readln(vec.patente);
	if(vec.patente <> 'ZZZ')then begin
		writeln('Ingrese la marca del auto');
		readln(vec.marca);
		writeln('Ingrese el anio de fabricacion del auto');
		readln(vec.anioFabricacion);
		writeln('Ingrese el color de la pintura');
		readln(vec.colorPintura);
		writeln('Ingrese el dni del propietario');
		readln(vec.dni);
	end;
end;

procedure mostrarVehiculo(vec:vehiculo);
begin
	writeln('La patente del vehiculo: ' , vec.patente);
	writeln('La marca del vehiculo:  ', vec.marca);
	writeln('Anio de fabricacion:  ', vec.anioFabricacion);
	writeln('Color de la pintura:  ', vec.colorPintura);
	writeln('Dni del propietario:  ', vec.dni);
end;

procedure crearArbol(var a:arbol; vec: vehiculo);
begin
	if(a = nil)then begin
		new(a);
		a^.dato:=vec;
		a^.HI:=nil;
		a^.HD:=nil;
	end
	else
		if(vec.dni <= a^.dato.dni)then
			crearArbol(a^.HI,vec)
		else
			crearArbol(a^.HD,vec);
end;

procedure cargarArbol(var a:arbol);
var
	vec:vehiculo;
begin
	leerVehiculo(vec);
	while(vec.patente <> 'ZZZ')do begin
		crearArbol(a,vec);
		leerVehiculo(vec);
	end;
end;

procedure mostrarArbol(a:arbol);
begin
	if(a <> nil)then begin
		mostrarArbol(a^.HI);
		mostrarVehiculo(a^.dato);
		mostrarArbol(a^.HD);
	end;
end;

procedure devolverCantidad(a:arbol ; var cant: integer; limiteInf: integer; limiteSup:integer);
begin
	if(a <> nil)then begin
		devolverCantidad(a^.HI,cant,limiteInf,limiteSup);
		if((a^.dato.anioFabricacion > limiteInf) AND (a^.dato.anioFabricacion < limiteSup))then
			cant:= cant + 1;
		devolverCantidad(a^.HD,cant,limiteInf,limiteSup);
	end;
end;

procedure agregarAtras(var L:lista; vec:vehiculo);
var
	nue:lista;
begin
	new(nue);
	nue^.dato:=vec;
	nue^.sig:=L;
	L:=nue;
end;

procedure cargarLista(a:arbol;var L:lista ; dni :integer);
begin
	if(a <> nil)then begin
		if(a^.dato.dni < dni)then begin
			cargarLista(a^.HI,L,dni);
			agregarAtras(L,a^.dato);
			cargarLista(a^.HD,L,dni);									//en realidad es adelante
		end
		else
			cargarLista(a^.HI,L,dni);
	end;
end;

procedure mostrarLista(L:lista);
begin
	while(L <> nil)do begin
		mostrarVehiculo(L^.dato);
		L:=L^.sig;
	end;
end;

var
	a: arbol;
	limiteInf:integer;
	limiteSup:integer;
	cant:integer;
	dni:integer;
	L:lista;
begin
	a:= nil;
	writeln('Inciso A');
	writeln('');
	cargarArbol(a);														//inciso A
	mostrarArbol(a);													//para mi
	writeln('Inciso B');
	writeln('');
	cant:=0;
	writeln('Ingrese un anio de fabricacion como limite inferior');
	readln(limiteInf);
	writeln('Ingrese un anio de fabricacion como limite superior');
	readln(limiteSup);
	devolverCantidad(a,cant,limiteInf,limiteSup);						//inciso B
	writeln('Cantidad de autos fabricados entre los anios: ',limiteInf, '   y   ' , limiteSup,':  ' , cant);
	writeln('Inciso C');												//inciso C
	writeln('');
	writeln('Ingrese un dni para el inciso C');
	readln(dni);
	L:=nil;
	cargarLista(a,L,dni);
	mostrarLista(L);
end.
