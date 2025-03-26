{El administrador de un edificio de oficinas, cuenta en papel, con la información del pago
 de las expensas de dichas oficinas. Implementar un programa con:
 a) Un módulo que retorne un vector, sin orden, con a lo sumo las 300 oficinas que
 administra. Se debe leer, para cada oficina, el código de identificación, DNI del
 propietario y valor de la expensa. La lectura finaliza cuando llega el código de
 identificación-1.
 b) Un módulo que reciba el vector retornado en a) y retorne dicho vector ordenado por
 código de identificación de la oficina. Ordenar el vector aplicando uno de los métodos
 vistos en la cursada.
 c) Un módulo que realice una búsqueda dicotómica. Este módulo debe recibir el vector
 generado en b) y un código de identificación de oficina. En el caso de encontrarlo, debe
 retornar la posición del vector donde se encuentra y en caso contrario debe retornar 0.
 Luego el programa debe informar el DNI del propietario o un cartel indicando que no
 se encontró la oficina.
 d) Unmódulorecursivo que retorne el monto total de las expensas}

program ejercicio;

type
	oficina = record
		codigo: integer;
		DNI: integer;
		expensa: real;
	end;
	
	vector = array[1..300]of oficina;
	
procedure leerOficina(var ofi: oficina);
begin
	writeln('ingrese el codigo de la oficina');
	readln(ofi.codigo);
	if(ofi.codigo <> (-1))then begin
		writeln('ingrese el DNI ');
		readln(ofi.DNI);
		writeln('ingrese el valor de la expensa de la oficina');
		readln(ofi.expensa);
	end;
end;	
	
procedure cargarVector(var vec: vector ; var dimL: integer);
var
	ofi: oficina;
begin
	leerOficina(ofi);
	while((ofi.codigo <> (-1)) AND (dimL < 300))do begin
		dimL:= dimL + 1;
		vec[dimL]:= ofi;
		if(dimL < 300)then 
			leerOficina(ofi);
	end;
end;

procedure ordenarVector(var vec: vector ; dimL: integer);
var
	i,j,p: integer;
	item: oficina;
begin
	for i:= 1 to (dimL - 1) do begin
		p:= i;
		for j:= i+1 to dimL do
			if (vec[j].codigo < vec[p].codigo) then
				p:= j;
		item:= vec[p];
		vec[p]:= vec[i];
		vec[i]:= item;
	end;
end;

function busquedaDicotomica(vec: vector ; dimL: integer ; num: integer):integer;
var
	encontre: boolean;
	min , max: integer;
	medio: integer;
	retorno: integer;
begin
	retorno:= 0;
	min:= 1;
	max:= dimL;
	medio:= (min + max) div 2;
	encontre:= false;
	while((encontre = false) AND (min <= max))do begin
		if(vec[medio].codigo = num)then begin
			encontre:= true;
			retorno:= medio;
		end
		else
			if(num < vec[medio].codigo)then begin
				max:= medio;
				medio:= (min + medio) div 2;
			end
			else begin
				min:= medio;
				medio:= (medio + max) div 2;
			end;
	end;
	busquedaDicotomica:= retorno;
end;

function buscarMontoTotal(vec: vector ; i: integer ; dimL: integer):real;
var
	retorno: real;
begin
	retorno:= 0;
	if(i <= dimL)then 
		retorno := retorno + vec[i].expensa + buscarMontoTotal(vec , i + 1 , dimL);
	buscarMontoTotal:= retorno;
end;
	
var
	vec: vector;
	dimL: integer;
	num: integer;
begin
	cargarVector(vec , dimL);
	ordenarVector(vec , dimL);
	writeln('Ingrese un codigo a buscar ');
	readln(num);
	writeln('Existe el codigo ingresado en el vector (0 si no existe <> si existe)?  ',busquedaDicotomica(vec , dimL, num));
	writeln('Monto total de las expensas : ' , buscarMontoTotal(vec , 1 , dimL):2:1);
end.
