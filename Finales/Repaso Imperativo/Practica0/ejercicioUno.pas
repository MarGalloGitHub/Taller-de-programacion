program ejercicioUno;
const
	dF = 36;
type

	materias = Array [1..dF] of integer;

	alumno = record
		apellido: string;
		numero: integer;
		anioIngreso: integer;
		cuantas:integer;
		aprobadas: materias;
	end;
	
	lista = ^nodo;
	nodo = record
		dato: alumno;
		sig: lista;
	end;
	
	datosAlu = record
		alu:alumno;
		promedio:real;
	end;
	
	lista2 = ^nodo2;
	nodo2 = record
		dato:datosAlu;
		sig:lista2;
	end;
	
procedure cargarAprobadas(var aprobadas : materias ; cuantas:integer);
var 
	i:integer;
begin
	for i:= 1 to cuantas do 
	begin
		writeln('Ingrese la nota de la materia: ' ,'  ', i);
		readln(aprobadas[i]);
	end;
end;

procedure leerAlumno(var a:alumno);
begin
	writeln('Ingrese el numero de alumno');
	readln(a.numero);
	writeln('Ingrese el apellido del alumno');
	readln(a.apellido);
	writeln('Ingrese el anio de ingreso');
	readln(a.anioIngreso);
	writeln('Ingrese cantidad de materias aprobadas');
	readln(a.cuantas);
	if(a.cuantas > 36)then 
		writeln('no mamon tienen 36 materias como limite')
	else
		if(a.cuantas > 0)then
			cargarAprobadas(a.aprobadas , a.cuantas);
end;

procedure agregarAdelante(var L:lista ; alu:alumno);
var
	nue:lista;
begin
	new(nue);
	nue^.dato:=alu;
	nue^.sig:=L;
	L:= nue;
end;

procedure cargarLista(var L:lista);
var
	alu:alumno;
begin
	repeat
		leerAlumno(alu);
		agregarAdelante(L,alu);
	until(alu.numero = 111);
end;

procedure mostrarMaterias(aprobadas: materias ; cuantas:integer);
var
	i:integer;
begin
	for i:= 1 to cuantas do begin
		writeln('Materia :' , i , '  Nota: ', aprobadas[i]);
	end;
end;

procedure mostrarNodo(alu:alumno);
begin
	writeln('Apellido del alumno: ' , alu.apellido);
	writeln('Numero del alumno: ' , alu.numero);
	writeln('Anio de ingreso del alumno: ' , alu.anioIngreso);
	mostrarMaterias(alu.aprobadas , alu.cuantas);
	writeln('  ');
	writeln('  ');
	writeln('  ');
end;

procedure mostrarLista(L:lista);
begin
	while(L <> nil)do begin
		mostrarNodo(L^.dato);
		L:= L^.sig;
	end;
end;

function sacarPromedio(alu:alumno):real;
var
	i:integer;
	suma:integer;
begin
	suma:=0;
	for i:= 1 to alu.cuantas do begin
		suma:= suma + alu.aprobadas[i];
	end;
	sacarPromedio:= suma / alu.cuantas;
end;

procedure agregarAdelante2(var L2:lista2; datos:datosAlu);
var
	nue:lista2;
begin
	new(nue);
	nue^.dato:=datos;
	nue^.sig:=L2;
	L2:=nue;
end;

procedure cargarLista2(var L2:lista2 ; L:lista);
var
	datos:datosAlu;
begin
	while(L <> nil)do begin
		datos.alu:=L^.dato;
		datos.promedio:=sacarPromedio(L^.dato);
		agregarAdelante2(L2,datos);
		L:=L^.sig;
	end;
end;

procedure mostrarLista2(L2:lista2);
begin
	while(L2 <> nil)do begin
		mostrarNodo(L2^.dato.alu);
		writeln('Promedio : ' , L2^.dato.promedio:0:1);
		writeln('  ');
		writeln('  ');
		writeln('  ');
		L2:=L2^.sig;
	end;
end;

var
	L:lista;
	L2:lista2;
begin
	L:= nil;
	cargarLista(L);
	mostrarLista(L);
	cargarLista2(L2,L);
	mostrarLista2(L2);
end.
