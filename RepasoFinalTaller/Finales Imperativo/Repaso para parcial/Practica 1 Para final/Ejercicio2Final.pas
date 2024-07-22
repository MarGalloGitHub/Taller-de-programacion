{2.- El administrador de un edificio de oficinas cuenta, en papel, con la información del pago de 
las expensas de dichas oficinas. 
Implementar un programa modularizado que:
a. Genere un vector, sin orden, con a lo sumo las 300 oficinas que administra. De cada oficina se 
ingresa el código de identificación, DNI del propietario y valor de la expensa. La lectura finaliza 
cuando se ingresa el código de identificación -1, el cual no se procesa.
b. Ordene el vector, aplicando el método de inserción, por código de identificación de la oficina.
c. Ordene el vector aplicando el método de selección, por código de identificación de la oficina.}

program ejercicio2Final;
const
	dF = 300;
var
	oficna = record
		codigoIdenti: integer;
		DNI: integer;
		valorExpensas: real;
	end;
	
	vectorOficinas = array[1..dF] of oficina;
	
procedure leerOficina(var ofi: oficina);
begin
	writeln('Ingrese el codigo de identificacion');
	readline(ofi.codigoIdenti);
	if(ofi.codigoIdenti <> - 1)then begin
		writeln('Ingrese el dni');
		readln(ofi.DNI);
		writeln('Ingrese el valor de las expensas');
		readln(ofi.valorExpensas);
	end;
end;	

procedure cargarVector(var V: vectorOficinas ; var dimL: integer);
var
	ofi: oficina;
begin
	leerOficina(ofi);
	while(ofi.codigoIdenti <> - 1)do begin
		dimL:= dimL + 1;
		V[dimL]:= ofi;
		leerOficina(ofi);
	end;
end;

var
	V: vectorOficinas;
	dimL: integer;
begin
	dimL:= 0;
	cargarVector(V,dimL);
end.
