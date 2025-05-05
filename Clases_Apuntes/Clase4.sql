--Configuración de un Nodo Distribuido en Docker 

Objetivo: Crear un entorno distribuido con múltiples nodos (contenedores Docker) que simulen una arquitectura de bases de datos distribuidas (BDD), como PostgreSQL, MongoDB o Cassandra. 

 
 

Pasos para Configurar un Nodo Distribuido 

1. Instalar Docker 

Asegúrate de tener Docker instalado en tu sistema: 

 

sudo apt-get update && sudo apt-get install docker.io docker-compose 

2. Crear una Red Docker para Comunicación 

Los nodos deben comunicarse entre sí. Crea una red bridge: 

 

docker network create bdd-distribuida 

3. Configurar Nodos con Docker Compose 

Ejemplo para 3 nodos PostgreSQL (docker-compose.yml): 

 

version: '3.8' 
 

services: 
  postgres-node1: 
    image: postgres:14 
    container_name: node1 
    environment: 
      POSTGRES_PASSWORD: admin123 
      POSTGRES_USER: admin 
      POSTGRES_DB: bdd_distribuida 
    ports: 
      - "5432:5432" 
    networks: 
      - bdd-distribuida 
 

postgres-node2: 
    image: postgres:14 
    container_name: node2 
    environment: 
      POSTGRES_PASSWORD: admin123 
      POSTGRES_USER: admin 
      POSTGRES_DB: bdd_distribuida 
    ports: 
      - "5433:5432" 
    networks: 
      - bdd-distribuida 
 

postgres-node3: 
    image: postgres:14 
    container_name: node3 
    environment: 
      POSTGRES_PASSWORD: admin123 
      POSTGRES_USER: admin 
      POSTGRES_DB: bdd_distribuida 
    ports: 
      - "5434:5432" 
    networks: 
      - bdd-distribuida 
 

networks: 
  bdd-distribuida: 
    external: true 

4. Iniciar los Contenedores 

 

docker-compose up -d 

Verifica que los nodos estén activos: 

 

docker ps 

 
 

5. Configurar la Distribución de Datos 

Ejemplo con PostgreSQL (Fragmentación Horizontal) 

Conéctate a un nodo: 
 
docker exec -it node1 psql -U admin -d bdd_distribuida 

Crea tablas fragmentadas y configura la replicación: 
 
-- En node1 (Fragmento 1) 
CREATE TABLE clientes_region1 ( 
    id SERIAL PRIMARY KEY, 
    nombre VARCHAR(100), 
    region VARCHAR(50) CHECK (region = 'Norte') 
); 
 
-- En node2 (Fragmento 2) 
CREATE TABLE clientes_region2 ( 
    id SERIAL PRIMARY KEY, 
    nombre VARCHAR(100), 
    region VARCHAR(50) CHECK (region = 'Sur') 
); 

Usa Foreign Data Wrappers para consultas distribuidas: 
CREATE EXTENSION postgres_fdw; 
 
-- En node1: Configura acceso a node2 
CREATE SERVER node2_server FOREIGN DATA WRAPPER postgres_fdw  
OPTIONS (host 'node2', dbname 'bdd_distribuida'); 
 
CREATE USER MAPPING FOR admin SERVER node2_server  
OPTIONS (user 'admin', password 'admin123'); 

 
 

6. Probar la Distribución 

Inserta datos en cada nodo y verifica su distribución: 
-- En node1 
INSERT INTO clientes_region1 (nombre, region) VALUES ('Empresa A', 'Norte'); 
 
-- En node2 
INSERT INTO clientes_region2 (nombre, region) VALUES ('Empresa B', 'Sur'); 

Consulta federada desde node1: 
 
SELECT * FROM clientes_region1 
UNION ALL 
SELECT * FROM clientes_region2; 

 
 

7. Configuración Avanzada 

Para Bases de Datos NoSQL (MongoDB/Cassandra) 

MongoDB: Usa réplicas con --replSet: 
 
docker run --name mongo-node1 --network bdd-distribuida -d mongo:5 --replSet rs0 

Cassandra: Configura un cluster con CASSANDRA_SEEDS: 
 
docker run --name cassandra-node1 --network bdd-distribuida -e CASSANDRA_CLUSTER_NAME=BDD_Cluster -d cassandra:4 

 
 

8. Monitoreo 

Verifica la comunicación entre nodos: 
 
docker exec -it node1 ping node2 

Usa herramientas como PgAdmin (para PostgreSQL) o MongoDB Compass para visualizar los datos distribuidos. 

 
 

Conclusión 

Con Docker, puedes simular un entorno distribuido completo para: 

✅ Fragmentación (sharding) 

✅ Replicación (alta disponibilidad) 

✅ Consultas federadas 

✅ Pruebas de escalabilidad 

Nota: Para producción, considera orquestadores como Kubernetes y configuraciones de seguridad avanzadas (TLS, autenticación). 