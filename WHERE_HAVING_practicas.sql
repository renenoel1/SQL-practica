

/*===================================================
-- Optimización de consultas SQL:
-- comparación práctica del uso de WHERE vs HAVING
-- en filtros aplicados antes y después del GROUP BY
__ siendo WHERE mas eficiente ya que filtra antes de agrupar.
=====================================================*/

select categoria,
        sum(stock)as total_stock,
        coalesce (nullif(categoria,''), 'S/R') as categoria_total
from inventario
group by categoria
having categoria in ('electronica', 'oficina');
__________________________________________________________________________________________

select categoria, 
        sum(stock) as total_stock,
        coalesce (nullif(categoria,''), 'S/R') as categoria_total
from inventario
where categoria in ('electronica', 'oficina')
group by categoria;


/* ======================================================================
Mostrar clientes cuyo total acumulado de compras sea mayor o igual a 1000
=========================================================================*/

select clientes_id,
     sum( cantidad*precio) as total_ventas
from ventas
group by  clientes_id
having sum(cantidad * precio) >=100
order by total_ventas desc;

/*========================================================== 
ejemplo sencillo donde filtramos con WHERE el precio mas alto y fechas 
============================================================*/

select * 
from ventas
where precio > 1000;

select * 
from ventas 
where fecha > '2024-01-20';

/*========================================================
Mostrar solo las ventas donde sean productos en especifico
==========================================================*/

select precio, productos,cantidad
from ventas 
where productos in ( 'Mouse Gamer' , 'Teclado Mecánico');

/* =================================================================================================
Consulta usando las cláusulas SELECT, FROM, WHERE y BETWEEN para filtrar ventas por rango de fechas
====================================================================================================*/

select * 
from ventas 
where  fecha between '2024-02-10'and'2024-02-20';

/* =====================================================================
consulta donde se especifica en  WHERE debera  cumplir estas  2 condiciones
=======================================================================*/

select *
from ventas 
where precio >80
and  cantidad > 3;

/* ============================================================================
 Comparativa del uso de IN y NOT IN para incluir o excluir precios específicos
 =============================================================================*/

select * 
from ventas 
where precio  in (150,45,1200);

select * 
from ventas 
where precio not in (150,45,1200);

/*=========================================================================================
consulta usando WHERE y el operador <> para filtrar registros con cantidades diferentes a 2
===========================================================================================*/

select * 
from ventas
where cantidad <> 2;


/*=====================================================================
Consulta usando LIKE para filtrar registros mediante patrones de texto
======================================================================*/

select *
from ventas 
where productos like '%top%' 
   or productos like '%use%';




