program HOSPITAL;
const
	dF = 15;
type
	rangoDIA = 1..30;
	rangoCOD = 1..dF;
	
	consulta = record
		matricula: string;
		DNI: integer;
		dia: rangoDIA;
		codDIAGNOSTICO: rangoCOD;
	end;
	
	consultaSIN = record
		DNI: integer;
		dia: rangoDIA;
		codDIAGNOSTICO: rangoCOD;
	end;
	
	listaCONSULTAS = ^nodoLISTA;
	nodoLISTA = record
		dato: consultaSIN;
		sig: listaCONSULTAS;
	end;
	
	elementoARBOL = record
		matricula: string;
		lista: listaCONSULTAS;
	end;
	
	arbol = ^nodo;
	nodo = record
		dato: elementoARBOL;
		HI: arbol;
		HD: arbol;
	end;
	
	vectorDIAGNOSTICOS = array[rangoCOD] of integer;
	
procedure leerCONSULTA(var cons: consulta);
begin
	writeln('escriba un dni ');
	readln(cons.DNI);
	if(cons.DNI <> 439)then begin
		writeln('escriba una matricula ');
		readln(cons.matricula);
		writeln('escriba un dia ');
		readln(cons.dia);
		writeln('escriba un codigo de diagnostico ');
		readln(cons.codDIAGNOSTICO);
	end;
		
end;	

procedure armarCONSUL(var consSIN: consultaSIN ; cons: consulta);
begin
	consSIN.dia:= cons.dia;
	consSIN.DNI:= cons.DNI;
	consSIN.codDIAGNOSTICO:= cons.codDIAGNOSTICO;
end;

procedure agregarADELANTE(var L: listaCONSULTAS ; consSIN: consultaSIN);
var
	nue: listaCONSULTAS;
begin
	new(nue);
	nue^.dato:= consSIN;
	nue^.sig:= L;
	L:= nue;
end;

procedure armarARBOL(var arb: arbol ; cons: consulta);
var	
	elemento: elementoARBOL;
	consSIN: consultaSIN;
begin
	if(arb = nil)then begin
		new(arb);
		elemento.matricula:= cons.matricula;
		armarCONSUL(consSIN , cons);
		elemento.lista:= nil;
		agregarADELANTE(elemento.lista , consSIN);
		arb^.dato:= elemento;
		arb^.HI:= nil;
		arb^.HD:= nil;
	end
	else
		if(cons.matricula = arb^.dato.matricula)then begin
			armarCONSUL(consSIN,cons);
			agregarADELANTE(arb^.dato.lista , consSIN);
		end
		else
			if(cons.matricula < arb^.dato.matricula)then
				armarARBOL(arb^.HI , cons)
			else
				armarARBOL(arb^.HD,cons);
end;
	
procedure cargarARBOL(var arb: arbol);
var
	cons: consulta;
begin
	leerCONSULTA(cons);
	while(cons.DNI <> 439)do begin
		armarARBOL(arb , cons);
		leerCONSULTA(cons);
	end;
end;

procedure inicializarVECTOR(var VEC: vectorDIAGNOSTICOS);
var
	i: rangoCOD;
begin
	for i:= 1 to dF do 
		VEC[i]:= 0;
end;

procedure recorrerLISTA(L: listaCONSULTAS ; var VEC: vectorDIAGNOSTICOS);
begin
	while(L <> nil)do begin
		VEC[L^.dato.codDIAGNOSTICO]:= VEC[L^.dato.codDIAGNOSTICO]+ 1;
		L:= L^.sig;
	end;
end;
	
procedure retornarINFORMACION (arb: arbol ; matricula : string ; var VEC: vectorDIAGNOSTICOS);
begin
	if(arb = nil)then
		writeln('arbol vacio')
	else
		if(arb^.dato.matricula = matricula)then 
			recorrerLISTA(arb^.dato.lista , VEC)
		else
			if(matricula < arb^.dato.matricula)then
				retornarINFORMACION(arb^.HI , matricula , VEC)
			else
				retornarINFORMACION(arb^.HD , matricula , VEC);
end;	
	
procedure imprimirVECTOR(VEC: vectorDIAGNOSTICOS);
var
	i: rangoCOD;
begin
	for i:= 1 to dF do 
		writeln(VEC[i]);
end;
	
procedure ordenarVECTOR(var VEC: vectorDIAGNOSTICOS);
var
	i,j,p: rangoCOD;
	item: integer;
begin
	for i:= 1 to (dF-1) do begin
		p:= i;
		for j:= (i + 1) to dF do 
			if(VEC[j] > VEC[p])then
				p:= j;
		item:= VEC[p];
		VEC[p]:= VEC[i];
		VEC[i]:= item;
	end;
end;	
	
var
	arb: arbol;
	matricula: string;
	VEC: vectorDIAGNOSTICOS;
begin
	arb:= nil;
	cargarARBOL(arb); {a}
	inicializarVECTOR(VEC);
	writeln('escriba una matricula');
	readln(matricula); {b}
	retornarINFORMACION(arb , matricula , VEC);
	imprimirVECTOR(VEC); {para mi}
	ordenarVECTOR(VEC);  {c}
	writeln('el vector ordenado es'); {para mi}
	imprimirVECTOR(VEC); {para mi}
end.
