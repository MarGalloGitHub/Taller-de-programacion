{Implementar un programa modularizado para una librería que:
a. Almacene los productos vendidos en una estructura eficiente para la búsqueda por código de producto. De cada producto deben quedar almacenados la cantidad total 
de unidades vendidas y el monto total. De cada venta se lee código de venta, código del producto vendido, cantidad de unidades vendidas y precio unitario. 
El ingreso de las ventas finaliza cuando se lee el código de venta -1.
b. Imprima el contenido del árbol ordenado por código de producto.
c. Contenga un módulo que reciba la estructura generada en el punto a y retorne el código de producto con mayor cantidad de unidades vendidas.
d. Contenga un módulo que reciba la estructura generada en el punto a y un código de producto y retorne la cantidad de códigos menores que él que hay en la 
estructura.
e. Contenga un módulo que reciba la estructura generada en el punto a y dos códigos de producto y retorne el monto total entre todos los códigos de productos 
comprendidos entre los dos valores recibidos (sin incluir).
}

Program ImperativoClase4;

type rangoEdad = 12..100;
     cadena15 = string [15];
     venta = record
               codigoVenta: integer;
               codigoProducto: integer;
               cantUnidades: integer;
               precioUnitario: real;
             end;
     productoVendido = record
                         codigo: integer;
                         cantTotalUnidades: integer;
                         montoTotal: real;
                       end;
     arbol = ^nodoArbol;
     nodoArbol = record
                    dato: productoVendido;
                    HI: arbol;
                    HD: arbol;
                 end;
     
  Procedure LeerVenta (var v: venta);
  begin
    writeln ('Ingrese codigo de venta: ');
    readln (v.codigoVenta);
    If (v.codigoVenta <> -1)
    then
		begin
           write ('Ingrese codigo de producto: ');
           readln (v.codigoProducto);
           write ('Ingrese cantidad de unidades: ');
           readln (v.cantUnidades);
           write ('Ingrese precio unitario: ');
           readln (v.precioUnitario);
         end;
  end;  
  
Procedure ArmarProducto (var p: productoVendido; v: venta);
     begin
       p.codigo:= v.codigoProducto;
       p.cantTotalUnidades:= v.cantUnidades;
       p.montoTotal:= v.cantUnidades * v.precioUnitario;
     end;
  
Procedure InsertarElemento (var a: arbol; elem: venta);
  var p: productoVendido;
Begin
    if (a = nil) then 
		begin
           new(a);
           ArmarProducto (p, elem);
           a^.dato:= p; 
           a^.HI:= nil; 
           a^.HD:= nil;
         end
    else
		if (elem.codigoProducto = a^.dato.codigo) then
			begin
                a^.dato.cantTotalUnidades:= a^.dato.cantTotalUnidades + elem.cantUnidades;
                a^.dato.montoTotal:= a^.dato.montoTotal + (elem.cantUnidades * elem.precioUnitario);
              end
         else
			if (elem.codigoProducto < a^.dato.codigo)then
				InsertarElemento(a^.HI, elem)
              else
				InsertarElemento(a^.HD, elem); 
  End;
procedure ModuloA (var a: arbol); { Almacene los productos vendidos en una estructura eficiente para la búsqueda por código de producto. De cada producto deben quedar almacenados la cantidad total 
de unidades vendidas y el monto total. }

var unaVenta: venta;  
Begin
 writeln ('----- Ingreso de ventas y armado de arbol de productos ----->');
 a:= nil;
 LeerVenta (unaVenta);
 while (unaVenta.codigoVenta <> -1) do
  begin
   InsertarElemento (a, unaVenta);
   LeerVenta (unaVenta);
  end;
end;

procedure ImprimirArbol (a: arbol);
  begin
    if (a <> nil)then 
		begin
			ImprimirArbol (a^.HI);
			writeln ('Codigo producto: ', a^.dato.codigo, ' cantidad unidades: ', a^.dato.cantTotalUnidades, ' monto: ', a^.dato.montoTotal:2:2);
			ImprimirArbol (a^.HD);
         end;
  end;

procedure ModuloB (a: arbol);
{ Imprima el contenido del árbol ordenado por código de producto.}

begin
  writeln ('----- Modulo B ----->');
  if ( a = nil) then
	writeln ('Arbol vacio')
   else
		ImprimirArbol (a);
end;

procedure chequearMaximo(a:arbol; var maxCant: integer; var maxCod: integer);
	begin
		    if(a^.dato.cantTotalUnidades > maxCant)then begin
				maxCant:= a^.dato.cantTotalUnidades;
				maxCod:= a^.dato.codigo;
			end;
	end;

procedure CodigoDeProductoConMayorCantidadDeUnidadesVendidas (a: arbol; var maxCant: integer; var maxCod: integer);
  begin
	if(a <> nil)then begin
		CodigoDeProductoConMayorCantidadDeUnidadesVendidas(a^.HI,maxCant,maxCod);
		chequearMaximo(a,maxCant,maxCod);
		CodigoDeProductoConMayorCantidadDeUnidadesVendidas(a^.HD,maxCant,maxCod);
	end;
  end;

procedure ModuloC (a: arbol);
{Contenga un módulo que reciba la estructura generada en el punto a y retorne el código de producto con mayor cantidad de unidades vendidas.}
   
var maxCant, maxCod: integer;
begin
  writeln ('----- Modulo c ----->');
  maxCant := -1;
  CodigoDeProductoConMayorCantidadDeUnidadesVendidas (a, maxCant, maxCod);
  if (maxCant = -1)  then
	writeln ('Arbol sin elementos')
  else 
	begin
         writeln ('Codigo de Producto con mayor cantidad de unidades vendidas: ', maxCod);
       end;
end;
 
function ObtenerCantidadCodigosMenores (a: arbol; unCodigo,cant: integer): integer;   {PREGUNTAR}
begin
	if(a <> nil)then begin
		if(a^.dato.codigo < unCodigo)then
			cant:= cant +1;
		ObtenerCantidadCodigosMenores:= ObtenerCantidadCodigosMenores(a^.HI,unCodigo,cant);
		if(a^.dato.codigo < unCodigo)then
			ObtenerCantidadCodigosMenores:= ObtenerCantidadCodigosMenores(a^.HD,unCodigo,cant);
		end
	else
		ObtenerCantidadCodigosMenores:= cant;
end;

procedure ModuloD (a: arbol);
{ Contenga un módulo que reciba la estructura generada en el punto a y un código de producto y retorne la cantidad de códigos menores que él que hay en la 
estructura. }
  
var unCodigo, cantCodigos,cant: integer;
begin
  writeln ('----- Modulo D  ----->');
  write ('Ingrese codigo de producto: ');
  readln (unCodigo);
  cant:= 0;
  cantCodigos:= ObtenerCantidadCodigosMenores (a, unCodigo,cant);
  if (cantCodigos = 0) 
  then writeln ('No hay codigos menores al codigo ', unCodigo)
  else begin
         writeln ('La cantidad de codigos menores a ', unCodigo, ' es: ', cantCodigos); 
       end;
end;

var a: arbol; 
Begin
  ModuloA (a);
  ModuloB (a);
  ModuloC (a);
  ModuloD (a);
End.
