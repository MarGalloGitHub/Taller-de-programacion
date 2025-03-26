{Un supermercado requiere el procesamiento de sus productos. De cada producto se
conoce código, rubro (1..10), stock y precio unitario. Se pide:
* a) Generar una estructura adecuada que permita agrupar los productos por rubro. A su
vez, para cada rubro, se requiere que la búsqueda de un producto por código sea lo
más eficiente posible. La lectura finaliza con el código de producto igual a -1.
b) Implementar un módulo que reciba la estructura generada en a), un rubro y un código
de producto y retorne si dicho código existe o no para ese rubro.
c) Implementar un módulo que reciba la estructura generada en a), y retorne, para cada
rubro, el código y stock del producto con mayor código.
d) Implementar un módulo que reciba la estructura generada en a), dos códigos y
retorne, para cada rubro, la cantidad de productos con códigos entre los dos valores
ingresados.}

program ejercicioTRES;
type
	rangoRubro = 1..10;
	producto = record
		codigo: integer;
		rubro: rangoRubro;
		stock: integer;
		precio: real;
	end;
	
	arbol = ^nodo;
	nodo = record
		dato: producto;
		HI: arbol;
		HD: arbol;
	end;
	
	productosMAX = record
		codigo: integer;
		stock: integer;
	end;
	
	vectorPRODUCTOS = array[rangoRubro] of arbol;
	vectorMAXIMOS = array [rangoRubro] of productosMAX;
	vectorCONTADOR = array[rangoRubro] of integer;
	
procedure leerPRODUCTO(var produc: producto);
begin
	writeln('escriba un codigo');
	readln(produc.codigo);
	if(produc.codigo <> -1)then begin
		writeln('escriba un rubro');
		readln(produc.rubro);
		writeln('escriba el stock');
		readln(produc.stock);
		writeln('escriba un precio');
		readln(produc.precio);
	end;
end;	

procedure agregarALarbol(var arb: arbol ; produc: producto);
begin
	if(arb = nil)then begin
		new(arb);
		arb^.dato:= produc;
		arb^.HI:= nil;
		arb^.HD:= nil;
	end
	else
		if(produc.codigo < arb^.dato.codigo)then
			agregarALarbol(arb^.HI , produc )
		else
			agregarALarbol(arb^.HD , produc );
end;

procedure cargarVECTOR(var V: vectorPRODUCTOS);
var
	produc: producto;
begin
	leerPRODUCTO(produc);
	while(produc.codigo <> -1)do begin
		agregarALarbol(V[produc.rubro], produc);
		leerPRODUCTO(produc);
	end;
end;


procedure InicializarRubros(var V: vectorPRODUCTOS);
var
	i: rangoRubro;
begin
	for i:= 1 to 10 do 
		V[i]:= nil;
end;


function buscarCOSASparteARBOL(arb: arbol ; codigo: integer): boolean;
begin
	if(arb  = nil)then
		buscarCOSASparteARBOL:= FALSE
	else
		if(arb^.dato.codigo = codigo)then
			buscarCosasparteARBOL:= TRUE
		else
			if(codigo < arb^.dato.codigo)then
				buscarCOSASparteARBOL(arb^.HI , codigo)
			else
				buscarCOSASparteARBOL(arb^.HD , codigo);
end;


function buscarCOSAS(V: vectorPRODUCTOS ; rubro: rangoRubro ; codigo : integer): boolean;
begin
	buscarCOSAS:= buscarCOSASparteARBOL(V[rubro] , codigo);
end;

function buscarNODOMAX(a: arbol): arbol;
begin
	if(a^.HD = nil)then
		buscarNODOMAX:= a
	else
		buscarNODOMAX:= buscarNODOMAX(a^.HD);
end;

procedure cargarVectorMAXIMOS(var VMAX: vectorMAXIMOS ; V: vectorPRODUCTOS);
var
	prodMAX: productosMax;
	i: rangoRubro;
	nodoMAX: arbol;
begin
	for i:= 1 to 10 do begin
		if(V[i] <> nil)then begin
			nodoMAX:= buscarNODOMAX(V[i]);   {x}
			prodMAX.codigo:= nodoMAX^.dato.codigo;
			prodMAX.stock:= nodoMAX^.dato.stock;
			VMAX[i]:= prodMAX;
		end
		else
			writeln('error');
	end;
end;

procedure InicializarVectorContador(var VR: vectorCONTADOR);
var
	i: rangoRubro;
begin
	for i:= 1 to 10 do 
		VR[i]:= 0;
end;

procedure contarEnArbol(a: arbol ; codigoUno: integer ; codigoDos: integer ; var cant: integer);
begin
	if(a <> nil)then
		if(a^.dato.codigo >= codigoUno)then
			if(a^.dato.codigo <= codigoDos)then begin
				cant:= cant +1 ;
				contarEnArbol(a^.HI, codigoUno,codigoDos,cant);
				contarEnArbol(a^.HD, codigoUno,codigoDos,cant);
			end
			else
			contarEnArbol(a^.HI, codigoUno,codigoDos,cant)
		else
		contarEnArbol(a^.HD, codigoUno,codigoDos,cant);
end;

procedure cargarVECTORentreRANGOS(var VR: vectorCONTADOR ; V: vectorPRODUCTOS ; codigoUno: integer ; codigoDos: integer);
var
	i:rangoRubro;
	cant:integer;
begin
	for i:= 1 to 10 do begin
		cant:= 0;
		contarEnArbol(V[i], codigoUno,codigoDos,cant);
		VR[i]:= cant;
	end;
end;



var
	V: vectorPRODUCTOS;
	rubro: rangoRubro;
	codigo,codigoUNO,codigoDOS: integer;
	ok: boolean;
	VMAX: vectorMAXIMOS;
	VR: vectorCONTADOR;
begin
	InicializarRubros(V);
	cargarVECTOR(V);  {a}
	writeln('escriba un rubro donde buscar');
	readln(rubro);
	writeln('escriba un codigo a buscar en rubro anterior');
	readln(codigo);
	ok:= buscarCOSAS(V,rubro,codigo); {b}
	if(ok = true)then                                                 {para mi chequear}
		writeln(' ese codigo existe en el rubro que queriamos')
	else
		writeln('cagaste');
	cargarVectorMAXIMOS(VMAX,V);  {c}  {preguntar}
	writeln('escriba un codigo 1 como limite inferior');
	readln(codigoUNO);
	writeln('escriba un codigo 2 como limite superior');
	readln(codigoDOS);
	InicializarVectorContador(VR);
	cargarVECTORentreRANGOS(VR , V , codigoUNO , codigoDOS ); {d}
end.
