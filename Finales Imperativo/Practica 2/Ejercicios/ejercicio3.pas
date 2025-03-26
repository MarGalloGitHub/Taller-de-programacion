{3.- Escribir un programa que:
a. Implemente un módulo recursivo que genere una lista de números enteros “random”                                 preguntar
mayores a 0 y menores a 100. Finalizar con el número 0.
b. Implemente un módulo recursivo que devuelva el mínimo valor de la lista.
c. Implemente un módulo recursivo que devuelva el máximo valor de la lista.
d. Implemente un módulo recursivo que devuelva verdadero si un valor determinado se
encuentra en la lista o falso en caso contrario.}

program ejercicioTrres;

type
	lista = ^nodo;
	nodo = record
		dato: integer;
		sig: lista;
	end;

procedure agregarAtras(var L,ult: lista ; num: integer);
var
	nue: lista;
begin
	new(nue);
	nue^.dato:= num;
	nue^.sig:= nil;
	if(L= nil)then
		L:= nue
	else
		ult^.sig:= nue;
end;

procedure cargarLista(var L: lista);
var
	num: integer;
	ult: lista;
begin
	writeln('escriba un numero');  {preguntar}
	readln(num);
	if(num <> 0)then begin
		agregarAtras(L,ult,num);
		cargarLista(L);
	end;
end;	

function cumple(num,min: integer): boolean;
begin
	if(num < min)then begin
		min:= num;
		cumple:= TRUE;
	end
	else
		cumple:= FALSE;
end;

function buscarMinimo(L: lista ; min: integer): integer;
begin
	if(L = nil) then
		buscarMinimo:= 0
	else
		if(cumple(L^.dato,min))then
			buscarMinimo:= L^.dato
		else
			buscarMinimo:= buscarMinimo(L^.sig,min);
end;	

function cumpleMax(num,max: integer): boolean;
begin
	if(num > max)then begin
		max:= num;
		cumpleMax:= TRUE;
	end
	else
		cumpleMax:= FALSE;
end;


function buscarMaximo(L: lista ; max: integer): integer;
begin
	if(L = nil) then
		buscarMaximo:= 0
	else
		if(cumpleMax(L^.dato,max))then
			buscarMaximo:= L^.dato
		else
			buscarMaximo:= buscarMaximo(L^.sig,max);
end;	
	
function busquedaRecur(L: lista ; numB: integer): boolean;
begin
	if(L <> nil) then 
		if(L^.dato = numB)then
			busquedaRecur:= TRUE
		else
			busquedaRecur(L^.sig,numB)
	else
		busquedaRecur:= FALSE;
end;	
	
var
	L: lista;
	min,max,Minimo,Maximo,numB: integer;
begin
	Minimo:= 0;
	Maximo:= 0;
	min:= 999;
	max:= -1;
	L:= nil;
	cargarLista(L); {a}
	Minimo:= buscarMinimo(L,min); {b}
	writeln('el valor mininom de la lista fue:','   ',Minimo);
	Maximo:= buscarMaximo(L,max); {c}
	writeln('el valor mininom de la lista fue:','   ',maximo);
	writeln('escriba un numero para buscar');
	readln(numB);
	if(busquedaRecur(L,numB))then {d}
		writeln('el elemento esta en la lista')
	else
		writeln('no esta');
end.
