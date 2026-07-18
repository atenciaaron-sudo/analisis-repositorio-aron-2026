--1.Ingresos por género – Comparación de los ingresos totales generados por 
--clientes hombres frente a mujeres.
select sexo ,sum(monto_de_compre) as Cantidad_Comprada
from cliente
group by sexo

--2.Usuarios de descuentos con alto gasto – 
--Identificación de clientes 
--que utilizaron descuentos pero 
--cuyo gasto superó el importe medio de compra.

select idcliente,monto_de_compre
from cliente
where descuento_aplicado ='yes' and monto_de_compre>=(select avg(monto_de_compre) from cliente )




select avg(monto_de_compre)
from cliente


--3. --Los 5 productos mejor valorados – 
--Identificación de los productos con las valoraciones 
--medias más altas.
SELECT top 5 articulo_comprado,
       round(avg(cast(calificacion_del_cliente as decimal(10,2))),2) as Promedio_calificacion_del_producto
from cliente
group by articulo_comprado
order by avg(cast(calificacion_del_cliente as decimal(10,2))) desc


--4.Comparación de tipos de envío – 
--Comparación de los importes medios de compra 
--entre envíos estándar y exprés.
select tipo_de_envio,
 round(AVG(monto_de_compre),2) as Promedio_Monto_de_Compra
from cliente
where tipo_de_envio in ('Standard','Express')
group by  tipo_de_envio


--5.Suscriptores frente a no suscriptores 
-- Comparación del gasto medio y los ingresos totales 
--según el estado de suscripción.

select estado_de_suscripcion,
count(idcliente) as total_de_clientes,
round(avg(monto_de_compre),2) as Gasto_Promedio,
round (sum(monto_de_compre),2) as Ingreso_total
from cliente
group by estado_de_suscripcion
order by Ingreso_total,Gasto_Promedio DESC


--6.Productos con alta dependencia de descuentos
--- Identificación de los 5 productos con mayor 
--porcentaje de compras realizadas con descuento.

SELECT TOP 5 articulo_comprado,
             round(100.0*sum(case when descuento_aplicado='YES' then 1 else 0 end) / count(*),
			 2) as tasa_de_descuento
from cliente
group by articulo_comprado
order by tasa_de_descuento desc


--7.Segmentación de clientes – 
--Clasificación de los clientes en segmentos (nuevos, recurrentes y fieles) 
--según su historial de compras.


with tipo_cliente as(
select idcliente,compras_anteriores,
case 
    when compras_anteriores=1 then 'Nuevo'
	when compras_anteriores between 2 and 10  then 'Recurrente'
	Else 'Leal'
	end as segmento_cliente
from cliente)

select Segmento_cliente, count(*) as "Numero de Clientes"
from tipo_cliente
group by Segmento_cliente

--8.Los 3 mejores productos por categoría 
-- Listado de los productos más comprados en cada categoría.

with CUENTADEARTICULOS AS(
select categoria,
       articulo_comprado,
	   count(idcliente) as TOTAL_DE_PEDIDOS,
	   ROW_NUMBER() OVER(PARTITION BY categoria order by count(idcliente) desc) as ranking_de_productos
from cliente
group by categoria,articulo_comprado)


select ranking_de_productos,categoria,Articulo_comprado,TOTAL_DE_PEDIDOS
from CUENTADEARTICULOS
where ranking_de_productos <=3


--9.Clientes recurrentes y con suscripciones
--Análisis de si los clientes con más de 5 compras tienen mayor probabilidad de suscribirse.

select estado_de_suscripcion,
       count(idcliente) as compras_recurrentes
from cliente
where compras_anteriores>10
group by estado_de_suscripcion