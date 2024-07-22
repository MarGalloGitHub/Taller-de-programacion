program TURNOcVEINTEveintiTRES;
type
	rangoMES = 1..12;
	
	compra = record
		codigo: integer;
		numMES: rangoMES;
		monto: real;
	end;
	
	vector = array[rangoMES] of real;

	elementoARBOL = record
		codigoCLIENTE: integer;
		vectorMESES: vector;
	end;

	arbol = ^nodo;
	nodo = record
		dato: elementoARBOL;
		HI: arbol;
		HD: arbol;
	end;
	
procedure leerCOMPRA(var comp: compra); {1}
begin
	writeln('escriba un codigo');
	readln(comp.codigo);
	if(comp.codigo <> 0 ) then begin
		writeln('escriba un monto');
		readln(comp.monto);
		writeln('escriba un mes');
		readln(comp.numMES);
	end;
end;	

procedure inicializarVECTOR(var vector: vector); {1}
var
	i: rangoMES;
begin
	for i:= 1 to 12 do 
		vector[i]:= 0;
end;

procedure cargarVECTOR(var V: vector ; comp: compra); {1}
begin
	V[comp.numMES]:= V[comp.numMES] + comp.monto;
end;

procedure armarARBOL(var arb: arbol ; comp: compra); {1}
var
	elemento: elementoARBOL;
begin
	if(arb = nil)then begin
		new(arb);
		elemento.codigoCLIENTE:= comp.codigo;
		inicializarVECTOR(elemento.vectorMESES);
		cargarVECTOR(elemento.vectorMESES , comp);
		arb^.dato := elemento;
		arb^.HI:= nil;
		arb^.HD:= nil;
	end
	else
		if(comp.codigo = arb^.dato.codigoCLIENTE)then
			cargarVECTOR(elemento.vectorMESES , comp)
		else
			if(comp.codigo < arb^.dato.codigoCLIENTE)then
				armarARBOL(arb^.HI, comp)
			else
				armarARBOL(arb^.HD , comp);
		
end;


procedure cargarARBOL(var arb: arbol); {1}
var
	comp: compra;
begin
	leerCOMPRA(comp);
	while(comp.codigo <> 0)do begin
		armarARBOL(arb,comp);
		leerCOMPRA(comp);
	end;
end;	

function buscarENvector(vector2: vector): integer;
var
	i: rangoMES;
	montoMAXIMO: real;
	mesMAX: integer;
begin
	montoMAXIMO:= -1;
	for i:= 1 TO 12 do 
		if(vector2[i] > montoMAXIMO)then begin
			montoMAXIMO:= vector2[i];
			mesMAX:= i;
		end;	
	buscarENvector:= mesMAX;
	
end;
	
function buscarMESmaximoDELcliente(arb: arbol ; cliente: integer): integer;
begin
	if(arb = nil)then begin
		buscarMESmaximoDELcliente:= 0;
		writeln('no existe ese cliente, por lo tanto no posee un mes con maximo gasto');
	end
	else
		if(arb^.dato.codigoCLIENTE = cliente)then
			buscarMESmaximoDELcliente:= buscarENvector(arb^.dato.vectorMESES)
		else
			if(cliente < arb^.dato.codigoCLIENTE)then
				buscarMESmaximoDELcliente(arb^.HI, cliente)
			else
				buscarMESmaximoDELcliente(arb^.HD,cliente);
end;	
	
function buscarENvectorNOgastos(vec: vector ; mes: rangoMES): integer;
begin
	if(vec[mes]= 0)then
		buscarENvectorNOgastos:= 1
	else
		buscarENvectorNOgastos:= 0;
end;	
	
function buscarCLIENTESqueNOgastaron(arb: arbol ; mes: rangoMES): integer;
begin
	if(arb = nil)then
		buscarCLIENTESqueNOgastaron:= 0
	else
		buscarCLIENTESqueNOgastaron:= buscarENvectorNOgastos(arb^.dato.vectorMESES , mes) + buscarCLIENTESqueNOgastaron(arb^.HI,mes) + buscarCLIENTESqueNOgastaron(arb^.HD,mes);
end;
	
var
	arb : arbol;
	mesMAXIMO,cliente,clientesSINgasto: integer;
	mes: rangoMES;
begin
	arb:= nil;
	cargarARBOL(arb); {1}
	writeln('escriba un cliente para buscar su maximo mes a buscar en arbol');
	readln(cliente);
	mesMAXIMO:= buscarMESmaximoDELcliente(arb , cliente);
	writeln('el mes con mas gastos del cliente fue: ', mesMAXIMO); {2}
	writeln('escriba un mes');
	readln(mes);
	clientesSINgasto:= buscarCLIENTESqueNOgastaron(arb , mes); {3}
	writeln('la cantidad de clientes que no gastaron en ese mes fue de: ', clientesSINgasto);
end.
