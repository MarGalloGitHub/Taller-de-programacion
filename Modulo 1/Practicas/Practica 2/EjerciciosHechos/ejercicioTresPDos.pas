{Escribir un programa que:
a. Implemente un módulo recursivo que genere una lista de números enteros “random”
mayores a 0 y menores a 100. Finalizar con el número 0.
b. Implemente un módulo recursivo que devuelva el mínimo valor de la lista.
c. Implemente un módulo recursivo que devuelva el máximo valor de la lista.
d. Implemente un módulo recursivo que devuelva verdadero si un valor determinado se
encuentra en la lista o falso en caso contrario.}

program ejercicioTres;

type
	ListaNum = ^nodo;
	nodo = record
		dato: integer;
		sig: ListaNum;
	end;
	
procedure leerNumeros(var num: integer);
begin
	Randomize;
	num:= Random(15);
	writeln(num);
end;
	
procedure agregarAtras(var Ln,ult : ListaNum ; num: integer);
var
	nue: ListaNum;
begin
	new(nue);
	nue^.dato:= num;
	nue^.sig:= nil;
	if(Ln = nil)then
		Ln:= nue
	else
		ult^.sig:= nue;
	ult:= nue;
end;	
	
procedure generarLista(var LN: ListaNum);			{preguntar si esta bien}
var
	ult: ListaNum;
	num: integer;
begin
	leerNumeros(num);
	if(num <> 0)then begin
		agregarAtras(LN,ult,num);
		leerNumeros(num);
		generarLista(Ln^.sig);
	end;
end;

procedure recorrerLista(LN: ListaNum);				{esto  es para mi}
begin
	while(LN <> nil) do begin
		writeln('el numero es :  ',LN^.dato);
		Ln:= Ln^.sig;
	end;
end;

function chequearMin(d: integer ; Min: integer): boolean;
begin
	if(d < Min)then
		chequearMin:= true
	else
		chequearMin:= false;
end;

function chequearMax(d: integer ; Max: integer): boolean;
begin
	if(d > Max)then
		chequearMax:= true
	else
		chequearMax:= false;
end;


procedure buscarMin(Ln: ListaNum ; var Min: integer);			{busqueda recursiva}
begin
	if(Ln <> nil)then begin
		if(chequearMin(Ln^.dato, Min)) then
			Min:= Ln^.dato;
		Ln:= Ln^.sig;
		buscarMin(Ln, Min);
	end;
end;

procedure buscarMax(Ln: ListaNum ; var Max: integer);			
begin
	if(Ln <> nil)then begin
		if(chequearMax(Ln^.dato, Max)) then
			Max:= Ln^.dato;
		Ln:= Ln^.sig;
		buscarMax(Ln, Max);
	end;
end;

function busqueda(LN : ListaNum ; num : integer): boolean;
var
	LAVERDAD: boolean;
begin
	if(LN <> nil) then begin
		if(LN^.dato = num)then
			LAVERDAD:= true
		else begin
			LN:= LN^.sig;
			busqueda(LN,num);	
		end;
	end;
	busqueda:= LAVERDAD;
end;

procedure busquedaPeroProceso(LN : ListaNum ; num : integer; var laboon: boolean);
begin
	if(LN <> nil) then begin
		if(LN^.dato = num)then
			laboon:= true
		else begin
			LN:= LN^.sig;
			busquedaPeroProceso(LN,num,laboon);	
		end;
	end;
end;


var
	LN: ListaNum;
	Min,Max,num: integer;
	laboon: boolean;
begin
	laboon:= false;
	Min:= 999;
	Max:= -1;
	LN:= nil;
	generarLista(LN);	{a}
	recorrerLista(LN);	{mio para ver nomas}
	buscarMin(LN,Min);	{b}
	writeln('el valor minimo fue: ', Min); {para mi} {si dice devolver no hace falta imprimirlo, por lo tanto estaria mal usar una funcion?}
	buscarMax(LN,Max); {c}
	writeln('el valor maximo fue: ', Max); {ejecuta varias veces}
	writeln('ingrese un valor para ver si esta en la lista');
	readln(num);
	busquedaPeroProceso(LN,num,laboon);			{d}		{preguntar}
	writeln(laboon);
	writeln('es', busqueda(LN,num) , ' ', 'que el valor estaba en la lista'); {d}
end.
