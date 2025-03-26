program finalJulio;

type
	rangoSector = 1..50;
	rangoImportancia = 1..5;
	
	llamada = record
		sector:rangoSector;
		importancia:rangoImportancia;
		afectados:integer;
	end;
	
	llamadaMini = record
		sector:rangoSector;
		afectados:integer;
	end;
	
	lista = ^nodo;
	nodo = record
		dato:llamadaMini;
		sig:lista;
	end;
	
	arbol = ^nodo2;
	nodo2 = record
		dato:llamadaMini;
		HI:arbol;
		HD:arbol;
	end;
	
	vector = Array[rangoImportancia] of lista;
	
procedure insertarOrdenado(var L:lista ; llMini:llamadaMini);
var
	act:lista;
	ant:lista;
	nue:lista;
begin
	new(nue);
	nue^.dato:=llmini;
	act:=L;
	ant:=L;
	while((act <> nil) AND (act^.dato.sector <= llMini.sector)) do begin
		ant:= act;
		act:=act^.sig;
	end;
	if(act = ant)then
		L:=nue
	else
		ant^.sig:=nue;
	nue^.sig:=act;
end;
	
procedure agregar(var vec: vector ; ll: llamada);
var
	llMini: llamadaMini;
begin
	llMini.sector:= ll.sector;
	llMini.afectados:=ll.afectados;
	insertarOrdenado(vec[ll.importancia],llMini);
end;	
	
procedure cargarVector(var vec:vector);
var
	i:integer;
	ll:llamada;
begin
	Randomize();
	for i:= 1 to 20 do begin
		ll.sector:= Random(50) + 1;
		ll.importancia:= Random(5) + 1;
		ll.afectados:= Random(10) + 1;
		agregar(vec,ll);
	end;
end;	

procedure mostrarLlamadaMini(llMini:llamadaMini);
begin
	writeln('Sector de la llamada:  ',llMini.sector);
	writeln('Afectados:  ', llMini.afectados);
end;

procedure mostrarLista(L:lista);
begin
	while(L <> nil)do begin
		mostrarLlamadaMini(L^.dato);
		L:=L^.sig;
	end;
end;	

procedure mostrarVector(vec:vector);
var
	i:rangoImportancia;
begin
	for i:=1 to 5 do begin
		writeln('Importancia de nivel: ', i);
		mostrarLista(vec[i]);
		writeln('');
	end;
end;

procedure crearArbol(var a:arbol; llMini:llamadaMini);
begin
	if(a = nil)then begin
		new(a);
		a^.dato:=llMini;
		a^.HI:=nil;
		a^.HD:=nil;
	end
	else
		if(llMini.afectados < a^.dato.afectados)then
			crearArbol(a^.HI,llMini)
		else
			crearArbol(a^.HD,llMini);
end;

procedure armarArbol(vec:vector;var a:arbol; importancia:rangoImportancia);
begin
	while(vec[importancia] <> nil)do begin
		crearArbol(a,vec[importancia]^.dato);
		vec[importancia]:=vec[importancia]^.sig;
	end;
end;

procedure mostrarArbol(a:arbol);
begin
	if(a <> nil)then begin
		mostrarArbol(a^.HI);
		mostrarLlamadaMini(a^.dato);
		mostrarArbol(a^.HD);
	end;
end;

function buscarSectorMasComplicado(a:arbol):rangoSector;
begin
	if(a = nil)then
		buscarSectorMasComplicado:= 1
	else
		if(a^.HD = nil)then
			buscarSectorMasComplicado:= a^.dato.sector
		else
			buscarSectorMasComplicado:= buscarSectorMasComplicado(a^.HD);
end;

var
	vec:vector;
	importancia:rangoImportancia;
	a:arbol;
	num:rangoSector;
begin
	writeln('Inciso A');
	cargarVector(vec);  												//Inciso A
	mostrarVector(vec);													// para mi
	writeln('');
	writeln('Inciso B');
	writeln('');
	writeln('Ingrese un nivel de importancia, 1-5');
	readln(importancia);
	a:=nil;
	armarArbol(vec,a,importancia);										//Incisio B
	writeln('Arbol');
	writeln('');
	mostrarArbol(a);													//para mi
	num:=buscarSectorMasComplicado(a);									//Inciso C
	writeln('El sector mas complicado era el: ',num);																	
end.
