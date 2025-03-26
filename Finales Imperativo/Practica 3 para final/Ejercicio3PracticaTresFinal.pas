{Implementar un programa que contenga:
 a. Un módulo que lea información de alumnos de Taller de Programación y los almacene en
 una estructura de datos. De cada alumno se lee legajo, DNI, año de ingreso y los códigos y
 notas de los finales rendidos. La estructura generada debe ser eficiente para la búsqueda por
 número de legajo. La lectura de los alumnos finaliza con legajo 0 y para cada alumno el ingreso
 de las materias finaliza con el código de materia-1.
 
 b. Un módulo que reciba la estructura generada en a. y retorne los DNI y año de ingreso de
 aquellos alumnos cuyo legajo sea inferior a un valor ingresado como parámetro.
 
 c. Un módulo que reciba la estructura generada en a. y retorne el legajo más grande.
 
 d. Un módulo que reciba la estructura generada en a. y retorne el DNI más grande.
 * 
 e. Un módulo que reciba la estructura generada en a. y retorne la cantidad de alumnos con
 legajo impar.
 * 
 e. Un módulo que reciba la estructura generada en a. y retorne el legajo y el promedio del
 alumno con mayor promedio.
 f. Un módulo que reciba la estructura generada en a. y un valor entero. Este módulo debe
 retornar los legajos y promedios de los alumnos cuyo promedio supera el valor ingresado}

program ejercicio;

type
	infoFinal = record
		codigo: integer;
		nota: real;
	end;
	
	lista = ^nodo;
	nodo = record
		dato: infoFinal;
		sig: lista;
	end;
	
	alumno = record
		legajo: integer;
		DNI: integer;
		anioIngreso: integer;
		materias: lista;
	end;
	
	arbol = ^nodoArbol;
	nodoArbol = record
		HI: arbol;
		HD: arbol;
		dato: alumno;
	end;
	
	infoB = record
		anioIngreso: integer;
		DNI: integer;
	end;
	
	listaB = ^nodoB;
	nodoB = record
		dato: infoB;
		sig: listaB;
	end;
	
procedure agregar(var materias: lista ; info: infoFinal);
var
	nue: lista;
begin
	new(nue);
	nue^.dato:= info;
	nue^.sig:= materias;
	materias:= nue;
end;	

procedure leerFinal(var info: infoFinal);
begin
	writeln('ingrese el codigo de la materia correspondiente');
	readln(info.codigo);
	if(info.codigo <> (-1))then begin
		writeln('ingrese la nota de la materia correspondiente');
		readln(info.nota);
	end;
end;
	
procedure leerMaterias(var materias: lista);
var
	info: infoFinal;
begin
	leerFinal(info);
	while(info.codigo <> (-1))do begin
		agregar(materias , info);
		leerFinal(info);
	end;
end;	

procedure leerAlumno(var alu: alumno);
begin
	alu.materias:= nil;
	writeln('Ingrese el numero de legajo');
	readln(alu.legajo);
	if(alu.legajo <> 0)then begin
		writeln('Ingrese el numero de DNI');
		readln(alu.DNI);
		writeln('Ingrese el numero del año de ingreso');
		readln(alu.anioIngreso);
		leerMaterias(alu.materias);
	end;
end;

procedure crearArbol(var arb: arbol ; alu: alumno);
begin
	if(arb = nil)then begin
		new(arb);
		arb^.HI:= nil;
		arb^.HD:= nil;
		arb^.dato:= alu;
	end
	else
		if(alu.legajo <= arb^.dato.legajo)then
			crearArbol(arb^.HI,alu)
		else
			crearArbol(arb^.HD,alu);
end;

procedure cargarArbol(var arb: arbol);
var
	alu: alumno;
begin
	leerAlumno(alu);
	while(alu.legajo <> 0)do begin
		crearArbol(arb , alu);
		leerAlumno(alu);
	end;
end;	

procedure agregarListaB(var list: listaB ; alu: alumno);
var
	nue: listaB;
begin
	new(nue);
	nue^.dato.anioIngreso:=  alu.anioIngreso;
	nue^.dato.DNI:= alu.DNI;
	nue^.sig:= list;
	list:= nue;
end;

procedure armarListaB(arb: arbol ; var list: listaB ; num:integer);
begin
	if(arb <> nil)then begin
		if(arb^.dato.legajo < num)then
			agregarListaB(list , arb^.dato);
		armarListaB(arb^.HI , list , num);                                         {preguntar si el recorrido esta bien}
		armarListaB(arb^.HD , list , num);
	end;
end;

procedure incisoB(arb: arbol ; var list: listaB);
var
	num: integer;
begin
	writeln('ingrese un legajo, recuperaremos info de legajos menores al ingresado');
	readln(num);
	armarListaB(arb , list , num);
end;

function buscarMaxLegajo(arb: arbol): integer;
begin
	if(arb = nil)then
		buscarMaxLegajo:= (-1)
	else
		if(arb^.HD = nil)then
			buscarMaxLegajo:= arb^.dato.legajo
		else
			buscarMaxLegajo(arb^.HD);
end;

procedure buscarMaxDNI(arb: arbol ; var maxDNI: integer);
begin
	if(arb <> nil)then begin
		if(arb^.dato.DNI > maxDNI)then
			maxDNI:= arb^.dato.DNI;
		buscarMaxDNI(arb^.HI , maxDNI);
		buscarMaxDNI(arb^.HD , maxDNI);
	end;
end;

var
	arb: arbol;
	listB: listaB;
	maxLegajo: integer;
	maxDNI: integer;
begin
	arb:= nil;
	cargarArbol(arb); {a}
	listB:= nil;
	incisoB(arb , listB); {b}
	maxLegajo:= buscarMaxLegajo(arb); {c} {retornar vs informar}
	maxDNI:= -1;
	buscarMaxDNI(arb , maxDNI); {d}
end.
