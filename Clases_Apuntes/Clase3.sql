" Tipos de Fragmentación 

La fragmentación es una técnica usada en bases de datos distribuidas para dividir una tabla en partes más pequeñas y manejables. Existen tres tipos principales: 

1.1 Fragmentación Horizontal 

Definición: 

 Divide una tabla en subconjuntos de filas. Cada fragmento contiene registros que cumplen ciertos criterios (por ejemplo, ubicación, fechas, tipo de cliente). 

Resumen de ventajas: 

Menor volumen de datos por nodo. 

Mejor rendimiento en consultas locales. 

Facilita el procesamiento paralelo. 

 

 

1.2 Fragmentación Vertical 

Definición: 

 Divide una tabla por columnas. Cada fragmento agrupa columnas relacionadas, manteniendo siempre la clave primaria para poder reconstruir la tabla. 

Resumen de ventajas: 

Optimiza el acceso a datos específicos. 

Aumenta la seguridad al separar datos sensibles. 

Reduce el uso de ancho de banda. 

 

 

1.3 Fragmentación Mixta (Híbrida) 

Definición: 

 Combina la fragmentación horizontal y vertical. Se puede fragmentar primero por filas y luego por columnas, o viceversa. 

Resumen de ventajas: 

Gran flexibilidad para adaptarse a las necesidades del sistema. 

Aprovecha lo mejor de los dos tipos anteriores. 

Mejora tanto el rendimiento como la seguridad. 

 

 

2. Almacenamiento en Bases de Datos Distribuidas 

Una vez que los datos han sido fragmentados, deben almacenarse de forma eficiente y confiable en distintos nodos de una red. 

2.1 Asignación de Fragmentos a Nodos 

Los fragmentos se distribuyen en los nodos según criterios como cercanía geográfica, carga del nodo y uso frecuente. 

Mejora el tiempo de respuesta al acercar los datos a los usuarios. 

 

 

-- 2.2 Replicación 

Se crean copias de ciertos fragmentos en varios nodos. 

Aumenta la disponibilidad y tolerancia a fallos: si un nodo falla, otro puede continuar funcionando. 

 

 

2.3 Control de Consistencia y Sincronización 

Es esencial mantener la coherencia entre copias replicadas. 

Se usan mecanismos como control de concurrencia y algoritmos de consenso para asegurar que las transacciones sean consistentes en todos los nodos. 

 

 

3. Consideraciones en el Diseño 

Diseñar una base de datos distribuida requiere tomar decisiones basadas en varios factores clave: 

3.1 Patrones de Acceso 

Si las consultas suelen hacerse sobre datos específicos, se recomienda la fragmentación horizontal para optimizar la eficiencia. 

 

 

3.2 Carga y Escalabilidad 

Una buena distribución de fragmentos permite repartir la carga y escalar el sistema a medida que crece. 

 

 

3.3 Seguridad y Privacidad 

Al separar los datos entre fragmentos y ubicaciones, se pueden aplicar diferentes políticas de seguridad, protegiendo mejor los datos sensibles. 

 "