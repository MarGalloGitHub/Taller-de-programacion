{Una oficina requiere el procesamiento de los reclamos de las personas. De cada reclamo
se lee código, DNI de la persona, año y tipo de reclamo. La lectura finaliza con el código de
igual a -1. Se pide:
a) Un módulo que retorne estructura adecuada para la búsqueda por DNI. Para cada DNI
se deben tener almacenados cada reclamo y la cantidad total de reclamos que realizó.
b) Un módulo que reciba la estructura generada en a) y un DNI y retorne la cantidad de
reclamos efectuados por ese DNI.
c) Un módulo que reciba la estructura generada en a) y dos DNI y retorne la cantidad de
reclamos efectuados por todos los DNI comprendidos entre los dos DNI recibidos.
d) Un módulo que reciba la estructura generada en a) y un año y retorne los códigos de
los reclamos realizados en el año recibido.}

program ejercicioFINAL;

type
	reclamo = record
		codigo: integer;
		DNI: integer;
		anio: integer;
		tipo: string;
	end;
	
	reclamoSINdni = record
		codigo: integer;
		anio: integer;
		tipo: string;
	end;
		
	
	listaRE = ^nodoLISTA;
	nodoLISTA = record
		dato: reclamoSINdni;
		sig: listaRE;
	end;
	
	registroARBOL = record
		DNI: integer;
		listaRECLAMOS: listaRE;
		cantidad: integer;
	end;
	
	arbol = ^nodoARBOL;
	nodoARBOL = record
		dato: registroARBOL;
		HI: arbol;
		HD: arbol;
	end;
	
	listaCODIGOS = ^nodoCODIGOS;
	nodoCODIGOS = record
		dato: integer;
		sig: listaCODIGOS;
	end;
	
procedure leerRECLAMO(var reclam: reclamo);   {a - 2}
begin
	writeln('escriba un codigo');
	readln(reclam.codigo);
	if(reclam.codigo <> -1)then begin
		writeln('escriba un DNI');
		readln(reclam.DNI);
		writeln('escriba el año');
		readln(reclam.anio);
		writeln('escriba un tipo');
		readln(reclam.tipo);
	end;
end;

procedure ASIGNAR (var reclamSIN: reclamoSINdni ; reclam: reclamo);   {a - 4}
begin
	reclamSIN.codigo:= reclam.codigo;
	reclamSIN.tipo:= reclam.tipo;
	reclamSIN.anio:= reclam.anio;
end;

procedure agregarADELANTE(var L: listaRE ; reclamSIN: reclamoSINdni);  {a - 5}
var
	nue: listaRE;
begin
	new(nue);
	nue^.dato:= reclamSIN;
	nue^.sig:= L;
	L:= nue;
end;

procedure crearARBOL(var arb: arbol ; reclam: reclamo);  {a - 3}
var
	reclamSIN: reclamoSINdni;
	registro: registroARBOL;
begin
	if(arb = nil)then begin
		new(arb);
		ASIGNAR(reclamSIN , reclam);
		registro.DNI:= reclam.DNI;
		registro.listaRECLAMOS:= nil;
		agregarADELANTE(registro.listaRECLAMOS , reclamSIN);  {cargo la lista}
		registro.cantidad:= 0;
		arb^.dato:= registro;
		arb^.HI:= nil;
		arb^.HD:= nil;
	end
	else
		if(arb^.dato.DNI = reclam.DNI)then begin
			agregarADELANTE(registro.listaRECLAMOS , reclamSIN);
			registro.cantidad:= registro.cantidad + 1;
		end
		else
			if(reclam. DNI < arb^.dato.DNI)then
				crearARBOL(arb^.HI,reclam)
			else
				crearARBOL(arb^.HD,reclam);
end;
	
procedure armarARBOL (var arb: arbol);   {a - 1}
var
	reclam: reclamo;
begin
	leerRECLAMO(reclam);
	while(reclam.codigo <> -1)do begin
		crearARBOL(arb , reclam);
		leerRECLAMO(reclam);
	end;
end;	

function buscarCUANTOSreclamos(arb: arbol ; DNI: integer): integer;
begin
	if(arb = nil)then
		buscarCUANTOSreclamos:= 0
	else
		if(arb^.dato.DNI = DNI)then
			buscarCUANTOSreclamos:= arb^.dato.cantidad
		else
			if(DNI < arb^.dato.DNI)then
				buscarCUANTOSreclamos:= buscarCUANTOSreclamos(arb^.HI, DNI)
			else
				buscarCUANTOSreclamos:= buscarCUANTOSreclamos(arb^.HD, DNI);
					
end;

function buscarCUANTOSreclamosENrango(arb: arbol ; DNIuno,DNIdos: integer): integer;
begin
	if(arb = nil)then
		buscarCUANTOSreclamosENrango:= 0
	else
		if(arb^.dato.DNI >= DNIuno)then
			if(arb^.dato.DNI <= DNIdos)then
				buscarCUANTOSreclamosENrango:= arb^.dato.cantidad + buscarCUANTOSreclamosENrango(arb^.HI, DNIuno,DNIdos) + buscarCUANTOSreclamosENrango(arb^.HD, DNIuno,DNIdos)
			else
				buscarCUANTOSreclamosENrango:= buscarCUANTOSreclamosENrango(arb^.HI, DNIuno,DNIdos)
		else
			buscarCUANTOSreclamosENrango:= buscarCUANTOSreclamosENrango(arb^.HD, DNIuno,DNIdos);			
end;

procedure agregarATRAS(var L,ult: listaCODIGOS ; codigo: integer);
var
	nue: listaCODIGOS;
begin
	new(nue);
	nue^.dato:= codigo;
	nue^.sig:= nil;
	if(L = nil)then
		L:= nue
	else
		ult^.sig:= nue;
	ult:= nue;
	
end;


procedure recorrerLISTA(var L: listaCODIGOS ; Lreclamos: listaRE ; anio: integer);
var
	ult: listaCODIGOS;
begin
	while(Lreclamos <> nil)do begin
		if(Lreclamos^.dato.anio = anio)then
			agregarATRAS(L,ult,Lreclamos^.dato.codigo);
		Lreclamos:= Lreclamos^.sig;
	end;
end;


procedure cargarLISTAcodigos(var L: listaCODIGOS ; arb: arbol ; anio : integer);
begin
	while(arb <> nil)do begin
		cargarLISTAcodigos (L,arb^.HI,anio);
		recorrerLISTA(L,arb^.dato.listaRECLAMOS,anio);
		cargarLISTAcodigos(L,arb^.HD,anio);
	end;
end;

var
	arb: arbol;
	DNI,DNIuno,DNIdos: integer;
	cantidadRECLAMOS,cantidadRECLAMOSenRANGO,anio: integer;
	Lcodigos: listaCODIGOS;
begin
	arb:= nil;
	armarARBOL(arb);   {a}
	writeln('escriba un dni para buscar cuantos reclamos tiene ');
	readln(DNI);
	cantidadRECLAMOS:= buscarCUANTOSreclamos(arb , DNI); {b}
	writeln('la cantidad de reclamos para ese dni fueron de : ','  ' ,cantidadRECLAMOS);
	writeln('escriba un dni como limite inferior ');
	readln(DNIuno);
	writeln('escriba un dni como limite superior ');
	readln(DNIdos);
	cantidadRECLAMOSenRANGO:= buscarCUANTOSreclamosENrango(arb , DNIuno , DNIdos); {c}
	writeln('la cantidad de reclamos entre rangos fue de : ','   ', cantidadRECLAMOSenRANGO);                      
	writeln('escriba un año donde vamos a buscar cuales son los codigos de los reclamos de ese año');
	readln(anio);
	Lcodigos:= nil;
	cargarLISTAcodigos(Lcodigos,arb,anio);  {d}
end.
