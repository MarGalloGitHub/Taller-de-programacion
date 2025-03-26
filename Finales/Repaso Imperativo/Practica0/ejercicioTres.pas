{ 3.- Implementar un programa que procese las ventas de un supermercado. El supermercado 
dispone de una tabla con los precios y stocks de los 1000 productos que tiene a la venta.
a) Implementar un módulo que retorne, en una estructura de datos adecuada, los tickets de las ventas. 
De cada venta se lee código de venta y los productos vendidos. Las ventas finalizan con el código de 
venta -1. De cada producto se lee código y cantidad de unidades solicitadas. Para cada venta, la lectura 
de los productos a vender finaliza con cantidad de unidades vendidas igual a 0. El ticket debe contener:
- Código de venta
- Detalle (código de producto, cantidad y precio unitario) de los productos que se pudieron vender. En 
caso de no haber stock suficiente, se venderá la máxima cantidad posible.
- Monto total de la venta.
c) Implementar un módulo que reciba la estructura generada en el inciso a) y un código de 
producto y retorne la cantidad de unidades vendidas de ese código de producto
}
program ejercicioTres;
type
	rangoProd = 1..10;
	
	producto = record
		codigo:rangoProd;
		cantidad:integer;
	end;
	
	informacion = record
		precio:real;
		stock:integer;
	end;
	
	informacionDetalle = record
		codigo:integer;
		cantidad:integer;
		precioUnitario:real;
	end;
	
	tabla = Array[rangoProd] of informacion;
	
	lista = ^nodo;
	nodo = record
		dato:producto;
		sig:lista;
	end;
	
	listaDetalle = ^nodo2;
	nodo2 = record
		dato: informacionDetalle;
		sig:listaDetalle;
	end;
	
	venta = record
		codigo:integer;
		productos:lista;
	end;
	
	ticket = record
		codigo:integer;
		detalle:listaDetalle;
		montoTotal:real;
	end;
	
	lista3 = ^nodo3;
	nodo3 = record
		dato:ticket;
		sig:lista3;
	end;
	
procedure leerInformacion(var info:informacion);
begin
	writeln('Ingrese el precio del producto');
	readln(info.precio);
	writeln('Ingrese el stock del producto');
	readln(info.stock);
end;

procedure inicializarTabla(var tablaSuper:tabla);
var
	i:rangoProd;
	info:informacion;
begin
	for i:= 1 to 10 do begin
		writeln('Producto: ' , i);
		leerInformacion(info);
		tablaSuper[i]:= info;
	end;
end;

procedure mostrarInfo(info:informacion);
begin
	writeln('precio del producto' ,' ' ,info.precio:0:1);
	writeln('stock del producto' ,' ' ,info.stock);
end;

procedure mostrarTabla(tablaSuper:tabla);
var
	i:rangoProd;
begin
	for i:= 1 to 10 do begin
		writeln('Producto :' , i);
		mostrarInfo(tablaSuper[i]);
	end;
end;

procedure agregarAdelante(var L:lista3 ; ven:venta);
var
	nue:lista3;
begin
	new(nue);
	nue^.dato:= ven;
end;

procedure cargarListaTickets(var L:lista3);
var
	ven:venta;
begin
	leerVenta(ven);
	while(ven.codigo <> (-1))do begin
		agregarAdelante(L,ven);
		leerVenta(ven);
	end;
end;

var
	tablaSuper:tabla;
	L:lista3;
begin
	inicializarTabla(tablaSuper);
	mostrarTabla(tablaSuper);
	L:=nil;
	cargarListaTickets(L);
	mostrarLista(L);
end.
