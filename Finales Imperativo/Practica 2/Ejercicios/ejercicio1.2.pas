{1.- Implementar un programa que invoque a los siguientes módulos.
a. Un módulo recursivo que permita leer una secuencia de caracteres terminada en punto, los
almacene en un vector con dimensión física igual a 10 y retorne el vector.
b. Un módulo que reciba el vector generado en a) e imprima el contenido del vector.
c. Un módulo recursivo que reciba el vector generado en a) e imprima el contenido del vector..
d. Un módulo recursivo que permita leer una secuencia de caracteres terminada en punto y
retorne la cantidad de caracteres leídos. El programa debe informar el valor retornado.
e. Un módulo recursivo que permita leer una secuencia de caracteres terminada en punto y
retorne una lista con los caracteres leídos.
f. Un módulo recursivo que reciba la lista generada en e) e imprima los valores de la lista en el
mismo orden que están almacenados.
g. Implemente un módulo recursivo que reciba la lista generada en e) e imprima los valores de
la lista en orden inverso al que están almacenados.
}
program ejercicioUno;
const
	dF = 10;
type

	vector = array[1..dF] of char;
	
	lista = ^nodo;
	nodo = record
		dato: char;
		sig: lista;
	end;
	
procedure cargar(var V: vector ; var dimL: integer);
var
	c: char;
begin
	writeln('ingrese un caracter');
	readln(c);
	if(c <> '.') AND (dimL < dF)then begin
		dimL:= dimL +1;
		V[dimL]:= c;
		cargar(V,dimL);
	end;
		
end;

procedure imprimir(V: vector ; dimL: integer);
var
	i: integer;
begin 
	for i:= 1 to dimL do 
		writeln('el vector en la posicion: ',i, 'tiene:',V[i]);
end;

procedure imprimirRecursivo(V: vector ; dimL: integer ; i: integer);
begin
	if(i < dimL)then begin
		i:= i +1;
		writeln('el vector en la posicion: ',i, 'tiene:',V[i]);
		imprimirRecursivo(V,dimL,i);
	end;
end;

function contarCaracteres(): integer;
var
	c: char;
begin
	writeln('para  inciso d escriba un caracter');
	readln(c);
	if(c = '.')then
		ContarCaracteres:= 0
	else 
		ContarCaracteres:= ContarCaracteres() + 1;
		
end;

procedure agregarAdelante(var L: lista ; c: char);
var
	nue: lista;
begin
	new(nue);
	nue^.dato:= c;
	nue^.sig:= L;
	L:= nue;
end;

procedure cargarListaRecursivo(var L: lista);
var
	c: char;
begin
	writeln('para el inciso e escriba un caracter:');
	readln(c);
	if(c <> '.')then begin
		agregarAdelante(L,c);	
		cargarListaRecursivo(L);
	end;
end;

procedure imprimirLista(L: lista);
begin
	if(L <> nil)then begin
		imprimirLista(L^.sig);
		writeln('el valor que esta en este nodo es: ',L^.dato);
	end;
end;

procedure imprimirListaInvertido(L: lista);
begin
	if(L <> nil)then begin
		writeln('el valor que esta en este nodo es: ',L^.dato);
		imprimirListaInvertido(L^.sig);
	end;
end;

var
	V: vector;
	dimL,i,cont: integer;
	L: lista;
begin
	L:= nil;
	i:= 0;
	dimL:= 0;
	cargar(V,dimL); {a}
	imprimir(V,dimL); {b}
	imprimirRecursivo(V,dimL,i); {c}
	cont:= contarCaracteres(); {d}
	writeln('la cantidad de caracteres fueron: ', cont);
	cargarListaRecursivo(L); {e}
	imprimirLista(L); {f}
	imprimirListaInvertido(L); {g}
end.
