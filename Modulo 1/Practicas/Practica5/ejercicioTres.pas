{
3. Un supermercado requiere el procesamiento de sus productos. De cada producto se
conoce código, rubro (1..10), stock y precio unitario. Se pide:

a) Generar una estructura adecuada que permita agrupar los productos por rubro. A su
vez, para cada rubro, se requiere que la búsqueda de un producto por código sea lo
más eficiente posible. La lectura finaliza con el código de producto igual a -1.

b) Implementar un módulo que reciba la estructura generada en a), un rubro y un código
de producto y retorne si dicho código existe o no para ese rubro.

c) Implementar un módulo que reciba la estructura generada en a), y retorne, para cada
rubro, el código y stock del producto con mayor código.

d) Implementar un módulo que reciba la estructura generada en a), dos códigos y
retorne, para cada rubro, la cantidad de productos con códigos entre los dos valores
ingresados. 
 
}

program ejercicioCinco;

type
	rangoRubro = 1..10;
	
	producto = record
		codigo:integer;
		rubro:rangoRubro;
		stock:integer;
		precioUnitario:real;
	end;
	
	productoSin = record
		codigo:integer;
		stock:integer;
		precioUnitario:real;
	end;
	
	arbolProductos = ^nodo;
	nodo = record
		dato:productoSin;
		HI:arbolProductos;
		HD:arbolProductos;
	end;
	
	dosCosas = record
		codigo:integer;
		stock:integer;
	end;
	
	vector = Array [rangoRubro] of arbolProductos;
	vectorChico = Array[rangoRubro] of dosCosas;

procedure leerProducto(var prod:producto);
begin
	writeln('Ingrese el codigo de producto');
	readln(prod.codigo);
	if(prod.codigo <> (-1))then begin
		writeln('Ingrese el stock del producto');
		readln(prod.stock);
		writeln('Ingrese el rubro del producto - num del 1 al 10');
		readln(prod.rubro);
		writeln('Ingrese el precio del producto');
		readln(prod.precioUnitario);
	end;
end;

procedure armarProductoSin(var prodSin:productoSin ; prod:producto);
begin
	prodSin.stock:=prod.stock;
	prodSin.precioUnitario:= prod.precioUnitario;
	prodSin.codigo:=prod.codigo;
end;

procedure agregarAlArbol(var a:arbolProductos; prod:producto);
var
	prodSin:productoSin;
begin
	if(a = nil)then begin
		new(a);
		a^.HI:=nil;
		a^.HD:=nil;
		armarProductoSin(prodSin,prod);
		a^.dato:=prodSin;
	end
	else
		if(prod.codigo <= a^.dato.codigo)then 
			agregarAlArbol(a^.HI,prod)
		else
			agregarAlArbol(a^.HD,prod);
end;


procedure cargarVector(var vec: vector);
var
	prod:producto;
begin
	leerProducto(prod);
	while(prod.codigo <> (-1))do begin
		agregarAlArbol(vec[prod.rubro],prod);
		leerProducto(prod);
	end;
end;

procedure mostrarProducto(prodSin:productoSin);
begin
	writeln(' ');
	writeln('Codigo del producto: ' , '  ' , prodSin.codigo);
	writeln('Stock del producto: ' , '  ' , prodSin.stock);
	writeln('Precio del producto: ' , '  ' , prodSin.precioUnitario:0:1);
	writeln(' ');
end;

procedure mostrarArbol(a:arbolProductos);
begin
	if(a <> nil)then begin
		mostrarArbol(a^.HI);
		mostrarProducto(a^.dato);
		mostrarArbol(a^.HD);
	end;
end;

procedure mostrarVector(vec:vector);
var
	i:rangoRubro;
begin
	for i:= 1 to 10 do begin
		writeln('Para el rubro : ' , '  ', i);
		if(vec[i] <> nil)then 
			mostrarArbol(vec[i])
		else
			writeln('No se cargaron productos');
	end;
end;

procedure buscarEnArbolRubro(a:arbolProductos ; codigo:integer; var encontre:boolean);
begin
	if((a <> nil) AND (encontre = false))then begin
		if(codigo = a^.dato.codigo)then 
			encontre:=true
		else
			if(codigo < a^.dato.codigo)then
				buscarEnArbolRubro(a^.HI,codigo,encontre)
			else
				buscarEnArbolRubro(a^.HD,codigo,encontre);
	end;
end;

function buscarCodigoPorRubro(vec:vector ; rubro:rangoRubro ; codigo:integer):boolean;
var
	encontre:boolean;
begin
	encontre:=false;
	buscarEnArbolRubro(vec[rubro],codigo,encontre);
	buscarCodigoPorRubro:= encontre;
end;

procedure sacarMaximo(a:arbolProductos ; var prodSin:productoSin);
begin
	if(a^.HD = nil)then 
		prodSin:= a^.dato
	else
		sacarMaximo(a^.HD,prodSin);
end;

procedure InicializarVectorChico(var vecChico: vectorChico);
var
	i:rangoRubro;
begin
	for i:= 1 to 10 do begin
		vecChico[i].codigo:=0;
		vecChico[i].stock:=0;
	end;
end;

procedure cargarVectorChico(var vecChico:vectorChico ; vec:vector);
var
	i:rangoRubro;
	prodSin:productoSin;
	cosas:dosCosas;
begin
	InicializarVectorChico(vecChico);
	for i:= 1 to 10 do begin
		if(vec[i] <> nil)then begin
			sacarMaximo(vec[i],prodSin);
			cosas.codigo:=prodSin.codigo;
			cosas.stock:=prodSin.stock;
			vecChico[i]:=cosas;
		end;
	end;
end;

procedure mostrarVectorChico(vecChico:vectorChico);
var
	i:rangoRubro;
begin
	for i:= 1 to 10 do begin
		writeln('Para el rubro: ' , ' ', i ,',el producto con mayor codigo fue:  ');
		if(vecChico[i].codigo = 0)then 
			writeln('No se cargaron productos')
		else 
			begin
				writeln('Codigo: ' , vecChico[i].codigo);
				writeln('Stock: ' , vecChico[i].stock);
			end;
		writeln(' ');
	end;
end;

procedure sacarCantidad(a:arbolProductos ; limInferior: integer; limSuperior:integer ; var cant:integer);
begin
	if(a <> nil)then
		if(a^.dato.codigo > limInferior)then
			if(a^.dato.codigo < limSuperior) then begin
				writeln('Encontre uno');
				cant:=cant + 1;
				sacarCantidad(a^.HI,limInferior,limSuperior,cant);
				sacarCantidad(a^.HD,limInferior,limSuperior,cant);
			end
			else
				sacarCantidad(a^.HI,limInferior,limSuperior,cant)
		else
			sacarCantidad(a^.HD,limInferior,limSuperior,cant);
end;

procedure incisoD(vec:vector);
var
	codigoUno:integer;
	codigoDos:integer;
	i:rangoRubro;
	cant:integer;
begin
	writeln('Ingrese el limite inferior');
	readln(codigoUno);
	writeln('Ingrese el limite superior');
	readln(codigoDos);
	for i:= 1 to 10 do begin
		cant:=0;
		if(vec[i] = nil)then 
			writeln('No hay elementos cargados para el rubro: ' , ' ' , i)
		else
			begin
				sacarCantidad(vec[i],codigoUno,codigoDos,cant);
				writeln('Para el rubro ', i , ' ' , 'tiene: ' , cant, ' ' , 'codigos entre los codigos ingresados');
			end;
	end;
end;

var
	vec:vector;
	rubro:rangoRubro;
	codigo:integer;
	existe:boolean;
	vecChico:vectorChico;
begin
	cargarVector(vec);  												//Inciso A
	mostrarVector(vec); 												//para mi
	writeln('Ingrese el codigo que desea buscar');
	readln(codigo);
	writeln('Ingrese un rubro donde buscar el codigo');
	readln(rubro);
	existe:=buscarCodigoPorRubro(vec,rubro,codigo); 					//Inciso B
	if(existe = true)then
		writeln('El codigo :' , ' ', codigo ,'  existe en el rubro ' , '  ' , rubro)
	else
		writeln('El codigo no se encuentra en el rubro especificado');
	cargarVectorChico(vecChico,vec);
	writeln(' ');														//Inciso C
	mostrarVectorChico(vecChico);
	incisoD(vec);														//Inciso D
end.
