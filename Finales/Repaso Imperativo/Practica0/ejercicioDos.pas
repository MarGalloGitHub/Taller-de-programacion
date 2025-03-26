{
2.- Implementar un programa que procese información de propiedades que están a la venta 
en una inmobiliaria. 
Se pide:
a) Implementar un módulo para almacenar en una estructura adecuada, las propiedades 
agrupadas por zona. Las propiedades de una misma zona deben quedar almacenadas 
ordenadas por tipo de propiedad. Para cada propiedad debe almacenarse el código, el tipo de 
propiedad y el precio total. De cada propiedad se lee: zona (1 a 5), código de propiedad, tipo 
de propiedad, cantidad de metros cuadrados y precio del metro cuadrado. La lectura finaliza 
cuando se ingresa el precio del metro cuadrado -1.
b) Implementar un módulo que reciba la estructura generada en a), un número de zona y un tipo de 
propiedad y retorne los códigos de las propiedades de la zona recibida y del tipo recibido. 
}
program ejercicioDos;
type
	rangoZonas = 1..5;

	propiedad = record
		codigo:integer;
		tipo:integer;
		precio:real;
	end;
	
	informacion = record
		zona:rangoZonas;
		codigo:integer;
		tipo:integer;
		cantidadMetros:integer;
		precioMetrosCuadrados:real;
	end;
	
	lista = ^nodo;
	nodo = record
		dato:propiedad;
		sig:lista;
	end;
	
	vector = Array[rangoZonas] of lista;
	
procedure inicializarVector(var propiedades:vector);
var
	i:rangoZonas;
begin
	for i:= 1 to 5 do 
		propiedades[i]:=nil;
end;

procedure leerDatos(var datos: informacion);
begin
	writeln('Ingrese el precio X metro cuadrado');
	readln(datos.precioMetrosCuadrados);
	if(datos.precioMetrosCuadrados <> (-1))then begin
		writeln('Ingrese el codigo de la propiedad');
		readln(datos.codigo);
		writeln('Ingrese el tipo de la propiedad - numero del 1 al 5');
		readln(datos.tipo);
		writeln('Ingrese la zona de la propiedad - numero del 1 al 5');
		readln(datos.zona);
		writeln('Ingrese la cantidad de metros cuadrados de la propiedad');
		readln(datos.cantidadMetros);
	end;
end;

procedure armarPropiedad(datos:informacion ; var prop:propiedad);
begin
	prop.codigo:=datos.codigo;
	prop.tipo:=datos.tipo;
	prop.precio:= (datos.cantidadMetros * datos.precioMetrosCuadrados);
end;

procedure agregarAdelante(var L:lista ; prop:propiedad);
var
	nue:lista;
begin
	new(nue);
	nue^.dato:= prop;
	nue^.sig:=L;
	L:=nue;
end;

procedure cargarVector(var propiedades:vector);
var
	prop:propiedad;
	datos:informacion;
begin
	leerDatos(datos);
	while(datos.precioMetrosCuadrados <> (-1))do begin
		armarPropiedad(datos,prop);
		agregarAdelante(propiedades[prop.tipo],prop);
		leerDatos(datos);
	end;
end;

procedure mostrarPropiedad(prop:propiedad);
begin
	writeln('tipo de propiedad:' , prop.tipo);
	writeln('codigo de propiedad', prop.codigo);
	writeln('precio de la propiedad:' , prop.precio:0:1);
end;

procedure mostrarLista(L:lista);
begin
	while(L <> nil)do begin
		mostrarPropiedad(L^.dato);
		writeln('');
		L:=L^.sig;
	end;
end;

procedure mostrarVector(propiedades:vector);
var
	i:rangoZonas;
begin
	for i:= 1 to 5 do begin
		writeln('propiedades de tipo: ' , i );
		mostrarLista(propiedades[i]);
	end;
end;
var
	propiedades: vector;
begin
	inicializarVector(propiedades);
	cargarVector(propiedades);
	mostrarVector(propiedades);
end.
