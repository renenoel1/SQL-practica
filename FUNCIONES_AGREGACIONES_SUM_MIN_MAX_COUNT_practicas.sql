

/*==============================================================================
Funciones de agregacion, trabaja sobre varias filas y devuelve un unico resultado
===============================================================================*/

/* ======================
funcion de agregacion SUM
=========================*/

select sum(precio) as total_Precio
from inventario;

select sum( stock * precio)
from inventario;

/* ======================
funcion de agregacion MAX
========================*/

select MAX ( precio) as Precio_max
from ventas;

select  MAX (fecha) as Ultima_fecha
from ventas;

/*========================
funcion de agregacion MIN
========================*/

select min (precio) precio_minimo
from ventas ;

select min(precio*cantidad)
from ventas;

select min(fecha)
from ventas;

select min(productos)
from ventas;

/*========================
funcion de agregacion AVG
=========================*/

select avg ( precio ) as precio_promedio
from ventas;

/* AVG normalmente ignora las celdas NULL y solo divide las filas con valores */

select avg ( precio ) as precio_promedio
from inventario;

/* AVG pero cuando a los NULL se le agrega valor usando COALESCE ahi si toma en cuenta la fila y las divide */

select avg ( coalesce (precio,'0')) as precio_promedio
from inventario;


/*=====================================================================
COUNT funcion de agregacion de contar, cuenta filas ignorando los NULL 
cuando es aplicado a una columna, pero toma en cuenta cadenas vacias 
=======================================================================*/

select count (stock)
from inventario;

/* COUNT cuando es aplicado en toda la tabla toma en cuanta todas la fila*/

select count (*)
from inventario;

/* pero si deseas ignorar las cadenas vacias usando NULLIF */

select count (nullif(stock,''))
from inventario;

 
