{1.- Se desea procesar la información de las ventas de productos de un comercio (como máximo
50).
Implementar un programa que invoque los siguientes módulos:
a. Un módulo que retorne la información de las ventas en un vector. De cada venta se conoce el
día de la venta, código del producto (entre 1 y 15) y cantidad vendida (como máximo 99
unidades). El código debe generarse automáticamente (random) y la cantidad se debe leer. El
ingreso de las ventas finaliza con el día de venta 0 (no se procesa).
b. Un módulo que muestre el contenido del vector resultante del punto a).
c. Un módulo que ordene el vector de ventas por código.
d. Un módulo que muestre el contenido del vector resultante del punto c).
e. Un módulo que elimine, del vector ordenado, las ventas con código de producto entre dos
valores que se ingresan como parámetros.
f. Un módulo que muestre el contenido del vector resultante del punto e).
g. Un módulo que retorne la información (ordenada por código de producto de menor a
mayor) de cada código par de producto junto a la cantidad total de productos vendidos.
h. Un módulo que muestre la información obtenida en el punto g).}

program LightsOnInAnEmptyPub;
const
	dimf = 50;
type
	dias = 0..31;
	codigos = 1..15;
	cantidades = 1..99;

	venta = record
		dia: dias;
		codigo: codigos;
		cant: cantidades;
	end;

	vector = array[1.. dimf] of venta;

procedure leerventa (var vent:venta);
begin
	randomize;
	writeln ('dia');
	readln (vent.dia);
	if (vent.dia <> 0) then begin
		writeln ('cant');
		readln (vent.cant);
		vent.codigo := abs(random(15));
		writeln ('Se asigno el codigo ', vent.codigo);
	end;
end;

procedure cargarvector (var v:vector; var diml:integer);
var vent:venta;
begin
	diml := 0;
	leerventa (vent);
	while (diml < dimf) and (vent.dia <> 0) do begin
		diml := diml + 1;
		v[diml] := vent;
		leerventa(vent);
	end;
end;

procedure imprimirvector (v:vector; diml:integer);
var i:integer;
begin
	for i:= 1 to diml do begin
		writeln ('dia');
		writeln (v[i].dia);
		writeln ('codigo');
		writeln (v[i].codigo);
		writeln ('cant');
		writeln (v[i].cant);
	end;
end;

procedure ordenarvector (var v:vector; diml:integer);
var i,j,pos: integer; elem: venta;
begin
	for i:= 1 to diml-1 do begin 
		pos := i;
		for j:= i + 1 to diml do
			if (v[j].codigo) < v[pos].codigo then
				pos := j;
		elem := v[pos];
		v[pos] := v[i];
		v[i] := elem;
end;
end;

procedure eliminarordenado (var v:vector; var diml:integer; a,b:integer);
var contador,i,pos:integer;
begin
	pos := 1;
	while (pos <= diml) and (v[pos].codigo < a) do
		pos := pos + 1;
	if (pos <= diml) then begin
		contador := 0;
		while (pos <= diml) and (v[pos].codigo >= a) and (v[pos].codigo <= b) do begin
			pos := pos + 1;
			contador := contador + 1;
		end;
		for i := pos to diml do 
			v[i-contador] := v[i];
		diml := diml - contador; 
	end
	else writeln ('No se encontró ningun elemento');
end;


var v:vector; diml, a:integer;
begin
	cargarvector (v,diml);
	ordenarvector (v,diml);
	eliminarordenado (v, diml, 3, 9);
	imprimirvector(v,diml);
	readln (a);
end
