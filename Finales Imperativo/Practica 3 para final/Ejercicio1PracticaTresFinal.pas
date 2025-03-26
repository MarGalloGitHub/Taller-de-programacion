{ 1. Escribir un programa que:
 a. Implemente un módulo que lea información de socios de un club y las almacene en un árbol
 binario de búsqueda. De cada socio se lee número de socio, nombre y edad. La lectura finaliza
 con el número de socio 0 y el árbol debe quedar ordenado por número de socio.
 
 b. Una vez generado el árbol, realice módulos independientes que reciban el árbol como
 parámetro y que :
 i. Informe el número de socio más grande. Debe invocar a un módulo recursivo que
 retorne dicho valor.
 
 ii. Informe los datos del socio con el número de socio más chico. Debe invocar a un módulo
 recursivo que retorne dicho socio.
 
 iii. Informe el número de socio con mayor edad. Debe invocar a un módulo recursivo que
 retorne dicho valor.
 
 iv. Aumente en 1 la edad de todos los socios.
 
 v. Lea un valor entero e informe si existe o no existe un socio con ese valor. Debe invocar a
 un módulo recursivo que reciba el valor leído y retorne verdadero o falso.
 
 vi. Lea un nombre e informe si existe o no existe un socio con ese nombre. Debe invocar a
 un módulo recursivo que reciba el nombre leído y retorne verdadero o falso.
 
 vii. Informe la cantidad de socios. Debe invocar a un módulo recursivo que retorne dicha
 cantidad.
 
 viii. Informe el promedio de edad de los socios. Debe invocar al módulo recursivo del inciso
 
 vii e invocar a un módulo recursivo que retorne la suma de las edades de los socios.
 
 ix. Informe, a partir de dos valores que se leen, la cantidad de socios en el árbol cuyo
 número de socio se encuentra entre los dos valores ingresados. Debe invocar a un módulo
 recursivo que reciba los dos valores leídos y retorne dicha cantidad.
 
 x. Informe los números de socio en orden creciente.
 
 xi. Informe los números de socio pares en orden decreciente.}
 
 program ejercicio;
 
 { a. Implemente un módulo que lea información de socios de un club y las almacene en un árbol
 binario de búsqueda. De cada socio se lee número de socio, nombre y edad. La lectura finaliza
 con el número de socio 0 y el árbol debe quedar ordenado por número de socio.}
type
	socio = record
		numero: integer;
		nombre: string[20];
		edad: integer;
	end;
 
	arbol = ^nodo;
	nodo = record
		HI: arbol;
		HD: arbol;
		dato: socio;
	end;

procedure leerSocio(var sos: socio);
begin
	writeln('escriba el numero del socio');
	readln(sos.numero);
	if(sos.numero <> 0)then begin
		writeln('escriba el nombre del socio');
		readln(sos.nombre);
		writeln('escriba la edad del socio');
		readln(sos.edad);
	end;
		
end;

procedure crearArbol(var arb: arbol ; sos: socio);
begin
	if(arb = nil)then begin
		new(arb);
		arb^.dato:= sos;
		arb^.HI:= nil;
		arb^.HD:= nil;
	end
	else begin
		if(sos.numero < arb^.dato.numero)then
			crearArbol(arb^.HI , sos)
		else
			crearArbol(arb^.HD,sos);
	end;
		
end;
 
procedure cargarArbol(var arb: arbol);
var
	sos:socio;
begin
	leerSocio(sos);
	while(sos.numero <> 0)do begin
		crearArbol(arb,sos);
		leerSocio(sos);
	end;
end; 

function buscarI(arb:arbol): integer;
begin
	if(arb = nil)then
		buscarI:= -1
	else
		if(arb^.HD = nil)then
			buscarI:= arb^.dato.numero
		else
			buscarI:= buscarI(arb^.HD);
end;

procedure buscarSocioMax(arb: arbol);
var
	max: integer;
begin
	max:= buscarI(arb);
	if(max <> (-1))then
		writeln('El numero de socio mas grande es el: ' , max)
	else
		writeln('Arbol pelado');
end;

function buscarII(arb: arbol): arbol;
begin
	if(arb = nil)then
		buscarII:= nil
	else
		if(arb^.HI = nil)then
			buscarII:= arb
		else
			buscarII:= buscarII(arb^.HI);
end;

procedure buscarDatosSocioMin(arb: arbol);
var
	socioMin: arbol;
begin
	socioMin:= buscarII(arb);
	if(socioMin <> nil)then begin
		writeln('Datos socioMinimo');
		writeln('Nombre: ' , socioMin^.dato.nombre , ' - Numero: ' , socioMin^.dato.numero , ' - Edad: ' , socioMin^.dato.edad);
	end
	else
		writeln('arbol pelado II');
end;

function buscarIII(arb: arbol ; maxEdad: integer): arbol;
var
	retorno: arbol;
begin
	if(arb = nil)then
		retorno:= nil
	else begin
		if(arb^.dato.edad > maxEdad)then begin
			maxEdad:= arb^.dato.edad;
			retorno:= arb;
		end;
		if(arb^.HI <> nil)then
			retorno:= buscarIII(arb^.HI , maxEdad);
		if(arb^.HD <> nil)then
			retorno:= buscarIII(arb^.HD , maxEdad);
	end;
	buscarIII:= retorno;
end;

procedure buscarDatosEdadMayor(arb: arbol);
var
	socioEdad: arbol;
	maxEdad: integer;
begin
	maxEdad:= -1;
	socioEdad:= buscarIII(arb , maxEdad);
	if(socioEdad <> nil)then 
		writeln('Numero del socio con mayor edad: ' , socioEdad^.dato.numero , ' - Edad: ' , socioEdad^.dato.edad)
	else
		writeln('arbol pelado III');
end;

procedure aumentarEdad(arb: arbol);
begin
	if(arb <> nil)then begin
		arb^.dato.edad:= arb^.dato.edad + 1;
		aumentarEdad(arb^.HI);
		aumentarEdad(arb^.HD);
	end;
end;

procedure mostrarArbol(arb: arbol);
begin
	if(arb <> nil)then begin
		writeln('Nombre: ' , arb^.dato.nombre , ' - Numero: ' , arb^.dato.numero , ' - Edad: ' , arb^.dato.edad);
		mostrarArbol(arb^.HI);
		mostrarArbol(arb^.HD);
	end;
end;

function buscarV(arb: arbol ; num: integer): boolean;
begin
	if(arb = nil)then 
		buscarV:= FALSE
	else
		if(arb^.dato.numero = num)then
			buscarV:= TRUE
		else
			if(num <= arb^.dato.numero)then
				buscarV:= buscarV OR buscarV(arb^.HI, num)
			else
				buscarV:= buscarV OR buscarV(arb^.HD, num)
				
end;

procedure buscarSiExiste(arb: arbol);
var
	num: integer;
begin
	writeln('Ingrese un numero de socio para ver si existe ');
	readln(num);
	if(buscarV(arb , num) = true)then
		writeln('Existe')
	else
		writeln('No existe');
end;

function contarSocios(arb: arbol):integer;
begin
	if(arb = nil)then
		contarSocios:= 0
	else
		contarSocios:= 1 + contarSocios(arb^.HI) + contarSocios(arb^.HD);
end;

procedure calcular(arb: arbol ; var cant: integer ; var edad: integer);
begin
	if(arb <> nil)then begin
		cant:= cant + 1;
		edad:= edad + arb^.dato.edad;
		calcular(arb^.HI, cant , edad); {tener en cuenta que un ejercicio es sumarle 1 a tdoas las edades}
		calcular(arb^.HD, cant, edad);
	end;
end;

procedure contarPromedioEdad(arb: arbol);
var
	cant,edad: integer;
begin
	cant:= 0;
	edad:= 0;
	calcular(arb , cant , edad);
	if((cant <> 0) AND (edad <> 0))then
		writeln('Promedio de edades: ' , (edad/cant):2:1)
	else
		writeln('Arbol pelado VIII');
end;
 
function sumarEdades(arb: arbol):integer; 
begin
	if(arb = nil)then
		sumarEdades:= 0
	else
		sumarEdades:= arb^.dato.edad + sumarEdades(arb^.HI) + sumarEdades(arb^.HD);
end;

procedure buscarIX(arb: arbol ; Linferior: integer ; Lsuperior: integer);
begin
	if(arb <> nil)then begin
		if(arb^.dato.numero < Lsuperior)then
			if(arb^.dato.numero > Linferior)then begin
				writeln('Numero de socio entre rangos: ',arb^.dato.numero);
				buscarIX(arb^.HI , Linferior , Lsuperior);
				buscarIX(arb^.HD , Linferior , Lsuperior);
			end
			else
				buscarIX(arb^.HD , Linferior, Lsuperior)
		else
			buscarIX(arb^.HI, Linferior, Lsuperior);
	end;		
end;

procedure informarEntreRangos(arb: arbol);
var
	Lsuperior: integer;
	Linferior: integer;
begin
	writeln('Ingrese un limite inferior');
	readln(Linferior);
	writeln('Ingrese un limite superior');
	readln(Lsuperior);
	buscarIX(arb , Linferior , Lsuperior);
end;

procedure informarCreciente(arb: arbol);
begin
	if(arb <> nil)then begin
		if(arb^.HI = nil)then 
			writeln('Nunero creciente: ' , arb^.dato.numero)
		else begin
			informarCreciente(arb^.HI);
			writeln('Nunero creciente: ' , arb^.dato.numero);
		end;
		informarCreciente(arb^.HD);
	end;
end;

procedure informarDecreciente(arb: arbol);
begin
	if(arb <> nil)then begin
		if(arb^.HD = nil)then 
			writeln('Nunero decreciente: ' , arb^.dato.numero)
		else begin
			informarDecreciente(arb^.HD);
			writeln('Nunero decreciente: ' , arb^.dato.numero)
		end;
		informarDecreciente(arb^.HI);
	end;
end;

var
	arb: arbol;
 begin
	arb:= nil;
	cargarArbol(arb); {a}
	if(arb <> nil)then
		writeln('arbol al principio');
	mostrarArbol(arb); {para mi} 
	buscarSocioMax(arb); { i. Informe el número de socio más grande. Debe invocar a un módulo recursivo que retorne dicho valor.}
	buscarDatosSocioMin(arb); { ii. Informe los datos del socio con el número de socio más chico. Debe invocar a un módulo recursivo que retorne dicho socio.}
	buscarDatosEdadMayor(arb);{iii. Informe el número de socio con mayor edad. Debe invocar a un módulo recursivo que retorne dicho valor.}
	{aumentarEdad(arb);} {iv. Aumente en 1 la edad de todos los socios.}
	if(arb <> nil)then
		writeln('Aumento de edad + 1');
	mostrarArbol(arb);
	buscarSiExiste(arb);{v. Lea un valor entero e informe si existe o no existe un socio con ese valor. Debe invocar a un módulo recursivo que reciba el valor leído y retorne verdadero o falso.}
	writeln('Cantidad de socio: ', contarSocios(arb));{ vii. Informe la cantidad de socios. Debe invocar a un módulo recursivo que retorne dicha cantidad.}
	contarPromedioEdad(arb);{viii. Informe el promedio de edad de los socios. Debe invocar al módulo recursivo del inciso}
	writeln('Suma edades los socios: ' , sumarEdades(arb));{vii e invocar a un módulo recursivo que retorne la suma de las edades de los socios.}
	informarEntreRangos(arb); {IX}
	writeln('');
	informarCreciente(arb);{ x. Informe los números de socio en orden creciente.}
	writeln('');
	informarDecreciente(arb);{ x. Informe los números de socio en orden decreciente.}
 end.
