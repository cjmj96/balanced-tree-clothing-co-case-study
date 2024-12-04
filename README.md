# Análisis del rendimiento de ventas de Balanced Tree Clothing Company


## Antecedentes del Proyecto



La compañía Balanced Tree Clothing, ofrece una gama amplia de ropa para el estilo de vida del aventurero moderno. Danny, 
el CEO de esta moderna empresa de moda, necesita apoyo para los equipos de mercadotecnia al analizar 
el rendimiento de ventas y generar un informe financiero básico.



Este proyecto analiza los datos de ventas para determinar el rendimiento de ventas y ajustar la 
estrategia de la empresa si es necesario.



Las ideas y recomendaciones se presentan en las siguientes áreas clave:



- Análisis de alto nivel: Proporciona una visión general de alto nivel sobre el rendimiento de ventas de 
la empresa, incluyendo métricas financieras de manera mensual y diaria.



- Análisis de transacciones: Analiza los datos relacionados con transacciones, incluyendo transacciones únicas, 
promedio de productos únicos comprados en cada transacción, valor promedio de descuento por transacción, etc.



- Análisis de productos: Analiza los datos relacionados con productos, incluyendo la cantidad total, 
los ingresos y los descuentos para cada segmento, el producto más vendido para cada segmento, el producto 
más vendido para cada categoría, etc.





## Estructura de datos y verificaciones iniciales



El conjunto de datos (base de datos) presenta 2 tablas. La primera, llamada **product_details**, incluye toda 
la información del inventario disponible en la tienda. La segunda, **sales**, contiene información de todas 
las transacciones (ventas) realizadas, incluyendo cantidad, precio, descuento (%), tipo de membresía, ID de 
transacción y también la marca de tiempo de la transacción. Estos datos abarcan el primer trimestre de 
2021. Las tablas contienen 12 y 15,095 observaciones respectivamente o 15,107 en total.


![erd](erd.png)

El esquema de la base de datos puede ser encontrado [aquí](https://github.com/cjmj96/balanced-tree-clothing-co-case-study/blob/spanish/code/balanced_tree_clothing_co_schema.sql)


## Resumen Ejecutivo



### Visión general de descubrimientos



Las ventas del último mes (marzo de 2021) muestran un desempeño positivo en diferentes métricas de 
salud financiera si se compara a meses anteriores en el mismo trimestre. Las métricas utilizadas fueron 
**total de unidades vendidas**, **ingresos de ventas brutas**, **ingresos de ventas netas** y 
**ganancia bruta**. Las siguientes secciones explorarán esto en mayor detalle. 



Los resultados se presentan en varios dashboards, que se encuentran [aquí](https://public.tableau.com/views/AnlisisdeVentasparalacompaaBalancedTreeClothing/Analisisdealtoniveldashboard?:language=en-US&publish=yes&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link).

[![Tableros de análisis de ventas financieras](https://public.tableau.com/static/images/An/AnlisisdeVentasparalacompaaBalancedTreeClothing/Analisisdealtoniveldashboard/1.png)](https://public.tableau.com/views/AnlisisdeVentasparalacompaaBalancedTreeClothing/Analisisdealtoniveldashboard)



Las consultas de PostgreSQL que se utilizaron para realizar los análisis están disponibles en el 
directorio **/codigo**, específicamente en estos enlaces 
de Github: [Análisis de alto nivel](https://github.com/cjmj96/balanced-tree-clothing-co-case-study/blob/spanish/code/analisis_de_alto_nivel.sql), 
[Análisis de transacciones](https://github.com/cjmj96/balanced-tree-clothing-co-case-study/blob/spanish/code/analisis_de_transacciones.sql) 
y [Análisis de productos](https://github.com/cjmj96/balanced-tree-clothing-co-case-study/blob/spanish/code/analisis_de_productos.sql).



### Análisis de alto nivel





#### Unidades totales vendidas





En marzo, la cantidad de unidades vendidas fue de 15,608, un aumento del 5.3% (+788 unidades) en 
comparación con febrero. (14,820). Esta tendencia también es evidente en el aumento del 5.5% desde enero.





![unidades-vendidas-totales](./unidades-vendidas-totales.PNG)



#### Ingresos de ventas brutas



En marzo, los ingresos totales por ventas alcanzaron los $447,227, un aumento del 6.1% respecto 
a febrero ($421,554). Este patrón de crecimiento constante también se observa en el 
aumento del 6.3% desde enero.



![ingresos-totales-por-ventas](./ingresos-totales-por-ventas.PNG)



#### Ingresos de ventas netas



En marzo, los ingresos de ventas netas ascendieron a $394,248, un aumento del 6.6% respecto a 
febrero ($421,554). Este patrón de crecimiento constante también se observa en el aumento del 6.8% desde enero.



![ingresos-por-ventas-netas](./ingresos-por-ventas-netas.PNG)



#### Monto total del descuento



En marzo, el monto total de descuentos alcanzó los $52,978, un aumento del 2.5% respecto a 
febrero ($51,661). Este patrón de crecimiento constante también se observa en el aumento 
del 2.6% desde enero.



![total-discount-amount](./monto-total-de-descuento.PNG)



#### Beneficio bruto





En marzo, el beneficio bruto ascendió a $157,699, un aumento del 6.6% respecto a febrero ($147,957). Este patrón de 
crecimiento constante también se observa en el aumento del 6.8% desde enero.



![beneficio-bruto](./beneficio-bruto.PNG)







#### Ingresos de ventas y beneficio bruto por segmento





Las camisas fueron las líderes tanto en ingresos de ventas como en beneficio, con $141,500 y $49,800, respectivamente. Esto 
representó un aumento del 6.4% en los ingresos y un aumento del 6.7% en las ganancias desde febrero, así como un 
crecimiento considerable del 7.52% y del 7.7% en ambas métricas desde enero.



![ingresos-por-ventas-y-beneficio-bruto-por-segmento](./ingresos-por-ventas-y-beneficio-bruto-por-segmento.PNG)



### Análisis de transacciones





#### Transacciones únicas



Marzo tuvo 860 transacciones, un aumento del 5.9% en comparación con febrero (812). Este patrón de crecimiento 
constante también se observa en el aumento del 3.86% desde enero (828).





![transacciones únicas](./transacciones-unicas.PNG)



#### Promedio de productos únicos por transacción





En marzo, los clientes compraron un promedio de 6.5 artículos distintos por transacción, una disminución 
del 1% en comparación con febrero (6.6). Este patrón es inexistente (6.5) en enero.





![promedio-de-productos-unicos-por-transaccion](./promedio-de-productos-por-transaccion.PNG)





#### Valor promedio de descuento





En marzo, el valor promedio del descuento alcanzó un 11.8%, una disminución del 3.4% en comparación con 
febrero. Este patrón de disminución constante también se observa en la disminución del 4% desde enero.



![valor-promedio-de-descuento](./valor-promedio-de-descuento.PNG)


#### Transacciones por tipo de cliente

En marzo, las transacciones son realizadas principalmente por clientes miembros con un 59% (510), una tendencia consistente 
también observada en meses anteriores.

![transacciones-por-tipo-de-cliente](./transacciones-por-tipo-de-cliente.PNG)


#### Ingresos promedio de ventas brutas por tipo de cliente

En marzo, el ingreso promedio por ventas fue de $86 y $87 para miembros y no miembros, respectivamente. Estas 
cantidades se mantuvieron relativamente estables en los meses anteriores.


![ingresos-de-ventas-brutas-por-tipo-de-cliente](./ingresos-de-ventas-brutas-por-tipo-de-cliente.PNG)


### Análisis de productos

#### Los 3 productos más vendidos por ventas brutas

El mes de marzo, la camisa polo azul ($75,000), la chaqueta de moda gris ($71,000) y la camiseta blanca ($54,000) generaron 
los mayores ingresos. Este patrón de ventas fue similar al de febrero. Sin embargo, los rankings para esto fueron diferentes 
a los de enero, donde la chaqueta de moda gris se vendió más, seguida de cerca por la camiseta polo de color azul que 
ocupó la segunda posición.

![top-3-productos-más-vendidos-por-ingresos-de-ventas-brutas](./top-3-productos-más-vendidos-por-ingresos-de-ventas-brutas.PNG)


#### Combinación de 3 productos más frecuente en las transacciones

En marzo, la mezcla de productos más vendida incluyó unos jeans negros rectos para mujer, un par de calcetines de lunares fluorescentes rosados para hombre y una 
camiseta blanca para hombre, con 136 ventas registradas. Esta tendencia también fue evidente en el primer trimestre con dos productos 
constantes (jeans y camiseta) y un tercer producto diferente cada mes: chaqueta de traje caqui para mujer en febrero (112 ventas) y calcetines sólidos azul marino para hombre en enero (117 ventas).

![combo-de-3-productos-mas-comun-en-transacciones](./combo-de-3-productos-mas-comun-en-transacciones.PNG)


#### Penetración de producto por transaccion


En cuanto a las ventas de la camiseta blanca para hombres, fue el centro de atención en marzo y, a través de ella, 
conquistó una penetración de mercado del 53%, superando al líder del mes anterior, las chaquetas de traje caqui, 
cuyo porcentaje de mercado se situaba en el 54%. Ya que se diferencia del líder del mercado este enero, que fueron 
los jeans relajados de color crema con un 52%.

![penetracion-de-producto-por-transaccion](./penetracion-de-producto-por-transaccion.PNG)



### Análisis de productos por género

#### Ingresos de ventas brutas por género

En marzo, los productos para hombres seguían siendo la categoría líder con un 56% de participación en los ingresos totales 
de ventas. Este liderazgo, curiosamente, es el mismo para los últimos dos meses de febrero y enero.

![ventas-brutas-por-género](./ventas-brutas-por-género.PNG)

#### Producto más vendido por género

Se ha observado que hubo algunas diferencias en los artículos de mayores ingresos mensuales tanto para hombres 
como para mujeres. En el caso de marzo, los calcetines de lunares fluorescentes rosas (1,367 unidades) y los 
jeans azul marino de gran tamaño (1,375 unidades) demostraron ser los productos más vendidos. Las camisas polo 
azules (1,281 unidades) en la categoría de hombres registraron las ventas más altas en el mes de febrero, mientras 
que en la categoría de mujeres fueron las chaquetas de traje caqui (1,296 unidades) las que registraron las ventas 
más altas. Solo se registró un cambio en la categoría de mujeres en enero, con las chaquetas de moda grises siendo el
producto líder (1,300 unidades), el producto camisetas polo azules mantuvo su lugar (1,264 unidades).


![producto-más-vendido-por-género](./producto-más-vendido-por-género.PNG)

#### Ingresos de ventas brutas por segmento y género

En marzo, la distribución de ingresos indicó que las camisas de hombre lideraban con un 56.5%, mientras que los calcetines 
seguían con un 43.5%; por otro lado, las chaquetas de mujer lideraban con un 63.2%, mientras que los jeans retrocedían al 36.8%. En general, 
se observó el mismo patrón de distribución en el primer trimestre del año.

![ventas-brutas-por-segmento-y-género](./ventas-brutas-por-segmento-y-género.PNG)

### Análisis de segmentos

#### Producto más vendido por segmento

En marzo, los artículos más vendidos fueron los jeans en color marino (1,375 unidades) en jeans, las camisetas blancas (1,346 unidades) en camisas, las 
chaquetas elegantes grises (1,322 piezas) en chaquetas, y los calcetines de lunares flúor rosa (1,367 piezas) en calcetines. Es interesante 
notar que febrero registró un cambio total en los productos más destacados en los diversos segmentos, con la única excepción de las 
camisetas blancas, cuyo rendimiento fue el mismo en enero.

![producto-mas-vendido-por-cantidad-segmento](./producto-mas-vendido-por-cantidad-segmento.PNG)

#### Ingresos de ventas brutas por segmento

Se observó en los respectivos segmentos que había un patrón de ventas uniforme como en los meses anteriores. Curiosamente, en cada segmento, el producto líder era el que más ingresos generaba: Chaquetas de Moda Grises (57.5%) en la categoría de Chaquetas, Jeans Rectos Negros (58.5%) en la categoría de Jeans, Camisetas Polo Azules (53.3%) en la categoría de Camisas, y Calcetines Sólidos Marinos (44.1%) en la categoría de Calcetines, mientras que el segundo y tercer producto en los segmentos también tenían una participación de ingresos consistente.

![ventas-brutas-por-segmento](./ventas-brutas-por-segmento.PNG)


## Recomendaciones



De los hallazgos resultantes del análisis se extraen las siguientes recomendaciones:



1. Optimización del rendimiento de ventas: Ampliar el inventario en la categoría de artículos de ropa masculina, especialmente en las camisas (polo azul) que aportan el 56% de los ingresos totales, asegurando al mismo tiempo grandes cantidades de los otros productos de compra habitual: chaquetas de moda grises.

2. Mejorar los márgenes: 

    2.1 Mantener la positiva revisión a la baja de las tasas de descuento (mejora de 3.4% en marzo) para mejorar el desarrollo de los márgenes.

    2.2 Crear estrategias de marketing únicamente centradas en recortes de precios del inventario con baja frecuencia de venta.

3. Gestion del inventario:

    3.1 Garantizar la disponibilidad de inventario de los tres productos más vendidos en conjunto: los jeans rectos negros, los calcetines lunares fucsias, la camiseta blanca, la chaqueta de traje caqui y el calcetín básico azul marino.

    3.2 Centrarse estratégicamente en la gestión de aquellos artículos que han tenido rendimiento medio en todos los segmentos en el trimestre examinado.

    3.3 La empresa debería descontinuar o rediseñar las categorías de artículos que tienen muy bajos niveles de tasas de penetración en las transacciones para maximizar su ROI.