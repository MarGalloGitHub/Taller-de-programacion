program finalFebrero;
type
	alumno = record
		nombre: string;
		dni: integer;
		tiempo: real;
	end;
	
	arbol = ^nodo;
	nodo = record
		dato: alumno;
		HI: arbol;
		HD: arbol;
	end;
	
	lista = ^nodo2;
	nodo2 = record
		dato:alumno;
		sig:lista;
	end;
	
procedure leerAlumno(var alu: alumno);
begin
	writeln('Ingrese el dni del alumno');
	readln(alu.dni);
	if(alu.dni <> 0)then begin
		writeln('Ingrese el nombre del alumno');
		readln(alu.nombre);
		writeln('Ingrese el tiempo del alumno');
		readln(alu.tiempo);
	end;
end;	
	
procedure crearArbol(var a: arbol ; alu:alumno);
begin
	if(a = nil)then begin
		new(a);
		a^.dato:=alu;
		a^.HI:=nil;
		a^.HD:= nil;
	end
	else
		if(alu.tiempo <= a^.dato.tiempo)then
			crearArbol(a^.HI,alu)
		else
			crearArbol(a^.HD,alu);
end;
	
procedure cargarArbol(var a:arbol);
var
	alu:alumno;
begin
	leerAlumno(alu);
	while(alu.dni <> 0) do begin
		crearArbol(a,alu);
		leerAlumno(alu);
	end;
end;

procedure mostrarAlumno(alu:alumno);
begin
	writeln('Tiempo del estudiante:  ', alu.tiempo:0:1 );
	writeln('DNI del estudiante:  ', alu.dni );
	writeln('Nombre del estudiante:  ', alu.nombre );
end;

procedure mostrarArbol(a:arbol);
begin
	if(a <> nil)then begin
		mostrarArbol(a^.HI);
		mostrarAlumno(a^.dato);
		mostrarArbol(a^.HD);
	end;
end;

procedure agregarAdelante(var L:lista ; alu:alumno);
var
	nue:lista;
begin
	new(nue);
	nue^.dato:= alu;
	nue^.sig:=L;
	L:=nue;
end;



procedure cargarListaRangos(a:arbol ; min:real ; max:real; var L:Lista);
begin
	if(a <> nil)then begin
		if(a^.dato.tiempo >= min)then
			if(a^.dato.tiempo <= max)then begin
				cargarListaRangos(a^.HI,min,max,L);
				agregarAdelante(L,a^.dato);
				cargarListaRangos(a^.HD,min,max,L);
			end
			else
				cargarListaRangos(a^.HI,min,max,L)
		else
			cargarListaRangos(a^.HD,min,max,L);
	end;
end;

procedure mostrarLista(L:lista);
begin
	while(L <> nil)do begin
		mostrarAlumno(L^.dato);
		L:=L^.sig;
	end;
end;

procedure buscarMasRapido(a:arbol; var nombre: string ; var dni: integer);
begin
	if(a = nil)then begin
		nombre:= 'Nose';
		dni:=0;
	end
	else
		if(a^.HI = nil)then begin
			nombre:= a^.dato.nombre;
			dni:= a^.dato.dni;
		end
		else
				buscarMasRapido(a^.HI,nombre,dni);
end;

var
	a: arbol;
	L:lista;
	nombre: string;
	dni: integer;
	min: real;
	max: real;
begin
	a:= nil;
	writeln('INCISO A');
	writeln('');
	cargarArbol(a); 													// inciso A
	mostrarArbol(a); 													// para mi para ver como esta
	writeln('Ingrese un tiempo minimo para el rango');
	readln(min);
	writeln('Ingrese un tiempo maximo para el rango');
	readln(max);
	L:=nil;
	writeln('INCISO B');
	writeln('');
	cargarListaRangos(a,min,max,L);										// inciso B
	mostrarLista(L);													// para mi
	buscarMasRapido(a,nombre,dni);										// inciso C
	writeln('El alumno mas rapido fue:  ' , nombre , ' ' , ', con el dni:  ' , dni);	//para mi
end.
