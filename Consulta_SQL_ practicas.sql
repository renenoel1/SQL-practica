
use reneantonio;
select productos, cantidad,nombre
from ventas as v
inner join clientes as c
on v.clientes_id = c.clientes_id
group by productos,cantidad,precio,nombre
order by cantidad desc;

select * from ventas;

select productos , sum (cantidad) as  a  from ventas
group by productos;

select productos,precio, cantidad,sum (cantidad * precio) as totoal_ventas, count (cantidad) as total_cantidad
from ventas
group by productos,cantidad,precio
order by cantidad desc;

select *, 
case
 when precio > 1000               then 'gerente'
 when precio between 300 and 500  then 'junior'
 when precio <  300               then 'pasante'
 else 'aprendis'
 end as cargos 
 from ventas;

 select * from inventario_practica inv ;

 select count (1) total from inventario_practica where producto is null;
 select precio, coalesce (stock, 'rene') from inventario_practica;

 select categoria,producto,coalesce (stock, 0) as catindad from inventario_practica;

 select *,
 case
 when id > 6      then 'medio'
 when id between 4 and 3 then 'grande'
 when id = 2       then 'xgrande'
 else 'brutal'
 end as cargos
 from inventario_practica;

 select * from clientes;
 select * from empleados;
 select * from inventario_practica;

 select *,coalesce (nullif(categoria,''),'s/n')  from inventario_practica;
 select * , coalesce (nullif ( categoria, ''), 's')  as blancs from inventario_practica;
 select *, coalesce( nullif(categoria,''), 'v') from inventario_practica;
 select stock,precio,coalesce (stock,precio,0) from inventario_practica;


 select * from inventario_practica
  where stock is not null 
  and   producto!='';
  
  select coalesce (NULLIF (categoria,''),'S/N') from inventario_practica;
  
 select* from inventario_practica;

  select * from inventario_practica
  where stock is not null;
  select * from inventario_practica
  where stock is  null;

