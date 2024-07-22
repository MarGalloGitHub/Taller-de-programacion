{Realizar un programa que lea números y que utilice un módulo recursivo que escriba el
equivalente en binario de un número decimal. El programa termina cuando el usuario ingresa
el número 0 (cero)}

program

type
	rangoBinario = 0..1;
	binario: rangoBinario;
		
	vector = array[1..8]of binario;

begin
	read(num);
	pasarBinario(num);
end.

{preguntar}
