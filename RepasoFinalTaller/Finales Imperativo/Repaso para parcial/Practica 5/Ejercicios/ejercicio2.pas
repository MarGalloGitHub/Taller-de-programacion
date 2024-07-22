{Una agencia dedicada a la venta de autos ha organizado su stock y, dispone en papel de la
información de los autos en venta. Implementar un programa que:                                             preguntar por condicion de corte
a) Lea la información de los autos (patente, año de fabricación (2010..2018), marca y
modelo) y los almacene en dos estructuras de datos:
i. Una estructura eficiente para la búsqueda por patente.
ii. Una estructura eficiente para la búsqueda por marca. Para cada marca se deben
almacenar todos juntos los autos pertenecientes a ella.
b) Invoque a un módulo que reciba la estructura generado en a) i y una marca y retorne la
cantidad de autos de dicha marca que posee la agencia.
c) Invoque a un módulo que reciba la estructura generado en a) ii y una marca y retorne
la cantidad de autos de dicha marca que posee la agencia.
d) Invoque a un módulo que reciba el árbol generado en a) i y retorne una estructura con
la información de los autos agrupados por año de fabricación.                                         
e) Invoque a un módulo que reciba el árbol generado en a) i y una patente y devuelva el
modelo del auto con dicha patente.
f) Invoque a un módulo que reciba el árbol generado en a) ii y una patente y devuelva el
modelo del auto con dicha patente}

program ejercicioBienHECHO;
TYPE
	rangoFABRI = 2010..2018;
	auto = record
		patente: integer;
		anioFABRI: rangoFABRI;
		marca: string;
		modelo: string;
	end;
	
	arbol = ^nodo;
	nodo = record
		dato: auto;
		HI: arbol;
		HD: arbol;
	end;
	
	autoSin = record
		patente: integer;
		anioFABRI: rangoFABRI;
		modelo: string;
	end;
	
	autoSinAnio = record
		patente: integer;
		marca: string;
		modelo: string;
	end;
		
	listaA = ^nodoLista;
	nodoLista = record
		dato: autoSin;
		sig: listaA;
	end;
	
	registroMARCA = record
		marca: string;
		lista: listaA;
	end;
	
	arbolMARCA = ^nodoMARCA;
	nodoMARCA = record
		dato: registroMARCA;
		HI: arbolMARCA;
		HD: arbolMARCA;
	end;
	
	listaAUTOS = ^nodoAUTO;
	nodoAUTO = record
		dato: autoSinAnio;
		sig: listaAUTOS;
	end;
	
	VectorANIOS = array[rangoFABRI] of listaAUTOS;
	
procedure leerAuto(var A: auto);
begin
	writeln('escriba una patente');
	readln(A.patente);
	if(A.patente <> 439)then begin
		writeln('escriba un modelo');
		readln(A.modelo);
		writeln('escriba un año de fabricacion');
		readln(A.anioFABRI);
		writeln('escriba una marca');
		readln(A.marca);
	end;	
end;

procedure crearARBOLuno(var a1: arbol ; A: auto);
begin
	if(a1 = nil)then begin
		new(a1);
		a1^.dato:= A;
		a1^.HI:= nil;
		a1^.HD:= nil;
	end
	else
		if(A. patente < a1^.dato.patente)then
			crearARBOLuno(a1^.HI,A)
		else
			crearARBOLuno(a1^.HD,A);			
end;

procedure agregarADELANTE (var L: listaA ; A: auto);
var
	nue: listaA;
	aSIN: autoSin;
begin
	new(nue);
	aSIN.patente:= A.patente;
	aSIN.modelo:= A.modelo;
	aSIN.anioFABRI:= A.anioFABRI;
	nue^.dato:= aSIN;
	nue^.sig:= L;
	L:= nue;

end;

procedure crearARBOLdos(var aMARCAS: arbolMARCA ; A: auto);
var
	r: registroMARCA;
begin
	if(aMARCAS = nil)then begin
		new(aMARCAS);
		r.marca:= A.marca;
		r.lista:= nil;
		agregarADELANTE(r.lista , A);
		aMARCAS^.dato := r;
		aMARCAS^.HI:= nil;
		aMARCAS^.HD:= nil;
	end
	else
		if(A.marca = aMARCAS^.dato.marca)then
			agregarADELANTE(r.lista , A)
		else
			if(A.marca < aMARCAS^.dato.marca)then
				crearARBOLdos(aMARCAS^.HI, A)
			else
				crearARBOLdos(aMARCAS^.HD, A);
end;
	
procedure cargarARBOL(var a1: arbol ; var aMARCAS: arbolMARCA);	
var
	A: auto;
begin
	leerAuto(A);
	while(A. patente <> 439)do begin
		crearARBOLuno(a1,A);
		crearARBOLdos(aMARCAS,A);
		leerAuto(A);
	end;
end;

function buscarcantAUTOS(a1 : arbol ; marca: string): integer;
begin
	if(a1 = nil)then 
		buscarcantAUTOS:= 0
	else
		if(a1^.dato.marca = marca)then 
			buscarcantAUTOS:= buscarcantAUTOS(a1^.HI,marca) + buscarcantAUTOS(a1^.HD , marca) + 1
		else
			buscarcantAUTOS:= buscarcantAUTOS(a1^.HI,marca) + buscarcantAUTOS(a1^.HD , marca);
end;

function contarENlista(L: listaA ; marca: string): integer;
begin
	if(L = nil)then 
		contarENlista:= 0
	else
		contarENlista:= contarENlista(L^.sig , marca) +1;	
end;
	
function buscarENarbolDOS (aMARCA : arbolMARCA ; marca : string): integer;
begin
	if(aMARCA = nil)then
		buscarENarbolDOS:= 0
	else
		if(aMARCA^.dato.marca = marca)then
			buscarENarbolDOS:= contarENlista(aMARCA^.dato.lista , marca)
		else
			if(aMARCA^.dato.marca = marca)then 
				buscarENarbolDOS:= buscarENarbolDOS(aMARCA^.HI , marca)
			else
				buscarENarbolDOS:= buscarENarbolDOS(aMARCA^.HD , marca);
end;

procedure InicializarVectorListas(var V: vectorANIOS);
var
	i: rangoFABRI;
begin
	for i:= 2010 to 2018 do
		V[i]:= nil;
end;

procedure asignarValoresDos(var autoSINfecha : autoSinAnio ; auto : auto);
begin
	autoSinfecha.marca:= auto.marca;
	autoSinfecha.modelo:= auto.modelo;
	autoSinfecha.patente:= auto.patente;
end;

procedure agregarADELANTEnuevo(var L: listaAUTOS ; a: autoSinANIO);
var
	nue: listaAUTOS;
begin
	new(nue);
	nue^.dato:= a;
	nue^.sig:= L;
	L:= nue;
end;


procedure cargarVECTORanios(var V: vectorANIOS ; a1 : arbol);
var
	autoSINfecha: autoSinANIO;
begin
	while(a1 <> nil) do begin
		cargarVECTORanios(V,a1^.HI);
			asignarValoresDos(autoSINfecha , a1^.dato);
			agregarADELANTEnuevo(V[a1^.dato.anioFABRI] , autoSINfecha);
		cargarVECTORanios(V,a1^.HD);
	end;
end;
	
procedure buscarMODELOconPATENTE(a1: arbol ; patente: integer ; var modelo: string);
begin
	if(a1 = nil)then 
		modelo:= 'no hay modelo con esa patente'
	else
		if(a1^.dato.patente = patente)then
			modelo:= a1^.dato.modelo
		else
			if(patente < a1^.dato.patente)then
				buscarMODELOconPATENTE(a1^.HI , patente , modelo)
			else
				buscarMODELOconPATENTE(a1^.HD , patente , modelo);
end;	
	
procedure buscarENlista(L: listaA ; patente : integer ; var modelo: string);
begin
	while(L <> nil)do begin
		if(L^.dato.patente = patente)then
			modelo:= L^.dato.modelo;
		L:= L^.sig;
	end;
end;	
	
procedure buscarMODELOconPATENTEparaARBOLdos(aMARCA : arbolMARCA ; patente: integer ; var modelo: string);
begin
	if(aMARCA <> nil)then begin
		buscarMODELOconPATENTEparaARBOLdos(aMARCA^.HI , patente , modelo);
		buscarENlista(aMARCA^.dato.lista , patente , modelo);
		buscarMODELOconPATENTEparaARBOLdos(aMARCA^.HD , patente , modelo);
	end;
end;	
	
	
var
	a1: arbol;
	aMARCA: arbolMARCA;
	cantAUTOS,cantAUTOSdos: integer;
	marca,modelo: string;
	VecAnios: vectorANIOS;
	patente: integer;
begin
	a1:= nil;
	aMARCA:= nil;
	cargarARBOL(a1,aMARCA);  {a}
	writeln('escriba una marca');
	readln(marca);
	cantAUTOS:= buscarcantAUTOS(a1, marca); {b}
	writeln(' la cantidad de autos con esa marca: ', cantAUTOS);
	writeln('escriba una nueva marca');
	readln(marca);
	cantAUTOSdos:= buscarENarbolDOS(aMARCA , marca); {c}
	writeln(' la cantidad de autos con esa marca es: ', cantAUTOSdos);
	InicializarVectorListas(VecAnios);
	cargarVECTORanios(VecAnios , a1); {d}   {preguntar fede}
	writeln('escriba una patente a buscar');
	readln(patente);
	buscarMODELOconPATENTE(a1,patente,modelo); {e}
	writeln('escriba otra patente para buscar un modelo en el 2do arbol');
	writeln(patente);
	buscarMODELOconPATENTEparaARBOLdos(aMARCA,patente,modelo); {f}
end.
