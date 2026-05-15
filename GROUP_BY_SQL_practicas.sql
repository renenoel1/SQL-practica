

/* ================================================================
Uso de GROUP BY y WHERE filtrando valores NULL y espacios en blanco  
==================================================================*/

select  categoria, count(*) as total_categorias
from inventario
where categoria is not null
 and  categoria <> ''    
group by categoria;

/*==============================================================
Consulta de datos agrupados utilizando GROUP BY, HAVING y SUM     
===============================================================*/ 
 
select productos, sum(cantidad * precio) as total_ventas
from ventas
group by productos
having sum(cantidad * precio) >200;

/* ========================================================================
sacando promedio de salario por departamento con la consulta GROUP BY y AVG
===========================================================================*/

select nombre,area,
       avg (salario) as promedio_salario
from empleados
group by area,nombre;


/*===================================================
 Reporte de ventas y frecuencia de compra por cliente
====================================================*/

select clientes_id,
       sum(cantidad) as total_articulos,
       count(*) as cantidad_compras,
       sum(precio) as ventas_clientes
from ventas
group by clientes_id
order by cantidad_compras desc;















