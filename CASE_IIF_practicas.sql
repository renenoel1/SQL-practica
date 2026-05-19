

/* =============================================================================================================
Uso de CASE -  IIF para clasificar datos, para calculos basicos usar IIF  y funciones con mas de 2 calculos case
=====================================================================================================   ===========*/

select *, 
case
   when stock > 50 then 'lleno' 
   when stock > 20 then 'vacio'
   else 'reponer'
   end as estado
from inventario;
_____________________________________________________________________
select * ,
   iif ( stock > 50, 'lleno', iif(stock > 20, 'vacio','reponer'))
   AS estado
from inventario;


/* ====================
uso de CASE con grup by
======================*/

select 
    categoria, 
    case
       when categoria = 'electronica' then 'grupo_1'
       when categoria = 'cables'      then 'grupo_2'
       when categoria = 'hogar'       then 'grupo_3'
       else 'grupo_4'
       end as grupo,
coalesce ( nullif(categoria,''),'S/N')    AS categoria_limpia 
from inventario
group by  categoria
order by grupo;

/*==================================================================
Clasificación de productos por rango de precio usando CASE y WHERE
===================================================================*/

select cantidad, productos,
case
   when precio >90 then '1'
   when precio >40 then '2'
   else '3'
end  as grupo
from ventas
where cantidad >2
order by grupo desc;
   

/* ==========================================================================
Análisis porcentual de ventas aplicando CASE, funciones agregadas y redondeo 
============================================================================*/

select 
round ( 
100.0*
  sum(
    case 
     when cantidad >= 3 then 1  else 0  end )  
     / count (*) ,
      2  ) as porcentage
from ventas;









