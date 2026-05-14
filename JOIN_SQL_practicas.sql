use reneantonio;

/*==========================================================================================
INNER JOIN se usa para unir información de dos tablas que tienen datos relacionados entre sí 
============================================================================================*/

select *
FROM  clientes c
inner join ventas v
on c.clientes_id = v.clientes_id;

/*===================================================
Uso de INNER JOIN y GROUP BY para agrupación de datos
=====================================================*/

select pais,productos,precio,fecha, sum (precio * cantidad) as ventas_totales, sum (cantidad) as cantidad
from clientes c
inner join  ventas v
on c.clientes_id = v.clientes_id
group by pais,productos,precio,fecha
having pais in ( 'españa' ,'colombia');

/* ============================================================================================
LEFT JOIN Muestra todos los registros de la tabla izquierda y las coincidencias de la derecha 
===============================================================================================*/

select * 
from ventas v
left join clientes c
on v.clientes_id = c.clientes_id;


/*=====================================
Manejo de LEFT JOIN y función COALESCE
======================================*/

select nombre,pais,cantidad, coalesce (nullif(productos, ''), 's/p' ) as total_productos
from ventas v
left join clientes c
on v.clientes_id = c.clientes_id
where cantidad >= 5;

/*=================================================================================
Limpieza y transformación de datos mediante INNER JOIN, COALESCE y cláusulas WHERE 
==================================================================================*/

select producto, coalesce(nullif( i.producto,''),'0') as producto_corregido   
from inventario i
inner join empleados e
on i.id = e.idempleados;

select producto
from inventario i
inner join empleados e
on i.id = e.idempleados
where i.producto is not null
and i.producto <> ''
and i.producto <> '0';

/*===========================================================================================
Top clientes por ventas mediante INNER JOIN, GROUP BY y ORDER BY
============================================================================================*/

select c.nombre,pais, sum(cantidad*precio) as ventas_totales
from clientes c
inner join ventas v
on c.clientes_id = v.clientes_id
group by c.nombre,pais
order by ventas_totales desc;
















