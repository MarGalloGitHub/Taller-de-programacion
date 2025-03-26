
{2.- El administrador de un edificio de oficinas cuenta, en papel, con la información del pago de
las expensas de dichas oficinas.
Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:
a. Genere un vector, sin orden, con a lo sumo las 300 oficinas que administra. De cada oficina
se ingresa el código de identificación, DNI del propietario y valor de la expensa. La lectura
finaliza cuando se ingresa el código de identificación -1, el cual no se procesa.
b. Ordene el vector, aplicando el método de inserción, por código de identificación de la
oficina.
c. Ordene el vector aplicando el método de selección, por código de identificación de la oficina}
program Ejercicio2Final;
const
	dF = 3;

type
	rangoOfi = 1..dF;
	oficina = record
		codigo: integer;
		DNI: integer;
		expensa: real;
	end;
	
	vector = array[rangoOfi] of oficina;
	
procedure leerOficina(var ofi: oficina);
begin
	writeln('Ingrese el codigo (integer)');
	readln(ofi.codigo);
	if(ofi.codigo <> (-1))then begin
		writeln('Ingrese el DNI (integer)');
		readln(ofi.DNI);
		writeln('Ingrese el valor de las expensas (real)');
		readln(ofi.expensa);
	end;
		
end;	

procedure cargarVector(var vec: vector ; var dimL: integer);
var
	ofi: oficina;
begin
	leerOficina(ofi);
	dimL:= 0;
	while((ofi.codigo <> (-1)) AND (dimL < dF))do begin
		dimL:= dimL + 1;
		vec[dimL]:= ofi;
		if(dimL < dF)then 
			leerOficina(ofi);
	end;
end;

procedure mostrarVector(vec: vector ; dimL: integer);
var
	i: rangoOfi;
begin
	if(dimL <> 0)then
		for i:= 1 to dimL do begin
			writeln('En el lugar:  ' , i, ', esta la oficina con codigo  ' , vec[i].codigo , ', DNI de prop  ', vec[i].DNI, ' y con unas expensas de $', vec[i].expensa:2:1);
		end; 
end;


procedure ordenarVectorSeleccion(var vec: vector ; dimL: integer);
var
	i,j,p: integer;
	item: oficina;
begin
	for i:= 1 to (dimL - 1)do begin
		p:= i;
		for j:= i + 1 to dimL do begin
			if(vec[j].codigo < vec[p].codigo)then begin
				p:= j;
			end;
		end;
		item:= vec[p];
		vec[p]:= vec[i];
		vec[i]:= item;
	end;	
end;

procedure ordenarVectorInsercion(var vec: vector ; dimL: integer);
var
	i,j: integer;
	item: oficina;
begin
	for i:= 2 to dimL do begin
		item:= vec[i];
		j:= i - 1;
		while((j > 0) AND (vec[j].codigo > item.codigo)) do begin
			vec[j + 1] := vec[j];
			j:= j - 1;
		end;
		vec[j + 1] := item;
	end;
end;

var
	dimL: integer;
	vec: vector;
begin
	cargarVector(vec , dimL); {A}
	writeln('');
	writeln('Vector sin ordenar');
	mostrarVector(vec,dimL);
	writeln('');
	{ordenarVectorSeleccion(vec,dimL)};
	ordenarVectorInsercion(vec,dimL);   {Ambos estan hechos, quitar las llaves para probar cualquiera de los 2}
	writeln('Vector despues de ordenar por algun metodo');
	writeln('');
	mostrarVector(vec,dimL);
	
end.
