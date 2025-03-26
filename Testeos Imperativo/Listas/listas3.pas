program listas;

type
	persona = record
		DNI: integer;
		apeynom: string;
		edad: integer;
	end;
	
	lista = ^nodo;
	nodo = record
		dato: persona;
		sig: lista;
	end;
	
procedure leerPersona(var p: persona);
begin
	writeln('escriba el nombre de la persona');
	readln(p.apeynom);
	if(p.apeynom <> 'elmati')then begin
		writeln('escriba el dni de la persona');
		readln(p.DNI);
		writeln('escriba la edad de la persona');
		readln(p.edad);
	end;
end;

procedure insertarOrdenado(var L: lista ; p: persona);                      {x}
var
	nue,ant,act: lista;
begin
	new(nue);
	nue^.dato:= p;
	act:= L;   {act y ant al comienzo de la lista}
	ant:= L;
	while(act <> nil) and (L^.dato.edad < p.edad)do begin
		ant:= act;
		act:= act^.sig;
	end;
	if(act = ant)then    {al inicio de la lista vacia}
		L:= nue
	else                 {al medio o al final}
		ant^.sig:= nue;
	nue^.sig:= act;
end;

procedure crearLista(var L: lista);
var
	p: persona;
begin
	leerPersona(p);
	while(p.apeynom <> 'elmati')do begin
		insertarOrdenado(L,p);  {x} 
		leerPersona(p);
	end;
end;	
	
var
	L: lista;
begin
	L:= nil;
	crearLista(L); {1}
end.
