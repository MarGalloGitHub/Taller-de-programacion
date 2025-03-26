{
Una agencia dedicada a la venta de autos ha organizado su stock y, dispone en papel de la
información de los autos en venta. Implementar un programa que:
a) Lea la información de los autos (patente, año de fabricación (2010..2018), marca y
modelo) y los almacene en dos estructuras de datos:
i. Una estructura eficiente para la búsqueda por patente.
ii. Una estructura eficiente para la búsqueda por marca. Para cada marca se deben
almacenar todos juntos los autos pertenecientes a ella.
b) Invoque a un módulo que reciba la estructura generado en a) i y una marca y retorne la
cantidad de autos de dicha marca que posee la agencia.
c) Invoque a un módulo que reciba la estructura generado en a) ii y una marca y retorne
la cantidad de autos de dicha marca que posee la agencia.
d) Invoque a un módulo que reciba el árbol generado en a) i y retorne una estructura con
la información de los autos agrupados por año de fabricación.
e) Invoque a un módulo que reciba el árbol generado en a) i y una patente y devuelva el
modelo del auto con dicha patente.
f) Invoque a un módulo que reciba el árbol generado en a) ii y una patente y devuelva el
modelo del auto con dicha patente.
}

program ejercicioDos;

type
	rangoAnios = 2010..2018;
{
*										Primer arbol 
}
	auto = record
		patente:integer;
		anioFabricacion:rangoAnios;
		marca:integer;
		modelo:string;
	end;
		
	arbolPatente = ^nodo;  
	nodo = record
		dato:auto;
		HI:arbolPatente;
		HD:arbolPatente;
	end;
{
* 										Segundo arbol
}
	auto2 = record
		patente:integer;
		anioFabricacion:rangoAnios;
		modelo:string;
	end;
	
	listaMarca = ^nodo2;
	nodo2 = record
		dato:auto2;
		sig:listaMarca;
	end;
	
	infoArbolMarca = record
		marca:integer;
		lista:listaMarca;
	end;
	
	arbolMarca = ^nodo3;
	nodo3 = record
		dato:infoArbolMarca;
		HI:arbolMarca;
		HD:arbolMarca;
	end;

procedure leerAuto(var car:auto);
begin
	writeln('Ingrese la patente del auto');
	readln(car.patente);
	if(car.patente <> (-1))then begin
		writeln('Ingrese la marca del auto - 1..7'); 
		readln(car.marca);
		writeln('Ingrese el modelo del auto');
		readln(car.modelo);
		writeln('Ingrese el anio de fabricacion del auto 2010..2018');
		readln(car.anioFabricacion);
	end;
end;

procedure agregarLista(var L:listaMarca ; car:auto);
var
	car2:auto2;
	nue:listaMarca;
begin
	new(nue);
	car2.patente:=car.patente;
	car2.modelo:=car.modelo;
	car2.anioFabricacion:=car.anioFabricacion;
	nue^.dato:=car2;
	nue^.sig:=L;
	L:=nue;
end;
	
procedure crearArbolMarca(var aM:arbolMarca ; car:auto);
var
	info: infoArbolMarca;
	L:listaMarca;
begin
	if(aM = nil)then begin
		new(aM);
		aM^.HI:=nil;
		aM^.HD:=nil;
		L:=nil;
		info.marca:=car.marca;
		agregarLista(L,car);
		info.lista:=L;
		aM^.dato:=info;
	end
	else
		if(car.marca = aM^.dato.marca)then
			agregarLista(aM^.dato.lista,car)
		else
			if(car.marca < aM^.dato.marca)then
				crearArbolMarca(aM^.HI,car)
			else
				crearArbolMarca(aM^.HD,car);
end;

procedure mostrarAuto2(car2:auto2);
begin
	writeln('Patente del auto: ', ' ', car2.patente);
	writeln('Anio de fabricacion : ', ' ', car2.anioFabricacion);
	writeln('Modelo del auto: ', ' ', car2.modelo);
end;
	
procedure mostrarInfo(info:infoArbolMarca);
begin
	writeln('Marca de los autos de este nodo: ' , info.marca);
	while(info.lista <> nil)do begin
		mostrarAuto2(info.lista^.dato);
		info.lista:=info.lista^.sig;
	end;
end;
	
procedure mostrarArbolMarca(aM:arbolMarca);
begin
	if(aM <> nil)then begin
		mostrarInfo(aM^.dato);
		mostrarArbolMarca(aM^.HI);
		mostrarArbolMarca(aM^.HD);
	end;
end;

procedure mostrarAuto(car:auto);
begin
	writeln('  ');
	writeln('Patente del auto:  ', ' ' ,car.patente);
	writeln('Anio de fabricacion:  ', ' ' ,car.anioFabricacion);
	writeln('Marca:  ', ' ' ,car.marca);
	writeln('Modelo:  ', ' ' ,car.modelo);
end;

procedure mostrarArbolPatente(aP:arbolPatente);		
begin
	if(aP <> nil)then begin
		mostrarAuto(aP^.dato);
		mostrarArbolPatente(aP^.HI);
		mostrarArbolPatente(aP^.HD);
	end;
end;

procedure crearArbolPatente(var aP:arbolPatente ; car:auto);
begin
	if(aP = nil)then begin
		new(aP);
		aP^.dato:=car;
		aP^.HI:= nil;
		aP^.HD:= nil;
	end
	else
		if(car.patente <= aP^.dato.patente)then
			crearArbolPatente(aP^.HI,car)
		else
			crearArbolPatente(aP^.HD,car);
end;


procedure cargarArboles(var aP:arbolPatente; var aM:arbolMarca);
var
	car:auto;
begin
	leerAuto(car);
	while(car.patente <> (-1))do begin
		crearArbolPatente(aP,car);
		crearArbolMarca(aM,car);
		leerAuto(car);
	end;
end;

procedure cantidadAutosPorMarca(aP:arbolPatente;marca:integer;var cant:integer);
begin
	if(aP <> nil)then begin
		if(aP^.dato.marca = marca)then begin
			writeln('Encontre uno');
			cant:= cant + 1;
		end;
		cantidadAutosPorMarca(aP^.HI,marca,cant);
		cantidadAutosPorMarca(aP^.HD,marca,cant);
	end;
end;

procedure contarCantidadEnLista(L:listaMarca ; var cant:integer);
begin
	while(L <> nil)do begin
		cant:= cant + 1;
		L:=L^.sig;
	end;
end;

procedure cantidadAutosPorMarcaEficiente(aM:arbolMarca;marca:integer;var cant:integer);
begin
	if(aM <> nil)then begin
		if(aM^.dato.marca = marca)then
			contarCantidadEnLista(aM^.dato.lista,cant)
		else
			if(aM^.dato.marca > marca)then
				cantidadAutosPorMarcaEficiente(aM^.HI,marca,cant)
			else
				cantidadAutosPorMarcaEficiente(aM^.HD,marca,cant);
	end;
end;

var
	aP:arbolPatente;
	aM:arbolMarca;
	marca:integer;
	marca2:integer;
	cant:integer;
	cant2:integer;
begin
	aP:=nil;
	aM:=nil;
	cargarArboles(aP,aM);																	//inciso A
	if(aM <> nil)then begin
		writeln(' ');
		writeln('Arbol de marcas');
		mostrarArbolMarca(aM)
	end
	else
		writeln('Arbol de marcas vacio');
	if(aP <> nil)then begin
		writeln(' ');
		writeln('Arbol de patentes');
		mostrarArbolPatente(aP)
	end
	else
		writeln('Arbol de patentes vacio');
	writeln('Ingrese una marca a buscar en el arbol para ver cuantos hay');					//inciso B
	readln(marca);
	cantidadAutosPorMarca(aP,marca,cant);
	writeln('Cantidad de autos de la marca ', '  ', marca , ':  ' , cant); 
	writeln('Ingrese una marca a buscar en el arbol mas eficiente para ver cuantos hay');					//inciso C
	readln(marca2);
	cantidadAutosPorMarcaEficiente(aM,marca2,cant2);
	writeln('Cantidad de autos de la marca ', '  ', marca2 , ':  ' , cant2); 
end.
