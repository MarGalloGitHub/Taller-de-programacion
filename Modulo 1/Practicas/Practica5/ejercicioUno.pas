{
El administrador de un edificio de oficinas, cuenta en papel, con la información del pago
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
d) Un módulo recursivo que retorne el monto total de las expensas. 
}
program ejercicioUno;
const
	dF = 300;
type
	oficina = record
		codigo:integer;
		DNI:integer;
		valorExpensa:real;
	end;
	
	rangoOficinas = 1..dF;
	
	vector = Array[rangoOficinas] of oficina;

procedure leerOficina(var ofi:oficina);
begin
	writeln('Ingrese el codigo de identificacion de la oficina');
	readln(ofi.codigo);
	if(ofi.codigo <> (-1))then begin
		writeln('Ingrese el dni del encargado');
		readln(ofi.DNI);
		writeln('Ingrese el valor de la expensa');
		readln(ofi.valorExpensa);
	end;
end;

procedure mostrarOficina(ofi:oficina);
begin
	writeln('Codigo de identificacion:  ' , ' ', ofi.codigo);
	writeln('Dni del encargado: ' , '  ', ofi.DNI);
	writeln('Valor de la expensa: ' , ' ' , ofi.valorExpensa:0:1);
end;

procedure cargarVector(var vec:vector ; var dimL:integer);
var
	ofi:oficina;
begin
	leerOficina(ofi);
	while((ofi.codigo <> (-1)) AND (dimL < dF))do begin
		dimL:=dimL + 1;
		vec[dimL]:= ofi;
		leerOficina(ofi);
	end;
end;

procedure mostrarVector(vec:vector ; dimL:integer);
var
	i:rangoOficinas;
begin
	writeln('Cantidad de elementos en el vector: ', ' ' , dimL);
	for i:= 1 to dimL do begin
		mostrarOficina(vec[i]);
	end;
end;

procedure ordenarSeleccion(var vec:vector; dimL:integer);
var
	i,j,p:integer;
	item:oficina;
begin
	for i:= 1 to dimL - 1 do begin
		p:= i;
		for j:= i + 1 to dimL do	
			if(vec[j].codigo < vec[p].codigo)then
				p:=j;
		item:=vec[p];
		vec[p]:=vec[i];
		vec[i]:=item;
	end;
end;

procedure ordenarInsercion(var vec:vector; dimL:integer);
var
	i,j:integer;
	item:oficina;
begin
	for i:= 2 to dimL do begin
		item:=vec[i];
		j:=i-1;
		while((j>0) AND (vec[j].codigo > item.codigo))do begin
			vec[j+1]:=vec[j];
			j:=j-1;
		end;
		vec[j+1]:=item;
	end;
end;

procedure busquedaDicotomica(vec:vector;dimL:integer;var dni:integer; codigo:integer);
var
	encontre:boolean;
	min:integer;
	max:integer;
	medio:integer;
begin
	dni:=0;
	min:=1;
	max:=dimL;
	medio:=(min + max) div 2;
	encontre:= false;
	while((encontre = false) AND (min <= max))do begin
		writeln('codigo actual = ' , vec[medio].codigo);
		if(vec[medio].codigo = codigo)then begin
			encontre:=true;
			dni:=vec[medio].dni;
		end
		else
			if(codigo < vec[medio].codigo)then begin
				max:=medio;
				medio:=(min + medio) div 2;
			end
			else begin
				min:=medio;
				medio:=(max + medio) div 2;
			end;
	end;
end;

function devolverMontoRecursivo(vec:vector; dimL:integer ; i:integer):real;
begin
	if(i > dimL)then
		devolverMontoRecursivo:=0
	else
		devolverMontoRecursivo:= vec[i].valorExpensa + devolverMontoRecursivo(vec,dimL,i + 1);
end;

var
	monto:real;
	vec: vector;
	dimL:integer;
	dni,codigo:integer;
	i:integer;
begin
	dimL:=0;
	cargarVector(vec,dimL);
	writeln('Asi fue cargado el vector');
	mostrarVector(vec,dimL);
	{ordenarSeleccion(vec,dimL);}
	ordenarInsercion(vec,dimL);
	writeln(' ');
	writeln(' ');
	writeln('Asi queda el vector tras ser ordenado');
	mostrarVector(vec,dimL);
	writeln('Ahora busqueda dicotomica');
	writeln('Ingresar codigo a buscar en el vector');
	readln(codigo);
	busquedaDicotomica(vec,dimL,dni,codigo);
	if(dni = 0)then
		writeln('No se encontro')
	else
		writeln('El dni del encargado de ese codigo es: ', '  ' , dni);
	i:=1;
	monto:= devolverMontoRecursivo(vec,dimL,i);
	writeln(' ');
	writeln('El monto total de las expensas es: ' , monto:0:1);
end.
