program ultimoDOS;

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
	writeln('escriba una cantidad de productos');
	readln(comp.cantidadPRODUCTOS);
	if(comp.cantidadPRODUCTOS <> 0)then begin
		writeln('escriba un codigo de cliente');
		readln(comp.codCLIENTE);
		writeln('escriba un dia');
		readln(comp.dia);
		writeln('escriba un monto');
		readln(comp.monto);
	end;
end;	

procedure armarCOMPRASIN(comp: compra ; var compSIN: compraSIN);
begin
	compSIN.dia:= comp.dia;
	compSIN.monto:= comp.monto;
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
		elemento.codCLIENTE:= comp.codCLIENTE;
		elemento.lista:= nil;
		armarCOMPRASIN(comp,compSIN);
		agregarADELANTE(elemento.lista , compSIN);
		arb^.dato:= elemento;
		arb^.HI:= nil;
		arb^.HD:= nil;
	end
	else
		if(comp.codCLIENTE = arb^.dato.codCLIENTE)then begin
			armarCOMPRASIN(comp,compSIN);
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
		armarARBOL(arb, comp);
		leerCOMPRA(comp);
	end;
end;	
	
procedure retornarCOMPRAS(arb: arbol; var ListaB: listaCOMPRAS ; codigo: integer);
begin
	if(arb = nil)then
		ListaB:= nil
	else
		if(arb^.dato.codCLIENTE = codigo)then
			ListaB:= arb^.dato.lista
		else
			if(codigo < arb^.dato.codCLIENTE)then
				retornarCOMPRAS(arb^.HI , ListaB , codigo)
			else
				retornarCOMPRAS(arb^.HD , listaB , codigo);
end;	
	
procedure buscarMONTOdeMAXcantidad(L: listaCOMPRAS ; var cantMAX: integer ; var montoMAX: real);
begin
	if(L <> nil)then begin
		if(L^.dato.cantidadPRODUCTOS > cantMAX)then begin
			cantMAX:= L^.dato.cantidadPRODUCTOS;
			montoMAX:= L^.dato.monto;
		end;
		buscarMONTOdeMAXcantidad(L^.sig, cantMAX, montoMAX);
	end;
end;


var
	arb: arbol;
	codigo: integer;
	ListaB: listaCOMPRAS;
	cantMAX: integer;
	montoMAX: real;
begin
	arb:= nil;
	cargarARBOL(arb); {a}
	writeln('escriba un codigo para el inciso b');
	readln(codigo);
	ListaB:= nil;
	retornarCOMPRAS(arb , ListaB,codigo); {b}
	cantMAX:= -1;
	buscarMONTOdeMAXcantidad(ListaB , cantMAX , montoMAX);
	writeln('el monto fue de :', ' ' , montoMAX:2:1); {c}
end.
