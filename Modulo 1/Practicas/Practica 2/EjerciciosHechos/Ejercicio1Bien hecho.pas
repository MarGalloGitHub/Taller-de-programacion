Program Clase2MI;
const dimF = 10;
type vector = array [1..dimF] of char;
     lista = ^nodo;
     nodo = record
              dato: char;
              sig: lista;
            end;
            
 procedure CargarVectorRecursivo (var v: vector; var dimL: integer);
  var caracter: char;
  begin
    write ('Ingrese un caracter: ');
    readln(caracter);  
    if (caracter <> '.' ) and (dimL < dimF) 
    then begin
          dimL:= dimL + 1;
          v[dimL]:= caracter;
          CargarVectorRecursivo (v, dimL);
         end;
  end;
  

procedure CargarVector (var v: vector; var dimL: integer);
begin
  dimL:= 0;
  CargarVectorRecursivo (v, dimL);
end;

procedure ImprimirVectorRecursivo(v: vector ; dimL: integer);

begin	
	if(dimL > 0)then begin											{preguntar}
		ImprimirVectorRecursivo(v,dimL-1);
		writeln(v[dimL]);
	end;
end;
	
procedure ContarCaracteres(var cont: integer);
var caracter: char;
Begin
	write ('Ingrese un caracter: ');
	readln(caracter);  
	if (caracter <> '.' ) then begin
		cont:= cont +1;
		ContarCaracteres(cont);
	end;
End;
	
procedure CargarLista (var l: lista);
var caracter: char;
    nuevo: lista;
Begin
  write ('Ingrese un caracter: ');
  readln(caracter);  
  if (caracter <> '.' )then begin
         CargarLista (l);
         new (nuevo);
         nuevo^.dato:= caracter;
         nuevo^.sig:= l;
         l:= nuevo;
       end
  else l:= nil		
End;

procedure ImprimirListaMismoOrden (l: lista);
begin
	if (l<> nil) then begin
		writeln('el caracter es ','  ', l^.dato);  
        ImprimirListaMismoOrden (l^.sig);
	end;
end;

procedure ImprimirListaOrdenInvertido (l: lista);
begin
	if (l<> nil) then begin 
        ImprimirListaOrdenInvertido (l^.sig);
        writeln('el caracter es ','  ', l^.dato); 
	end;
end;


var 
	cont,dimL: integer; v: vector;	l: lista;
Begin 
	cont:= 0;
	CargarVector (v, dimL);
	ImprimirVectorRecursivo(v,dimL);
	ContarCaracteres(cont);
	writeln(cont);
	CargarLista(l);
	ImprimirListaMismoOrden(l);
	ImprimirListaOrdenInvertido(l);
end.
