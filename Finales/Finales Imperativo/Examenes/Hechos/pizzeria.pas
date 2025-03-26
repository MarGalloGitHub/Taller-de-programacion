program ejercicioPizzeria;
type

	rangoDias = 1..31;

	pedidio = record
		dni: integer;
		nombre: string;
		fecha: rangoDias;
		monto: real;
	end;
	
	pedido2 = record
		fecha: rangoDias;
		monto: real;
	end;
	
	lista = ^nodo2;
	nodo2 = record
		dato: pedido2;
		sig:lista;
	end;
	
	historial = record
		dni: integer;
		nombre: string;
		pedidos: lista;
	end;
	
	arbol = ^nodo;
	nodo = record
		dato:historial;
		HI:arbol;
		HD:arbol;
	end;
	
procedure leerPedido(var ped: pedido);
begin
	writeln('Ingrese el monto del pedido');
	readln(ped.monto);
	if(ped.monto <> 0)then begin
		writeln('Ingrese el dni del cliente');
		readln(ped.dni);
		writeln('Ingrese la fecha del pedido');
		readln(ped.fecha);
		writeln('Ingrese el nombre del cliente');
		readln(ped.nombre);
	end;
end;	

procedure cargarArbol(var a:arbol ; ped: pedido);
var
	nue: arbol;
	histo:historial;
begin
	if(a = nil)then begin
		new(nue);
		histo.dni:=ped.dni;
		histo.nombre:=ped.nombre;
		histo.pedidos:=nil;
		agregarAdelante(histo.pedidos,ped);
		nue^.dato:=histo;
		nue^.HI:=nil;
		nue^.HD:=nil;
	end
	else
		if(ped.dni = a^.dato.dni)then begin
			agregarAdelante(a^.dato.pedidos,ped);
		end
		else
			if(ped.dni < a^.dato.dni)then
				cargarArbol(a^.HI,ped)
			else
				cargarArbol(a^.HD,ped);
end;

procedure crearArbol(var a:arbol);
var
	ped: pedido;
begin
	leerPedido(ped);
	while(ped.monto <> 0)do begin
		cargarArbol(a,ped);
		leerPedido(ped);
	end;
end;

var
	a: arbol;
begin
	a:= nil;
	crearArbol(a);
end.
