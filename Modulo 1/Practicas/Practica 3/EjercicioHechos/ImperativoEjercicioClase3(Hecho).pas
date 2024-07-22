{Escribir un programa que:
a. Implemente un modulo que lea informacion de socios de un club y las almacene en un arbol binario de busqueda. De cada socio se lee numero de socio, 
nombre y edad. La lectura finaliza con el numero de socio 0 y el arbol debe quedar ordenado por numero de socio.
b. Una vez generado el arbol, realice modulos independientes que reciban el arbol como parametro y: 
    i. Informe el numero de socio mas grande. Debe invocar a un modulo recursivo que retorne dicho valor. 
    ii. Informe los datos del socio con el numero de socio mas chico. Debe invocar a un modulo recursivo que retorne dicho socio. 
    iii. Informe el numero de socio con mayor edad. Debe invocar a un modulo recursivo que retorne dicho valor. 
    iv. Aumente en 1 la edad de todos los socios.
    v. Lea un valor entero e informe si existe o no existe un socio con ese valor. Debe invocar a un modulo recursivo que reciba el valor lei­do y
       retorne verdadero o falso.
    vi. Lea un nombre e informe si existe o no existe un socio con ese valor. Debe invocar a un modulo recursivo que reciba el nombre lei­do y 
        retorne verdadero o falso.
    vii. Informe la cantidad de socios. Debe invocar a un modulo recursivo que retorne dicha cantidad.
    viii. Informe el promedio de edad de los socios. Debe invocar a un modulo recursivo que retorne dicho promedio.
    ix. Informe, a partir de dos valores que se leen, la cantidad de socios en el arbol cuyo numero de socio se encuentra entre 
        los dos valores ingresados. Debe invocar a un modulo recursivo que reciba los dos valores leÃ­dos y retorne dicha cantidad. 
    x. Informe los numeros de socio en orden creciente. 
    xi. Informe los numeros de socio pares en orden decreciente.
}

Program ImperativoClase3;

type rangoEdad = 12..100;
     cadena15 = string [15];
     socio = record
               numero: integer;
               nombre: cadena15;
               edad: rangoEdad;
             end;
     arbol = ^nodoArbol;
     nodoArbol = record
                    dato: socio;
                    HI: arbol;
                    HD: arbol;
                 end;
     
     
     
Procedure LeerSocio (var s: socio);
  begin
    write ('Ingrese numero del socio: ');
    readln (s.numero);
    If (s.numero <> 0)
    then begin
           write ('Ingrese nombre del socio: ');
           readln (s.nombre);
           write ('Ingrese edad del socio: ');
           readln (s.edad);
         end;
end;  
  
Procedure InsertarElemento (var a: arbol; elem: socio);
  Begin
    if (a = nil) 
    then begin
           new(a);
           a^.dato:= elem; 
           a^.HI:= nil; 
           a^.HD:= nil;
         end
    else 
		if (elem.numero <= a^.dato.numero)then 
			InsertarElemento(a^.HI, elem)
		else InsertarElemento(a^.HD, elem); 
End;
    
     
     
procedure GenerarArbol (var a: arbol);   {A}
{ Implemente un modulo que lea informacion de socios de un club y las almacene en un arbol binario de busqueda. De cada socio se lee numero de socio, 
nombre y edad. La lectura finaliza con el numero de socio 0 y el arbol debe quedar ordenado por numero de socio. }

var unSocio: socio;  
Begin
 writeln ('----- Ingreso de socios y armado del arbol ----->');
 a:= nil;
 LeerSocio(unSocio);
 while (unSocio.numero <> 0)do
  begin
   InsertarElemento (a, unSocio);
   LeerSocio(unSocio);
  end;
end;

function NumeroMasGrande (a: arbol): integer;
  begin
    if (a = nil) then NumeroMasGrande:= -1
    else 
		if (a^.HD = nil) then 
			NumeroMasGrande:= a^.dato.numero
		else 
			NumeroMasGrande:= NumeroMasGrande(a^.HD);
  end;

procedure InformarNumeroSocioMasGrande (a: arbol);
{Informe el numero de socio mas grande. Debe invocar a un modulo recursivo que retorne dicho valor.}
   
var max: integer;
begin
  writeln ('----- Informar Numero Socio Mas Grande ----->');
  max:= NumeroMasGrande (a);
  if (max = -1)then 
	writeln ('Arbol sin elementos')
  else 
	begin
         writeln ('Numero de socio mas grande: ', max);
	end;
end;

function SocioMasChico (a: arbol): arbol;
  begin
    if ((a = nil) or (a^.HI = nil))	then 
		SocioMasChico:= a
    else 
		SocioMasChico:= SocioMasChico (a^.HI);
  end;
   

procedure InformarDatosSocioNumeroMasChico (a: arbol);
{ Informe los datos del socio con el numero de socio mas chico. Debe invocar a un modulo recursivo que retorne dicho socio. }
   
var minSocio: arbol;
begin
  writeln ('----- Informar Datos Socio Numero Mas Chico ----->');
  minSocio:= SocioMasChico (a);
  if (minSocio = nil)then 
	writeln ('Arbol sin elementos')
  else 
	begin
         writeln ('Socio con numero mas chico: ', minSocio^.dato.numero, ' Nombre: ', minSocio^.dato.nombre, ' Edad: ', minSocio^.dato.edad); 
	end;
end;

procedure actualizarMaximo(var maxValor,maxElem : integer; nuevoValor, nuevoElem : integer);
	begin
	  if (nuevoValor >= maxValor) then
	  begin
		maxValor := nuevoValor;
		maxElem := nuevoElem;
	  end;
	end;
	
procedure NumeroMasEdad (a: arbol; var maxEdad: integer; var maxNum: integer);
	begin
	   if (a <> nil) then
	   begin
		  actualizarMaximo(maxEdad,maxNum,a^.dato.edad,a^.dato.numero);
		  numeroMasEdad(a^.hi, maxEdad,maxNum);
		  numeroMasEdad(a^.hd, maxEdad,maxNum);
	   end; 
	end;


procedure InformarNumeroSocioConMasEdad (a: arbol);
{ Informe el numero de socio con mayor edad. Debe invocar a un modulo recursivo que retorne dicho valor.  }
var maxEdad, maxNum: integer;
begin
  writeln ('----- Informar Numero Socio Con Mas Edad ----->');
  maxEdad := -1;
  NumeroMasEdad (a, maxEdad, maxNum);
  if (maxEdad = -1) 
  then writeln ('Arbol sin elementos')
  else begin
         writeln ('Numero de socio con mas edad: ', maxNum);
       end;
end;

procedure AumentarEdad (a: arbol);
begin
 if (a <> nil)
 then 
	begin
        a^.dato.edad:= a^.dato.edad + 1;
        AumentarEdad (a^.HI);
        AumentarEdad (a^.HD);
      end;
end;

function Buscar (a: arbol; num: integer): boolean;
  begin
    if (a = nil)then 
		Buscar:= false
    else 
		If (a^.dato.numero = num) then 
			Buscar:= true
         else 
			if (num < a^.dato.numero)then 
				Buscar:= Buscar (a^.HI, num)
			else 
				Buscar:= Buscar (a^.HD, num);
  end;
  

procedure InformarExistenciaNumeroSocio (a: arbol);
{ Lea un valor entero e informe si existe o no existe un socio con ese valor. Debe invocar a un modulo recursivo que reciba el valor lei­do y
       retorne verdadero o falso. }
       
var numABuscar: integer;
begin
	writeln ('----- Informar Existencia Numero Socio ----->');
	write ('Ingrese numero de socio a buscar: ');
	Readln (numABuscar);
	if (Buscar (a, numABuscar)) then 
		writeln ('El numero ', numABuscar, ' existe')
	else 
		writeln ('El numero ', numABuscar, ' no existe');

end;

{function BuscarNom (a: arbol; nom: cadena15): boolean;
  begin
    if (a = nil)then 
		BuscarNom:= false
    else 
		If (a^.dato.nombre = nom) then 
			BuscarNom:= true
         else 
			if (nom <> a^.dato.nombre)then 
				BuscarNom:= BuscarNom (a^.HI, nom)
			else 
				BuscarNom:= BuscarNom (a^.HD, nom);
  end;}
  
function BuscarNom(a: arbol ; nom : cadena15): boolean;    {preguntar porque en video dice que esta mal}
begin
	if(a = nil)then begin
		BuscarNom(a^.HI,nom);
		if (a^.dato.nombre = nom)then 
			BuscarNom:= true;
		BuscarNom(a^.HD,nom);
	end;
end;

procedure InformarExistenciaNombreSocio(a: arbol);
var nomABuscar: cadena15;
begin
	writeln ('----- Informar Existencia Nombre Socio ----->');
	write ('Ingrese un nombre de socio a buscar: ');
	Readln (nomABuscar);
	if (BuscarNom (a, nomABuscar)) then 
		writeln ('El nombre ', nomABuscar, ' existe')
	else 
		writeln ('El nombre ', nomABuscar, ' no existe');

end;

  
procedure  InformarCantidadSocios (a: arbol ; var cantidad : integer);
begin
	if(a <> nil) then 
		begin
			InformarCantidadSocios(a^.HI,cantidad);
			cantidad:= cantidad +1;
			InformarCantidadSocios(a^.HD,cantidad);
		end;
end;
  
procedure InformarPromedioDeEdad(a: arbol ; var sumaTotal: integer  ; cantidad: integer ; var prom: real);
begin
	if(a <> nil) then 
		begin
			InformarPromedioDeEdad(a^.HI,sumaTotal,cantidad,prom);
			sumaTotal:= sumaTotal + a^.dato.edad;
			InformarPromedioDeEdad(a^.HD,sumaTotal,cantidad,prom);
		end;
		prom:= (sumaTotal / cantidad);
end;
    
  
procedure  InformarCantidadSociosEnRango (a: arbol ; var cantidad2 : integer; val1,val2: integer);
begin
	if(a <> nil) and (a^.dato.numero >= val1) and (a^.dato.numero <= val2) then 
		begin
			InformarCantidadSociosEnRango(a^.HI,cantidad2,val1,val2);
			cantidad2:= cantidad2 +1;
			InformarCantidadSociosEnRango(a^.HD,cantidad2,val1,val2);
		end;
end;  
  
  
procedure InformarNumerosSociosOrdenCreciente(a: arbol);
begin
	if(a <> nil)then begin
		InformarNumerosSociosOrdenCreciente(a^.HI);
		writeln(a^.dato.numero);
		InformarNumerosSociosOrdenCreciente(a^.HD);
	end;
end;

procedure InformarNumerosSociosOrdenDeCreciente(a: arbol);
begin
	if(a <> nil)then begin
		InformarNumerosSociosOrdenDeCreciente(a^.HI);
		InformarNumerosSociosOrdenDeCreciente(a^.HD);
		writeln(a^.dato.numero);
	end;
end;
  
var 
	a: arbol; 
	cantidad,cantidad2: integer;
	sumaTotal: integer;
	prom: real;
	val1, val2: integer;
Begin
	cantidad2:= 0;
	prom:= 0;
	sumaTotal:= 0;
	cantidad:= 0;
	GenerarArbol (a); {a}
	InformarNumeroSocioMasGrande (a);  {b,i}
	InformarDatosSocioNumeroMasChico (a); {ii}
	InformarNumeroSocioConMasEdad (a); {iii}
	AumentarEdad (a); {iv}
	InformarExistenciaNumeroSocio (a); {v}   {hasta aca va bien} 
	InformarExistenciaNombreSocio (a);	{vi}		 {desde aca hiciste vos, preguntar}
    InformarCantidadSocios (a,cantidad); {vii}
    writeln('la cantidad de socios es : ', cantidad);    {preguntar}
    InformarPromedioDeEdad (a,sumaTotal,cantidad,prom); {creo que esta bien}  {viii}
    writeln('el promedio de edad es: ', prom:2:2); 
    writeln('delimitar rango 1');
    readln(val1);
    writeln('delimitar rango 2');
    readln(val2);
    InformarCantidadSociosEnRango (a,cantidad2,val1,val2); {ix}
    writeln('la cantidad de socios en rango es de : ', cantidad2); {preguntar}
    InformarNumerosSociosOrdenCreciente (a); {x}
    InformarNumerosSociosOrdenDeCreciente (a); {xi}
End.
