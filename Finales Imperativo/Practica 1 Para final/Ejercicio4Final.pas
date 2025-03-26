
{4.- Una librería requiere el procesamiento de la información de sus productos. De cada
producto se conoce el código del producto, código de rubro (del 1 al 8) y precio.
Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:
a. Lea los datos de los productos y los almacene ordenados por código de producto y
agrupados por rubro, en una estructura de datos adecuada. El ingreso de los productos finaliza
cuando se lee el precio 0.
b. Una vez almacenados, muestre los códigos de los productos pertenecientes a cada rubro.
c. Genere un vector (de a lo sumo 30 elementos) con los productos del rubro 3. Considerar que
puede haber más o menos de 30 productos del rubro 3. Si la cantidad de productos del rubro 3
es mayor a 30, almacenar los primeros 30 que están en la lista e ignore el resto.
d. Ordene, por precio, los elementos del vector generado en c) utilizando alguno de los dos
métodos vistos en la teoría.
e. Muestre los precios del vector resultante del punto d).
f. Calcule el promedio de los precios del vector resultante del punto d)}

program Ejercicio4Final;
type
	rangoRubro = 1..8;
	producto = record
		codigo: integer;
		rubro: rangoRubro;
		precio: real;
	end;
	
	miniProducto = record
		codigo: integer;
		precio: real;
	end;
	
	lista = ^nodo;
	nodo = record
		dato: miniProducto;
		sig:lista;
	end;
	
	vector = array[rangoRubro] of lista;
	
	rangoC = 1..30;
	vectorC = array[rangoC] of miniProducto;
	
	
procedure InicializarVector(var vec: vector);
var
	i: rangoRubro;
begin
	for i:= 1 to 8 do begin
		vec[i]:= nil;
	end;
end;

procedure leerProducto(var prod: producto);
begin
	writeln('Ingrese el codigo del producto');
	readln(prod.codigo);
	if(prod.codigo <> 0)then begin
		writeln('Ingrese el rubro del producto');
		readln(prod.rubro);
		writeln('Ingrese el precio del producto');
		readln(prod.precio);
	end;
end;	

procedure insertarOrdenado(var list: lista ; prod:producto);
var
	nue,ant,act: lista;
begin
	new(nue);
	nue^.dato.codigo:= prod.codigo;
	nue^.dato.precio:= prod.precio;
	act:= list;   {act y ant al comienzo de la lista}
	ant:= list;
	while((act <> nil) and (list^.dato.codigo < prod.codigo))do begin
		ant:= act;
		act:= act^.sig;
	end;
	if(act = ant)then    {al inicio de la lista vacia}
		list:= nue
	else                 {al medio o al final}
		ant^.sig:= nue;
	nue^.sig:= act;
end;

procedure cargarVector(var vec: vector);
var
	prod: producto;
begin
	InicializarVector(vec);
	leerProducto(prod);
	while(prod.codigo <> 0)do begin
		insertarOrdenado(vec[prod.rubro] , prod);
		leerProducto(prod);
	end;
end;	

procedure mostrarVector(vec: vector);
var
	i: rangoRubro;
begin
	for i:= 1 to 8 do begin
		if(vec[i] <> nil) then begin
			writeln('Codigos de productos del rubro ' , i);
			while(vec[i] <> nil)do begin
				writeln(vec[i]^.dato.codigo);
				vec[i]:= vec[i]^.sig;
			end;
		end
		else
			writeln('No hay productos en el rubro ' , i);
	end;
end;

{c. Genere un vector (de a lo sumo 30 elementos) con los productos del rubro 3. Considerar que
puede haber más o menos de 30 productos del rubro 3. Si la cantidad de productos del rubro 3
es mayor a 30, almacenar los primeros 30 que están en la lista e ignore el resto.}

procedure cargarVectorIncisoC(vec: vector ; var vecMax: vectorC ; var dimL: integer);
begin
	if(vec[3] <> nil)then begin
		while((vec[3] <> nil) AND (dimL < 4))do begin   {iniciada la dimL en 0 carga hasta 4 elementos en el vector}
			dimL:= dimL + 1;
			vecMax[dimL]:= vec[3]^.dato;
			vec[3]:= vec[3]^.sig;
		end;
	end
	else	
		writeln('El rubro 3 no tiene productos');
end;

procedure mostrarVectorC(vecMax: vectorC ; dimL: integer);
var
	i: rangoC;
begin
	if(dimL = 0)then 
		writeln('El rubro 3 no tenia productos')
	else begin
		writeln('El rubro 3 cuenta con estos productos');
		for i:= 1 to dimL do begin
			writeln('Codigo de producto: ',vecMax[i].codigo);
		end;
	end;
	
end;

procedure mostrarVectorC2(vecMax: vectorC ; dimL: integer);
var
	i: rangoC;
begin
	if(dimL = 0)then 
		writeln('El rubro 3 no tenia productos')
	else begin
		writeln('El rubro 3 cuenta con estos precios de productos');
		for i:= 1 to dimL do begin
			writeln('Precio de producto: ',vecMax[i].precio:2:1);
		end;
	end;
	
end;

{d. Ordene, por precio, los elementos del vector generado en c) utilizando alguno de los dos
métodos vistos en la teoría.}
procedure ordenarInsercion(var vecMax: vectorC ; dimL: integer);
var
	i,j: integer;
	item: miniProducto;
begin
	for i:= 2 to  dimL do begin
		item:= vecMax[i];
		j:= i - 1;
		while((j > 0) AND (vecMax[j].precio > item.precio))do begin
			vecMax[j+1]:= vecMax[j];
			j:= j - 1;
		end;
		vecMax[j+1]:= item;
	end;
end;

procedure calcularPromedio(vecMax: vectorC ; dimL: integer);
var
	suma: real;
	i: rangoC;
begin
	suma:= 0;
	if(dimL <> 0) then begin
		for i:= 1 to dimL do begin
			suma:= suma + vecMax[i].precio;
		end;
		suma:= (suma/dimL);
		writeln('El promedio de precios es: ' , suma:2:1);
	end
	else
		writeln('No se puede calcular el precio porque no hay productos');
end;

var
	vec: vector;
	vecMax: vectorC;
	dimL: integer;
begin
	cargarVector(vec); {a}
	writeln('Almacenamiento de datos');
	writeln('');
	mostrarVector(vec); {b}
	cargarVectorIncisoC(vec , vecMax , dimL); {c}
	writeln('');
	writeln('Almacenamiento de datos del rubro 3');
	writeln('');
	mostrarVectorC(vecMax,dimL); 
	ordenarInsercion(vecMax,dimL); {d}
	writeln('Almacenamiento de datos del rubro 3 pero ordenados por precio ');
	writeln('');
	mostrarVectorC2(vecMax,dimL);  {e}
	writeln('');
	calcularPromedio(vecMax,dimL); {f}
end.
