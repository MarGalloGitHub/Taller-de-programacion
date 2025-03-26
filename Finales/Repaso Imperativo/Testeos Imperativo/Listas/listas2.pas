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

procedure agregarAtras(var L,ult: lista ; p: persona); {x}
var
	nue: lista;
begin
	new(nue);
	nue^.dato:= p;
	nue^.sig:= nil;
	if(L = nil)then   {si la lista esta vacia}
		L:= nue
	else
		ult^.sig:= nue;  {enganche}
	ult:= nue;
end;

procedure crearLista(var L: lista);
var
	p: persona;
	ult: lista;
begin
	leerPersona(p);
	while(p.apeynom <> 'elmati')do begin
		agregarAtras(L,ult,p);  {x} 
		leerPersona(p);
	end;
end;	
	
var
	L: lista;
begin
	L:= nil;
	crearLista(L); {1}
end.
