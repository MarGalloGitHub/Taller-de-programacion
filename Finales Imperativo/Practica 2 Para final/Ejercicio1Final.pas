{1.- Implementar un programa que invoque a los siguientes módulos.
* 
a. Un módulo recursivo que permita leer una secuencia de caracteres terminada en punto, los
almacene en un vector con dimensión física igual a 10 y retorne el vector.
* 
b. Un módulo que reciba el vector generado en a) e imprima el contenido del vector.
* 
c. Un módulo recursivo que reciba el vector generado en a) e imprima el contenido del vector..
* 
d. Un módulo recursivo que permita leer una secuencia de caracteres terminada en punto y
retorne la cantidad de caracteres leídos. El programa debe informar el valor retornado.
* 
e. Un módulo recursivo que permita leer una secuencia de caracteres terminada en punto y
retorne una lista con los caracteres leídos.
* 
f. Un módulo recursivo que reciba la lista generada en e) e imprima los valores de la lista en el
mismo orden que están almacenados.
* 
g. Implemente un módulo recursivo que reciba la lista generada en e) e imprima los valores de
la lista en orden inverso al que están almacenados.
* }
program Ejercicio1Final;
const
	dF = 5;
type
	vector = array[1..dF] of char;
	
	lista = ^nodo;
	nodo = record
		dato: char;
		sig: lista;
	end;

procedure cargarVectorRecursivo(var vec: vector ; var dimL: integer);
var
	character: char;
begin
	writeln('Ingrese un caracter');
	readln(character);
	if((character <> '.') AND (dimL < dF))then begin
		dimL:= dimL + 1;
		vec[dimL]:= character;
		if(dimL < dF)then begin
			writeln('');
			cargarVectorRecursivo(vec , dimL);
		end;
	end;
end;

procedure mostrarVector(vec: vector ; dimL: integer);
var
	i: integer;
begin
	for i:= 1 to dimL do begin
		writeln('Vector en posicion: ' , i , ' contiene :  ', vec[i]);
	end;
end;

procedure mostrarVectorRecursivo(vec: vector ; dimL: integer ; i: integer);
begin
	if(i <= dimL)then begin
		writeln('Vector en posicion: ' , i , ' contiene :  ', vec[i]);
		i:= i + 1;
		mostrarVectorRecursivo(vec , dimL , i);
	end;
end;

function calcularCantidadRecursivo(): integer;
var
	caracter: char;
begin
	writeln('Ingrese un caracter');
	readln(caracter);
	if(caracter = '.')then begin
		calcularCantidadRecursivo:= 0;
	end
	else
		calcularCantidadRecursivo:= calcularCantidadRecursivo() + 1;	
end;

{e. Un módulo recursivo que permita leer una secuencia de caracteres terminada en punto y
retorne una lista con los caracteres leídos.}

procedure CargarLista (var l: lista);
var caracter: char;
    nuevo: lista;
Begin
  write ('Ingrese un caracter: ');
  readln(caracter);  
  if(caracter <> '.' )then begin
	CargarLista (l);
    new (nuevo);
	nuevo^.dato:= caracter;
    nuevo^.sig:= l;
    l:= nuevo;
  end
  else 
	l:= nil;
end;

procedure ImprimirListaMismoOrden (l: lista);
begin
	if(l<> nil) then begin
		write (' ', l^.dato);
		ImprimirListaMismoOrden (l^.sig);
	end;
end;

procedure ImprimirListaOtroOrden (l: lista);
begin
	if(l<> nil) then begin
		ImprimirListaMismoOrden (l^.sig);
		write (' ', l^.dato);
	end;
end;



var
	vec: vector;
	dimL: integer;
	i, num: integer;
	l: lista;
begin
	l:= nil;
	dimL:= 0;
	i:= 1;
	cargarVectorRecursivo(vec , dimL); {a}
	writeln('Mostrando iterativamente');
	mostrarVector(vec, dimL); {b}
	writeln('');
	writeln('Mostrando recursivamente');
	mostrarVectorRecursivo(vec , dimL , i); {c}
	writeln('');
	num:= calcularCantidadRecursivo; {d}
	writeln('Valor mostrado por funcion recursiva: ' , num);
	cargarLista(l); {e}
	writeln('');
	ImprimirListaMismoOrden (l); {f}
	writeln('');
	ImprimirListaOtroOrden (l); {h}
end.
