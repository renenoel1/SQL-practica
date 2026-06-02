

/*========================================================
Manejo de valores vacíos y NULL mediante NULLIF y COALESCE
=========================================================*/

select categoria, 
    coalesce (nullif ( categoria,''), 'S/R') as categoria_1
from inventario;

/*====================================================================
clausula donde podemos detectar valores NULL filtrando filas con WHERE
======================================================================*/

select *
from inventario
where categoria  is null
    or producto  is null;

 
/*======================================
cambiando valores NULL por SIN CATEGORIA 
=======================================*/

 select   coalesce (categoria, 'sin categoria')
 from inventario;

/* ============================================================
cambiando valores NULL por S/N usando dos columnas con COALESCE
=====================================================   =========*/

select coalesce(categoria,producto, 's/n')
from inventario;

/*========================================
 convertir las cadenas  vacias '' por NULL
=========================================*/

select nullif ( categoria, '')
from inventario;


/* ======================================================================
cuando en la division hay cero (0), se utiliza NULL para que no de error
========================================================================*/

select  * ,
precio / nullif(cantidad,0)
from ventas;

/*=====================================================
esta consulta ayuda  a devolver el valor NULL a cero 
=======================================================*/

select *,
 coalesce (precio /  nullif ( cantidad,0),0 )
from ventas;




