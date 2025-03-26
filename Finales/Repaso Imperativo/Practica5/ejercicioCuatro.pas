{
Una oficina requiere el procesamiento de los reclamos de las personas. De cada reclamo
se lee código, DNI de la persona, año y tipo de reclamo. La lectura finaliza con el código de
igual a -1. Se pide:
a) Un módulo que retorne estructura adecuada para la búsqueda por DNI. Para cada DNI
se deben tener almacenados cada reclamo y la cantidad total de reclamos que realizó.
b) Un módulo que reciba la estructura generada en a) y un DNI y retorne la cantidad de
reclamos efectuados por ese DNI.
c) Un módulo que reciba la estructura generada en a) y dos DNI y retorne la cantidad de
reclamos efectuados por todos los DNI comprendidos entre los dos DNI recibidos.
d) Un módulo que reciba la estructura generada en a) y un año y retorne los códigos de
los reclamos realizados en el año recibido.
}
program ejercicioCuatro;

type
	rangoReclamos = 1..10;
	reclamo = record
		codigo:integer;
		DNI:integer;
		anio:integer;
		tipoDeReclamo:rangoReclamos;
	end;
	
	reclamoChico = record
		codigo:integer;
		anio:integer;
		tipoDeReclamo:rangoReclamos;
	end;
	
	listaReclamos = ^nodo2;
	nodo2 = record
		dato:reclamoChico;
		sig:listaReclamos;
	end;
	
	modulo = record
		DNI:integer;
		lista:listaReclamos;
		cantTotalReclamos:integer;
	end;	
	
	arbol = ^nodo;
	nodo = record
		dato:modulo;
		HI:arbol;
		HD:arbol;
	end;
	
procedure leerReclamo(var r:reclamo);
begin
	writeln('Ingrese el codigo del reclamo');
	readln(r.codigo);
	if(r.codigo <> (-1))then begin
		writeln('Ingrese el anio del reclamo');
		readln(r.anio);
		writeln('Ingrese el dni asociado');
		readln(r.DNI);
		writeln('Ingrese el tipo de reclamo, num entre 1 y 10');
		readln(r.tipoDeReclamo);
	end;
end;

procedure armarReclamoChico(var recMin:reclamoChico ; rec:reclamo);
begin
	recMin.codigo:=rec.codigo;
	recMin.anio:=rec.anio;
	recMin.tipoDeReclamo:=rec.tipoDeReclamo;
end;
	
procedure agregarLista(var l:listaReclamos ; rec:reclamo);
var
	recMin:reclamoChico;
	nue:listaReclamos;
begin
	new(nue);
	nue^.sig:=l;
	armarReclamoChico(recMin,rec);
	nue^.dato:=recMin;
	l:=nue;
end;
	
procedure armarModulo(var Modulo:modulo ; rec:reclamo);
var
	L:listaReclamos;
begin
	L:=nil;
	Modulo.DNI:=rec.DNI;
	Modulo.lista:=L;
	agregarLista(Modulo.lista,rec);
	Modulo.cantTotalReclamos:=1;
end;
	
procedure agregarModulo(var a:arbol ; rec:reclamo);
var
	modo:modulo;
begin
	if(a = nil)then begin
		new(a);
		a^.HI:=nil;
		a^.HD:=nil;
		armarModulo(modo,rec);
		a^.dato:=modo;
	end
	else
		if(rec.DNI = a^.dato.DNI)then
			agregarLista(a^.dato.lista , rec)
		else
			if(rec.DNI <= a^.dato.DNI)then
				agregarModulo(a^.HI,rec)
			else
				agregarModulo(a^.HD,rec);
end;
	
procedure cargarArbol(var a:arbol);
var
	rec:reclamo;
begin
	leerReclamo(rec);
	while(rec.codigo <> (-1))do begin
		agregarModulo(a,rec);
		leerReclamo(rec);
	end;
end;	
	
var
	a:arbol;
begin
	a:=nil;
	cargarArbol(a); 													//Inciso A
end.
