program ejercicioCOMERCIO;

type
	rangoDIA = 1..31;

	compra = record
		codCLIENTE: integer;
		dia: rangoDIA;
		cantidadPRODUCTOS: integer;
		monto: real;
	end;
	
	compraSIN = record
		dia: rangoDIA;
		cantidadPRODUCTOS: integer;
		monto: real;
	end;
		
	
	listaCOMPRAS = ^nodoLISTA;
	nodoLISTA = record
		dato: compraSIN;
		sig: listaCOMPRAS;
	end;
	
	elementoARBOL = record
		codCLIENTE: integer;
		lista: listaCOMPRAS;
	end;
	
	arbol = ^nodo;
	nodo = record
		dato: elementoARBOL;
		HI: arbol;
		HD: arbol;
	end;
	
procedure leerCOMPRA(var comp: compra);
begin
	writeln('leer una cantidad');
	readln(comp.cantidadPRODUCTOS);
	if(comp.cantidadPRODUCTOS <> 0)then begin
		writeln('leer un dia');
		readln(comp.dia);
		writeln('leer un codigo de cliente');
		readln(comp.codCLIENTE);
		writeln('leer un monto');
		readln(comp.monto);
	end;
end;

procedure armarCOMPRASIN(var compSIN: compraSIN ; comp: compra);
begin
	compSIN.monto:= comp.monto;
	compSIN.dia:= comp.dia;
	compSIN.cantidadPRODUCTOS:= comp.cantidadPRODUCTOS;
end;

procedure agregarADELANTE(var L: listaCOMPRAS ; compSIN: compraSIN);
var
	nue: listaCOMPRAS;
begin
	new(nue);
	nue^.dato:= compSIN;
	nue^.sig:= L;
	L:= nue;
end;

procedure armarARBOL(var arb: arbol ; comp: compra);
var
	elemento: elementoARBOL;
	compSIN: compraSIN;
begin
	if(arb = nil)then begin
		new(arb);
		armarCOMPRASIN(compSIN , comp);
		elemento.codCLIENTE:= comp.codCLIENTE;
		elemento.lista:= nil;
		agregarADELANTE(elemento.lista , compSIN);
		arb^.dato:= elemento;
		arb^.HI:= nil;
		arb^.HD:= nil;
	end
	else
		if(arb^.dato.codCLIENTE = comp.codCLIENTE)then begin
			armarCOMPRASIN(compSIN,comp);
			agregarADELANTE(arb^.dato.lista , compSIN);
		end
		else
			if(comp.codCLIENTE < arb^.dato.codCLIENTE)then
				armarARBOL(arb^.HI , comp)
			else
				armarARBOL(arb^.HD, comp);
end;

procedure cargarARBOL(var arb: arbol);	
var
	comp: compra;
begin
	leerCOMPRA(comp);
	while(comp.cantidadPRODUCTOS <> 0)do begin
		armarARBOL(arb , comp);
		leerCOMPRA(comp);
	end;
end;
	
procedure retornarCOMPRAS(arb: arbol ; codigo: integer ; var listaB: listaCOMPRAS);
begin
	if(arb = nil)then
		listaB:= nil
	else
		if(arb^.dato.codCLIENTE = codigo)then
			listaB:= arb^.dato.lista
		else
			if(codigo < arb^.dato.codCLIENTE)then	
				retornarCOMPRAS(arb^.HI,codigo,listaB)
			else
				retornarCOMPRAS(arb^.HD,codigo,listaB);
end;	
	
procedure retornarMONTO(L: listaCOMPRAS ; var cantMAX: integer ; var montoMAX: real);
begin
	if(L <> nil)then
		begin
			if(L^.dato.cantidadPRODUCTOS > cantMAX)then begin
				cantMAX:= L^.dato.cantidadPRODUCTOS;
				montoMAX:= L^.dato.monto;
			end;
			retornarMONTO(L^.sig , cantMAX, montoMAX);
		end;
end;	
	
var
	arb: arbol;
	codigo,cantMAX: integer;
	listaB: listaCOMPRAS;
	montoMAX: real;
begin
	cantMAX:= -1;
	arb:= nil;
	cargarARBOL(arb); {a}
	writeln('escriba un codigo para hacer el inciso b');
	readln(codigo);
	listaB:= nil;
	retornarCOMPRAS(arb, codigo , listaB); {b}
	retornarMONTO(listaB , cantMAX , montoMAX);
	writeln('el monto es: ' , montoMAX:2:1); {c}
end.
