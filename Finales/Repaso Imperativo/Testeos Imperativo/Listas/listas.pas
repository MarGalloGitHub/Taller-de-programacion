{casos extra como elementos repetidos en lista desordenada:
* 	
* Procedure EliminarRepDesord (var L:lista ; n: integer); {sin casos repetidos}
 var 
     anterior,actual:lista; 
 begin 
     actual:=L;  
     while ((actual <> nil) AND (actual^.dato.num <> valor)) do begin 
             anterior:=actual; 
             actual:=actual^.sig 
     end;
     if(actual <> nil)then begin
	if(actual = L)then 
	   L:= L^.sig;
	end
	else 
	   ant^.sig:= actual^.sig;
	dispose(actual);
	end;
 end; 

ahora con lista ordenada

* Procedure EliminarRepAsc (var pri:lista ; n: integer); 
 var 
     anterior,actual:lista; 
 begin 
     actual:=pri; 
     anterior:=nil; 
     while (actual <> nil) and (actual^.num < n) do begin 
         anterior := actual; 
         actual := actual^.sig; 
     end; 
     while (actual <> nil) and (actual^.num = n) do begin 
         if (actual = pri) then 
             pri := actual^.sig 
         else 
             anterior^.sig := actual^.sig; 
         dispose(actual); 
         actual := anterior^.sig; 
     end; 
 end;
}


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

procedure agregarAdelante(var L: lista ; p: persona); {x}
var
	nue: lista;
begin
	new(nue);
	nue^.dato:= p;
	nue^.sig:= L;
	L:= nue;
end;

procedure crearLista(var L: lista);
var
	p: persona;
begin
	leerPersona(p);
	while(p.apeynom <> 'elmati')do begin
		agregarAdelante(L,p);  {x} 
		leerPersona(p);
	end;
end;	

function buscar(L: lista; nom: string): boolean;
var
	ok: boolean;
begin
	ok:= FALSE;
	while(L <> nil) AND (L^.dato.apeynom <> nom) do
		L:= L^.sig;
	if(L^.dato.apeynom = nom)then
		ok:= TRUE;
	buscar:= ok;
end;

procedure leerNODO(p: persona);
begin
	writeln('el nombre de la persona es :','', p.apeynom);
	writeln('el dni de la persona es :','', p.DNI);
	writeln('la edad de la persona es :','', p.edad);
end;

procedure recorrerLista(L: lista);
begin
	while(L <> nil) do begin
		leerNODO(L^.dato);
		L:= L^.sig;
	end;
end;	
	
procedure eliminar(var L: lista ; edad: integer);   { un solo elemento y existe}
var
	act,ant: lista;
begin
	act:= L;
	ant:= nil;
	while(act <> nil) AND (act^.dato.edad <> edad) do begin
		ant:= act;
		act:= act^.sig;
	end;
	if(act <> nil)then {AND (actual^.num=n) then} { si el elemento no esta}
		if(act = L)then
			L:= act^.sig
		else
			ant^.sig:= act^.sig;
	dispose(act);	
end;	
	
	
var
	L: lista;
	nom: string;
	edad: integer;
begin
	L:= nil;
	crearLista(L); {1}
	recorrerLista(L);  {2}
	writeln('escriba un nombre a buscar');
	readln(nom);
	if(buscar(L,nom)) then
		writeln('la persona: ',' ', nom,'  ', 'esta en la lista')
	else
		writeln('la persona: ',' ', nom,'  ', 'no esta en la lista');
	writeln('ingrese edad para eliminar personas de la lista con ese valor');
	readln(edad);
	eliminar(L,edad); {3}
	recorrerLista(L);
end.
