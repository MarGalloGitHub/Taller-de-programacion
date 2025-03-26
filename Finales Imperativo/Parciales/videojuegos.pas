program parcial;

type
	rangoDIA = 1..30;
	rangoMES = 1..12;
	
	compra= record
		codigo: integer;
		codCLIENTE: integer;
		dia: rangoDIA;
		mes: rangoMES;
	end;

	arbol = ^nodo;
	nodo = record
		dato: compra;
		HI: arbol;
		HD: arbol;
	end;
	
	vectorCOMPRAS = array[rangoMES] of integer;
	
	listaCOMPRAS = ^nodoLISTA;
	nodoLISTA = record
		dato: compra;
		sig: listaCOMPRAS;
	end;
	
procedure leerCOMPRA(var comp: compra);
begin
	writeln('escriba un codigo de cliente');
	readln(comp.codCLIENTE);
	if(comp.codCLIENTE <> 0)then begin
		writeln('escriba un codigo de juego');
		readln(comp.codigo);
		writeln('escriba un dia');
		readln(comp.dia);
		writeln('escriba un mes');
		readln(comp.mes);
	end;
end;
	
procedure crearARBOL(var arb: arbol ; comp: compra);
begin
	if(arb = nil)then begin
		new(arb);
		arb^.dato:= comp;
		arb^.HI:= nil;
		arb^.HD:= nil;
	end
	else
		if(comp.codCLIENTE < arb^.dato.codCLIENTE)then
			crearARBOL(arb^.HI , comp)
		else
			crearARBOL(arb^.HD, comp);
end;	
	
procedure inicializarVECTOR(var VEC: vectorCOMPRAS);
var
	i: rangoMES;
begin
	for i:= 1 to 12 do
		VEC[i]:= 0;
end;	
	
procedure cargarARBOL(var arb: arbol ; var VEC: vectorCOMPRAS);
var
	comp: compra;
begin
	leerCOMPRA(comp);
	while(comp.codCLIENTE <> 0)do begin
		VEC[comp.mes]:= VEC[comp.mes] + 1;
		crearARBOL(arb , comp);
		leerCOMPRA(comp);
	end;
end;

procedure agregarADELANTE(var L: listaCOMPRAS ; elemento: compra);
var
	nue: listaCOMPRAS;
begin
	new(nue);
	nue^.dato:= elemento;
	nue^.sig:= L;
	L:= nue;
end;

procedure retornarCOMPRAS(arb: arbol ; var Lista: listaCOMPRAS ; cliente: integer);
begin
	if(arb^.HI = nil)then
		if(arb^.dato.codCLIENTE = cliente)then
			agregarADELANTE(Lista , arb^.dato)
	else
		retornarCOMPRAS(arb^.HI, Lista , cliente);
end;

procedure ordenarVECTOR(var V: vectorCOMPRAS);
var
	i,j,p: rangoMES;
	item: integer;
begin
	for i:= 1 to 11 do begin
		p:=i;
		for j:= (i + 1) to 12 do 
			if(V[j] > V[p])then
				p:= j;
		item:= V[p];
		V[p]:= V[i];
		V[i]:= item;
	end;
end;

procedure mostrarVECTOR(VEC: vectorCOMPRAS);
var
	i: rangoMES;
begin
	for i:= 1 to 12 do
		writeln(VEC[i]);
end;

var
	arb: arbol;
	VEC: vectorCOMPRAS;
	cliente: integer;
	Lcliente: listaCOMPRAS;
begin
	arb:= nil;
	inicializarVECTOR(VEC);
	cargarARBOL(arb,VEC); {a-i y ii}
	writeln('escriba un codigo de cliente');
	readln(cliente);
	Lcliente:= nil;
	retornarCOMPRAS(arb, Lcliente, cliente); {b}
	ordenarVECTOR(VEC); {c}
	mostrarVECTOR(VEC);
	
end.
