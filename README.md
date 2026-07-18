# COMPORTAMIENTO-DE-LOS-CLIENTES--VENTAS

Almacen de los archivos del proyecto de Comportamiento de Cliente

Descripción general del proyecto
Este proyecto analiza el comportamiento de compra de los clientes utilizando datos transaccionales de 3.900 compras en diversas categorías de productos. El objetivo es obtener información clave sobre patrones de gasto, segmentos de clientes, preferencias de productos y comportamiento de suscripción para orientar decisiones empresariales estratégicas.

Resumen del conjunto de datos

• Filas: 3900
• Columnas: 18
• Variables clave:
  - Datos demográficos del cliente (edad, género, ubicación, estado de la suscripción)
  - Detalles de la compra (artículo adquirido, categoría, importe de la compra, temporada, talla, color)
  - Comportamiento de compra (descuento aplicado, código promocional utilizado, compras anteriores, frecuencia de compra, valoración de la reseña, tipo de envío)
• Datos faltantes: 37 valores en la columna de valoración de la reseña

Análisis exploratorio de datos con Python

Comenzamos con la preparación y limpieza de datos en Python:

a) Carga de datos:
Se importó el conjunto de datos utilizando pandas.

b) Exploración Inicial:
Uso de df.info() y revisamos la estructura con .describe() para ver estadísticas generales.

Análisis de datos mediante SQL (transacciones comerciales)

Realizamos un análisis estructurado en PostgreSQL para responder a preguntas clave del negocio.

Panel de control en Power BI

Por último, creamos un panel de control interactivo en Power BI para presentar visualmente los hallazgos.
