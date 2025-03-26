program parcialDosMilDieciocho;
type
	cadena15 = string[15];
	pedido = record
		DNI: integer;
		nombre: cadena15;
		fecha: integer;
		monto: real;
	end;
	
	datosCLIENTE = record
		fecha: integer;
		monto: real;
	end;
	
	
	listaDATOS = ^nodoLISTA;
	nodoLISTA = record
		dato: datosCLIENTE;
		sig: listaDATOS;
	end;
	
	elementoARBOL = record
		DNI: integer;
		nombre: cadena15;
		lista: listaDATOS;
	end;
	
	arbol = ^nodo;
	nodo = record
		dato: elementoARBOL;
		HI: arbol;
		HD: arbol;
	end;
	
procedure leerENCARGO(var e: pedido); {1,b}
begin
	writeln('escriba un monto');
	readln(e.monto);
	if(e.monto <> 0)then begin
		writeln('escriba un nombre');  
		readln(e.nombre);
		writeln('escriba una fecha');
		readln(e.fecha);
		writeln('escriba un DNI');
		readln(e.DNI);
	end;
end;

procedure armarREGISTROLISTA(var datos: datosCLIENTE ; encargo : pedido); {1,d}
begin
	datos.fecha:= encargo.fecha;
	datos.monto:= encargo.monto;
end;
	
procedure agregarADELANTE(var L: listaDATOS ; datos: datosCLIENTE);	{1,e}
var
	nue: listaDATOS;
begin
	new(nue);
	nue^.dato:= datos;
	nue^.sig:= L;
	L:= nue;
end;
	
procedure armarARBOL(var a: arbol ; encargo: pedido); {1,c}
var
	elemento: elementoARBOL;
	datos: datosCLIENTE;
begin
	if(a = nil)then begin
		new(a);
		elemento.DNI:= encargo.DNI;
		elemento.nombre:= encargo.nombre;
		elemento.lista:= nil;
		armarREGISTROLISTA(datos , encargo); {x}
		agregarADELANTE(elemento.lista , datos); {x}
		a^.dato:= elemento;
		a^.HI:= nil;
		a^.HD:= nil;
	end
	else
		if(encargo.DNI = a^.dato.DNI)then
			agregarADELANTE(elemento.lista , datos)
		else
			if(encargo.DNI < a^.dato.DNI)then
				armarARBOL(a^.HI , encargo)
			else
				armarARBOL(a^.HD , encargo);
		
		
end;	
	
	
procedure cargarARBOL(var a: arbol);  {1,a}
var
	encargo: pedido;
begin
	leerENCARGO(encargo);
	while(encargo.monto <> 0)do begin
		armarARBOL(a,encargo);
		leerENCARGO(encargo);
	end;
end;	

function buscarENlista (L: listaDATOS ; fecha: integer): integer;
begin
	buscarENlista:= 0;
	while(L <> nil)do begin
		if(L^.dato.fecha = fecha)then
			buscarENlista:= buscarENlista + 1;
		L:= L^.sig;
	end;
end;
	
function cantidadPEDIDOSenESAfecha(a: arbol ; fecha: integer): integer;
begin
	if(a = nil)then
		cantidadPEDIDOSenESAfecha:= 0
	else
		cantidadPEDIDOSenESAfecha:= buscarENlista(a^.dato.lista , fecha) + cantidadPEDIDOSenESAfecha(a^.HI ,fecha) + cantidadPEDIDOSenESAfecha(a^.HD, fecha);
end;	
	
procedure trabajarHOJA(L: listaDATOS);
var
	totalPEDIDOS: integer;
	totalABONADO: real;
begin
	totalABONADO:= 0;
	totalPEDIDOS:= 0;
	while(L <> nil)do begin
		totalPEDIDOS:= totalPEDIDOS + 1;
		totalABONADO:= L^.dato.monto;
		L:= L^.sig;
	end;
	writeln('el total de pedidos fue de : ', ' ', totalPEDIDOS,' ', 'mientras que el total abonado fue de : ', '  ', totalABONADO:2:1);
end;	
	
procedure informarTOTALdni(a: arbol ; DNI: integer);
begin
	if(a = nil)then begin
		writeln('el total abonado es 0 al igual que la cantidad de pedidos');
	end
	else
		if(a^.dato.DNI = DNI)then
			trabajarHOJA(a^.dato.lista)
		else
			if(DNI < a^.dato.DNI)then
				informarTOTALdni(a^.HI , DNI)
			else
				informarTOTALdni(a^.HD , DNI);
		
end;	
	
var
	a: arbol;
	fecha,DNI: integer;
	cantidadCLIENTES: integer;
begin
	a:= nil;
	cargarARBOL(a); {1}
	writeln('escriba una fecha a buscar');
	readln(fecha);
	cantidadCLIENTES:= cantidadPEDIDOSenESAfecha(a,fecha);  {2}
	writeln('la cantidad de clientes que pidieron en esa fecha fue de : ','  ', cantidadCLIENTES);
	writeln('escriba un DNI');
	readln(DNI);
	informarTOTALdni(a , DNI); {3}
	
end.
