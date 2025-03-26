{1. El administrador de un edificio de oficinas, cuenta en papel, con la información del pago
de las expensas de dichas oficinas. Implementar un programa con:
a) Un módulo que retorne un vector, sin orden, con a lo sumo las 300 oficinas que
administra. Se debe leer, para cada oficina, el código de identificación, DNI del
propietario y valor de la expensa. La lectura finaliza cuando llega el código de
identificación -1.
b) Un módulo que reciba el vector retornado en a) y retorne dicho vector ordenado por
código de identificación de la oficina. Ordenar el vector aplicando uno de los métodos
vistos en la cursada.
c) Un módulo que realice una búsqueda dicotómica. Este módulo debe recibir el vector
generado en b) y un código de identificación de oficina. En el caso de encontrarlo, debe
retornar la posición del vector donde se encuentra y en caso contrario debe retornar 0.
Luego el programa debe informar el DNI del propietario o un cartel indicando que no
se encontró la oficina.
d) Un módulo recursivo que retorne el monto total de las expensas.}

program ejercicioUno;
const
	dF = 300;
type
	oficina = record
		codigo: integer;
		dniProp: integer;
		valorExp: real;
	end;
	
	vector = array[1..dF] of oficina;
	
procedure leerOficina(var ofi: oficina);
begin
	writeln('escriba un codigo');
	readln(ofi.codigo);
	if(ofi.codigo <> -1)then begin
		writeln('escriba un dni');
		readln(ofi.dniProp);
		writeln('escriba un valor de la Expensa');
		readln(ofi.valorExp);
	end;
end;
	
procedure cargarVector(var V: vector ; var dimL: integer);
var
	ofi: oficina;
begin
	leerOficina(ofi);
	while(dimL < dF) AND (ofi.codigo <> -1)do begin
		dimL:= dimL +1;
		V[dimL]:= ofi;
		leerOficina(ofi);
	end;
end;	
	
procedure ordenarSELECCION(var V: vector ; dimL: integer);	
var
	i,j,p: integer;
	item: oficina;
begin
	for i:= 1 to (dimL -1) do begin
		p:=i;
		for j:= i+1 to dimL do begin
			if(V[j].codigo < V[p].codigo)then 
				p:= j;
			item:= V[p];
			V[p]:= V[i];
			V[i]:= item;
		end;
	end;
end;

function buscarMontoTotal(V: vector ; dimL: integer ; i: integer): real;
begin
	if(i < dimL)then begin
		i:= i + 1;
		buscarMontoTotal:= V[i].valorExp + buscarMontoTotal(V,dimL,i);
	end;
end;
	
procedure busquedaDICO(V: vector ; dimL: integer ; var Pos,codigo,DniBusqueda: integer);
var
	pri,ult,medio : integer;
begin
	pri:= 1;
	ult:= dimL;
	medio:= (1 + dimL) div 2;
	while(pri <= ult) and (codigo <> V[medio].codigo)do begin
		begin
			if(codigo < V[medio].codigo)then
				ult:= medio -1
			else
				pri:= medio +1;
			medio:= (pri + ult)div 2;
		end;
	if(pri <= ult) and (codigo = V[medio].codigo) then begin
		Pos:= medio;
		DniBusqueda:= V[medio].dniProp;
	end
	else
		Pos:= 0;
	end;
end;	
	
	
var
	V: vector;
	dimL,i,codigo,DniBusqueda,pos: integer;
	montoTotal: real;
begin
	pos:= 0;
	i:= 0;
	montoTotal:= 0;
	dimL:= 0;
	cargarVector(V,dimL); {a}
	ordenarSELECCION(V,dimL); {b}
	montoTotal:= buscarMontoTotal(V,dimL,i); {d}
	writeln('el monto total de las expensas es: ','   ', montoTotal:2:1);
	writeln('ingrese un codigo de identificacion a buscar');
	readln(codigo);
	busquedaDICO(V,dimL,pos,codigo,DniBusqueda);
	if(pos = 0)then
		writeln('no se encontro la oficina')
	else
		writeln('el codigo se encuentra en la posicion: ','  ', pos);
	writeln('el dni del propietario es: ','   ', DniBusqueda);
end.
