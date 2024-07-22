{extras: 
* Recorrido en orden completo    
* 
* procedure imprimirCompleto(a: arbol);    
begin
	if(a <> nil)then begin
		imprimirCompleto(a^.HI);
		writeln('la persona en esta parte del arbol es: ','   ', a^.dato.apeynom);  x
		imprimirCompleto(a^.HD);
	end;
end;

* Recorrido en post orden completo
* procedure imprimirCompletoPostOrden(a: arbol);    
begin
	if(a <> nil)then begin
		imprimirCompleto(a^.HI);
		imprimirCompleto(a^.HD); 
		writeln('la persona en esta parte del arbol es: ','   ', a^.dato.apeynom); x
	end;
end;

* Recorrido pre orden completo
* 
* 
* procedure imprimirCompletoPreOrden(a: arbol);    
begin
	if(a <> nil)then begin
	* 	writeln('la persona en esta parte del arbol es: ','   ', a^.dato.apeynom); x
		imprimirCompleto(a^.HI);
		imprimirCompleto(a^.HD); 
	end;
end;
* 
* 
* 
* 
* busqueda que devuelve un nodo (tengo que poner en variables del PP min:= arbol);
* min:= minimoNodo(a);
* if(min <> nil) then
* 	writeln(min^.dato); si tengo un registro pues un proceso leer;
* 
* en la funcion
* function minimoNodo(a: arbol): arbol;
* begin
* 	if(a = nil)then
* 		minimoNodo:= nil;
* 	else
* 		if(a^.HI = nil)then
* 			minimoNodo:= a
* 		else
* 			minimoNodo:= minimoNodo(a^.HI);
*end;
* 
* para maximo cambiar HI por HD;
}
program arboles;
type
	persona = record
		apeynom: string;
		edad: integer;
		DNI: integer;
	end;
	
	arbol = ^nodo;
	nodo = record
		dato: persona;
		HI: arbol;
		HD: arbol;
	end;
	
	
procedure leerPersona(var p: persona);  {1.2}
begin
	writeln('escriba el DNI de la persona');
	readln(p.DNI);
	if(p.DNI <> 439)then begin
		writeln('escriba el nombre de la persona');
		readln(p.apeynom);
		writeln('escriba la edad de la persona');
		readln(p.edad);
	end;
end;	
	
procedure armarArbol(var a: arbol ; p: persona);  {ordenado por edad}  {1.3}
begin
	if(a <> nil)then begin
		a^.dato:= p;
		a^.HI:= nil;
		a^.HD:= nil;
	end
	else
		if(p.edad < a^.dato.edad)then
			armarArbol(a^.HI,p)
		else
			armarArbol(a^.HD,p);
end;	
	
procedure crear(var a: arbol); {1.1}
var
	p: persona;
begin
	leerPersona(p);
	while(p.DNI <> 439) do begin
		armarArbol(a,p);                {x}
		leerPersona(p); 
	end;
end;

procedure imprimirCompleto(a: arbol);    {imprimir en orden}  {2}
begin
	if(a <> nil)then begin
		imprimirCompleto(a^.HI);
		writeln('la persona en esta parte del arbol es: ','   ', a^.dato.apeynom);
		imprimirCompleto(a^.HD);
	end;
end;

function busquedaOrden(a: arbol ; edad: integer): boolean;  {PREGUNTAR}
begin
	if(a = nil) then 
		busquedaOrden:= FALSE
	else 
		if(edad = a^.dato.edad)then 
			busquedaOrden:= TRUE
		ELSE
			if(edad < a^.dato.edad)then
				busquedaOrden(a^.HI,edad)
			else
				busquedaOrden(a^.HD,edad);	
end;

function buscarMinimo(a: arbol): integer;   {x}    {preguntar por arbol vacio}
begin
	if(a^.HI = nil) then                                    {antes un if(a = nil)then buscarMinimo := 0}
		buscarMinimo:= a^.dato.edad
	else
		buscarMinimo:= buscarMinimo(a^.HI);
end;

function buscarMaximo(a: arbol): integer;   {x}
begin
	if(a^.HD = nil) then
		buscarMaximo:= a^.dato.edad
	else
		buscarMaximo:= buscarMinimo(a^.HD);
end;

procedure recorridoAcotado(a: arbol ; Linf,Lsup: integer);
begin
	if(a <> nil)then
		if(a^.dato.edad >= Linf)then
			if(a^.dato.edad <= Lsup) then begin
				writeln(a^.dato.edad,'es una edad en rango en el arbol');
				recorridoAcotado(a^.HI,Linf,Lsup);
				recorridoAcotado(a^.HD,Linf,Lsup);
			end
			else
				recorridoAcotado(a^.HI,Linf,Lsup)
		else
			recorridoAcotado(a^.HD,Linf,Lsup);
end;

var
	a: arbol;
	edad: integer;
	min,max,Linf,Lsup: integer;
begin
	a:= nil;
	crear(a);     {1}
	imprimirCompleto(a);  {2}
	writeln('escriba la edad de la persona que desea buscar');
	readln(edad);
	if(busquedaOrden(a,edad))then            {3}  {usando el orden del arbol}
		writeln('la persona con la edad: ','',edad, ' esta en el arbol')
	else
		writeln('la persona con la edad: ','',edad, ' no esta en el arbol');
	min:= buscarMinimo(a); {estas 2 son para devolver el valor y ademas aprovechan el orden del arbol}
	max:= buscarMaximo(a);
	writeln('la edad mainima en el arbol es : ','', min);  
	writeln('la edad maxima en el arbol es : ','', max);
	writeln('escriba el limite inferior de busqueda');
	readln(Linf);
	writeln('escriba el limite superior de busqueda');
	read(Lsup);
	recorridoAcotado(a,Linf,Lsup);	
end.
