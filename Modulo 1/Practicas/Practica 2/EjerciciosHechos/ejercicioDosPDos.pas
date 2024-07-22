{- Realizar un programa que lea números hasta leer el valor 0 e imprima, para cada número
leído, sus dígitos en el orden en que aparecen en el número. Debe implementarse un módulo
recursivo que reciba el número e imprima lo pedido. Ejemplo si se lee el valor 256, se debe
imprimir 2 5 6}

program ejercicioDos;

procedure imprimirRecursivo(num: integer);
var
	digito: integer;
begin
	if(num <> 0)then begin					{pensar al reves}
		digito:= num MOD 10;
		num:= num Div 10;
		imprimirRecursivo(num);
		writeln(digito);
	end;
end;


var
	num: integer;
begin
	writeln('escriba un numero');
	readln(num);
	while (num <> 0) do begin
		imprimirRecursivo(num);
		writeln('escriba un numero');
		read(num);
	end;
end.
