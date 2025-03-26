{2. Escribir un programa que:

 a. Implemente un módulo que lea información de ventas de un comercio. De cada venta se lee
 código de producto, fecha y cantidad de unidades vendidas. La lectura finaliza con el código de
 producto 0. Un producto puede estar en más de una venta. Se pide:
 i. Generar y retornar un árbol binario de búsqueda de ventas ordenado por código de
 producto.
 ii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por
 código de producto. Cada nodo del árbol debe contener el código de producto y la
 cantidad total de unidades vendida.
 * 
 Nota: El módulo debe retornar los dos árboles.
 
 b. Implemente un módulo que reciba el árbol generado en i. y un código de producto y retorne
 la cantidad total de unidades vendidas de ese producto.
 * 
 c. Implemente un módulo que reciba el árbol generado en  ii. y un código de producto y retorne
 la cantidad total de unidades vendidas de ese producto}

program ejercicio;

type
	venta = record
		codigo: integer;
		fecha: integer;
		cant: integer;
	end;
	
	producto = record
		codigo: integer;
		cant: integer;
	end;
	
	arbol = ^nodo;
	nodo = record
		HI: arbol;
		HD: arbol;
		dato: venta;
	end;
	
	arbol2 = ^nodo2;
	nodo2 = record
		HI: arbol2;
		HD: arbol2;
		dato: producto;
	end;
	
procedure leerVenta(var ven: venta);
begin
	writeln('Ingrese un codigo de producto');
	readln(ven.codigo);
	if(ven.codigo <> 0)then begin
		writeln('Ingrese la fecha de la venta');
		readln(ven.fecha);
		writeln('Ingrese la cantidad de productos');
		readln(ven.cant);
	end;
end;	

procedure crearArbol(var arb: arbol ; ven: venta);
begin
	if(arb = nil)then begin
		new(arb);
		arb^.dato:= ven;
		arb^.HI:= nil;
		arb^.HD:= nil;
	end
	else
		if(ven.codigo <= arb^.dato.codigo)then
			crearArbol(arb^.HI , ven)
		else
			crearArbol(arb^.HD , ven);
end;

procedure crearArbolDOS(var arb: arbol2 ; ven: venta);
begin
	if(arb = nil)then begin
		new(arb);
		arb^.dato.codigo:= ven.codigo;
		arb^.dato.cant:= ven.cant;
		arb^.HI:= nil;
		arb^.HD:= nil;
	end
	else
		if(ven.codigo <= arb^.dato.codigo)then
			crearArbolDOS(arb^.HI , ven)
		else
			crearArbolDOS(arb^.HD , ven);
end;

procedure cargarArbol(var arb: arbol);
var
	ven: venta;
begin
	leerVenta(ven);
	while(ven.codigo <> 0)do begin
		crearArbol(arb , ven);
		leerVenta(ven);
	end;
end;

procedure cargarArbolDOS(arb: arbol ; var arb2: arbol2);
begin
	if(arb <> nil)then begin
		crearArbolDOS(arb2 , arb^.dato);
		cargarArbolDOS(arb^.HI , arb2);
		cargarArbolDOS(arb^.HD, arb2);
	end;
end;

procedure incisoA(var arb: arbol ; var arb2: arbol2);
begin
	cargarArbol(arb);
	cargarArbolDOS(arb , arb2);
end;

procedure mostrarArbolUNO(arb: arbol);
begin
	if(arb <> nil)then begin
		writeln('Informacion de la venta: ' ,'Codigo: ' ,arb^.dato.codigo ,' - Fecha: ',arb^.dato.fecha , ' - Cantidad: ' , arb^.dato.cant);
		mostrarArbolUNO(arb^.HI);
		mostrarArbolUNO(arb^.HD);
	end;	
end;

procedure mostrarArbolDOS(arbDOS: arbol2);
begin
	if(arbDOS <> nil)then begin
		writeln('Informacion del producto: ' , ' Codigo: ', arbDOS^.dato.codigo , ' - Cantidad: ', arbDOS^.dato.cant);
		mostrarArbolDOS(arbDOS^.HI);
		mostrarArbolDOS(arbDOS^.HD);
	end;
end;

function contarUno(arb: arbol ; cod: integer):integer;
var
	num: integer;
begin
	if(arb = nil)then
		num:= 0
	else begin
		if(arb^.dato.codigo = cod)then
			num:= arb^.dato.cant;
		num:= num + contarUno(arb^.HI , cod) + contarUno(arb^.HD , cod);
	end;
	contarUno:= num;
end;

procedure incisoB(arb: arbol);
var
	cod: integer;
	cant: integer;
begin
	writeln('Ingrese un codigo de producto para ver cantidad total de ventas correspondiente a el');
	readln(cod);
	cant:= contarUno(arb , cod) ;
	writeln('Cantidad de unidades vendidas: ' , cant);
end;


function contarDos(arb: arbol2 ; cod: integer):integer;
var
	num: integer;
begin
	if(arb = nil)then
		num:= 0
	else begin
		if(arb^.dato.codigo = cod)then
			num:= arb^.dato.cant;
		num:= num + contarDos(arb^.HI , cod) + contarDos(arb^.HD , cod);
	end;
	contarDos:= num;
end;

procedure incisoC(arb2: arbol2);
var
	cod: integer;
	cant: integer;
begin
	writeln('Ingrese un codigo de producto para ver cantidad total de ventas correspondiente a el');
	readln(cod);
	cant:= contarDos(arb2 , cod);
	writeln('Cantidad de unidades vendidas: ' , cant);
end;

var
	arb: arbol;
	arb2: arbol2;
begin
	arb:= nil;
	arb2:= nil;
	incisoA(arb , arb2);
	writeln('');
	mostrarArbolUNO(arb);
	writeln('');
	mostrarArbolDOS(arb2);
	incisoB(arb); { b. Implemente un módulo que reciba el árbol generado en i. y un código de producto y retorne
 la cantidad total de unidades vendidas de ese producto.}
	incisoC(arb2); { c. Implemente un módulo que reciba el árbol generado en  ii. y un código de producto y retorne
 la cantidad total de unidades vendidas de ese producto}
end.
