progtam parcialDosMILDieciNueve;

type
	
	voto = record
		nombre: string;
		topico: string;
	end;


	arbol = ^nodo;
	nodo = record
		dato: voto;
		HI: arbol;
		HD: arbol;
	end;

begin
end.
