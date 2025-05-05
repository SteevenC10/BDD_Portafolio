
"CLASIFICACIONES DE BASE DE DATOS DISTRIBUIDAS  

Es según su distribución de datos y existen:  

Fragmentadas:  

Fragmentación horizontal: divide registros por filas según condiciones específicas. Se una para la transmisión de datos en grandes masas . Pero tenemos que verificar los nodos, velocidad de tiempo, cantidad de archivos, SO, Motor de base de datos, Aplicativo. 

Basa en encontrar condiciones de selección (Encontrar 1 solo dato). 

Fragmentación vertical: divide registros por columnas según el uso de los atributos. Cuando tengamos una buena red o esta en la nube. 

Basa en encontrar un conjunto de atributos. 

Fragmentación mixta: combinación de fragmentación horizontal y vertical. Es cuando es una base de datos no estructurada. 

Schema: Archivo donde tiene todos los datos de una base de datos. 

Replicas:  

Replicación completa: cada nodo posee una copia completa de los datos. 

Replicación parcial: ciertos datos se replican según necesidades específicas. 

Conjunto espejo de la base de datos 

Hibridas:  

Combina fragmentación y replicación, según requerimientos operativos y estratégicos. 

 

Según la Homogeneidad del Sistema  

Homogéneas  

Todos los nodos ejecutan el mismo tipo de software de gestión de base de datos. 

Ejemplos: MySQL distribuido, MongoDB Sharded Cluster. 

Heterogéneas  

Nodos con diferentes sistemas de gestión de base de datos que interactúan mediante estándares comunes. 

Ejemplos: Oracle Gateway, SQL Server Integration Services (SSIS) 

Según la Autonomía del Nodo  

Bases de datos federadas  

Alta autonomía local, cada nodo mantiene control propio de sus datos. 

Gestión descentralizada. 

Bases de datos multidatabase  

Colección de bases de datos independientes que cooperan mediante acuerdos explícitos. 

Autonomía y heterogeneidad son características esenciales. 

Ventajas  

Mayor disponibilidad y confiabilidad. 

Escalabilidad eficiente. 

Distribución de carga. 

Flexibilidad y adaptación geográfica. 

Desafíos de la BDD  

Complejidad administrativa. 

Seguridad y coherencia de datos. 

Gestión eficiente de transacciones distribuidas 

Problemas asociados al rendimiento por la  latencia en redes. 

Aplicaciones típicas  

Comercio electrónico global.//AMAZON 

Sistemas financieros multinacionales.//PAYPAL 

Aplicaciones de big data.GITHUB//SOOME//AZURE 

Servicios en la nube.//AWS//AZURE//ONEDRIVE/GOOGLE 

Conclusiones  

Las bases de datos distribuidas ofrecen ventajas importantes en escenarios modernos, aunque implican complejidades y desafíos técnicos relevantes. 

Seleccionar el tipo adecuado depende de las necesidades específicas y estratégicas de cada organización. "